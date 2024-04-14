const std = @import("std");
const rl = @import("raylib.zig");
const b2 = @import("box2d.zig");
const Vector2 = @import("vector.zig");
const Allocator = std.mem.Allocator;

const EDITOR_HEIGHT: f32 = 50.0;
const LABEL_WIDTH: f32 = 50.0;
const TEXT_BOX_WIDTH: f32 = 70.0;
const COLOR_PICKER_WIDTH: f32 = 100.0;

pub const EditorF32 = struct {
    text_buffer: [Self.TEXT_LEN]u8 = .{0} ** Self.TEXT_LEN,

    const Self = @This();
    const TEXT_LEN: u32 = 8;
    const HEIGHT: f32 = EDITOR_HEIGHT;
    const WIDTH: f32 = LABEL_WIDTH + TEXT_BOX_WIDTH;

    pub fn new(value: *const f32) Self {
        var text_buffer: [Self.TEXT_LEN]u8 = .{0} ** Self.TEXT_LEN;
        _ = std.fmt.bufPrint(&text_buffer, "{d:.1}", .{value.*}) catch unreachable;
        return Self{
            .text_buffer = text_buffer,
        };
    }

    pub fn draw(self: *Self, label: [:0]const u8, position: Vector2, mouse_position: Vector2) bool {
        const rl_position = position.to_rl_as_pos();
        const rl_mouse_position = mouse_position.to_rl_as_pos();

        const label_rect = rl.Rectangle{
            .x = rl_position.x,
            .y = rl_position.y,
            .width = LABEL_WIDTH,
            .height = EDITOR_HEIGHT,
        };
        _ = rl.GuiLabel(
            label_rect,
            label.ptr,
        );

        const text_box_rect =
            rl.Rectangle{
            .x = rl_position.x + LABEL_WIDTH,
            .y = rl_position.y,
            .width = TEXT_BOX_WIDTH,
            .height = EDITOR_HEIGHT,
        };
        const editable = rl.CheckCollisionPointRec(rl_mouse_position, text_box_rect);
        const interacted = rl.GuiTextBox(
            text_box_rect,
            &self.text_buffer,
            self.text_buffer.len,
            editable,
        );
        return interacted == 1;
    }

    pub fn get_value(self: *const Self) ?f32 {
        const s = std.mem.sliceTo(&self.text_buffer, 0);
        const value = std.fmt.parseFloat(f32, s) catch |err| {
            std.log.info("invalid width: {s}, err: {}", .{ s, err });
            return null;
        };
        return value;
    }
};

pub const EditorVector2 = struct {
    x_editor: EditorF32,
    y_editor: EditorF32,

    const Self = @This();
    const HEIGHT: f32 = EditorF32.HEIGHT * 3.0;
    const WIDTH: f32 = EditorF32.WIDTH;

    pub fn new(vector: *const Vector2) Self {
        return Self{
            .x_editor = EditorF32.new(&vector.x),
            .y_editor = EditorF32.new(&vector.y),
        };
    }

    pub fn draw(self: *Self, label: [:0]const u8, position: Vector2, mouse_position: Vector2) bool {
        const rl_position = position.to_rl_as_pos();
        _ = rl.GuiLabel(
            rl.Rectangle{
                .x = rl_position.x,
                .y = rl_position.y,
                .width = EditorF32.WIDTH,
                .height = EDITOR_HEIGHT,
            },
            label.ptr,
        );
        return self.x_editor.draw("x", position.sub(&Vector2{ .x = 0.0, .y = EditorF32.HEIGHT }), mouse_position) or
            self.y_editor.draw("y", position.sub(&Vector2{ .x = 0.0, .y = EditorF32.HEIGHT * 2.0 }), mouse_position);
    }

    pub fn get_value(self: *const Self) ?Vector2 {
        const x = self.x_editor.get_value() orelse return null;
        const y = self.y_editor.get_value() orelse return null;
        return Vector2{ .x = x, .y = y };
    }
};

pub const EditorArrayOfVectors = struct {
    points_editors: []EditorVector2,

    const Self = @This();
    const HEIGHT: f32 = EDITOR_HEIGHT * 4.0;
    const WIDTH: f32 = LABEL_WIDTH + COLOR_PICKER_WIDTH;

    pub fn new(points: []Vector2, allocator: Allocator) !Self {
        var points_editors = try allocator.alloc(EditorVector2, points.len);
        for (points, points_editors) |*point, *point_editor| {
            point_editor.* = EditorVector2.new(point);
        }
        return Self{
            .points_editors = points_editors,
        };
    }

    pub fn deinit(self: *const Self, allocator: Allocator) void {
        allocator.free(self.points_editors);
    }

    pub fn draw(self: *Self, allocator: Allocator, label: [:0]const u8, position: Vector2, mouse_position: Vector2) !bool {
        const rl_position = position.to_rl_as_pos();
        _ = rl.GuiLabel(
            rl.Rectangle{
                .x = rl_position.x,
                .y = rl_position.y,
                .width = EditorF32.WIDTH,
                .height = EDITOR_HEIGHT,
            },
            label.ptr,
        );
        var interacted = false;
        for (self.points_editors, 0..) |*ve, i| {
            interacted = interacted or ve.draw(
                "",
                position.add(&Vector2{
                    .x = EditorVector2.WIDTH * @as(f32, @floatFromInt(i)),
                    .y = 0.0,
                }),
                mouse_position,
            );
        }
        const add_point = rl.GuiButton(
            rl.Rectangle{
                .x = rl_position.x,
                .y = rl_position.y + EditorVector2.HEIGHT,
                .width = Self.WIDTH,
                .height = EDITOR_HEIGHT,
            },
            "Add point",
        );
        if (add_point != 0) {
            const v = Vector2.ZERO;
            self.points_editors = try allocator.realloc(
                self.points_editors,
                self.points_editors.len + 1,
            );
            self.points_editors[self.points_editors.len - 1] = EditorVector2.new(&v);
        }
        return interacted;
    }

    pub fn get_value(self: *const Self, allocator: Allocator) !?[]Vector2 {
        var points = try allocator.alloc(Vector2, self.points_editors.len);
        for (self.points_editors, points) |*e, *p| {
            p.* = e.get_value() orelse {
                allocator.free(points);
                return null;
            };
        }
        return points;
    }
};

pub const EditorColor = struct {
    color: rl.Color = rl.WHITE,

    const Self = @This();
    const HEIGHT: f32 = EDITOR_HEIGHT * 2.0;
    const WIDTH: f32 = LABEL_WIDTH + COLOR_PICKER_WIDTH;

    pub fn new(color: *const rl.Color) Self {
        return Self{
            .color = color.*,
        };
    }

    pub fn draw(self: *Self, label: [:0]const u8, position: Vector2, mouse_position: Vector2) bool {
        _ = mouse_position;
        const rl_position = position.to_rl_as_pos();
        _ = rl.GuiLabel(
            rl.Rectangle{
                .x = rl_position.x,
                .y = rl_position.y,
                .width = LABEL_WIDTH,
                .height = EDITOR_HEIGHT,
            },
            label.ptr,
        );
        _ = rl.GuiColorPicker(
            rl.Rectangle{
                .x = rl_position.x + LABEL_WIDTH,
                .y = rl_position.y,
                .width = COLOR_PICKER_WIDTH,
                .height = EDITOR_HEIGHT,
            },
            label.ptr,
            &self.color,
        );
        const interacted = rl.GuiButton(
            rl.Rectangle{
                .x = rl_position.x,
                .y = rl_position.y + EDITOR_HEIGHT,
                .width = Self.WIDTH,
                .height = EDITOR_HEIGHT,
            },
            "Apply",
        );
        return interacted == 1;
    }

    pub fn get_value(self: *const Self) ?rl.Color {
        return self.color;
    }
};

pub fn ParamEditor(comptime T: type) type {
    return struct {
        inner: ParamEditorInner(T),

        const Self = @This();

        pub fn new(value: *const T) Self {
            const type_fields = comptime @typeInfo(ParamEditorInner(T)).Struct.fields;
            var inner: ParamEditorInner(T) = undefined;
            inline for (type_fields) |field| {
                @field(inner, field.name) = field.type.new(&@field(value, field.name));
            }
            return Self{ .inner = inner };
        }

        pub fn new_with_alloc(value: *const T, allocator: Allocator) !Self {
            const type_fields = comptime @typeInfo(ParamEditorInner(T)).Struct.fields;
            var inner: ParamEditorInner(T) = undefined;
            inline for (type_fields) |field| {
                switch (field.type) {
                    EditorArrayOfVectors => {
                        @field(inner, field.name) = try field.type.new(@field(value, field.name), allocator);
                    },
                    else => {
                        @field(inner, field.name) = field.type.new(&@field(value, field.name));
                    },
                }
            }
            return Self{ .inner = inner };
        }

        pub fn deinit(self: *const Self, allocator: Allocator) void {
            const type_fields = comptime @typeInfo(ParamEditorInner(T)).Struct.fields;
            inline for (type_fields) |field| {
                switch (field.type) {
                    EditorArrayOfVectors => {
                        @field(self.inner, field.name).deinit(allocator);
                    },
                    else => {},
                }
            }
        }

        pub fn draw(self: *Self, position: Vector2) ?T {
            const mouse_position = Vector2.from_rl_pos(rl.GetMousePosition());
            const type_fields = comptime @typeInfo(ParamEditorInner(T)).Struct.fields;
            var p = position;
            var interacted = false;
            inline for (type_fields) |field| {
                // converts []const u8 that @typeInfo contains to [:0]const u8 for raylib
                const field_name: [:0]const u8 = std.fmt.comptimePrint("{s}", .{field.name});
                interacted = interacted or field.type.draw(&@field(self.inner, field.name), field_name, p, mouse_position);
                p.y -= field.type.HEIGHT;
            }
            if (interacted) {
                return self.get_value();
            } else {
                return null;
            }
        }

        pub fn draw_alloc(self: *Self, allocator: Allocator, position: Vector2) !?T {
            const mouse_position = Vector2.from_rl_pos(rl.GetMousePosition());
            const type_fields = comptime @typeInfo(ParamEditorInner(T)).Struct.fields;
            var p = position;
            var interacted = false;
            inline for (type_fields) |field| {
                // converts []const u8 that @typeInfo contains to [:0]const u8 for raylib
                const field_name: [:0]const u8 = std.fmt.comptimePrint("{s}", .{field.name});

                switch (field.type) {
                    EditorArrayOfVectors => {
                        interacted = interacted or try field.type.draw(&@field(self.inner, field.name), allocator, field_name, p, mouse_position);
                    },
                    else => {
                        interacted = interacted or field.type.draw(&@field(self.inner, field.name), field_name, p, mouse_position);
                    },
                }

                p.y -= field.type.HEIGHT;
            }
            if (interacted) {
                return self.get_value_alloc(allocator);
            } else {
                return null;
            }
        }

        pub fn get_value(self: *const Self) ?T {
            const type_fields = comptime @typeInfo(T).Struct.fields;
            var value: T = undefined;
            inline for (type_fields) |field| {
                @field(value, field.name) = @field(self.inner, field.name).get_value() orelse return null;
            }
            return value;
        }

        pub fn get_value_alloc(self: *const Self, allocator: Allocator) !?T {
            const type_fields = comptime @typeInfo(T).Struct.fields;
            var value: T = undefined;
            inline for (type_fields) |field| {
                switch (field.type) {
                    []Vector2 => {
                        @field(value, field.name) = try @field(self.inner, field.name).get_value(allocator) orelse return null;
                    },
                    else => {
                        @field(value, field.name) = @field(self.inner, field.name).get_value() orelse return null;
                    },
                }
            }
            return value;
        }
    };
}

fn ParamEditorInner(comptime T: type) type {
    const type_fields = comptime @typeInfo(T).Struct.fields;
    var new_fields: [type_fields.len]std.builtin.Type.StructField = undefined;
    inline for (type_fields, 0..) |field, i| {
        switch (field.type) {
            f32 => {
                new_fields[i] = .{
                    .name = field.name,
                    .type = EditorF32,
                    .default_value = null,
                    .is_comptime = false,
                    .alignment = @alignOf(EditorF32),
                };
            },
            rl.Color => {
                new_fields[i] = .{
                    .name = field.name,
                    .type = EditorColor,
                    .default_value = null,
                    .is_comptime = false,
                    .alignment = @alignOf(EditorColor),
                };
            },
            Vector2 => {
                new_fields[i] = .{
                    .name = field.name,
                    .type = EditorVector2,
                    .default_value = null,
                    .is_comptime = false,
                    .alignment = @alignOf(EditorColor),
                };
            },
            []Vector2 => {
                new_fields[i] = .{
                    .name = field.name,
                    .type = EditorArrayOfVectors,
                    .default_value = null,
                    .is_comptime = false,
                    .alignment = @alignOf(EditorArrayOfVectors),
                };
            },
            else => {},
        }
    }
    return @Type(.{
        .Struct = .{
            .layout = .Auto,
            .fields = new_fields[0..],
            .decls = &[_]std.builtin.Type.Declaration{},
            .is_tuple = false,
        },
    });
}

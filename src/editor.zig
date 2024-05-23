const std = @import("std");
const rl = @import("raylib.zig");
const b2 = @import("box2d.zig");
const flecs = @import("flecs.zig");
const Vector2 = @import("vector.zig");
const Allocator = std.mem.Allocator;

const _game = @import("game.zig");
const MousePosition = _game.MousePosition;
const GameStateStack = _game.GameStateStack;

const _objects = @import("objects.zig");
const AABB = _objects.AABB;

const Ball = _objects.Ball;
const BallParams = _objects.BallParams;

const Anchor = _objects.Anchor;
const AnchorParams = _objects.AnchorParams;

const Rectangle = _objects.Rectangle;
const RectangleParams = _objects.RectangleParams;

const EDITOR_HEIGHT: f32 = 50.0;
const LABEL_WIDTH: f32 = 50.0;
const TEXT_BOX_WIDTH: f32 = 70.0;
const COLOR_PICKER_WIDTH: f32 = 100.0;

const AABB_LINE_THICKNESS = 1.5;
const AABB_COLOR = rl.SKYBLUE;
const AABB_COLOR_SELECTED = rl.ORANGE;

pub const SelectedEntity = struct {
    entity: ?flecs.entity_t = null,
};

pub const EditorBool = struct {
    text_buffer: [Self.TEXT_LEN:0]u8 = .{0} ** Self.TEXT_LEN,
    state: bool,

    const Self = @This();
    const TEXT_LEN: u32 = 8;
    const HEIGHT: f32 = EDITOR_HEIGHT;
    const WIDTH: f32 = LABEL_WIDTH + TEXT_BOX_WIDTH;

    pub fn new(value: *const bool) Self {
        var text_buffer: [Self.TEXT_LEN:0]u8 = .{0} ** Self.TEXT_LEN;
        _ = std.fmt.bufPrintZ(&text_buffer, "{}", .{value.*}) catch unreachable;
        return Self{
            .text_buffer = text_buffer,
            .state = value.*,
        };
    }

    pub fn draw(self: *Self, label: [:0]const u8, position: Vector2, mouse_position: Vector2) bool {
        _ = mouse_position;
        const rl_position = position.to_rl_as_pos();

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

        const switch_state = rl.GuiButton(
            rl.Rectangle{
                .x = rl_position.x,
                .y = rl_position.y,
                .width = Self.WIDTH,
                .height = EDITOR_HEIGHT,
            },
            &self.text_buffer,
        );

        if (switch_state == 1) {
            self.state = !self.state;
        }

        return switch_state == 1;
    }

    pub fn get_value(self: *const Self) ?bool {
        return self.state;
    }
};

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

        pub fn draw(self: *Self, mouse_position: Vector2) ?T {
            const type_fields = comptime @typeInfo(ParamEditorInner(T)).Struct.fields;
            var p = Vector2.ZERO;
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

        pub fn get_value(self: *const Self) ?T {
            const type_fields = comptime @typeInfo(T).Struct.fields;
            var value: T = undefined;
            inline for (type_fields) |field| {
                @field(value, field.name) = @field(self.inner, field.name).get_value() orelse return null;
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
            bool => {
                new_fields[i] = .{
                    .name = field.name,
                    .type = EditorBool,
                    .default_value = null,
                    .is_comptime = false,
                    .alignment = @alignOf(EditorBool),
                };
            },
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
            else => {},
        }
    }
    return @Type(.{
        .Struct = .{
            .layout = .auto,
            .fields = new_fields[0..],
            .decls = &[_]std.builtin.Type.Declaration{},
            .is_tuple = false,
        },
    });
}

const SelectEntityCtx = struct {
    allocator: Allocator,
    ball_query: *flecs.query_t,
    anchor_query: *flecs.query_t,
    rectangle_query: *flecs.query_t,

    const Self = @This();
    pub fn deinit(self: *const Self) callconv(.C) void {
        self.allocator.destroy(self);
    }
};
fn select_entity(iter: *flecs.iter_t) void {
    const state_stack = flecs.singleton_get(iter.world, GameStateStack).?;
    const mouse_pos = flecs.singleton_get(iter.world, MousePosition).?;
    const selected_entity = flecs.singleton_get_mut(iter.world, SelectedEntity).?;

    if (state_stack.current_state() != .Editor) {
        return;
    }

    if (!rl.IsKeyPressed(rl.KEY_S)) {
        return;
    }

    const ctx: *const SelectEntityCtx = @alignCast(@ptrCast(iter.ctx.?));

    var selected: ?flecs.entity_t = null;

    const ball_query: *flecs.query_t = @ptrCast(ctx.ball_query);
    var ball_iter = flecs.query_iter(iter.world, ball_query);
    while (flecs.query_next(&ball_iter)) {
        const balls = flecs.field(&ball_iter, Ball, 1).?;
        for (ball_iter.entities(), balls) |e, b| {
            if (b.aabb_contains(mouse_pos.world_position)) {
                selected = e;
            }
        }
    }

    const anchor_query: *flecs.query_t = @ptrCast(ctx.anchor_query);
    var anchor_iter = flecs.query_iter(iter.world, anchor_query);
    while (flecs.query_next(&anchor_iter)) {
        const anchors = flecs.field(&anchor_iter, Anchor, 1).?;
        for (anchor_iter.entities(), anchors) |e, b| {
            if (b.aabb_contains(mouse_pos.world_position)) {
                selected = e;
            }
        }
    }

    const rectangle_query: *flecs.query_t = @ptrCast(ctx.rectangle_query);
    var rectangle_iter = flecs.query_iter(iter.world, rectangle_query);
    while (flecs.query_next(&rectangle_iter)) {
        const rectangles = flecs.field(&rectangle_iter, Rectangle, 1).?;
        for (rectangle_iter.entities(), rectangles) |e, b| {
            if (b.aabb_contains(mouse_pos.world_position)) {
                selected = e;
            }
        }
    }

    selected_entity.entity = selected;
}

fn draw_balls_aabb(iter: *flecs.iter_t, balls: []const Ball) void {
    const state_stack = flecs.singleton_get(iter.world, GameStateStack).?;
    const selected_entity = flecs.singleton_get(iter.world, SelectedEntity).?;

    if (state_stack.current_state() != .Editor) {
        return;
    }
    for (iter.entities(), balls) |e, *ball| {
        const position = Vector2.from_b2(b2.b2Body_GetPosition(ball.body_id));
        const aabb = AABB.from_b2(b2.b2Shape_GetAABB(ball.shape_id));
        const rl_aabb_rect = aabb.to_rl_rect(position);
        const color = c: {
            if (selected_entity.entity) |selected| {
                break :c if (e == selected) AABB_COLOR_SELECTED else AABB_COLOR;
            } else {
                break :c AABB_COLOR;
            }
        };
        rl.DrawRectangleLinesEx(rl_aabb_rect, AABB_LINE_THICKNESS, color);
    }
}

fn draw_anchors_aabb(iter: *flecs.iter_t, anchors: []const Anchor) void {
    const state_stack = flecs.singleton_get(iter.world, GameStateStack).?;
    const selected_entity = flecs.singleton_get(iter.world, SelectedEntity).?;

    if (state_stack.current_state() == .Editor) {
        for (iter.entities(), anchors) |e, *anchor| {
            const position = Vector2.from_b2(b2.b2Body_GetPosition(anchor.body_id));
            const aabb = AABB.from_b2(b2.b2AABB{
                .lowerBound = (Vector2{
                    .x = -anchor.radius,
                    .y = -anchor.radius,
                }).add(&position).to_b2(),
                .upperBound = (Vector2{
                    .x = anchor.radius,
                    .y = anchor.radius,
                }).add(&position).to_b2(),
            });

            const rl_aabb_rect = aabb.to_rl_rect(position);

            const color = c: {
                if (selected_entity.entity) |selected| {
                    break :c if (e == selected) AABB_COLOR_SELECTED else AABB_COLOR;
                } else {
                    break :c AABB_COLOR;
                }
            };

            rl.DrawRectangleLinesEx(
                rl_aabb_rect,
                AABB_LINE_THICKNESS,
                color,
            );
        }
    }
}

fn draw_rectangles_aabb(iter: *flecs.iter_t, rectangles: []const Rectangle) void {
    const state_stack = flecs.singleton_get(iter.world, GameStateStack).?;
    const selected_entity = flecs.singleton_get(iter.world, SelectedEntity).?;

    if (state_stack.current_state() == .Editor) {
        for (iter.entities(), rectangles) |e, *rectangle| {
            const body_position = Vector2.from_b2(b2.b2Body_GetPosition(rectangle.body_id));
            const aabb = AABB.from_b2(b2.b2Shape_GetAABB(rectangle.rectangle.shape_id));
            const rl_aabb_rect = aabb.to_rl_rect(body_position);

            const color = c: {
                if (selected_entity.entity) |selected| {
                    break :c if (e == selected) AABB_COLOR_SELECTED else AABB_COLOR;
                } else {
                    break :c AABB_COLOR;
                }
            };

            rl.DrawRectangleLinesEx(
                rl_aabb_rect,
                AABB_LINE_THICKNESS,
                color,
            );
        }
    }
}

fn draw_editor_ball(iter: *flecs.iter_t, editors: []ParamEditor(BallParams)) void {
    const mouse_pos = flecs.singleton_get(iter.world, MousePosition).?;
    const selected_entity = flecs.singleton_get(iter.world, SelectedEntity).?;

    if (selected_entity.entity == null) {
        return;
    }

    const selected = selected_entity.entity.?;
    for (iter.entities(), 0..) |e, i| {
        if (e == selected) {
            _ = editors[i].draw(mouse_pos.screen_position);
        }
    }
}

pub fn draw_editor_anchor(iter: *flecs.iter_t, editors: []ParamEditor(AnchorParams)) void {
    const mouse_pos = flecs.singleton_get(iter.world, MousePosition).?;
    const selected_entity = flecs.singleton_get(iter.world, SelectedEntity).?;

    if (selected_entity.entity == null) {
        return;
    }

    const selected = selected_entity.entity.?;
    for (iter.entities(), 0..) |e, i| {
        if (e == selected) {
            _ = editors[i].draw(mouse_pos.screen_position);
        }
    }
}

fn draw_editor_rectangle(iter: *flecs.iter_t, editors: []ParamEditor(RectangleParams)) void {
    const mouse_pos = flecs.singleton_get(iter.world, MousePosition).?;
    const selected_entity = flecs.singleton_get(iter.world, SelectedEntity).?;

    if (selected_entity.entity == null) {
        return;
    }

    const selected = selected_entity.entity.?;
    for (iter.entities(), 0..) |e, i| {
        if (e == selected) {
            _ = editors[i].draw(mouse_pos.screen_position);
        }
    }
}

pub fn FLECS_INIT(world: *flecs.world_t, allocator: Allocator) !void {
    flecs.COMPONENT(world, SelectedEntity);
    flecs.COMPONENT(world, ParamEditor(BallParams));
    flecs.COMPONENT(world, ParamEditor(AnchorParams));
    flecs.COMPONENT(world, ParamEditor(RectangleParams));

    _ = flecs.singleton_set(world, SelectedEntity, .{});

    flecs.ADD_SYSTEM(world, "draw_balls_aabb", flecs.OnUpdate, draw_balls_aabb);
    flecs.ADD_SYSTEM(world, "draw_anchors_aabb", flecs.OnUpdate, draw_anchors_aabb);
    flecs.ADD_SYSTEM(world, "draw_rectangles_aabb", flecs.OnUpdate, draw_rectangles_aabb);

    {
        var desc = flecs.SYSTEM_DESC(select_entity);

        var ball_query: flecs.query_desc_t = .{};
        ball_query.filter.terms[0].inout = .In;
        ball_query.filter.terms[0].id = flecs.id(Ball);
        const bq = try flecs.query_init(world, &ball_query);

        var anchor_query: flecs.query_desc_t = .{};
        anchor_query.filter.terms[0].inout = .In;
        anchor_query.filter.terms[0].id = flecs.id(Anchor);
        const aq = try flecs.query_init(world, &anchor_query);

        var rectangle_query: flecs.query_desc_t = .{};
        rectangle_query.filter.terms[0].inout = .In;
        rectangle_query.filter.terms[0].id = flecs.id(Rectangle);
        const rq = try flecs.query_init(world, &rectangle_query);

        var s_ctx = try allocator.create(SelectEntityCtx);
        s_ctx.allocator = allocator;
        s_ctx.ball_query = bq;
        s_ctx.anchor_query = aq;
        s_ctx.rectangle_query = rq;

        desc.ctx = s_ctx;
        desc.ctx_free = @ptrCast(&SelectEntityCtx.deinit);

        flecs.SYSTEM(world, "select_entity", flecs.OnLoad, &desc);
    }

    flecs.ADD_SYSTEM(world, "draw_editor_ball", flecs.PreStore, draw_editor_ball);
    flecs.ADD_SYSTEM(world, "draw_editor_anchor", flecs.PreStore, draw_editor_anchor);
    flecs.ADD_SYSTEM(world, "draw_editor_rectangle", flecs.PreStore, draw_editor_rectangle);
}

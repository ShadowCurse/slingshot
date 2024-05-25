const std = @import("std");
const rl = @import("raylib.zig");
const imgui = @import("imgui.zig");
const b2 = @import("box2d.zig");
const flecs = @import("flecs.zig");
const Vector2 = @import("vector.zig");
const Allocator = std.mem.Allocator;

const _game = @import("game.zig");
const MousePosition = _game.MousePosition;
const GameStateStack = _game.GameStateStack;
const PhysicsWorld = _game.PhysicsWorld;

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
    state: bool,

    const Self = @This();

    pub fn new(value: *const bool) Self {
        return Self{
            .state = value.*,
        };
    }

    pub fn draw(self: *Self, label: [:0]const u8) bool {
        return imgui.igCheckbox(label, &self.state);
    }

    pub fn get_value(self: *const Self) ?bool {
        return self.state;
    }
};

pub const EditorF32 = struct {
    state: f32,

    const STEP: f32 = 0.01;
    const MIN: f32 = -1000.0;
    const MAX: f32 = 1000.0;
    const FORMAT: [:0]const u8 = "%.3f";

    const Self = @This();

    pub fn new(value: *const f32) Self {
        return Self{
            .state = value.*,
        };
    }

    pub fn draw(self: *Self, label: [:0]const u8) bool {
        return imgui.igDragFloat(
            label,
            &self.state,
            Self.STEP,
            Self.MIN,
            Self.MAX,
            Self.FORMAT,
            0,
        );
    }

    pub fn get_value(self: *const Self) ?f32 {
        return self.state;
    }
};

pub const EditorVector2 = struct {
    state: [2]f32,

    const STEP: f32 = 0.01;
    const MIN: f32 = -1000.0;
    const MAX: f32 = 1000.0;
    const FORMAT: [:0]const u8 = "%.3f";

    const Self = @This();

    pub fn new(value: *const Vector2) Self {
        return Self{
            .state = .{ value.x, value.y },
        };
    }

    pub fn draw(self: *Self, label: [:0]const u8) bool {
        return imgui.igDragFloat2(
            label,
            &self.state,
            Self.STEP,
            Self.MIN,
            Self.MAX,
            Self.FORMAT,
            0,
        );
    }

    pub fn get_value(self: *const Self) ?Vector2 {
        return Vector2{ .x = self.state[0], .y = self.state[1] };
    }
};

pub const EditorColor = struct {
    state: [4]f32,

    const Self = @This();

    pub fn new(value: *const rl.Color) Self {
        return Self{
            .state = .{
                @as(f32, @floatFromInt(value.r)) / 255.0,
                @as(f32, @floatFromInt(value.g)) / 255.0,
                @as(f32, @floatFromInt(value.b)) / 255.0,
                @as(f32, @floatFromInt(value.a)) / 255.0,
            },
        };
    }

    pub fn draw(self: *Self, label: [:0]const u8) bool {
        return imgui.igColorEdit4(
            label,
            &self.state,
            0,
        );
    }

    pub fn get_value(self: *const Self) ?rl.Color {
        return rl.Color{
            .r = @intFromFloat(self.state[0] * 255.0),
            .g = @intFromFloat(self.state[1] * 255.0),
            .b = @intFromFloat(self.state[2] * 255.0),
            .a = @intFromFloat(self.state[3] * 255.0),
        };
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

        pub fn draw(self: *Self) ?T {
            const type_name = @typeName(T);
            const type_fields = comptime @typeInfo(ParamEditorInner(T)).Struct.fields;
            var interacted = false;
            var open = true;
            if (imgui.igBegin(type_name, &open, 0)) {
                defer imgui.igEnd();

                inline for (type_fields) |field| {
                    // converts []const u8 that @typeInfo contains to [:0]const u8 for imgui
                    const field_name: [:0]const u8 = std.fmt.comptimePrint("{s}", .{field.name});
                    interacted = interacted or field.type.draw(&@field(self.inner, field.name), field_name);
                }
                if (interacted) {
                    return self.get_value();
                } else {
                    return null;
                }
            }
            return null;
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
                    .alignment = @alignOf(EditorVector2),
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

    if (state_stack.current_state() != .Editor) {
        return;
    }

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

fn draw_rectangles_aabb(iter: *flecs.iter_t, rectangles: []const Rectangle) void {
    const state_stack = flecs.singleton_get(iter.world, GameStateStack).?;
    const selected_entity = flecs.singleton_get(iter.world, SelectedEntity).?;

    if (state_stack.current_state() != .Editor) {
        return;
    }

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

fn draw_editor_ball(
    iter: *flecs.iter_t,
    balls: []Ball,
    params: []BallParams,
    editors: []ParamEditor(BallParams),
) void {
    const selected_entity = flecs.singleton_get(iter.world, SelectedEntity).?;
    const physics_world = flecs.singleton_get(iter.world, PhysicsWorld).?;

    if (selected_entity.entity == null) {
        return;
    }

    const selected = selected_entity.entity.?;
    for (iter.entities(), 0..) |e, i| {
        if (e == selected) {
            const b = &balls[i];
            const p = &params[i];
            const editor = &editors[i];
            if (editor.draw()) |new_param| {
                const new_ball = Ball.new(physics_world.id, new_param);
                p.* = new_param;
                b.deinit();
                b.* = new_ball;
            }
        }
    }
}

pub fn draw_editor_anchor(
    iter: *flecs.iter_t,
    anchors: []Anchor,
    params: []AnchorParams,
    editors: []ParamEditor(AnchorParams),
) void {
    const selected_entity = flecs.singleton_get(iter.world, SelectedEntity).?;
    const physics_world = flecs.singleton_get(iter.world, PhysicsWorld).?;

    if (selected_entity.entity == null) {
        return;
    }

    const selected = selected_entity.entity.?;
    for (iter.entities(), 0..) |e, i| {
        if (e == selected) {
            const a = &anchors[i];
            const p = &params[i];
            const editor = &editors[i];
            if (editor.draw()) |new_param| {
                const new_anchor = Anchor.new(physics_world.id, new_param);
                p.* = new_param;
                a.deinit();
                a.* = new_anchor;
            }
        }
    }
}

fn draw_editor_rectangle(
    iter: *flecs.iter_t,
    rectangles: []Rectangle,
    params: []RectangleParams,
    editors: []ParamEditor(RectangleParams),
) void {
    const selected_entity = flecs.singleton_get(iter.world, SelectedEntity).?;
    const physics_world = flecs.singleton_get(iter.world, PhysicsWorld).?;

    if (selected_entity.entity == null) {
        return;
    }

    const selected = selected_entity.entity.?;
    for (iter.entities(), 0..) |e, i| {
        if (e == selected) {
            const r = &rectangles[i];
            const p = &params[i];
            const editor = &editors[i];
            if (editor.draw()) |new_param| {
                const new_rect = Rectangle.new(physics_world.id, new_param) catch return;
                p.* = new_param;
                r.deinit();
                r.* = new_rect;
            }
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

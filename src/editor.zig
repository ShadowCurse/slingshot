const std = @import("std");
const Vector2 = @import("vector.zig");
const Allocator = std.mem.Allocator;

const rl = @import("deps/raylib.zig");
const imgui = @import("deps/imgui.zig");
const b2 = @import("deps/box2d.zig");
const flecs = @import("deps/flecs.zig");

const TAG = flecs.SYSTEM_PARAMETER_TAG;
const WORLD = flecs.SYSTEM_PARAMETER_WORLD;
const STATIC = flecs.SYSTEM_PARAMETER_STATIC;
const ENTITIES = flecs.SYSTEM_PARAMETER_ENTITIES;
const COMPONENT = flecs.SYSTEM_PARAMETER_COMPONENT;
const COMPONENT_MUT = flecs.SYSTEM_PARAMETER_COMPONENT_MUT;
const SINGLETON = flecs.SYSTEM_PARAMETER_SINGLETON;
const SINGLETON_MUT = flecs.SYSTEM_PARAMETER_SINGLETON_MUT;

const __game = @import("game.zig");
const PhysicsWorld = __game.PhysicsWorld;
const MousePosition = __game.MousePosition;
const GameStateStack = __game.GameStateStack;

const __level = @import("level.zig");
const LevelState = __level.LevelState;

const __objects = @import("objects.zig");
const AABB = __objects.AABB;
const BodyId = __objects.BodyId;
const ShapeId = __objects.ShapeId;
const Color = __objects.Color;
const Position = __objects.Position;

const TextTag = __objects.TextTag;
const TextText = __objects.TextText;
const TextBundle = __objects.TextBundle;
const TextParams = __objects.TextParams;

const SpawnerTag = __objects.SpawnerTag;

const BallTag = __objects.BallTag;
const BallShape = __objects.BallShape;
const BallBundle = __objects.BallBundle;

const AnchorTag = __objects.AnchorTag;
const AnchorShape = __objects.AnchorShape;
const AnchoraJointParams = __objects.AnchoraJointParams;
const AnchorBundle = __objects.AnchorBundle;

const PortalTag = __objects.PortalTag;
const PortalShape = __objects.PortalShape;
const PortalId = __objects.PortalId;
const PortalTarget = __objects.PortalTarget;
const PortalBundle = __objects.PortalBundle;

const BlackHoleTag = __objects.BlackHoleTag;
const BlackHoleShape = __objects.BlackHoleShape;
const BlackHoleStrength = __objects.BlackHoleStrength;
const BlackHoleBundle = __objects.BlackHoleBundle;

const RectangleTag = __objects.RectangleTag;
const RectangleShape = __objects.RectangleShape;
const RectangleBundle = __objects.RectangleBundle;

const EDITOR_HEIGHT: f32 = 50.0;
const LABEL_WIDTH: f32 = 50.0;
const TEXT_BOX_WIDTH: f32 = 70.0;
const COLOR_PICKER_WIDTH: f32 = 100.0;

const AABB_LINE_THICKNESS = 1.5;
const AABB_COLOR = rl.SKYBLUE;
const AABB_COLOR_SELECTED = rl.ORANGE;

pub const SelectedEntity = struct {
    entity: ?flecs.entity_t = null,
    hovered: bool = false,
};

pub const EditorCamera = struct {
    camera: rl.Camera2D,
};

pub const EditorState = struct {
    level_path: [256]u8 = .{0} ** 256,
    // used to disable object dragging when
    // editor ui is hovered or focused
    focused: bool = false,
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

pub const EditorI32 = struct {
    state: i32,

    const SPEED: f32 = 0.01;
    const MIN: i32 = -1000.0;
    const MAX: i32 = 1000.0;
    const FORMAT: [:0]const u8 = "%d";

    const Self = @This();

    pub fn new(value: *const i32) Self {
        return Self{
            .state = value.*,
        };
    }

    pub fn draw(self: *Self, label: [:0]const u8) bool {
        return imgui.igDragInt(
            label,
            &self.state,
            Self.SPEED,
            Self.MIN,
            Self.MAX,
            Self.FORMAT,
            0,
        );
    }

    pub fn get_value(self: *const Self) ?i32 {
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

pub const EditorText = struct {
    state: TextParams.TEXT_TYPE = TextParams.TEXT_DEFAULT,

    const Self = @This();

    pub fn new(value: *const TextParams.TEXT_TYPE) Self {
        var self: Self = undefined;
        @memcpy(&self.state, value);
        return self;
    }

    pub fn draw(self: *Self, label: [:0]const u8) bool {
        return imgui.igInputText(
            label,
            &self.state,
            self.state.len,
            0,
            null,
            null,
        );
    }

    pub fn get_value(self: *const Self) ?TextParams.TEXT_TYPE {
        return self.state;
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

        pub fn draw(self: *Self) bool {
            const type_fields = comptime @typeInfo(ParamEditorInner(T)).Struct.fields;
            var interacted = false;

            inline for (type_fields) |field| {
                // converts []const u8 that @typeInfo contains to [:0]const u8 for imgui
                const field_name: [:0]const u8 = std.fmt.comptimePrint("{s}", .{field.name});
                interacted = interacted or field.type.draw(&@field(self.inner, field.name), field_name);
            }
            return interacted;
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
            TextParams.TEXT_TYPE => {
                new_fields[i] = .{
                    .name = field.name,
                    .type = EditorText,
                    .default_value = null,
                    .is_comptime = false,
                    .alignment = @alignOf(EditorText),
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

fn update_editor_camera(
    _state_stack: SINGLETON(GameStateStack),
    _editor_camera: SINGLETON_MUT(EditorCamera),
) void {
    const state_stack = _state_stack.get();
    const editor_camera = _editor_camera.get_mut();

    if (state_stack.current_state() != .Editor) {
        return;
    }

    if (rl.IsMouseButtonDown(rl.MOUSE_BUTTON_MIDDLE)) {
        const delta = rl.GetMouseDelta();
        editor_camera.camera.target.x -= delta.x;
        editor_camera.camera.target.y -= delta.y;
    }

    const mouse_wheel_move = rl.GetMouseWheelMove() / 10.0;
    editor_camera.camera.zoom += mouse_wheel_move;
}

fn enter_editor_mode(
    _editor_state: SINGLETON(EditorState),
    _state_stack: SINGLETON_MUT(GameStateStack),
) void {
    const editor_state = _editor_state.get();
    const state_stack = _state_stack.get_mut();

    if (editor_state.focused) {
        return;
    }

    const current_state = state_stack.current_state();
    if (rl.IsKeyPressed(rl.KEY_E)) {
        if (current_state == .Running) {
            state_stack.push_state(.Editor);
        } else if (current_state == .Editor) {
            state_stack.pop_state();
        }
    }
}

const SelectEntityCtx = struct {
    text_query: *flecs.query_t,
    spawner_query: *flecs.query_t,
    ball_query: *flecs.query_t,
    anchor_query: *flecs.query_t,
    portal_query: *flecs.query_t,
    black_hole_query: *flecs.query_t,
    rectangle_query: *flecs.query_t,

    const Self = @This();
    pub fn init(world: *flecs.world_t) !Self {
        var text_query: flecs.query_desc_t = .{};
        text_query.filter.terms[0].inout = .In;
        text_query.filter.terms[0].id = flecs.id(AABB);
        text_query.filter.terms[1].inout = .In;
        text_query.filter.terms[1].id = flecs.id(Position);
        text_query.filter.terms[2].inout = .In;
        text_query.filter.terms[2].id = flecs.id(TextTag);
        const tq = try flecs.query_init(world, &text_query);

        var spawner_query: flecs.query_desc_t = .{};
        spawner_query.filter.terms[0].inout = .In;
        spawner_query.filter.terms[0].id = flecs.id(AABB);
        spawner_query.filter.terms[1].inout = .In;
        spawner_query.filter.terms[1].id = flecs.id(Position);
        spawner_query.filter.terms[2].inout = .In;
        spawner_query.filter.terms[2].id = flecs.id(SpawnerTag);
        const sq = try flecs.query_init(world, &spawner_query);

        var ball_query: flecs.query_desc_t = .{};
        ball_query.filter.terms[0].inout = .In;
        ball_query.filter.terms[0].id = flecs.id(AABB);
        ball_query.filter.terms[1].inout = .In;
        ball_query.filter.terms[1].id = flecs.id(Position);
        ball_query.filter.terms[2].inout = .In;
        ball_query.filter.terms[2].id = flecs.id(BallTag);
        const bq = try flecs.query_init(world, &ball_query);

        var anchor_query: flecs.query_desc_t = .{};
        anchor_query.filter.terms[0].inout = .In;
        anchor_query.filter.terms[0].id = flecs.id(AABB);
        anchor_query.filter.terms[1].inout = .In;
        anchor_query.filter.terms[1].id = flecs.id(Position);
        anchor_query.filter.terms[2].inout = .In;
        anchor_query.filter.terms[2].id = flecs.id(AnchorTag);
        const aq = try flecs.query_init(world, &anchor_query);

        var portal_query: flecs.query_desc_t = .{};
        portal_query.filter.terms[0].inout = .In;
        portal_query.filter.terms[0].id = flecs.id(AABB);
        portal_query.filter.terms[1].inout = .In;
        portal_query.filter.terms[1].id = flecs.id(Position);
        portal_query.filter.terms[2].inout = .In;
        portal_query.filter.terms[2].id = flecs.id(PortalTag);
        const pq = try flecs.query_init(world, &portal_query);

        var black_hole_query: flecs.query_desc_t = .{};
        black_hole_query.filter.terms[0].inout = .In;
        black_hole_query.filter.terms[0].id = flecs.id(AABB);
        black_hole_query.filter.terms[1].inout = .In;
        black_hole_query.filter.terms[1].id = flecs.id(Position);
        black_hole_query.filter.terms[2].inout = .In;
        black_hole_query.filter.terms[2].id = flecs.id(BlackHoleTag);
        const bhq = try flecs.query_init(world, &black_hole_query);

        var rectangle_query: flecs.query_desc_t = .{};
        rectangle_query.filter.terms[0].inout = .In;
        rectangle_query.filter.terms[0].id = flecs.id(AABB);
        rectangle_query.filter.terms[1].inout = .In;
        rectangle_query.filter.terms[1].id = flecs.id(Position);
        rectangle_query.filter.terms[2].inout = .In;
        rectangle_query.filter.terms[2].id = flecs.id(RectangleTag);
        const rq = try flecs.query_init(world, &rectangle_query);

        return .{
            .text_query = tq,
            .spawner_query = sq,
            .ball_query = bq,
            .anchor_query = aq,
            .portal_query = pq,
            .black_hole_query = bhq,
            .rectangle_query = rq,
        };
    }
};
fn select_entity(
    _world: WORLD(),
    _ctx: STATIC(SelectEntityCtx),
    _state_stack: SINGLETON(GameStateStack),
    _editor_state: SINGLETON(EditorState),
    _mouse_pos: SINGLETON(MousePosition),
    _selected_entity: SINGLETON_MUT(SelectedEntity),
) void {
    const world = _world.get_mut();
    const ctx = _ctx.get();
    const state_stack = _state_stack.get();
    const editor_state = _editor_state.get();
    const mouse_pos = _mouse_pos.get();
    const selected_entity = _selected_entity.get_mut();

    if (state_stack.current_state() != .Editor) {
        return;
    }

    if (editor_state.focused) {
        return;
    }

    if (!rl.IsMouseButtonPressed(rl.MOUSE_LEFT_BUTTON)) {
        return;
    }

    var selected: ?flecs.entity_t = null;
    const text_query: *flecs.query_t = @ptrCast(ctx.text_query);
    var text_iter = flecs.query_iter(world, text_query);
    while (flecs.query_next(&text_iter)) {
        const aabbs = flecs.field(&text_iter, AABB, 1).?;
        const positions = flecs.field(&text_iter, Position, 2).?;
        for (text_iter.entities(), aabbs, positions) |e, aabb, position| {
            if (aabb.contains(position.value, mouse_pos.world_position)) {
                selected = e;
            }
        }
    }

    const spawner_query: *flecs.query_t = @ptrCast(ctx.spawner_query);
    var spawner_iter = flecs.query_iter(world, spawner_query);
    while (flecs.query_next(&spawner_iter)) {
        const aabbs = flecs.field(&spawner_iter, AABB, 1).?;
        const positions = flecs.field(&spawner_iter, Position, 2).?;
        for (spawner_iter.entities(), aabbs, positions) |e, aabb, position| {
            if (aabb.contains(position.value, mouse_pos.world_position)) {
                selected = e;
            }
        }
    }

    const ball_query: *flecs.query_t = @ptrCast(ctx.ball_query);
    var ball_iter = flecs.query_iter(world, ball_query);
    while (flecs.query_next(&ball_iter)) {
        const aabbs = flecs.field(&ball_iter, AABB, 1).?;
        const positions = flecs.field(&ball_iter, Position, 2).?;
        for (ball_iter.entities(), aabbs, positions) |e, aabb, position| {
            if (aabb.contains(position.value, mouse_pos.world_position)) {
                selected = e;
            }
        }
    }

    const anchor_query: *flecs.query_t = @ptrCast(ctx.anchor_query);
    var anchor_iter = flecs.query_iter(world, anchor_query);
    while (flecs.query_next(&anchor_iter)) {
        const aabbs = flecs.field(&anchor_iter, AABB, 1).?;
        const positions = flecs.field(&anchor_iter, Position, 2).?;
        for (anchor_iter.entities(), aabbs, positions) |e, aabb, position| {
            if (aabb.contains(position.value, mouse_pos.world_position)) {
                selected = e;
            }
        }
    }

    const portal_query: *flecs.query_t = @ptrCast(ctx.portal_query);
    var portal_iter = flecs.query_iter(world, portal_query);
    while (flecs.query_next(&portal_iter)) {
        const aabbs = flecs.field(&portal_iter, AABB, 1).?;
        const positions = flecs.field(&portal_iter, Position, 2).?;
        for (portal_iter.entities(), aabbs, positions) |e, aabb, position| {
            if (aabb.contains(position.value, mouse_pos.world_position)) {
                selected = e;
            }
        }
    }

    const black_hole_query: *flecs.query_t = @ptrCast(ctx.black_hole_query);
    var black_hole_iter = flecs.query_iter(world, black_hole_query);
    while (flecs.query_next(&black_hole_iter)) {
        const aabbs = flecs.field(&black_hole_iter, AABB, 1).?;
        const positions = flecs.field(&black_hole_iter, Position, 2).?;
        for (black_hole_iter.entities(), aabbs, positions) |e, aabb, position| {
            if (aabb.contains(position.value, mouse_pos.world_position)) {
                selected = e;
            }
        }
    }

    const rectangle_query: *flecs.query_t = @ptrCast(ctx.rectangle_query);
    var rectangle_iter = flecs.query_iter(world, rectangle_query);
    while (flecs.query_next(&rectangle_iter)) {
        const aabbs = flecs.field(&rectangle_iter, AABB, 1).?;
        const positions = flecs.field(&rectangle_iter, Position, 2).?;
        for (rectangle_iter.entities(), aabbs, positions) |e, aabb, position| {
            if (aabb.contains(position.value, mouse_pos.world_position)) {
                selected = e;
            }
        }
    }

    selected_entity.entity = selected;
}

fn drag_selected_entity(
    _world: WORLD(),
    _state_stack: SINGLETON(GameStateStack),
    _mouse_pos: SINGLETON(MousePosition),
    _selected_entity: SINGLETON(SelectedEntity),
) void {
    const world = _world.get_mut();
    const state_stack = _state_stack.get();
    const mouse_pos = _mouse_pos.get();
    const selected_entity = _selected_entity.get();

    if (state_stack.current_state() != .Editor) {
        return;
    }

    if (!rl.IsMouseButtonDown(rl.MOUSE_BUTTON_RIGHT)) {
        return;
    }

    if (selected_entity.entity == null) {
        return;
    }

    const selected = selected_entity.entity.?;

    if (flecs.get(world, selected, BodyId)) |body| {
        b2.b2Body_SetTransform(body.id, mouse_pos.world_position.to_b2(), 0.0);
    } else {
        const position = if (flecs.get_mut(world, selected, Position)) |p| p else return;
        position.value = mouse_pos.world_position;
    }
}

fn draw_texts_aabb(
    _entities: ENTITIES(),
    _state_stack: SINGLETON(GameStateStack),
    _selected_entity: SINGLETON(SelectedEntity),
    _aabbs: COMPONENT(AABB, .In),
    _positions: COMPONENT(Position, .In),
    _: TAG(TextTag),
) void {
    const entities = _entities.get();
    const state_stack = _state_stack.get();
    const selected_entity = _selected_entity.get();
    const aabbs = _aabbs.get();
    const positions = _positions.get();

    if (state_stack.current_state() != .Editor) {
        return;
    }

    for (entities, aabbs, positions) |e, *aabb, *position| {
        const rl_aabb_rect = aabb.to_rl_rect(position.value);
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

fn draw_spawners_aabb(
    _entities: ENTITIES(),
    _state_stack: SINGLETON(GameStateStack),
    _selected_entity: SINGLETON(SelectedEntity),
    _aabbs: COMPONENT(AABB, .In),
    _positions: COMPONENT(Position, .In),
    _: TAG(SpawnerTag),
) void {
    const entities = _entities.get();
    const state_stack = _state_stack.get();
    const selected_entity = _selected_entity.get();
    const aabbs = _aabbs.get();
    const positions = _positions.get();

    if (state_stack.current_state() != .Editor) {
        return;
    }

    for (entities, aabbs, positions) |e, *aabb, *position| {
        const rl_aabb_rect = aabb.to_rl_rect(position.value);
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

fn draw_balls_aabb(
    _entities: ENTITIES(),
    _state_stack: SINGLETON(GameStateStack),
    _selected_entity: SINGLETON(SelectedEntity),
    _aabbs: COMPONENT(AABB, .In),
    _positions: COMPONENT(Position, .In),
    _: TAG(BallTag),
) void {
    const entities = _entities.get();
    const state_stack = _state_stack.get();
    const selected_entity = _selected_entity.get();
    const aabbs = _aabbs.get();
    const positions = _positions.get();

    if (state_stack.current_state() != .Editor) {
        return;
    }

    for (entities, aabbs, positions) |e, *aabb, *position| {
        const rl_aabb_rect = aabb.to_rl_rect(position.value);
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

fn draw_anchors_aabb(
    _entities: ENTITIES(),
    _state_stack: SINGLETON(GameStateStack),
    _selected_entity: SINGLETON(SelectedEntity),
    _aabbs: COMPONENT(AABB, .In),
    _positions: COMPONENT(Position, .In),
    _: TAG(AnchorTag),
) void {
    const entities = _entities.get();
    const state_stack = _state_stack.get();
    const selected_entity = _selected_entity.get();
    const aabbs = _aabbs.get();
    const positions = _positions.get();

    if (state_stack.current_state() != .Editor) {
        return;
    }

    for (entities, aabbs, positions) |e, *aabb, *position| {
        const rl_aabb_rect = aabb.to_rl_rect(position.value);

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

fn draw_portals_aabb(
    _entities: ENTITIES(),
    _state_stack: SINGLETON(GameStateStack),
    _selected_entity: SINGLETON(SelectedEntity),
    _aabbs: COMPONENT(AABB, .In),
    _positions: COMPONENT(Position, .In),
    _: TAG(PortalTag),
) void {
    const entities = _entities.get();
    const state_stack = _state_stack.get();
    const selected_entity = _selected_entity.get();
    const aabbs = _aabbs.get();
    const positions = _positions.get();

    if (state_stack.current_state() != .Editor) {
        return;
    }

    for (entities, aabbs, positions) |e, *aabb, *position| {
        const rl_aabb_rect = aabb.to_rl_rect(position.value);

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

fn draw_black_holess_aabb(
    _entities: ENTITIES(),
    _state_stack: SINGLETON(GameStateStack),
    _selected_entity: SINGLETON(SelectedEntity),
    _aabbs: COMPONENT(AABB, .In),
    _positions: COMPONENT(Position, .In),
    _: TAG(BlackHoleTag),
) void {
    const entities = _entities.get();
    const state_stack = _state_stack.get();
    const selected_entity = _selected_entity.get();
    const aabbs = _aabbs.get();
    const positions = _positions.get();

    if (state_stack.current_state() != .Editor) {
        return;
    }

    for (entities, aabbs, positions) |e, *aabb, *position| {
        const rl_aabb_rect = aabb.to_rl_rect(position.value);

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

fn draw_rectangles_aabb(
    _entities: ENTITIES(),
    _state_stack: SINGLETON(GameStateStack),
    _selected_entity: SINGLETON(SelectedEntity),
    _aabbs: COMPONENT(AABB, .In),
    _positions: COMPONENT(Position, .In),
    _: TAG(RectangleTag),
) void {
    const entities = _entities.get();
    const state_stack = _state_stack.get();
    const selected_entity = _selected_entity.get();
    const aabbs = _aabbs.get();
    const positions = _positions.get();

    if (state_stack.current_state() != .Editor) {
        return;
    }

    for (entities, aabbs, positions) |e, *aabb, *position| {
        const rl_aabb_rect = aabb.to_rl_rect(position.value);

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

fn draw_editor_text(
    _entities: ENTITIES(),
    _state_stack: SINGLETON(GameStateStack),
    _selected_entity: SINGLETON(SelectedEntity),
    _colors: COMPONENT_MUT(Color, .InOut),
    _positions: COMPONENT_MUT(Position, .InOut),
    _texts: COMPONENT_MUT(TextText, .InOut),
) void {
    const entities = _entities.get();
    const state_stack = _state_stack.get();
    const selected_entity = _selected_entity.get();
    const colors = _colors.get_mut();
    const positions = _positions.get_mut();
    const texts = _texts.get_mut();

    if (state_stack.current_state() != .Editor) {
        return;
    }

    if (selected_entity.entity == null) {
        return;
    }

    const LocalCtx = struct {
        // used to detect when entity is first
        // selected for editors initialization.
        var current_entity: flecs.entity_t = 0;
        var editor_color: EditorColor = undefined;
        var editor_position: EditorVector2 = undefined;
        var editor_text: ParamEditor(TextText) = undefined;
    };

    const selected = selected_entity.entity.?;

    for (entities, 0..) |e, i| {
        if (e == selected) {
            const color = &colors[i];
            const position = &positions[i];
            const text = &texts[i];

            if (LocalCtx.current_entity != selected) {
                LocalCtx.editor_color = EditorColor.new(&color.value);
                LocalCtx.editor_position = EditorVector2.new(&position.value);
                LocalCtx.editor_text = ParamEditor(TextText).new(text);
            }

            var open = true;
            if (imgui.igBegin("EditorText", &open, 0)) {
                defer imgui.igEnd();

                if (LocalCtx.editor_color.draw("color")) {
                    if (LocalCtx.editor_color.get_value()) |v| {
                        color.value = v;
                    }
                }

                if (LocalCtx.editor_position.draw("position")) {
                    if (LocalCtx.editor_position.get_value()) |v| {
                        position.value = v;
                    }
                }

                if (LocalCtx.editor_text.draw()) {
                    if (LocalCtx.editor_text.get_value()) |v| {
                        text.* = v;
                    }
                }
            }
        }
    }
}

fn draw_editor_ball(
    _entities: ENTITIES(),
    _state_stack: SINGLETON(GameStateStack),
    _selected_entity: SINGLETON(SelectedEntity),
    _body_ids: COMPONENT(BodyId, .In),
    _shape_ids: COMPONENT(ShapeId, .In),
    _colors: COMPONENT_MUT(Color, .InOut),
    _positions: COMPONENT_MUT(Position, .InOut),
    _aabbs: COMPONENT_MUT(AABB, .InOut),
    _shapes: COMPONENT_MUT(BallShape, .InOut),
) void {
    const entities = _entities.get();
    const state_stack = _state_stack.get();
    const selected_entity = _selected_entity.get();
    const body_ids = _body_ids.get();
    const shape_ids = _shape_ids.get();
    const colors = _colors.get_mut();
    const positions = _positions.get_mut();
    const aabbs = _aabbs.get_mut();
    const shapes = _shapes.get_mut();

    if (state_stack.current_state() != .Editor) {
        return;
    }

    if (selected_entity.entity == null) {
        return;
    }

    const LocalCtx = struct {
        // used to detect when entity is first
        // selected for editors initialization.
        var current_entity: flecs.entity_t = 0;
        var editor_color: EditorColor = undefined;
        var editor_position: EditorVector2 = undefined;
        var editor_radius: EditorF32 = undefined;
    };

    const selected = selected_entity.entity.?;

    for (entities, 0..) |e, i| {
        if (e == selected) {
            const color = &colors[i];
            const position = &positions[i];
            const aabb = &aabbs[i];
            const shape = &shapes[i];
            const body_id = &body_ids[i];
            const shape_id = &shape_ids[i];

            if (LocalCtx.current_entity != selected) {
                LocalCtx.editor_color = EditorColor.new(&color.value);
                LocalCtx.editor_position = EditorVector2.new(&position.value);
                LocalCtx.editor_radius = EditorF32.new(&shape.radius);
            }

            var open = true;
            if (imgui.igBegin("EditorBall", &open, 0)) {
                defer imgui.igEnd();

                if (LocalCtx.editor_color.draw("color")) {
                    if (LocalCtx.editor_color.get_value()) |v| {
                        color.value = v;
                    }
                }

                if (LocalCtx.editor_position.draw("position")) {
                    if (LocalCtx.editor_position.get_value()) |v| {
                        position.value = v;
                        b2.b2Body_SetTransform(body_id.id, v.to_b2(), 0.0);
                    }
                }

                if (LocalCtx.editor_radius.draw("radius")) {
                    if (LocalCtx.editor_radius.get_value()) |v| {
                        shape.radius = v;
                        const circle = b2.b2Circle{
                            .point = b2.b2Vec2{ .x = 0.0, .y = 0.0 },
                            .radius = v,
                        };
                        b2.b2Shape_SetCircle(shape_id.id, &circle);
                        aabb.* = AABB.from_b2(b2.b2Shape_GetAABB(shape_id.id));
                    }
                }
            }
        }
    }
}

pub fn draw_editor_anchor(
    _entities: ENTITIES(),
    _state_stack: SINGLETON(GameStateStack),
    _selected_entity: SINGLETON(SelectedEntity),
    _body_ids: COMPONENT(BodyId, .In),
    _colors: COMPONENT_MUT(Color, .InOut),
    _positions: COMPONENT_MUT(Position, .InOut),
    _aabbs: COMPONENT_MUT(AABB, .InOut),
    _shapes: COMPONENT_MUT(AnchorShape, .InOut),
    _joint_params: COMPONENT_MUT(AnchoraJointParams, .InOut),
) void {
    const entities = _entities.get();
    const state_stack = _state_stack.get();
    const selected_entity = _selected_entity.get();
    const body_ids = _body_ids.get();
    const colors = _colors.get_mut();
    const positions = _positions.get_mut();
    const aabbs = _aabbs.get_mut();
    const shapes = _shapes.get_mut();
    const joint_params = _joint_params.get_mut();

    if (state_stack.current_state() != .Editor) {
        return;
    }

    if (selected_entity.entity == null) {
        return;
    }

    const LocalCtx = struct {
        // used to detect when entity is first
        // selected for editors initialization.
        var current_entity: flecs.entity_t = 0;
        var editor_color: EditorColor = undefined;
        var editor_position: EditorVector2 = undefined;
        var editor_radius: EditorF32 = undefined;
        var editor_joint_params: ParamEditor(AnchoraJointParams) = undefined;
    };

    const selected = selected_entity.entity.?;

    for (entities, 0..) |e, i| {
        if (e == selected) {
            const color = &colors[i];
            const position = &positions[i];
            const aabb = &aabbs[i];
            const shape = &shapes[i];
            const joint_param = &joint_params[i];
            const body_id = &body_ids[i];

            if (LocalCtx.current_entity != selected) {
                LocalCtx.editor_color = EditorColor.new(&color.value);
                LocalCtx.editor_position = EditorVector2.new(&position.value);
                LocalCtx.editor_radius = EditorF32.new(&shape.radius);
                LocalCtx.editor_joint_params = ParamEditor(AnchoraJointParams).new(joint_param);
            }

            var open = true;
            if (imgui.igBegin("EditorAnchor", &open, 0)) {
                defer imgui.igEnd();

                if (LocalCtx.editor_color.draw("color")) {
                    if (LocalCtx.editor_color.get_value()) |v| {
                        color.value = v;
                    }
                }

                if (LocalCtx.editor_position.draw("position")) {
                    if (LocalCtx.editor_position.get_value()) |v| {
                        position.value = v;
                        b2.b2Body_SetTransform(body_id.id, v.to_b2(), 0.0);
                    }
                }

                if (LocalCtx.editor_radius.draw("radius")) {
                    if (LocalCtx.editor_radius.get_value()) |v| {
                        shape.radius = v;
                        const new_aabb = AABB.new_square(v);
                        aabb.* = new_aabb;
                    }
                }

                if (LocalCtx.editor_joint_params.draw()) {
                    if (LocalCtx.editor_joint_params.get_value()) |v| {
                        joint_param.* = v;
                    }
                }
            }
        }
    }
}

pub fn draw_editor_portal(
    _entities: ENTITIES(),
    _state_stack: SINGLETON(GameStateStack),
    _selected_entity: SINGLETON(SelectedEntity),
    _body_ids: COMPONENT(BodyId, .In),
    _colors: COMPONENT_MUT(Color, .InOut),
    _positions: COMPONENT_MUT(Position, .InOut),
    _aabbs: COMPONENT_MUT(AABB, .InOut),
    _shapes: COMPONENT_MUT(PortalShape, .InOut),
    _ids: COMPONENT_MUT(PortalId, .InOut),
    _targets: COMPONENT_MUT(PortalTarget, .InOut),
) void {
    const entities = _entities.get();
    const state_stack = _state_stack.get();
    const selected_entity = _selected_entity.get();
    const body_ids = _body_ids.get();
    const colors = _colors.get_mut();
    const positions = _positions.get_mut();
    const aabbs = _aabbs.get_mut();
    const shapes = _shapes.get_mut();
    const ids = _ids.get_mut();
    const targets = _targets.get_mut();

    if (state_stack.current_state() != .Editor) {
        return;
    }

    if (selected_entity.entity == null) {
        return;
    }

    const LocalCtx = struct {
        // used to detect when entity is first
        // selected for editors initialization.
        var current_entity: flecs.entity_t = 0;
        var editor_color: EditorColor = undefined;
        var editor_position: EditorVector2 = undefined;
        var editor_radius: EditorF32 = undefined;
        var editor_id: EditorI32 = undefined;
        var editor_target: EditorI32 = undefined;
    };

    const selected = selected_entity.entity.?;

    for (entities, 0..) |e, i| {
        if (e == selected) {
            const body_id = &body_ids[i];
            const color = &colors[i];
            const position = &positions[i];
            const aabb = &aabbs[i];
            const shape = &shapes[i];
            const id = &ids[i];
            const target = &targets[i];

            if (LocalCtx.current_entity != selected) {
                LocalCtx.editor_color = EditorColor.new(&color.value);
                LocalCtx.editor_position = EditorVector2.new(&position.value);
                LocalCtx.editor_radius = EditorF32.new(&shape.radius);
                LocalCtx.editor_id = EditorI32.new(&id.id);
                LocalCtx.editor_target = EditorI32.new(&target.id);
            }

            var open = true;
            if (imgui.igBegin("EditorPortal", &open, 0)) {
                defer imgui.igEnd();

                if (LocalCtx.editor_color.draw("color")) {
                    if (LocalCtx.editor_color.get_value()) |v| {
                        color.value = v;
                    }
                }

                if (LocalCtx.editor_position.draw("position")) {
                    if (LocalCtx.editor_position.get_value()) |v| {
                        position.value = v;
                        b2.b2Body_SetTransform(body_id.id, v.to_b2(), 0.0);
                    }
                }

                if (LocalCtx.editor_radius.draw("radius")) {
                    if (LocalCtx.editor_radius.get_value()) |v| {
                        shape.radius = v;
                        const new_aabb = AABB.new_square(v);
                        aabb.* = new_aabb;
                    }
                }

                if (LocalCtx.editor_id.draw("id")) {
                    if (LocalCtx.editor_id.get_value()) |v| {
                        id.id = v;
                    }
                }

                if (LocalCtx.editor_target.draw("target")) {
                    if (LocalCtx.editor_target.get_value()) |v| {
                        target.id = v;
                    }
                }
            }
        }
    }
}

fn draw_editor_black_hole(
    _entities: ENTITIES(),
    _state_stack: SINGLETON(GameStateStack),
    _selected_entity: SINGLETON(SelectedEntity),
    _body_ids: COMPONENT(BodyId, .In),
    _colors: COMPONENT_MUT(Color, .InOut),
    _positions: COMPONENT_MUT(Position, .InOut),
    _aabbs: COMPONENT_MUT(AABB, .InOut),
    _shapes: COMPONENT_MUT(BlackHoleShape, .InOut),
    _strengths: COMPONENT_MUT(BlackHoleStrength, .InOut),
) void {
    const entities = _entities.get();
    const state_stack = _state_stack.get();
    const selected_entity = _selected_entity.get();
    const body_ids = _body_ids.get();
    const colors = _colors.get_mut();
    const positions = _positions.get_mut();
    const aabbs = _aabbs.get_mut();
    const shapes = _shapes.get_mut();
    const strengths = _strengths.get_mut();

    if (state_stack.current_state() != .Editor) {
        return;
    }

    if (selected_entity.entity == null) {
        return;
    }

    const LocalCtx = struct {
        // used to detect when entity is first
        // selected for editors initialization.
        var current_entity: flecs.entity_t = 0;
        var editor_color: EditorColor = undefined;
        var editor_position: EditorVector2 = undefined;
        var editor_radius: EditorF32 = undefined;
        var editor_strength: EditorF32 = undefined;
    };

    const selected = selected_entity.entity.?;

    for (entities, 0..) |e, i| {
        if (e == selected) {
            const body_id = &body_ids[i];
            const color = &colors[i];
            const position = &positions[i];
            const aabb = &aabbs[i];
            const shape = &shapes[i];
            const strength = &strengths[i];

            if (LocalCtx.current_entity != selected) {
                LocalCtx.editor_color = EditorColor.new(&color.value);
                LocalCtx.editor_position = EditorVector2.new(&position.value);
                LocalCtx.editor_radius = EditorF32.new(&shape.radius);
                LocalCtx.editor_strength = EditorF32.new(&strength.value);
            }

            var open = true;
            if (imgui.igBegin("EditorBlackHole", &open, 0)) {
                defer imgui.igEnd();

                if (LocalCtx.editor_color.draw("color")) {
                    if (LocalCtx.editor_color.get_value()) |v| {
                        color.value = v;
                    }
                }

                if (LocalCtx.editor_position.draw("position")) {
                    if (LocalCtx.editor_position.get_value()) |v| {
                        position.value = v;
                        b2.b2Body_SetTransform(body_id.id, v.to_b2(), 0.0);
                    }
                }

                if (LocalCtx.editor_radius.draw("radius")) {
                    if (LocalCtx.editor_radius.get_value()) |v| {
                        shape.radius = v;
                        const new_aabb = AABB.new_square(v);
                        aabb.* = new_aabb;
                    }
                }

                if (LocalCtx.editor_strength.draw("strength")) {
                    if (LocalCtx.editor_strength.get_value()) |v| {
                        strength.value = v;
                    }
                }
            }
        }
    }
}

fn draw_editor_rectangle(
    _entities: ENTITIES(),
    _state_stack: SINGLETON(GameStateStack),
    _selected_entity: SINGLETON(SelectedEntity),
    _body_ids: COMPONENT(BodyId, .In),
    _shape_ids: COMPONENT(ShapeId, .In),
    _colors: COMPONENT_MUT(Color, .InOut),
    _positions: COMPONENT_MUT(Position, .InOut),
    _aabbs: COMPONENT_MUT(AABB, .InOut),
    _shapes: COMPONENT_MUT(RectangleShape, .InOut),
) void {
    const entities = _entities.get();
    const state_stack = _state_stack.get();
    const selected_entity = _selected_entity.get();
    const body_ids = _body_ids.get();
    const shape_ids = _shape_ids.get();
    const colors = _colors.get_mut();
    const positions = _positions.get_mut();
    const aabbs = _aabbs.get_mut();
    const shapes = _shapes.get_mut();

    if (state_stack.current_state() != .Editor) {
        return;
    }

    if (selected_entity.entity == null) {
        return;
    }

    const LocalCtx = struct {
        const ShapeParams = struct {
            point_1: Vector2,
            point_2: Vector2,
            width: f32,
            height_offset: f32,
            restitution: f32,
            is_sensor: bool,
        };
        // used to detect when entity is first
        // selected for editors initialization.
        var current_entity: flecs.entity_t = 0;
        var editor_color: EditorColor = undefined;
        var editor_position: EditorVector2 = undefined;
        var editor_shape: ParamEditor(ShapeParams) = undefined;
    };

    const selected = selected_entity.entity.?;

    for (entities, 0..) |e, i| {
        if (e == selected) {
            const color = &colors[i];
            const position = &positions[i];
            const aabb = &aabbs[i];
            const shape = &shapes[i];
            const body_id = &body_ids[i];
            const shape_id = &shape_ids[i];

            if (LocalCtx.current_entity != selected) {
                LocalCtx.editor_color = EditorColor.new(&color.value);
                LocalCtx.editor_position = EditorVector2.new(&position.value);
                const shape_params = LocalCtx.ShapeParams{
                    .point_1 = shape.point_1,
                    .point_2 = shape.point_2,
                    .width = shape.width,
                    .height_offset = shape.height_offset,
                    .restitution = shape.restitution,
                    .is_sensor = shape.is_sensor,
                };
                LocalCtx.editor_shape = ParamEditor(LocalCtx.ShapeParams).new(&shape_params);
            }

            var open = true;
            if (imgui.igBegin("EditorAnchor", &open, 0)) {
                defer imgui.igEnd();

                if (LocalCtx.editor_color.draw("color")) {
                    if (LocalCtx.editor_color.get_value()) |v| {
                        color.value = v;
                    }
                }

                if (LocalCtx.editor_position.draw("position")) {
                    if (LocalCtx.editor_position.get_value()) |v| {
                        position.value = v;
                        b2.b2Body_SetTransform(body_id.id, v.to_b2(), 0.0);
                    }
                }

                if (LocalCtx.editor_shape.draw()) {
                    if (LocalCtx.editor_shape.get_value()) |v| {
                        const restitution = if (v.restitution < 0.0) 0.0 else v.restitution;
                        const rectangle = RectangleShape.new(
                            v.point_1,
                            v.point_2,
                            v.width,
                            v.height_offset,
                            restitution,
                            v.is_sensor,
                        ) catch return;
                        shape.* = rectangle;
                        b2.b2Shape_SetPolygon(shape_id.id, &rectangle.shape);
                        b2.b2Shape_SetRestitution(shape_id.id, restitution);
                        b2.b2Shape_EnableSensorEvents(shape_id.id, v.is_sensor);

                        var new_aabb = AABB.from_b2(b2.b2Shape_GetAABB(shape_id.id));
                        // move aabb back to 0,0
                        new_aabb.move(position.value.mul(-1));

                        aabb.* = new_aabb;
                    }
                }
            }
        }
    }
}

fn draw_editor_level(
    _world: WORLD(),
    _physics_world: SINGLETON(PhysicsWorld),
    _selected_entity: SINGLETON_MUT(SelectedEntity),
    _editor_state: SINGLETON_MUT(EditorState),
    _state_stack: SINGLETON_MUT(GameStateStack),
    _level_state: SINGLETON_MUT(LevelState),
) void {
    const world = _world.get_mut();
    const physics_world = _physics_world.get();
    const selected_entity = _selected_entity.get_mut();
    const editor_state = _editor_state.get_mut();
    const state_stack = _state_stack.get_mut();
    const level_state = _level_state.get_mut();

    if (state_stack.current_state() != .Editor) {
        return;
    }

    var open = true;
    if (imgui.igBegin("LevelEditor", &open, 0)) {
        defer imgui.igEnd();

        _ = imgui.igInputText(
            "Save path",
            &editor_state.level_path,
            editor_state.level_path.len,
            0,
            null,
            null,
        );
        const slice = std.mem.sliceTo(&editor_state.level_path, 0);
        if (imgui.igButton("Save level", .{ .x = 0.0, .y = 0.0 })) {
            level_state.save_path = slice;
        }
        if (imgui.igButton("Load level", .{ .x = 0.0, .y = 0.0 })) {
            level_state.load_path = slice;
            level_state.need_to_clean = true;
            state_stack.pop_state();
        }

        imgui.igSeparatorText("Objects");
        if (imgui.igButton("Add text", .{ .x = 0.0, .y = 0.0 })) {
            _ = flecs.spawn_bundle(TextBundle.from_params(&.{}), world);
        }
        if (imgui.igButton("Add ball", .{ .x = 0.0, .y = 0.0 })) {
            _ = flecs.spawn_bundle(BallBundle.from_params(physics_world.id, &.{}), world);
        }

        if (imgui.igButton("Add anchor", .{ .x = 0.0, .y = 0.0 })) {
            _ = flecs.spawn_bundle(AnchorBundle.from_params(physics_world.id, &.{}), world);
        }

        if (imgui.igButton("Add portal", .{ .x = 0.0, .y = 0.0 })) {
            _ = flecs.spawn_bundle(PortalBundle.from_params(physics_world.id, &.{}), world);
        }

        if (imgui.igButton("Add blackhole", .{ .x = 0.0, .y = 0.0 })) {
            _ = flecs.spawn_bundle(BlackHoleBundle.from_params(physics_world.id, &.{}), world);
        }

        if (imgui.igButton("Add rectangle", .{ .x = 0.0, .y = 0.0 })) {
            const bundle = RectangleBundle.from_params(physics_world.id, &.{}) catch {
                state_stack.push_state(.Exit);
                return;
            };
            _ = flecs.spawn_bundle(bundle, world);
        }

        if (imgui.igButton("Remove selected", .{ .x = 0.0, .y = 0.0 })) {
            if (selected_entity.entity) |e| {
                _ = flecs.delete(world, e);
                selected_entity.entity = null;
            }
        }

        editor_state.focused = imgui.igIsWindowHovered(imgui.ImGuiFocusedFlags_AnyWindow) or
            imgui.igIsWindowFocused(imgui.ImGuiFocusedFlags_AnyWindow);
    }
}

pub fn FLECS_INIT_COMPONENTS(world: *flecs.world_t, allocator: Allocator) !void {
    _ = allocator;
    flecs.COMPONENT(world, EditorState);
    flecs.COMPONENT(world, EditorCamera);
    flecs.COMPONENT(world, SelectedEntity);

    _ = flecs.singleton_set(world, EditorState, .{});
    _ = flecs.singleton_set(world, SelectedEntity, .{});

    const camera = rl.Camera2D{
        .offset = rl.Vector2{ .x = 0.0, .y = 0.0 },
        .target = rl.Vector2{ .x = 0.0, .y = 0.0 },
        .rotation = 0.0,
        .zoom = 1.0,
    };
    _ = flecs.singleton_set(world, EditorCamera, .{ .camera = camera });
}

pub fn FLECS_INIT_SYSTEMS(world: *flecs.world_t, allocator: Allocator) !void {
    _ = allocator;
    flecs.ADD_SYSTEM(world, "enter_editor_mode", flecs.PreUpdate, enter_editor_mode);
    flecs.ADD_SYSTEM(world, "update_editor_camera", flecs.PreUpdate, update_editor_camera);
    flecs.ADD_SYSTEM(world, "select_entity", flecs.PreUpdate, select_entity);
    flecs.ADD_SYSTEM(world, "drag_selected_entity", flecs.PreUpdate, drag_selected_entity);

    flecs.ADD_SYSTEM(world, "draw_texts_aabb", flecs.OnValidate, draw_texts_aabb);
    flecs.ADD_SYSTEM(world, "draw_spawners_aabb", flecs.OnValidate, draw_spawners_aabb);
    flecs.ADD_SYSTEM(world, "draw_balls_aabb", flecs.OnValidate, draw_balls_aabb);
    flecs.ADD_SYSTEM(world, "draw_anchors_aabb", flecs.OnValidate, draw_anchors_aabb);
    flecs.ADD_SYSTEM(world, "draw_portals_aabb", flecs.OnValidate, draw_portals_aabb);
    flecs.ADD_SYSTEM(world, "draw_black_holess_aabb", flecs.OnValidate, draw_black_holess_aabb);
    flecs.ADD_SYSTEM(world, "draw_rectangles_aabb", flecs.OnValidate, draw_rectangles_aabb);

    flecs.ADD_SYSTEM(world, "draw_level_editor", flecs.PreStore, draw_editor_level);
    flecs.ADD_SYSTEM(world, "draw_editor_text", flecs.PreStore, draw_editor_text);
    flecs.ADD_SYSTEM(world, "draw_editor_ball", flecs.PreStore, draw_editor_ball);
    flecs.ADD_SYSTEM(world, "draw_editor_anchor", flecs.PreStore, draw_editor_anchor);
    flecs.ADD_SYSTEM(world, "draw_editor_portal", flecs.PreStore, draw_editor_portal);
    flecs.ADD_SYSTEM(world, "draw_editor_black_hole", flecs.PreStore, draw_editor_black_hole);
    flecs.ADD_SYSTEM(world, "draw_editor_rectangle", flecs.PreStore, draw_editor_rectangle);
}

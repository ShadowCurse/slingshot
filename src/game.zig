const std = @import("std");
const builtin = @import("builtin");

const rl = @import("deps/raylib.zig");
const imgui = @import("deps/imgui.zig");
const b2 = @import("deps/box2d.zig");
const flecs = @import("deps/flecs.zig");

const SPT = flecs.SYSTEM_PARAMETER_TAG;
const SPW = flecs.SYSTEM_PARAMETER_WORLD;
const SP_CONTEXT = flecs.SYSTEM_PARAMETER_CONTEXT;
const SP_CONTEXT_MUT = flecs.SYSTEM_PARAMETER_CONTEXT_MUT;
const SP_DELTA_TIME = flecs.SYSTEM_PARAMETER_DELTA_TIME;
const SPC = flecs.SYSTEM_PARAMETER_COMPONENT;
const SPC_MUT = flecs.SYSTEM_PARAMETER_COMPONENT_MUT;
const SPS = flecs.SYSTEM_PARAMETER_SINGLETON;
const SPS_MUT = flecs.SYSTEM_PARAMETER_SINGLETON_MUT;
const SPC_ID = flecs.SYSTEM_PARAMETER_COMPONENT_ID;

const _ui = @import("ui.zig");
const UI_FLECS_INIT_SYSTEMS = _ui.FLECS_INIT_SYSTEMS;
const UI_FLECS_INIT_COMPONENTS = _ui.FLECS_INIT_COMPONENTS;

const _level = @import("level.zig");
const Levels = _level.Levels;
const LevelSave = _level.LevelSave;
const CurrentLevel = _level.CurrentLevel;
const DEFAULT_SAVE_PATH = _level.DEFAULT_SAVE_PATH;

const _settings = @import("settings.zig");
const Settings = _settings.Settings;
const DEFAULT_SETTINGS_PATH = _settings.DEFAULT_SETTINGS_PATH;

const _editor = @import("editor.zig");
const EditorLevel = _editor.EditorLevel;
const EditorCamera = _editor.EditorCamera;
const EDITOR_FLECS_INIT_SYSTEMS = _editor.FLECS_INIT_SYSTEMS;
const EDITOR_FLECS_INIT_COMPONENTS = _editor.FLECS_INIT_COMPONENTS;

const _objects = @import("objects.zig");
const ObjectParams = _objects.ObjectParams;
const OBJECTS_FLECS_INIT_SYSTEMS = _objects.FLECS_INIT_SYSTEMS;
const OBJECTS_FLECS_INIT_COMPONENTS = _objects.FLECS_INIT_COMPONENTS;

const Color = _objects.Color;
const BodyId = _objects.BodyId;
const ShapeId = _objects.ShapeId;
const Position = _objects.Position;

const create_text = _objects.create_text;
const TextTag = _objects.TextTag;
const TextText = _objects.TextText;
const TextParams = _objects.TextParams;

const create_spawner = _objects.create_spawner;
const SpawnerTag = _objects.SpawnerTag;
const SpawnerParams = _objects.SpawnerParams;

const create_ball = _objects.create_ball;
const BallTag = _objects.BallTag;
const BallShape = _objects.BallShape;
const BallParams = _objects.BallParams;
const BallAttachment = _objects.BallAttachment;

const create_anchor = _objects.create_anchor;
const AnchorTag = _objects.AnchorTag;
const AnchorShape = _objects.AnchorShape;
const AnchorParams = _objects.AnchorParams;
const AnchoraJointParams = _objects.AnchoraJointParams;

const JointTag = _objects.JointTag;
const JointId = _objects.JointId;

const create_rectangle = _objects.create_rectangle;
const RectangleTag = _objects.RectangleTag;
const RectangleShape = _objects.RectangleShape;
const RectangleParams = _objects.RectangleParams;

const Vector2 = @import("vector.zig");
const Allocator = std.mem.Allocator;

const TARGET_FPS = 80;
const BACKGROUND_COLOR = rl.BLACK;
const AABB_LINE_THICKNESS = 1.5;
const AABB_COLOR = rl.SKYBLUE;

pub const SensorEvents = struct {
    begin_events: []b2.b2SensorBeginTouchEvent,
    end_events: []b2.b2SensorEndTouchEvent,

    const Self = @This();

    pub fn new(world_id: b2.b2WorldId) Self {
        const events = b2.b2World_GetSensorEvents(world_id);

        var begin_events: []b2.b2SensorBeginTouchEvent = undefined;
        begin_events.ptr = events.beginEvents;
        begin_events.len = @intCast(events.beginCount);

        var end_events: []b2.b2SensorEndTouchEvent = undefined;
        end_events.ptr = events.endEvents;
        end_events.len = @intCast(events.endCount);
        return Self{
            .begin_events = begin_events,
            .end_events = end_events,
        };
    }
};

pub const GameState = enum {
    MainMenu,
    LevelSelection,
    Settings,
    LevelLoaded,
    Running,
    Paused,
    Editor,
    Win,
    Exit,
};

pub const GameStateStack = struct {
    stack: [STACK_SIZE]GameState,
    current_index: usize,

    const STACK_SIZE = 5;
    const Self = @This();

    pub fn new(initial_state: GameState) Self {
        return Self{
            .stack = .{initial_state} ** Self.STACK_SIZE,
            .current_index = 0,
        };
    }

    pub fn current_state(self: *const Self) GameState {
        return self.stack[self.current_index];
    }

    pub fn push_state(self: *Self, state: GameState) void {
        self.current_index += 1;
        std.debug.assert(self.current_index < Self.STACK_SIZE);

        self.stack[self.current_index] = state;
        std.log.debug("State stack push. Stack: {any}", .{self.stack[0 .. self.current_index + 1]});
    }

    pub fn pop_state(self: *Self) void {
        if (self.current_index == 0) return;
        self.current_index -= 1;
        std.log.debug("State stack pop. Stack: {any}", .{self.stack[0 .. self.current_index + 1]});
    }
};

pub const WinTarget = struct {};

pub const LevelObject = struct {
    destruction_order: usize,
};

pub const GameCamera = struct {
    camera: rl.Camera2D,
};

pub const PhysicsWorld = struct {
    id: b2.b2WorldId,
};

pub const MousePosition = struct {
    world_position: Vector2,
    screen_position: Vector2,
};

fn initial_setup(settings: *const Settings) void {
    rl.InitWindow(
        @intCast(settings.resolution_width),
        @intCast(settings.resolution_height),
        "Slingshot",
    );
    rl.SetExitKey(rl.KEY_NULL);
    rl.GuiLoadStyleDefault();
    rl.SetTargetFPS(TARGET_FPS);
    imgui.rlImGuiSetup(true);
}

fn draw_start() void {
    rl.BeginDrawing();
    rl.ClearBackground(BACKGROUND_COLOR);
    imgui.rlImGuiBegin();
}

fn draw_end() void {
    imgui.rlImGuiEnd();
    rl.EndDrawing();
}

fn draw_game_start(
    _state_stack: SPS(GameStateStack),
    _game_camera: SPS(GameCamera),
    _editor_camera: SPS(EditorCamera),
) void {
    const state_stack = _state_stack.data;
    const game_camera = _game_camera.data;
    const editor_camera = _editor_camera.data;

    if (state_stack.current_state() == .Editor) {
        rl.BeginMode2D(editor_camera.camera);
    } else {
        rl.BeginMode2D(game_camera.camera);
    }
}

fn draw_game_end() void {
    rl.EndMode2D();
}

fn window_should_close(
    _state_stack: SPS_MUT(GameStateStack),
) void {
    const state_stack = _state_stack.data;
    if (rl.WindowShouldClose()) {
        state_stack.push_state(.Exit);
    }
}

fn check_exit(
    _world: SPW(),
    _state_stack: SPS(GameStateStack),
) void {
    const world = _world.data;
    const state_stack = _state_stack.data;
    if (state_stack.current_state() == .Exit) {
        flecs.quit(world);
    }
}

fn draw_mouse_pos(
    _mouse_pos: SPS(MousePosition),
) void {
    const mouse_pos = _mouse_pos.data;
    rl.DrawCircleV(mouse_pos.world_position.to_rl_as_pos(), 2.0, rl.YELLOW);
}

pub fn load_level(
    _world: SPW(),
    _allocator: SPS(Allocator),
    _physical_world: SPS(PhysicsWorld),
    _state_stack: SPS_MUT(GameStateStack),
    _current_level: SPS_MUT(CurrentLevel),
    _: SPC_ID(&flecs.Wildcard, .{
        .inout = .Out,
        .src = .{ .flags = flecs.IsEntity, .id = 0 },
    }),
) void {
    const world = _world.data;
    const allocator = _allocator.data;
    const physics_world = _physical_world.data;
    const state_stack = _state_stack.data;
    const current_level = _current_level.data;

    if (current_level.load_path == null) {
        return;
    }

    const path = current_level.load_path.?;
    current_level.load_path = null;

    std.log.debug("Loading level from path: {s}", .{path});

    var file = std.fs.cwd().openFile(path, .{}) catch {
        state_stack.push_state(.Exit);
        return;
    };
    defer file.close();

    const file_data = file.readToEndAlloc(allocator.*, 1024 * 1024 * 1024) catch {
        state_stack.push_state(.Exit);
        return;
    };
    defer allocator.free(file_data);

    const save_state = std.json.parseFromSlice(LevelSave, allocator.*, file_data, .{}) catch {
        state_stack.push_state(.Exit);
        return;
    };
    defer save_state.deinit();

    const level_save = &save_state.value;

    for (level_save.objects) |*obj| {
        switch (obj.*) {
            .Text => |*r| {
                create_text(world, r);
            },
            .Spawner => |*r| {
                create_spawner(world, r);
            },
            .Ball => |*r| {
                create_ball(world, physics_world.id, r);
            },
            .Anchor => |*r| {
                create_anchor(world, physics_world.id, r);
            },
            .Rectangle => |*r| {
                create_rectangle(world, physics_world.id, r) catch {
                    state_stack.push_state(.Exit);
                    return;
                };
            },
        }
    }

    state_stack.push_state(.LevelLoaded);
}

pub const StartLevelCtx = struct {
    allocator: Allocator,
    ball_query: *flecs.query_t,
    spawner_query: *flecs.query_t,

    const Self = @This();
    pub fn deinit(self: *const Self) callconv(.C) void {
        self.allocator.destroy(self);
    }
};
pub fn start_level(
    _world: SPW(),
    _state_stack: SPS_MUT(GameStateStack),
    _ctx: SP_CONTEXT(StartLevelCtx),
) void {
    const world = _world.data;
    const state_stack = _state_stack.data;
    const ctx = _ctx.data;

    if (state_stack.current_state() != .LevelLoaded) {
        return;
    }

    const ball_query: *flecs.query_t = ctx.ball_query;
    var ball_iter = flecs.query_iter(world, ball_query);
    std.debug.assert(flecs.query_next(&ball_iter));
    const ball_body = flecs.field(&ball_iter, BodyId, 1).?[0];
    std.debug.assert(!flecs.query_next(&ball_iter));

    const spawner_query: *flecs.query_t = ctx.spawner_query;
    var spawner_iter = flecs.query_iter(world, spawner_query);
    std.debug.assert(flecs.query_next(&spawner_iter));
    const spawner_position = flecs.field(&spawner_iter, Position, 1).?[0];
    std.debug.assert(!flecs.query_next(&spawner_iter));

    b2.b2Body_SetTransform(ball_body.id, spawner_position.value.to_b2(), 0.0);

    state_stack.pop_state();
    state_stack.push_state(.Running);
}

pub fn clean_level(
    _world: SPW(),
    _current_level: SPS_MUT(CurrentLevel),
    _ctx: SP_CONTEXT_MUT(flecs.query_t),
) void {
    const world = _world.data;
    const current_level = _current_level.data;
    const ctx = _ctx.data;

    if (!current_level.need_to_clean) {
        return;
    }

    current_level.need_to_clean = false;

    var level_object_iter = flecs.query_iter(world, ctx);
    while (flecs.query_next(&level_object_iter)) {
        std.log.info("cleaning the level. Deleting {} entities", .{level_object_iter.entities().len});

        for (level_object_iter.entities()) |e| {
            flecs.delete(world, e);
        }
    }
}

pub const RecreateLevelCtx = struct {
    allocator: Allocator,
    ball_query: *flecs.query_t,
    joint_query: *flecs.query_t,

    const Self = @This();
    pub fn deinit(self: *const Self) callconv(.C) void {
        self.allocator.destroy(self);
    }
};
pub fn recreate_level(
    _world: SPW(),
    _current_level: SPS_MUT(CurrentLevel),
    _state_stack: SPS_MUT(GameStateStack),
    _ctx: SP_CONTEXT(RecreateLevelCtx),
) void {
    const world = _world.data;
    const current_level = _current_level.data;
    const state_stack = _state_stack.data;
    const ctx = _ctx.data;

    if (!current_level.need_to_restart) {
        return;
    }

    current_level.need_to_restart = false;

    const joint_query: *flecs.query_t = ctx.joint_query;
    var joint_iter = flecs.query_iter(world, joint_query);
    while (flecs.query_next(&joint_iter)) {
        for (joint_iter.entities()) |e| {
            _ = flecs.delete(world, e);
        }
    }

    const ball_query: *flecs.query_t = ctx.ball_query;
    var ball_iter = flecs.query_iter(world, ball_query);
    std.debug.assert(flecs.query_next(&ball_iter));
    const ball_body_id = &flecs.field(&ball_iter, BodyId, 1).?[0];
    var ball_attachment = &flecs.field(&ball_iter, BallAttachment, 2).?[0];
    std.debug.assert(!flecs.query_next(&ball_iter));

    b2.b2Body_SetLinearVelocity(ball_body_id.id, Vector2.ZERO.to_b2());
    ball_attachment.attached = false;

    state_stack.pop_state();
    state_stack.push_state(.LevelLoaded);
}

pub const SaveLevelCtx = struct {
    allocator: Allocator,
    text_query: *flecs.query_t,
    spawner_query: *flecs.query_t,
    ball_query: *flecs.query_t,
    anchor_query: *flecs.query_t,
    rectangle_query: *flecs.query_t,

    const Self = @This();
    pub fn deinit(self: *const Self) callconv(.C) void {
        self.allocator.destroy(self);
    }
};
pub fn save_level(
    _world: SPW(),
    _allocator: SPS(Allocator),
    _current_level: SPS_MUT(CurrentLevel),
    _state_stack: SPS_MUT(GameStateStack),
    _ctx: SP_CONTEXT(SaveLevelCtx),
) void {
    const world = _world.data;
    const allocator = _allocator.data;
    const current_level = _current_level.data;
    const state_stack = _state_stack.data;
    const ctx = _ctx.data;

    if (current_level.save_path == null) {
        return;
    }

    const path = current_level.save_path.?;
    current_level.save_path = null;

    std.log.debug("Saving level to path: {s}", .{path});

    var objects_params = std.ArrayList(ObjectParams).init(allocator.*);
    defer objects_params.deinit();

    const text_query: *flecs.query_t = @ptrCast(ctx.text_query);
    var text_iter = flecs.query_iter(world, text_query);
    while (flecs.query_next(&text_iter)) {
        const colors = flecs.field(&text_iter, Color, 1).?;
        const positions = flecs.field(&text_iter, Position, 2).?;
        const texts = flecs.field(&text_iter, TextText, 3).?;
        for (colors, positions, texts) |*color, *position, *text| {
            const params = TextParams.new(position, color, text);
            objects_params.append(.{ .Text = params }) catch {
                state_stack.push_state(.Exit);
                return;
            };
        }
    }

    const spawner_query: *flecs.query_t = @ptrCast(ctx.spawner_query);
    var spawner_iter = flecs.query_iter(world, spawner_query);
    while (flecs.query_next(&spawner_iter)) {
        const positions = flecs.field(&spawner_iter, Position, 1).?;
        for (positions) |*position| {
            const params = SpawnerParams.new(position);
            objects_params.append(.{ .Spawner = params }) catch {
                state_stack.push_state(.Exit);
                return;
            };
        }
    }

    const ball_query: *flecs.query_t = @ptrCast(ctx.ball_query);
    var ball_iter = flecs.query_iter(world, ball_query);
    while (flecs.query_next(&ball_iter)) {
        const colors = flecs.field(&ball_iter, Color, 1).?;
        const shapes = flecs.field(&ball_iter, BallShape, 2).?;
        for (colors, shapes) |*color, *shape| {
            const params = BallParams.new(color, shape);
            objects_params.append(.{ .Ball = params }) catch {
                state_stack.push_state(.Exit);
                return;
            };
        }
    }

    const anchor_query: *flecs.query_t = @ptrCast(ctx.anchor_query);
    var anchor_iter = flecs.query_iter(world, anchor_query);
    while (flecs.query_next(&anchor_iter)) {
        const colors = flecs.field(&anchor_iter, Color, 1).?;
        const positions = flecs.field(&anchor_iter, Position, 2).?;
        const shapes = flecs.field(&anchor_iter, AnchorShape, 3).?;
        const joint_params = flecs.field(&anchor_iter, AnchoraJointParams, 4).?;
        for (colors, positions, shapes, joint_params) |*color, *position, *shape, *joint_param| {
            const params = AnchorParams.new(color, position, shape, joint_param);
            objects_params.append(.{ .Anchor = params }) catch {
                state_stack.push_state(.Exit);
                return;
            };
        }
    }

    const rectangle_query: *flecs.query_t = @ptrCast(ctx.rectangle_query);
    var rectangle_iter = flecs.query_iter(world, rectangle_query);
    while (flecs.query_next(&rectangle_iter)) {
        const colors = flecs.field(&rectangle_iter, Color, 1).?;
        const positions = flecs.field(&rectangle_iter, Position, 2).?;
        const shapes = flecs.field(&rectangle_iter, RectangleShape, 3).?;
        for (colors, positions, shapes) |*color, *position, *shape| {
            const params = RectangleParams.new(color, position, shape);
            objects_params.append(.{ .Rectangle = params }) catch {
                state_stack.push_state(.Exit);
                return;
            };
        }
    }

    const save_state = LevelSave{
        .objects = objects_params.items,
    };

    var file = std.fs.cwd().createFile(path, .{}) catch {
        state_stack.push_state(.Exit);
        return;
    };
    defer file.close();

    const options = std.json.StringifyOptions{
        .whitespace = .indent_4,
    };
    std.json.stringify(save_state, options, file.writer()) catch {
        state_stack.push_state(.Exit);
        return;
    };
}

pub fn process_keys(
    _state_stack: SPS_MUT(GameStateStack),
    _current_level: SPS_MUT(CurrentLevel),
) void {
    const state_stack = _state_stack.data;
    const current_level = _current_level.data;

    const current_state = state_stack.current_state();

    if (rl.IsKeyPressed(rl.KEY_ESCAPE)) {
        if (current_state == .Running) {
            state_stack.push_state(.Paused);
        } else if (current_state == .Paused) {
            state_stack.pop_state();
        }
    }

    if (current_state == .Running) {
        if (rl.IsKeyPressed(rl.KEY_R)) {
            current_level.need_to_restart = true;
        }
    }
}

fn update_mouse_pos(
    _game_camera: SPS(GameCamera),
    _editor_camera: SPS(EditorCamera),
    _state_stack: SPS(GameStateStack),
    _mouse_pos: SPS_MUT(MousePosition),
) void {
    const game_camera = _game_camera.data;
    const editor_camera = _editor_camera.data;
    const state_stack = _state_stack.data;
    const mouse_pos = _mouse_pos.data;

    const camera = if (state_stack.current_state() == .Editor)
        editor_camera.camera
    else
        game_camera.camera;

    const p = rl.GetMousePosition();
    mouse_pos.screen_position = Vector2.from_rl_pos(p);
    mouse_pos.world_position = Vector2.from_rl_pos(
        rl.GetScreenToWorld2D(
            p,
            camera,
        ),
    );
}

pub fn update_physics(
    _delta_time: SP_DELTA_TIME(),
    _state_stack: SPS(GameStateStack),
    _physics_world: SPS(PhysicsWorld),
    _sensor_events: SPS_MUT(SensorEvents),
) void {
    const delta_time = _delta_time.data;
    const state_stack = _state_stack.data;
    const physics_world = _physics_world.data;
    const sensor_events = _sensor_events.data;

    if (state_stack.current_state() != .Running) {
        return;
    }

    b2.b2World_Step(physics_world.id, delta_time, 4);
    sensor_events.* = SensorEvents.new(physics_world.id);
}

pub fn check_win_contidion(
    _state_stack: SPS_MUT(GameStateStack),
    _sensor_events: SPS(SensorEvents),
    _shapes: SPC(ShapeId, .In),
    _: SPT(RectangleTag),
    _: SPT(WinTarget),
) void {
    const state_stack = _state_stack.data;
    const sensor_events = _sensor_events.data;
    const shapes = _shapes.data;

    if (state_stack.current_state() == .Win) {
        return;
    }

    for (shapes) |shape| {
        for (sensor_events.begin_events) |be| {
            if (@as(u64, @bitCast(be.sensorShapeId)) == @as(u64, @bitCast(shape.id))) {
                state_stack.push_state(.Win);
            }
        }
    }
}

pub fn update_game_camera(
    _delta_time: SP_DELTA_TIME(),
    _state_stack: SPS(GameStateStack),
    _game_camera: SPS_MUT(GameCamera),
    _positions: SPC(Position, .In),
    _: SPT(BallTag),
) void {
    const delta_time = _delta_time.data;
    const state_stack = _state_stack.data;
    const game_camera = _game_camera.data;
    const positions = _positions.data;

    if (state_stack.current_state() != .Running) {
        return;
    }

    const ball_pos = positions[0].value;
    const camera_pos = Vector2.from_rl_pos(game_camera.camera.target);
    const p = ball_pos.lerp(&camera_pos, delta_time);
    game_camera.camera.target.y = p.to_rl_as_pos().y;
}

pub const GameV2 = struct {
    allocator: Allocator,

    ecs_world: *flecs.world_t,
    physics_world: b2.b2WorldId,

    const Self = @This();

    pub fn new(allocator: Allocator) !Self {
        var physics_world_def = b2.b2DefaultWorldDef();
        physics_world_def.gravity = b2.b2Vec2{ .x = 0, .y = -100 };
        const physics_world = b2.b2CreateWorld(&physics_world_def);

        const ecs_world = flecs.init();

        const settings = try Settings.load(allocator, DEFAULT_SETTINGS_PATH);

        initial_setup(&settings);

        try UI_FLECS_INIT_COMPONENTS(ecs_world, allocator);
        try EDITOR_FLECS_INIT_COMPONENTS(ecs_world, allocator);
        try OBJECTS_FLECS_INIT_COMPONENTS(ecs_world, allocator);

        flecs.TAG(ecs_world, WinTarget);

        flecs.COMPONENT(ecs_world, Allocator);
        flecs.COMPONENT(ecs_world, Settings);
        flecs.COMPONENT(ecs_world, GameStateStack);
        flecs.COMPONENT(ecs_world, SensorEvents);
        flecs.COMPONENT(ecs_world, GameCamera);
        flecs.COMPONENT(ecs_world, PhysicsWorld);
        flecs.COMPONENT(ecs_world, MousePosition);
        flecs.COMPONENT(ecs_world, Levels);
        flecs.COMPONENT(ecs_world, CurrentLevel);
        flecs.COMPONENT(ecs_world, LevelObject);

        _ = flecs.singleton_set(ecs_world, Allocator, allocator);
        _ = flecs.singleton_set(ecs_world, Settings, settings);

        const state_stack = GameStateStack.new(.MainMenu);
        _ = flecs.singleton_set(ecs_world, GameStateStack, state_stack);

        const sensor_events = SensorEvents.new(physics_world);
        _ = flecs.singleton_set(ecs_world, SensorEvents, sensor_events);

        const camera = rl.Camera2D{
            .offset = rl.Vector2{
                .x = @as(f32, @floatFromInt(settings.resolution_width)) / 2.0,
                .y = @as(f32, @floatFromInt(settings.resolution_height)) / 2.0,
            },
            .target = rl.Vector2{ .x = 0.0, .y = 0.0 },
            .rotation = 0.0,
            .zoom = 1.0,
        };
        _ = flecs.singleton_set(ecs_world, GameCamera, .{ .camera = camera });

        _ = flecs.singleton_set(ecs_world, PhysicsWorld, .{ .id = physics_world });
        _ = flecs.singleton_set(ecs_world, MousePosition, .{
            .world_position = Vector2.ZERO,
            .screen_position = Vector2.ZERO,
        });

        const levels = try Levels.init(allocator);
        _ = flecs.singleton_set(ecs_world, Levels, levels);
        _ = flecs.singleton_set(ecs_world, CurrentLevel, .{});

        try UI_FLECS_INIT_SYSTEMS(ecs_world, allocator);
        try EDITOR_FLECS_INIT_SYSTEMS(ecs_world, allocator);
        try OBJECTS_FLECS_INIT_SYSTEMS(ecs_world, allocator);

        {
            var desc = flecs.SYSTEM_DESC(clean_level);

            var level_objects_query: flecs.query_desc_t = .{};
            level_objects_query.filter.terms[0].inout = .InOutNone;
            level_objects_query.filter.terms[0].id = flecs.id(LevelObject);
            level_objects_query.order_by_component = flecs.id(LevelObject);
            const DestructionOrder = struct {
                fn sort(
                    e1: flecs.entity_t,
                    ptr1: *const anyopaque,
                    e2: flecs.entity_t,
                    ptr2: *const anyopaque,
                ) callconv(.C) i32 {
                    _ = e2;
                    _ = e1;
                    const lo_1: *const LevelObject = @alignCast(@ptrCast(ptr1));
                    const lo_2: *const LevelObject = @alignCast(@ptrCast(ptr2));
                    return @as(i32, @intFromBool(lo_1.destruction_order > lo_2.destruction_order)) -
                        @as(i32, @intFromBool(lo_1.destruction_order < lo_2.destruction_order));
                }
            };
            level_objects_query.order_by = &DestructionOrder.sort;
            const q = try flecs.query_init(ecs_world, &level_objects_query);
            desc.ctx = q;
            // No need to clean ctx, query seems to be cleaned automatically.

            flecs.SYSTEM(ecs_world, "clean_level", flecs.PreFrame, &desc);
        }

        {
            var desc = flecs.SYSTEM_DESC(start_level);

            var ball_query: flecs.query_desc_t = .{};
            ball_query.filter.terms[0].inout = .In;
            ball_query.filter.terms[0].id = flecs.id(BodyId);
            ball_query.filter.terms[1].inout = .In;
            ball_query.filter.terms[1].id = flecs.id(BallTag);
            const bq = try flecs.query_init(ecs_world, &ball_query);

            var spawner_query: flecs.query_desc_t = .{};
            spawner_query.filter.terms[0].inout = .In;
            spawner_query.filter.terms[0].id = flecs.id(Position);
            spawner_query.filter.terms[1].inout = .In;
            spawner_query.filter.terms[1].id = flecs.id(SpawnerTag);
            const sq = try flecs.query_init(ecs_world, &spawner_query);

            var rl_ctx = try allocator.create(StartLevelCtx);
            rl_ctx.allocator = allocator;
            rl_ctx.ball_query = bq;
            rl_ctx.spawner_query = sq;

            desc.ctx = rl_ctx;
            desc.ctx_free = @ptrCast(&StartLevelCtx.deinit);

            flecs.SYSTEM(ecs_world, "start_level", flecs.PreFrame, &desc);
        }

        flecs.ADD_SYSTEM(ecs_world, "load_level", flecs.PreFrame, load_level);

        {
            var desc = flecs.SYSTEM_DESC(recreate_level);

            var ball_query: flecs.query_desc_t = .{};
            ball_query.filter.terms[0].inout = .In;
            ball_query.filter.terms[0].id = flecs.id(BodyId);
            ball_query.filter.terms[1].inout = .InOut;
            ball_query.filter.terms[1].id = flecs.id(BallAttachment);
            const bq = try flecs.query_init(ecs_world, &ball_query);

            var joint_query: flecs.query_desc_t = .{};
            joint_query.filter.terms[0].inout = .In;
            joint_query.filter.terms[0].id = flecs.id(JointTag);
            const jq = try flecs.query_init(ecs_world, &joint_query);

            var rl_ctx = try allocator.create(RecreateLevelCtx);
            rl_ctx.allocator = allocator;
            rl_ctx.ball_query = bq;
            rl_ctx.joint_query = jq;

            desc.ctx = rl_ctx;
            desc.ctx_free = @ptrCast(&RecreateLevelCtx.deinit);

            flecs.SYSTEM(ecs_world, "recreate_level", flecs.PreFrame, &desc);
        }
        {
            var desc = flecs.SYSTEM_DESC(save_level);

            var text_query: flecs.query_desc_t = .{};
            text_query.filter.terms[0].inout = .In;
            text_query.filter.terms[0].id = flecs.id(Color);
            text_query.filter.terms[1].inout = .In;
            text_query.filter.terms[1].id = flecs.id(Position);
            text_query.filter.terms[2].inout = .In;
            text_query.filter.terms[2].id = flecs.id(TextText);
            const tq = try flecs.query_init(ecs_world, &text_query);

            var spawner_query: flecs.query_desc_t = .{};
            spawner_query.filter.terms[0].inout = .In;
            spawner_query.filter.terms[0].id = flecs.id(Position);
            spawner_query.filter.terms[1].inout = .In;
            spawner_query.filter.terms[1].id = flecs.id(SpawnerTag);
            const sq = try flecs.query_init(ecs_world, &spawner_query);

            var ball_query: flecs.query_desc_t = .{};
            ball_query.filter.terms[0].inout = .In;
            ball_query.filter.terms[0].id = flecs.id(Color);
            ball_query.filter.terms[1].inout = .In;
            ball_query.filter.terms[1].id = flecs.id(BallShape);
            const bq = try flecs.query_init(ecs_world, &ball_query);

            var anchor_query: flecs.query_desc_t = .{};
            anchor_query.filter.terms[0].inout = .In;
            anchor_query.filter.terms[0].id = flecs.id(Color);
            anchor_query.filter.terms[1].inout = .In;
            anchor_query.filter.terms[1].id = flecs.id(Position);
            anchor_query.filter.terms[2].inout = .In;
            anchor_query.filter.terms[2].id = flecs.id(AnchorShape);
            anchor_query.filter.terms[3].inout = .In;
            anchor_query.filter.terms[3].id = flecs.id(AnchoraJointParams);
            const aq = try flecs.query_init(ecs_world, &anchor_query);

            var rectangle_query: flecs.query_desc_t = .{};
            rectangle_query.filter.terms[0].inout = .In;
            rectangle_query.filter.terms[0].id = flecs.id(Color);
            rectangle_query.filter.terms[1].inout = .In;
            rectangle_query.filter.terms[1].id = flecs.id(Position);
            rectangle_query.filter.terms[2].inout = .In;
            rectangle_query.filter.terms[2].id = flecs.id(RectangleShape);
            const rq = try flecs.query_init(ecs_world, &rectangle_query);

            var s_ctx = try allocator.create(SaveLevelCtx);
            s_ctx.allocator = allocator;
            s_ctx.text_query = tq;
            s_ctx.spawner_query = sq;
            s_ctx.ball_query = bq;
            s_ctx.anchor_query = aq;
            s_ctx.rectangle_query = rq;

            desc.ctx = s_ctx;
            desc.ctx_free = @ptrCast(&SaveLevelCtx.deinit);

            flecs.SYSTEM(ecs_world, "save_level", flecs.PreFrame, &desc);
        }

        flecs.ADD_SYSTEM(ecs_world, "draw_start", flecs.OnLoad, draw_start);

        // Game
        flecs.ADD_SYSTEM(ecs_world, "update_physics", flecs.PreUpdate, update_physics);
        flecs.ADD_SYSTEM(ecs_world, "process_keys", flecs.PreUpdate, process_keys);
        flecs.ADD_SYSTEM(ecs_world, "update_mouse_pos", flecs.PreUpdate, update_mouse_pos);
        flecs.ADD_SYSTEM(ecs_world, "update_game_camera", flecs.PreUpdate, update_game_camera);

        flecs.ADD_SYSTEM(ecs_world, "check_win_contidion", flecs.PreUpdate, check_win_contidion);

        flecs.ADD_SYSTEM(ecs_world, "draw_game_start", flecs.PreUpdate, draw_game_start);
        flecs.ADD_SYSTEM(ecs_world, "draw_mouse_pos", flecs.OnUpdate, draw_mouse_pos);
        flecs.ADD_SYSTEM(ecs_world, "draw_game_end", flecs.PostUpdate, draw_game_end);
        // UI
        flecs.ADD_SYSTEM(ecs_world, "draw_end", flecs.PostFrame, draw_end);
        // Other
        flecs.ADD_SYSTEM(ecs_world, "window_should_close", flecs.PostFrame, window_should_close);
        flecs.ADD_SYSTEM(ecs_world, "check_exit", flecs.PostFrame, check_exit);

        return Self{
            .allocator = allocator,
            .ecs_world = ecs_world,
            .physics_world = physics_world,
        };
    }

    pub fn deinit(self: *Self) void {
        _ = flecs.fini(self.ecs_world);
        b2.b2DestroyWorld(self.physics_world);
        imgui.rlImGuiShutdown();
    }

    pub fn run(self: *Self) void {
        _ = flecs.app_run(self.ecs_world, &.{
            .target_fps = TARGET_FPS,
            .enable_rest = true,
        });
    }

    pub fn run_once(self: *Self, dt: f32) void {
        _ = flecs.progress(self.ecs_world, dt);
    }
};

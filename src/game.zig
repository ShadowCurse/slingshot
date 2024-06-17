const std = @import("std");
const builtin = @import("builtin");

const rl = @import("deps/raylib.zig");
const imgui = @import("deps/imgui.zig");
const b2 = @import("deps/box2d.zig");
const flecs = @import("deps/flecs.zig");

const SPT = flecs.SYSTEM_PARAMETER_TAG;
const SPW = flecs.SYSTEM_PARAMETER_WORLD;
const SP_STATIC = flecs.SYSTEM_PARAMETER_STATIC;
const SP_CONTEXT = flecs.SYSTEM_PARAMETER_CONTEXT;
const SP_CONTEXT_MUT = flecs.SYSTEM_PARAMETER_CONTEXT_MUT;
const SP_DELTA_TIME = flecs.SYSTEM_PARAMETER_DELTA_TIME;
const SPC = flecs.SYSTEM_PARAMETER_COMPONENT;
const SPC_MUT = flecs.SYSTEM_PARAMETER_COMPONENT_MUT;
const SPS = flecs.SYSTEM_PARAMETER_SINGLETON;
const SPS_MUT = flecs.SYSTEM_PARAMETER_SINGLETON_MUT;
const SPC_ID = flecs.SYSTEM_PARAMETER_COMPONENT_ID;

const _ui = @import("ui.zig");
const UiTimer = _ui.UiTimer;
const UI_FLECS_INIT_SYSTEMS = _ui.FLECS_INIT_SYSTEMS;
const UI_FLECS_INIT_COMPONENTS = _ui.FLECS_INIT_COMPONENTS;

const _level = @import("level.zig");
const CurrentLevel = _level.CurrentLevel;
const LEVEL_FLECS_INIT_SYSTES = _level.FLECS_INIT_SYSTEMS;
const LEVEL_FLECS_INIT_COMPONENTS = _level.FLECS_INIT_COMPONENTS;

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
const ShapeId = _objects.ShapeId;
const Position = _objects.Position;
const BallTag = _objects.BallTag;
const RectangleTag = _objects.RectangleTag;
const OBJECTS_FLECS_INIT_SYSTEMS = _objects.FLECS_INIT_SYSTEMS;
const OBJECTS_FLECS_INIT_COMPONENTS = _objects.FLECS_INIT_COMPONENTS;

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
        try LEVEL_FLECS_INIT_COMPONENTS(ecs_world, allocator);
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

        try UI_FLECS_INIT_SYSTEMS(ecs_world, allocator);
        try LEVEL_FLECS_INIT_SYSTES(ecs_world, allocator);
        try EDITOR_FLECS_INIT_SYSTEMS(ecs_world, allocator);
        try OBJECTS_FLECS_INIT_SYSTEMS(ecs_world, allocator);

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

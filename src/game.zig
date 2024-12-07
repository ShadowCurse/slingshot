const std = @import("std");
const builtin = @import("builtin");

const rl = @import("deps/raylib.zig");
const imgui = @import("deps/imgui.zig");
const b2 = @import("deps/box2d.zig");
const flecs = @import("deps/flecs.zig");

const TAG = flecs.SYSTEM_PARAMETER_TAG;
const WORLD = flecs.SYSTEM_PARAMETER_WORLD;
const STATIC = flecs.SYSTEM_PARAMETER_STATIC;
const DELTA_TIME = flecs.SYSTEM_PARAMETER_DELTA_TIME;
const COMPONENT = flecs.SYSTEM_PARAMETER_COMPONENT;
const SINGLETON = flecs.SYSTEM_PARAMETER_SINGLETON;
const SINGLETON_MUT = flecs.SYSTEM_PARAMETER_SINGLETON_MUT;

const __game = @import("game.zig");

const __ui = @import("ui.zig");
const UI_FLECS_INIT_SYSTEMS = __ui.FLECS_INIT_SYSTEMS;
const UI_FLECS_INIT_COMPONENTS = __ui.FLECS_INIT_COMPONENTS;

const __level = @import("level.zig");
const Levels = __level.Levels;
const LevelState = __level.LevelState;
const CurrentLevel = __level.CurrentLevel;
const LEVEL_FLECS_INIT_SYSTES = __level.FLECS_INIT_SYSTEMS;
const LEVEL_FLECS_INIT_COMPONENTS = __level.FLECS_INIT_COMPONENTS;

const __settings = @import("settings.zig");
const Settings = __settings.Settings;
const DEFAULT_SETTINGS_PATH = __settings.DEFAULT_SETTINGS_PATH;

const __editor = @import("editor.zig");
const EditorLevel = __editor.EditorLevel;
const EditorCamera = __editor.EditorCamera;
const EDITOR_FLECS_INIT_SYSTEMS = __editor.FLECS_INIT_SYSTEMS;
const EDITOR_FLECS_INIT_COMPONENTS = __editor.FLECS_INIT_COMPONENTS;

const __objects = @import("objects.zig");
const ShapeId = __objects.ShapeId;
const Position = __objects.Position;
const BallTag = __objects.BallTag;
const RectangleTag = __objects.RectangleTag;
const OBJECTS_FLECS_INIT_SYSTEMS = __objects.FLECS_INIT_SYSTEMS;
const OBJECTS_FLECS_INIT_COMPONENTS = __objects.FLECS_INIT_COMPONENTS;

const Vector2 = @import("vector.zig");
const Allocator = std.mem.Allocator;

pub const DEFAULT_SCREEN_WIDTH: f32 = 1280.0;
const TARGET_FPS = 60;
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

pub const States = packed struct(u32) {
    MainMenu: bool = false,
    LevelSelection: bool = false,
    Settings: bool = false,
    LevelLoaded: bool = false,
    Running: bool = false,
    Paused: bool = false,
    Editor: bool = false,
    Win: bool = false,
    Exit: bool = false,
    _: u23 = 0,
};

pub const GameState = struct {
    previous_state: States,
    current_state: States,
    system_run_conditions: [Self.RUN_CONDITION_SIZE]Self.RunCondition,
    system_run_condition_len: usize,

    const Self = @This();
    const RUN_CONDITION_SIZE = 64;
    const RunCondition = struct {
        entity: flecs.entity_t,
        run_states: States,
    };

    pub fn new(initial_state: States) Self {
        return Self{
            .current_state = initial_state,
            .previous_state = initial_state,
            .system_run_conditions = undefined,
            .system_run_condition_len = 0,
        };
    }

    pub fn add_system_run_conditions(self: *Self, conditions: []const RunCondition) void {
        for (conditions) |c| {
            self.system_run_conditions[self.system_run_condition_len] = c;
            self.system_run_condition_len += 1;
            std.debug.assert(self.system_run_condition_len < Self.RUN_CONDITION_SIZE);
        }
    }

    pub fn update_run_conditions(self: *const Self, ecs_world: *flecs.world_t) void {
        for (self.system_run_conditions[0..self.system_run_condition_len]) |rc| {
            const enabled = @as(u32, @bitCast(rc.run_states)) & @as(u32, @bitCast(self.current_state)) != 0;
            flecs.enable(ecs_world, rc.entity, enabled);
        }
    }

    pub fn set(self: *Self, ecs_world: *flecs.world_t, state: States) void {
        self.previous_state = self.current_state;
        self.current_state = state;
        self.update_run_conditions(ecs_world);
    }

    pub fn set_previous(self: *Self, ecs_world: *flecs.world_t) void {
        self.current_state = self.previous_state;
        self.update_run_conditions(ecs_world);
    }
};

pub const WinTarget = struct {};

pub const GameCamera = struct {
    camera: rl.Camera2D,

    const Self = @This();

    pub fn update_resolution(self: *Self, resolution_width: u32, resolution_height: u32) void {
        self.camera.offset = rl.Vector2{
            .x = @as(f32, @floatFromInt(resolution_width)) / 2.0,
            .y = @as(f32, @floatFromInt(resolution_height)) / 2.0,
        };
        self.camera.zoom = @as(f32, @floatFromInt(resolution_width)) / DEFAULT_SCREEN_WIDTH;
    }
};

pub const PhysicsWorld = struct {
    id: b2.b2WorldId,
};

pub const MousePosition = struct {
    world_position: Vector2,
    screen_position: Vector2,
};

pub const LevelTimer = struct {
    time: f32 = 0.0,
};

fn update_timer(
    _delta_time: DELTA_TIME(),
    _timer: SINGLETON_MUT(LevelTimer),
) void {
    const time = _delta_time.get();
    var timer = _timer.get_mut();

    timer.time += time;
}

fn initial_setup(settings: *const Settings) void {
    rl.InitWindow(
        @intCast(settings.resolution_width),
        @intCast(settings.resolution_height),
        "Slingshot",
    );
    rl.SetExitKey(rl.KEY_NULL);
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
    _game_state: SINGLETON(GameState),
    _game_camera: SINGLETON(GameCamera),
    _editor_camera: SINGLETON(EditorCamera),
) void {
    const game_state = _game_state.get();
    const game_camera = _game_camera.get();
    const editor_camera = _editor_camera.get();

    if (game_state.current_state.Editor) {
        rl.BeginMode2D(editor_camera.camera.camera);
    } else {
        rl.BeginMode2D(game_camera.camera);
    }
}

fn draw_game_end() void {
    rl.EndMode2D();
}

fn window_should_close(
    _world: WORLD(),
    _game_state: SINGLETON_MUT(GameState),
) void {
    const world = _world.get_mut();
    const game_state = _game_state.get_mut();

    if (rl.WindowShouldClose()) {
        game_state.set(world, .{ .Exit = true });
    }
}

fn check_exit(
    _world: WORLD(),
    _game_state: SINGLETON(GameState),
) void {
    const world = _world.get_mut();
    const game_state = _game_state.get();

    if (game_state.current_state.Exit) {
        flecs.quit(world);
    }
}

fn draw_mouse_pos(
    _mouse_pos: SINGLETON(MousePosition),
) void {
    const mouse_pos = _mouse_pos.get();
    rl.DrawCircleV(mouse_pos.world_position.to_rl_as_pos(), 2.0, rl.YELLOW);
}

pub fn process_keys(
    _world: WORLD(),
    _game_state: SINGLETON_MUT(GameState),
    _level_state: SINGLETON_MUT(LevelState),
) void {
    const world = _world.get_mut();
    const game_state = _game_state.get_mut();
    const level_state = _level_state.get_mut();

    if (rl.IsKeyPressed(rl.KEY_ESCAPE)) {
        if (game_state.current_state.Running) {
            game_state.set(world, .{ .Paused = true });
        } else if (game_state.current_state.Paused) {
            game_state.set_previous(world);
        }
    }

    if (game_state.current_state.Running) {
        if (rl.IsKeyPressed(rl.KEY_R)) {
            level_state.need_to_restart = true;
        }
    }
}

fn update_mouse_pos(
    _game_camera: SINGLETON(GameCamera),
    _editor_camera: SINGLETON(EditorCamera),
    _game_state: SINGLETON(GameState),
    _mouse_pos: SINGLETON_MUT(MousePosition),
) void {
    const game_camera = _game_camera.get();
    const editor_camera = _editor_camera.get();
    const game_state = _game_state.get();
    const mouse_pos = _mouse_pos.get_mut();

    const camera = if (game_state.current_state.Editor)
        editor_camera.camera.camera
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
    _physics_world: SINGLETON(PhysicsWorld),
    _sensor_events: SINGLETON_MUT(SensorEvents),
) void {
    const physics_world = _physics_world.get();
    const sensor_events = _sensor_events.get_mut();

    b2.b2World_Step(physics_world.id, 1.0 / @as(f32, TARGET_FPS), 4);
    sensor_events.* = SensorEvents.new(physics_world.id);
}

pub fn check_win_contidion(
    _world: WORLD(),
    _timer: SINGLETON(LevelTimer),
    _sensor_events: SINGLETON(SensorEvents),
    _game_state: SINGLETON_MUT(GameState),
    _levels: SINGLETON_MUT(Levels),
    _shapes: COMPONENT(ShapeId, .In),
    _: TAG(RectangleTag),
    _: TAG(WinTarget),
) void {
    const world = _world.get_mut();
    const timer = _timer.get();
    const sensor_events = _sensor_events.get();
    const game_state = _game_state.get_mut();
    const levels = _levels.get_mut();
    const shapes = _shapes.get();

    const current_level = levels.active_level_metadata().?;

    for (shapes) |shape| {
        for (sensor_events.begin_events) |be| {
            if (@as(u64, @bitCast(be.sensorShapeId)) == @as(u64, @bitCast(shape.id))) {
                game_state.set(world, .{ .Win = true });
                if (current_level.best_time) |bt| {
                    current_level.best_time = @min(bt, timer.time);
                } else {
                    current_level.best_time = timer.time;
                }
                levels.save() catch {
                    game_state.set(world, .{ .Exit = true });
                    return;
                };
            }
        }
    }
}

pub fn update_game_camera(
    _delta_time: DELTA_TIME(),
    _game_camera: SINGLETON_MUT(GameCamera),
    _positions: COMPONENT(Position, .In),
    _: TAG(BallTag),
) void {
    const delta_time = _delta_time.get();
    const game_camera = _game_camera.get_mut();
    const positions = _positions.get();

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

        try UI_FLECS_INIT_COMPONENTS(ecs_world, &settings);
        try LEVEL_FLECS_INIT_COMPONENTS(ecs_world, allocator);
        try EDITOR_FLECS_INIT_COMPONENTS(ecs_world, allocator, &settings);
        try OBJECTS_FLECS_INIT_COMPONENTS(ecs_world, allocator);

        flecs.TAG(ecs_world, WinTarget);

        flecs.COMPONENT(ecs_world, Allocator);
        flecs.COMPONENT(ecs_world, Settings);
        flecs.COMPONENT(ecs_world, GameState);
        flecs.COMPONENT(ecs_world, SensorEvents);
        flecs.COMPONENT(ecs_world, GameCamera);
        flecs.COMPONENT(ecs_world, PhysicsWorld);
        flecs.COMPONENT(ecs_world, MousePosition);
        flecs.COMPONENT(ecs_world, LevelTimer);

        var game_state = GameState.new(.{ .MainMenu = true });

        try UI_FLECS_INIT_SYSTEMS(ecs_world, allocator, &game_state);
        try LEVEL_FLECS_INIT_SYSTES(ecs_world, allocator);
        try EDITOR_FLECS_INIT_SYSTEMS(ecs_world, allocator, &game_state);
        try OBJECTS_FLECS_INIT_SYSTEMS(ecs_world, allocator, &game_state);

        _ = flecs.ADD_SYSTEM(ecs_world, "draw_start", flecs.OnLoad, draw_start);

        // Game
        game_state.add_system_run_conditions(&.{
            .{
                .entity = flecs.ADD_SYSTEM(ecs_world, "update_timer", flecs.PreUpdate, update_timer),
                .run_states = .{ .Running = true },
            },
            .{
                .entity = flecs.ADD_SYSTEM(ecs_world, "update_physics", flecs.PreUpdate, update_physics),
                .run_states = .{ .Running = true },
            },
            .{
                .entity = flecs.ADD_SYSTEM(ecs_world, "update_game_camera", flecs.PreUpdate, update_game_camera),
                .run_states = .{ .Running = true },
            },
            .{
                .entity = flecs.ADD_SYSTEM(ecs_world, "check_win_contidion", flecs.PreUpdate, check_win_contidion),
                .run_states = .{ .Running = true },
            },
        });
        _ = flecs.ADD_SYSTEM(ecs_world, "process_keys", flecs.PreUpdate, process_keys);
        _ = flecs.ADD_SYSTEM(ecs_world, "update_mouse_pos", flecs.PreUpdate, update_mouse_pos);

        _ = flecs.ADD_SYSTEM(ecs_world, "draw_game_start", flecs.PreUpdate, draw_game_start);
        _ = flecs.ADD_SYSTEM(ecs_world, "draw_mouse_pos", flecs.OnUpdate, draw_mouse_pos);
        _ = flecs.ADD_SYSTEM(ecs_world, "draw_game_end", flecs.PostUpdate, draw_game_end);

        // UI
        _ = flecs.ADD_SYSTEM(ecs_world, "draw_end", flecs.PostFrame, draw_end);
        // Other
        _ = flecs.ADD_SYSTEM(ecs_world, "window_should_close", flecs.PostFrame, window_should_close);
        _ = flecs.ADD_SYSTEM(ecs_world, "check_exit", flecs.PostFrame, check_exit);

        _ = flecs.singleton_set(ecs_world, LevelTimer, .{});

        _ = flecs.singleton_set(ecs_world, Allocator, allocator);
        _ = flecs.singleton_set(ecs_world, Settings, settings);

        game_state.update_run_conditions(ecs_world);
        _ = flecs.singleton_set(ecs_world, GameState, game_state);

        const sensor_events = SensorEvents.new(physics_world);
        _ = flecs.singleton_set(ecs_world, SensorEvents, sensor_events);

        var camera = GameCamera{
            .camera = std.mem.zeroInit(rl.Camera2D, .{}),
        };
        camera.update_resolution(settings.resolution_width, settings.resolution_height);
        _ = flecs.singleton_set(ecs_world, GameCamera, camera);

        _ = flecs.singleton_set(ecs_world, PhysicsWorld, .{ .id = physics_world });
        _ = flecs.singleton_set(ecs_world, MousePosition, .{
            .world_position = Vector2.ZERO,
            .screen_position = Vector2.ZERO,
        });

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

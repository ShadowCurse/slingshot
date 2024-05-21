const std = @import("std");
const builtin = @import("builtin");
const rl = @import("raylib.zig");
const b2 = @import("box2d.zig");
const flecs = @import("flecs.zig");
const objects = @import("objects.zig");

const _level = @import("level.zig");
const Level = _level.Level;
const Levels = _level.Levels;
const LevelSave = _level.LevelSave;
const CurrentLevel = _level.CurrentLevel;
const DEFAULT_SAVE_PATH = _level.DEFAULT_SAVE_PATH;

const _settings = @import("settings.zig");
const Settings = _settings.Settings;
const DEFAULT_SETTINGS_PATH = _settings.DEFAULT_SETTINGS_PATH;

const ParamEditor = @import("editor.zig").ParamEditor;

const Object = objects.Object;
const ObjectParams = objects.ObjectParams;
const DebugDraw = objects.DebugDraw;
const AABB = objects.AABB;

const Arc = objects.Arc;

const Ball = objects.Ball;
const BallParams = objects.BallParams;

const Anchor = objects.Anchor;
const AnchorParams = objects.AnchorParams;

const Rectangle = objects.Rectangle;
const RectangleParams = objects.RectangleParams;

const RectangleChain = objects.RectangleChain;
const RectangleChainParams = objects.RectangleChainParams;

const Vector2 = @import("vector.zig");
const Allocator = std.mem.Allocator;

const TARGET_FPS = 80;
const BACKGROUND_COLOR = rl.BLACK;
const AABB_LINE_THICKNESS = 1.5;
const AABB_COLOR = rl.SKYBLUE;

pub const UI_ELEMENT_WIDTH = 300.0;
pub const UI_ELEMENT_HEIGHT = 100.0;

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

pub const LevelObject = struct {
    destruction_order: usize,
};

pub const GameCamera = struct {
    camera: rl.Camera2D,
};

pub const EditorCamera = struct {
    camera: rl.Camera2D,
};

pub const PhysicsWorld = struct {
    id: b2.b2WorldId,
};

pub const MousePosition = struct {
    world_position: Vector2,
    screen_position: Vector2,
};

fn initial_setup(iter: *flecs.iter_t) void {
    const allocator = flecs.singleton_get(iter.world, Allocator).?;
    const game_camera = flecs.singleton_get_mut(iter.world, GameCamera).?;

    const settings = Settings.load(allocator.*, DEFAULT_SETTINGS_PATH) catch {
        flecs.quit(iter.world);
        return;
    };
    _ = flecs.singleton_set(iter.world, Settings, settings);

    game_camera.camera.offset.x = @as(f32, @floatFromInt(settings.resolution_width)) / 2.0;
    game_camera.camera.offset.y = @as(f32, @floatFromInt(settings.resolution_height)) / 2.0;

    rl.InitWindow(
        @intCast(settings.resolution_width),
        @intCast(settings.resolution_height),
        "Slingshot",
    );
    rl.SetExitKey(rl.KEY_NULL);
    rl.GuiLoadStyleDefault();
    rl.SetTargetFPS(TARGET_FPS);
}

fn draw_start(iter: *flecs.iter_t) void {
    _ = iter;
    rl.BeginDrawing();
    rl.ClearBackground(BACKGROUND_COLOR);
}

fn draw_end(iter: *flecs.iter_t) void {
    _ = iter;
    rl.EndDrawing();
}

fn draw_game_start(iter: *flecs.iter_t) void {
    const state_stack = flecs.singleton_get(iter.world, GameStateStack).?;
    const game_camera = flecs.singleton_get(iter.world, GameCamera).?;
    const editor_camera = flecs.singleton_get(iter.world, EditorCamera).?;

    if (state_stack.current_state() == .Editor) {
        rl.BeginMode2D(editor_camera.camera);
    } else {
        rl.BeginMode2D(game_camera.camera);
    }
}

fn draw_game_end(iter: *flecs.iter_t) void {
    _ = iter;
    rl.EndMode2D();
}

fn window_should_close(iter: *flecs.iter_t) void {
    const state_stack = flecs.singleton_get_mut(iter.world, GameStateStack).?;
    if (rl.WindowShouldClose()) {
        state_stack.push_state(.Exit);
    }
}

fn check_exit(iter: *flecs.iter_t) void {
    const state_stack = flecs.singleton_get_mut(iter.world, GameStateStack).?;
    if (state_stack.current_state() == .Exit) {
        flecs.quit(iter.world);
    }
}

fn draw_main_menu(iter: *flecs.iter_t) void {
    const settings = flecs.singleton_get(iter.world, Settings).?;
    const state_stack = flecs.singleton_get_mut(iter.world, GameStateStack).?;
    const levels = flecs.singleton_get_mut(iter.world, Levels).?;

    if (state_stack.current_state() != .MainMenu) {
        return;
    }

    var rectangle = rl.Rectangle{
        .x = @as(f32, @floatFromInt(settings.resolution_width)) / 2.0 - UI_ELEMENT_WIDTH / 2.0,
        .y = @as(f32, @floatFromInt(settings.resolution_height)) / 2.0 - UI_ELEMENT_HEIGHT / 2.0,
        .width = UI_ELEMENT_WIDTH,
        .height = UI_ELEMENT_HEIGHT,
    };
    const start_button = rl.GuiButton(
        rectangle,
        "Start",
    );
    if (start_button != 0) {
        levels.scan() catch {
            state_stack.push_state(.Exit);
            return;
        };
        state_stack.push_state(.LevelSelection);
    }

    rectangle.y += UI_ELEMENT_HEIGHT;
    const settings_button = rl.GuiButton(
        rectangle,
        "Settings",
    );
    if (settings_button != 0) {
        state_stack.push_state(.Settings);
    }

    rectangle.y += UI_ELEMENT_HEIGHT;
    const exit_button = rl.GuiButton(
        rectangle,
        "Exit",
    );
    if (exit_button != 0) {
        state_stack.push_state(.Exit);
    }
}

fn draw_level_selection(iter: *flecs.iter_t) void {
    const settings = flecs.singleton_get(iter.world, Settings).?;
    const levels = flecs.singleton_get_mut(iter.world, Levels).?;
    const current_level = flecs.singleton_get_mut(iter.world, CurrentLevel).?;
    const state_stack = flecs.singleton_get_mut(iter.world, GameStateStack).?;

    if (state_stack.current_state() != .LevelSelection) {
        return;
    }

    levels.draw(settings, state_stack, current_level);
}

fn draw_settings(iter: *flecs.iter_t) void {
    const camera = flecs.singleton_get_mut(iter.world, GameCamera).?;
    const settings = flecs.singleton_get_mut(iter.world, Settings).?;
    const state_stack = flecs.singleton_get_mut(iter.world, GameStateStack).?;

    if (state_stack.current_state() != .Settings) {
        return;
    }

    settings.draw(camera, state_stack) catch {
        state_stack.push_state(.Exit);
    };
}

pub fn draw_paused(iter: *flecs.iter_t) void {
    const settings = flecs.singleton_get(iter.world, Settings).?;
    const state_stack = flecs.singleton_get_mut(iter.world, GameStateStack).?;
    const current_level = flecs.singleton_get_mut(iter.world, CurrentLevel).?;

    if (state_stack.current_state() != .Paused) {
        return;
    }

    var rectangle = rl.Rectangle{
        .x = @as(f32, @floatFromInt(settings.resolution_width)) / 2.0 - UI_ELEMENT_WIDTH / 2.0,
        .y = @as(f32, @floatFromInt(settings.resolution_height)) / 2.0 - UI_ELEMENT_HEIGHT / 2.0,
        .width = UI_ELEMENT_WIDTH,
        .height = UI_ELEMENT_HEIGHT,
    };
    const resume_button = rl.GuiButton(
        rectangle,
        "Resume",
    );
    if (resume_button != 0) {
        state_stack.pop_state();
    }

    rectangle.y += UI_ELEMENT_HEIGHT;
    const settings_button = rl.GuiButton(
        rectangle,
        "Settings",
    );
    if (settings_button != 0) {
        state_stack.push_state(.Settings);
    }

    rectangle.y += UI_ELEMENT_HEIGHT;
    const main_menu_button = rl.GuiButton(
        rectangle,
        "Main menu",
    );
    if (main_menu_button != 0) {
        state_stack.pop_state();
        state_stack.pop_state();
        state_stack.pop_state();
        current_level.need_to_clean = true;
    }
}

fn draw_win(iter: *flecs.iter_t) void {
    const settings = flecs.singleton_get(iter.world, Settings).?;
    const state_stack = flecs.singleton_get(iter.world, GameStateStack).?;

    if (state_stack.current_state() != .Win) {
        return;
    }

    const win_button_rect = rl.Rectangle{
        .x = @as(f32, @floatFromInt(settings.resolution_width)) / 2.0,
        .y = @as(f32, @floatFromInt(settings.resolution_height)) / 2.0,
        .width = 100.0,
        .height = 100.0,
    };
    const win_button = rl.GuiButton(
        win_button_rect,
        "You won",
    );
    if (win_button != 0) {
        std.log.info("Need to restart level", .{});
        // try self.restart();
    }
}

fn draw_balls(balls: []const Ball, params: []const BallParams) void {
    for (balls, params) |*ball, *param| {
        const position = Vector2.from_b2(b2.b2Body_GetPosition(ball.body_id));
        const max_velocity = 200.0;
        const velocity = @min(Vector2.from_b2(b2.b2Body_GetLinearVelocity(ball.body_id)).length() / max_velocity, 1.0);
        const color = rl.Color{
            .r = @as(
                u8,
                @intFromFloat(
                    std.math.lerp(
                        @as(f32, @floatFromInt(param.color.r)),
                        @as(f32, @floatFromInt(param.fast_color.r)),
                        velocity,
                    ),
                ),
            ),
            .g = @as(
                u8,
                @intFromFloat(
                    std.math.lerp(
                        @as(f32, @floatFromInt(param.color.g)),
                        @as(f32, @floatFromInt(param.fast_color.g)),
                        velocity,
                    ),
                ),
            ),
            .b = @as(
                u8,
                @intFromFloat(
                    std.math.lerp(
                        @as(f32, @floatFromInt(param.color.b)),
                        @as(f32, @floatFromInt(param.fast_color.b)),
                        velocity,
                    ),
                ),
            ),
            .a = 255,
        };
        rl.DrawCircleV(position.to_rl_as_pos(), ball.circle.radius, color);
    }
}

fn draw_balls_aabb(iter: *flecs.iter_t, balls: []const Ball) void {
    const state_stack = flecs.singleton_get(iter.world, GameStateStack).?;
    if (state_stack.current_state() == .Editor) {
        for (balls) |*ball| {
            const position = Vector2.from_b2(b2.b2Body_GetPosition(ball.body_id));
            const aabb = AABB.from_b2(b2.b2Shape_GetAABB(ball.shape_id));
            const rl_aabb_rect = aabb.to_rl_rect(position);
            rl.DrawRectangleLinesEx(rl_aabb_rect, AABB_LINE_THICKNESS, AABB_COLOR);
        }
    }
}

fn draw_anchors(anchors: []const Anchor, params: []const AnchorParams) void {
    for (anchors, params) |*anchor, *param| {
        const position = Vector2.from_b2(b2.b2Body_GetPosition(anchor.body_id));
        rl.DrawCircleV(position.to_rl_as_pos(), param.radius, param.color);

        if (anchor.attached_body_id) |id| {
            const attached_body_position = Vector2.from_b2(b2.b2Body_GetPosition(id));
            rl.DrawLineV(
                position.to_rl_as_pos(),
                attached_body_position.to_rl_as_pos(),
                param.color,
            );
        }
    }
}

fn draw_anchors_aabb(iter: *flecs.iter_t, anchors: []const Anchor, params: []const AnchorParams) void {
    const state_stack = flecs.singleton_get(iter.world, GameStateStack).?;
    if (state_stack.current_state() == .Editor) {
        for (anchors, params) |*anchor, *param| {
            const position = Vector2.from_b2(b2.b2Body_GetPosition(anchor.body_id));
            const aabb = AABB.from_b2(b2.b2AABB{
                .lowerBound = (Vector2{
                    .x = -param.radius,
                    .y = -param.radius,
                }).add(&position).to_b2(),
                .upperBound = (Vector2{
                    .x = param.radius,
                    .y = param.radius,
                }).add(&position).to_b2(),
            });

            const rl_aabb_rect = aabb.to_rl_rect(position);
            rl.DrawRectangleLinesEx(
                rl_aabb_rect,
                AABB_LINE_THICKNESS,
                AABB_COLOR,
            );
        }
    }
}

fn draw_rectangles(rectangles: []const Rectangle, params: []const RectangleParams) void {
    for (rectangles, params) |*rect, *param| {
        const body_position = Vector2.from_b2(b2.b2Body_GetPosition(rect.body_id));
        const body_angle = b2.b2Body_GetAngle(rect.body_id);
        const rl_rect = rect.rectangle.rl_rect(body_position, body_angle);
        const angle = rect.rectangle.angle + body_angle;
        // raylib rotates in clock wise order
        // we negeate degrees to chacnge it to ccw
        const rl_angle = -(angle / std.math.pi * 180.0);
        rl.DrawRectanglePro(rl_rect, rl.Vector2{
            .x = 0.0,
            .y = 0.0,
        }, rl_angle, param.color);
    }
}

fn draw_rectangles_aabb(iter: *flecs.iter_t, rectangles: []const Rectangle) void {
    const state_stack = flecs.singleton_get(iter.world, GameStateStack).?;
    if (state_stack.current_state() == .Editor) {
        for (rectangles) |*rectangle| {
            const body_position = Vector2.from_b2(b2.b2Body_GetPosition(rectangle.body_id));
            const aabb = AABB.from_b2(b2.b2Shape_GetAABB(rectangle.rectangle.shape_id));
            const rl_aabb_rect = aabb.to_rl_rect(body_position);
            rl.DrawRectangleLinesEx(
                rl_aabb_rect,
                AABB_LINE_THICKNESS,
                AABB_COLOR,
            );
        }
    }
}

fn draw_rectangle_chains(rc: []const RectangleChain) void {
    for (rc) |*r| {
        r.draw();
    }
}

fn draw_rectangle_chains_aabb(iter: *flecs.iter_t, rectangle_chains: []const RectangleChain) void {
    const state_stack = flecs.singleton_get(iter.world, GameStateStack).?;
    if (state_stack.current_state() == .Editor) {
        for (rectangle_chains) |*rectangle_chain| {
            rectangle_chain.draw_aabb(rl.SKYBLUE);
        }
    }
}

fn draw_mouse_pos(iter: *flecs.iter_t) void {
    const mouse_pos = flecs.singleton_get(iter.world, MousePosition).?;
    rl.DrawCircleV(mouse_pos.world_position.to_rl_as_pos(), 2.0, rl.YELLOW);
}

pub fn load_level(iter: *flecs.iter_t) void {
    const allocator = flecs.singleton_get(iter.world, Allocator).?;
    const physics_world = flecs.singleton_get(iter.world, PhysicsWorld).?;
    const current_level = flecs.singleton_get_mut(iter.world, CurrentLevel).?;
    const state_stack = flecs.singleton_get_mut(iter.world, GameStateStack).?;

    if (current_level.path == null) {
        return;
    }

    const path = current_level.path.?;
    current_level.path = null;

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
            .Ball => |r| {
                const n = flecs.new_id(iter.world);
                _ = flecs.set(
                    iter.world,
                    n,
                    Ball,
                    Ball.new(physics_world.id, r),
                );
                _ = flecs.set(iter.world, n, BallParams, r);
                _ = flecs.set(iter.world, n, ParamEditor(BallParams), ParamEditor(BallParams).new(&r));
                _ = flecs.set(iter.world, n, LevelObject, .{ .destruction_order = 1 });
            },
            .Anchor => |r| {
                const n = flecs.new_id(iter.world);
                _ = flecs.set(iter.world, n, Anchor, Anchor.new(physics_world.id, r));
                _ = flecs.set(iter.world, n, AnchorParams, r);
                _ = flecs.set(iter.world, n, ParamEditor(AnchorParams), ParamEditor(AnchorParams).new(&r));
                _ = flecs.set(iter.world, n, LevelObject, .{ .destruction_order = 0 });
            },
            .Rectangle => |r| {
                const n = flecs.new_id(iter.world);
                const rectangle = Rectangle.new(physics_world.id, r) catch {
                    state_stack.push_state(.Exit);
                    return;
                };
                _ = flecs.set(iter.world, n, Rectangle, rectangle);
                _ = flecs.set(iter.world, n, RectangleParams, r);
                _ = flecs.set(iter.world, n, ParamEditor(RectangleParams), ParamEditor(RectangleParams).new(&r));
                _ = flecs.set(iter.world, n, LevelObject, .{ .destruction_order = 1 });
            },
            .RectangleChain => |r| {
                const c = r.clone(allocator.*) catch {
                    state_stack.push_state(.Exit);
                    return;
                };

                const rc = RectangleChain.new(physics_world.id, allocator.*, c) catch {
                    c.deinit(allocator.*);
                    state_stack.push_state(.Exit);
                    return;
                };

                const n = flecs.new_id(iter.world);
                _ = flecs.set(iter.world, n, RectangleChain, rc);
                _ = flecs.set(iter.world, n, LevelObject, .{ .destruction_order = 1 });
            },
            else => {},
        }
    }

    state_stack.push_state(.Running);
}

pub fn clean_level(iter: *flecs.iter_t) void {
    const current_level = flecs.singleton_get_mut(iter.world, CurrentLevel).?;

    if (!current_level.need_to_clean) {
        return;
    }

    current_level.need_to_clean = false;

    const level_object_query: *flecs.query_t = @ptrCast(iter.ctx.?);
    var level_object_iter = flecs.query_iter(iter.world, level_object_query);
    while (flecs.query_next(&level_object_iter)) {
        std.log.info("cleaning the level. Deleting {} entities", .{level_object_iter.entities().len});

        for (level_object_iter.entities()) |e| {
            flecs.delete(iter.world, e);
        }
    }
}

pub const RecreateLevelCtx = struct {
    allocator: Allocator,
    ball_query: *flecs.query_t,
    anchor_query: *flecs.query_t,

    const Self = @This();
    pub fn deinit(self: *const Self) callconv(.C) void {
        self.allocator.destroy(self);
    }
};
pub fn recreate_level(iter: *flecs.iter_t) void {
    const physics_world = flecs.singleton_get_mut(iter.world, PhysicsWorld).?;
    const current_level = flecs.singleton_get_mut(iter.world, CurrentLevel).?;

    if (!current_level.need_to_restart) {
        return;
    }

    current_level.need_to_restart = false;

    const ctx: *const RecreateLevelCtx = @alignCast(@ptrCast(iter.ctx.?));

    const anchor_query: *flecs.query_t = @ptrCast(ctx.anchor_query);
    var anchor_iter = flecs.query_iter(iter.world, anchor_query);
    while (flecs.query_next(&anchor_iter)) {
        const anchors = flecs.field(&anchor_iter, Anchor, 1).?;
        const anchor_params = flecs.field(&anchor_iter, AnchorParams, 2).?;
        for (anchors, anchor_params) |*anchor, *params| {
            anchor.deinit();
            anchor.* = Anchor.new(physics_world.id, params.*);
        }
    }

    const ball_query: *flecs.query_t = @ptrCast(ctx.ball_query);
    var ball_iter = flecs.query_iter(iter.world, ball_query);
    while (flecs.query_next(&ball_iter)) {
        const balls = flecs.field(&ball_iter, Ball, 1).?;
        const ball_params = flecs.field(&ball_iter, BallParams, 2).?;
        for (balls, ball_params) |*ball, *params| {
            ball.deinit();
            ball.* = Ball.new(physics_world.id, params.*);
        }
    }
}

pub const SaveLevelCtx = struct {
    allocator: Allocator,
    ball_query: *flecs.query_t,
    anchor_query: *flecs.query_t,
    rectangle_query: *flecs.query_t,
    rectangle_chain_query: *flecs.query_t,

    const Self = @This();
    pub fn deinit(self: *const Self) callconv(.C) void {
        self.allocator.destroy(self);
    }
};
pub fn save_level(iter: *flecs.iter_t) void {
    const allocator = flecs.singleton_get_mut(iter.world, Allocator).?;
    const current_level = flecs.singleton_get_mut(iter.world, CurrentLevel).?;
    const state_stack = flecs.singleton_get_mut(iter.world, GameStateStack).?;

    if (!current_level.need_to_save) {
        return;
    }

    current_level.need_to_save = false;

    const ctx: *const SaveLevelCtx = @alignCast(@ptrCast(iter.ctx.?));

    var objects_params = std.ArrayList(ObjectParams).init(allocator.*);
    defer objects_params.deinit();

    const ball_query: *flecs.query_t = @ptrCast(ctx.ball_query);
    var ball_iter = flecs.query_iter(iter.world, ball_query);
    while (flecs.query_next(&ball_iter)) {
        const ball_params = flecs.field(&ball_iter, BallParams, 1).?;
        for (ball_params) |*params| {
            objects_params.append(.{ .Ball = params.* }) catch {
                state_stack.push_state(.Exit);
                return;
            };
        }
    }

    const anchor_query: *flecs.query_t = @ptrCast(ctx.anchor_query);
    var anchor_iter = flecs.query_iter(iter.world, anchor_query);
    while (flecs.query_next(&anchor_iter)) {
        const anchor_params = flecs.field(&anchor_iter, AnchorParams, 1).?;
        for (anchor_params) |*params| {
            objects_params.append(.{ .Anchor = params.* }) catch {
                state_stack.push_state(.Exit);
                return;
            };
        }
    }

    const rectangle_query: *flecs.query_t = @ptrCast(ctx.rectangle_query);
    var rectangle_iter = flecs.query_iter(iter.world, rectangle_query);
    while (flecs.query_next(&rectangle_iter)) {
        const rectangle_params = flecs.field(&rectangle_iter, RectangleParams, 1).?;
        for (rectangle_params) |*params| {
            objects_params.append(.{ .Rectangle = params.* }) catch {
                state_stack.push_state(.Exit);
                return;
            };
        }
    }

    const rectangle_chain_query: *flecs.query_t = @ptrCast(ctx.rectangle_chain_query);
    var rectangle_chain_iter = flecs.query_iter(iter.world, rectangle_chain_query);
    while (flecs.query_next(&rectangle_chain_iter)) {
        const rectangle_chain_params = flecs.field(&rectangle_chain_iter, RectangleChainParams, 1).?;
        for (rectangle_chain_params) |*params| {
            objects_params.append(.{ .RectangleChain = params.* }) catch {
                state_stack.push_state(.Exit);
                return;
            };
        }
    }

    const save_state = LevelSave{
        .objects = objects_params.items,
    };

    std.log.debug("Saving level to: {s}", .{DEFAULT_SAVE_PATH});

    var file = std.fs.cwd().createFile(DEFAULT_SAVE_PATH, .{}) catch {
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

pub fn process_keys(iter: *flecs.iter_t) void {
    const state_stack = flecs.singleton_get_mut(iter.world, GameStateStack).?;
    const current_level = flecs.singleton_get_mut(iter.world, CurrentLevel).?;

    if (rl.IsKeyPressed(rl.KEY_R)) {
        current_level.need_to_restart = true;
    }

    if (rl.IsKeyPressed(rl.KEY_ESCAPE)) {
        state_stack.push_state(.Paused);
    }

    if (rl.IsKeyPressed(rl.KEY_E)) {
        if (state_stack.current_state() == .Running) {
            state_stack.push_state(.Editor);
        } else if (state_stack.current_state() == .Editor) {
            state_stack.pop_state();
        }
    }
}

fn update_mouse_pos(iter: *flecs.iter_t) void {
    const game_camera = flecs.singleton_get(iter.world, GameCamera).?;
    const editor_camera = flecs.singleton_get(iter.world, EditorCamera).?;
    const state_stack = flecs.singleton_get(iter.world, GameStateStack).?;
    const mouse_pos = flecs.singleton_get_mut(iter.world, MousePosition).?;

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

pub fn update_physics(iter: *flecs.iter_t) void {
    const state_stack = flecs.singleton_get(iter.world, GameStateStack).?;

    if (state_stack.current_state() != .Running) {
        return;
    }

    const physics_world = flecs.singleton_get_mut(iter.world, PhysicsWorld).?;
    b2.b2World_Step(physics_world.id, iter.delta_time, 4);
}

pub fn update_anchor(iter: *flecs.iter_t, anchors: []Anchor, anchor_params: []const AnchorParams) void {
    const mouse_pos = flecs.singleton_get(iter.world, MousePosition).?;
    const physics_world = flecs.singleton_get(iter.world, PhysicsWorld).?;
    const state_stack = flecs.singleton_get(iter.world, GameStateStack).?;

    if (state_stack.current_state() != .Running) {
        return;
    }

    const ball_query: *flecs.query_t = @ptrCast(iter.ctx.?);
    var ball_iter = flecs.query_iter(iter.world, ball_query);
    std.debug.assert(flecs.query_next(&ball_iter));
    const balls = flecs.field(&ball_iter, Ball, 1).?;
    const ball_params = flecs.field(&ball_iter, BallParams, 2).?;
    const ball = balls[0];
    const ball_param = ball_params[0];
    std.debug.assert(!flecs.query_next(&ball_iter));

    for (anchors, anchor_params) |*anchor, *anchor_param| {
        const self_position = Vector2.from_b2(b2.b2Body_GetPosition(anchor.body_id));
        const ball_position = Vector2.from_b2(b2.b2Body_GetPosition(ball.body_id));

        if (rl.IsKeyDown(rl.KEY_SPACE)) {
            if (anchor.length_joint_id) |id| {
                b2.b2DestroyJoint(id);
                anchor.length_joint_id = null;
                anchor.attached_body_id = null;
            }
        } else {
            if (anchor.length_joint_id == null) {
                if (self_position.sub(&ball_position).length() < anchor_param.radius + ball_param.radius) {
                    var joint_def = b2.b2DefaultDistanceJointDef();
                    joint_def.bodyIdA = anchor.body_id;
                    joint_def.bodyIdB = ball.body_id;
                    joint_def.length = 0.0;
                    joint_def.minLength = anchor_param.min_length;
                    joint_def.maxLength = anchor_param.max_length;
                    joint_def.dampingRatio = anchor_param.damping_ratio;
                    joint_def.hertz = anchor_param.hertz;

                    const joint_id = b2.b2CreateDistanceJoint(physics_world.*.id, &joint_def);
                    anchor.length_joint_id = joint_id;
                    anchor.attached_body_id = ball.body_id;
                }
            } else {
                if (rl.IsMouseButtonDown(rl.MOUSE_BUTTON_LEFT)) {
                    const to_mouse = mouse_pos.world_position
                        .sub(&self_position)
                        .normalized()
                        .mul(anchor_param.pull_force);
                    b2.b2Body_SetLinearVelocity(ball.body_id, to_mouse.to_b2());
                }
            }
        }
    }
}

pub fn update_game_camera(iter: *flecs.iter_t, balls: []const Ball) void {
    const game_camera = flecs.singleton_get_mut(iter.world, GameCamera).?;

    const ball = balls[0];
    const ball_pos = ball.get_position();
    const camera_pos = Vector2.from_rl_pos(game_camera.camera.target);
    const p = ball_pos.lerp(&camera_pos, iter.delta_time);
    game_camera.camera.target.y = p.to_rl_as_pos().y;
}

pub fn update_editor_camera(iter: *flecs.iter_t) void {
    const state_stack = flecs.singleton_get(iter.world, GameStateStack).?;
    const editor_camera = flecs.singleton_get_mut(iter.world, EditorCamera).?;

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

        flecs.COMPONENT(ecs_world, Allocator);
        flecs.COMPONENT(ecs_world, Settings);
        flecs.COMPONENT(ecs_world, GameStateStack);
        flecs.COMPONENT(ecs_world, GameCamera);
        flecs.COMPONENT(ecs_world, EditorCamera);
        flecs.COMPONENT(ecs_world, PhysicsWorld);
        flecs.COMPONENT(ecs_world, MousePosition);
        flecs.COMPONENT(ecs_world, Levels);
        flecs.COMPONENT(ecs_world, CurrentLevel);

        flecs.COMPONENT(ecs_world, LevelObject);

        flecs.COMPONENT(ecs_world, Ball);
        flecs.COMPONENT(ecs_world, BallParams);
        flecs.COMPONENT(ecs_world, ParamEditor(BallParams));

        flecs.COMPONENT(ecs_world, Anchor);
        flecs.COMPONENT(ecs_world, AnchorParams);
        flecs.COMPONENT(ecs_world, ParamEditor(AnchorParams));

        flecs.COMPONENT(ecs_world, Rectangle);
        flecs.COMPONENT(ecs_world, RectangleParams);
        flecs.COMPONENT(ecs_world, ParamEditor(RectangleParams));

        flecs.COMPONENT(ecs_world, RectangleChain);

        flecs.ADD_SYSTEM(ecs_world, "initial_setup", flecs.OnStart, initial_setup);

        flecs.ADD_SYSTEM(ecs_world, "draw_start", flecs.PreFrame, draw_start);

        {
            var desc = flecs.SYSTEM_DESC(load_level);
            desc.query.filter.terms[0].inout = .Out;
            desc.query.filter.terms[0].id = flecs.Wildcard;
            desc.query.filter.terms[0].src.flags = flecs.IsEntity;
            desc.query.filter.terms[0].src.id = 0;
            flecs.SYSTEM(ecs_world, "load_level", flecs.OnLoad, &desc);
        }
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

            flecs.SYSTEM(ecs_world, "clean_level", flecs.OnLoad, &desc);
        }
        {
            var desc = flecs.SYSTEM_DESC(recreate_level);

            var ball_query: flecs.query_desc_t = .{};
            ball_query.filter.terms[0].inout = .InOut;
            ball_query.filter.terms[0].id = flecs.id(Ball);
            ball_query.filter.terms[1].inout = .In;
            ball_query.filter.terms[1].id = flecs.id(BallParams);
            const bq = try flecs.query_init(ecs_world, &ball_query);

            var anchor_query: flecs.query_desc_t = .{};
            anchor_query.filter.terms[0].inout = .InOut;
            anchor_query.filter.terms[0].id = flecs.id(Anchor);
            anchor_query.filter.terms[1].inout = .In;
            anchor_query.filter.terms[1].id = flecs.id(AnchorParams);
            const aq = try flecs.query_init(ecs_world, &anchor_query);

            var rl_ctx = try allocator.create(RecreateLevelCtx);
            rl_ctx.allocator = allocator;
            rl_ctx.ball_query = bq;
            rl_ctx.anchor_query = aq;

            desc.ctx = rl_ctx;
            desc.ctx_free = @ptrCast(&RecreateLevelCtx.deinit);

            flecs.SYSTEM(ecs_world, "recreate_level", flecs.OnLoad, &desc);
        }
        {
            var desc = flecs.SYSTEM_DESC(save_level);

            var ball_query: flecs.query_desc_t = .{};
            ball_query.filter.terms[0].inout = .In;
            ball_query.filter.terms[0].id = flecs.id(BallParams);
            const bq = try flecs.query_init(ecs_world, &ball_query);

            var anchor_query: flecs.query_desc_t = .{};
            anchor_query.filter.terms[0].inout = .In;
            anchor_query.filter.terms[0].id = flecs.id(AnchorParams);
            const aq = try flecs.query_init(ecs_world, &anchor_query);

            var rectangle_query: flecs.query_desc_t = .{};
            rectangle_query.filter.terms[0].inout = .In;
            rectangle_query.filter.terms[0].id = flecs.id(RectangleParams);
            const rq = try flecs.query_init(ecs_world, &rectangle_query);

            var rectangle_chain_query: flecs.query_desc_t = .{};
            rectangle_chain_query.filter.terms[0].inout = .In;
            rectangle_chain_query.filter.terms[0].id = flecs.id(RectangleChainParams);
            const rcq = try flecs.query_init(ecs_world, &rectangle_chain_query);

            var s_ctx = try allocator.create(SaveLevelCtx);
            s_ctx.allocator = allocator;
            s_ctx.ball_query = bq;
            s_ctx.anchor_query = aq;
            s_ctx.rectangle_query = rq;
            s_ctx.rectangle_chain_query = rcq;

            desc.ctx = s_ctx;
            desc.ctx_free = @ptrCast(&SaveLevelCtx.deinit);

            flecs.SYSTEM(ecs_world, "save_level", flecs.OnLoad, &desc);
        }

        // Game
        flecs.ADD_SYSTEM(ecs_world, "update_physics", flecs.PreUpdate, update_physics);
        flecs.ADD_SYSTEM(ecs_world, "process_keys", flecs.PreUpdate, process_keys);
        flecs.ADD_SYSTEM(ecs_world, "update_mouse_pos", flecs.PreUpdate, update_mouse_pos);
        flecs.ADD_SYSTEM(ecs_world, "update_game_camera", flecs.PreUpdate, update_game_camera);
        flecs.ADD_SYSTEM(ecs_world, "update_editor_camera", flecs.PreUpdate, update_editor_camera);

        {
            var desc = flecs.SYSTEM_DESC(update_anchor);

            var ball_query: flecs.query_desc_t = .{};
            ball_query.filter.terms[0].id = flecs.id(Ball);
            ball_query.filter.terms[0].inout = .In;
            ball_query.filter.terms[1].id = flecs.id(BallParams);
            ball_query.filter.terms[1].inout = .In;
            const q = try flecs.query_init(ecs_world, &ball_query);
            desc.ctx = q;
            // No need to clean ctx, query seems to be cleaned automatically.

            flecs.SYSTEM(ecs_world, "update_anchor", flecs.PreUpdate, &desc);
        }

        flecs.ADD_SYSTEM(ecs_world, "draw_game_start", flecs.PreUpdate, draw_game_start);

        // Draw all game objects
        flecs.ADD_SYSTEM(ecs_world, "draw_balls", flecs.OnUpdate, draw_balls);
        flecs.ADD_SYSTEM(ecs_world, "draw_balls_aabb", flecs.OnUpdate, draw_balls_aabb);
        flecs.ADD_SYSTEM(ecs_world, "draw_anchors", flecs.OnUpdate, draw_anchors);
        flecs.ADD_SYSTEM(ecs_world, "draw_anchors_aabb", flecs.OnUpdate, draw_anchors_aabb);
        flecs.ADD_SYSTEM(ecs_world, "draw_rectangles", flecs.OnUpdate, draw_rectangles);
        flecs.ADD_SYSTEM(ecs_world, "draw_rectangles_aabb", flecs.OnUpdate, draw_rectangles_aabb);
        flecs.ADD_SYSTEM(ecs_world, "draw_rectangle_chains", flecs.OnUpdate, draw_rectangle_chains);
        flecs.ADD_SYSTEM(ecs_world, "draw_rectangle_chains_aabb", flecs.OnUpdate, draw_rectangle_chains_aabb);

        flecs.ADD_SYSTEM(ecs_world, "draw_mouse_pos", flecs.OnUpdate, draw_mouse_pos);

        flecs.ADD_SYSTEM(ecs_world, "draw_game_end", flecs.PostUpdate, draw_game_end);

        // UI
        flecs.ADD_SYSTEM(ecs_world, "draw_main_menu", flecs.PreStore, draw_main_menu);
        flecs.ADD_SYSTEM(ecs_world, "draw_level_selection", flecs.PreStore, draw_level_selection);
        flecs.ADD_SYSTEM(ecs_world, "draw_settings", flecs.PreStore, draw_settings);
        flecs.ADD_SYSTEM(ecs_world, "draw_paused", flecs.PreStore, draw_paused);
        flecs.ADD_SYSTEM(ecs_world, "draw_win", flecs.PreStore, draw_win);

        flecs.ADD_SYSTEM(ecs_world, "draw_end", flecs.PostFrame, draw_end);

        // Other
        flecs.ADD_SYSTEM(ecs_world, "window_should_close", flecs.PostFrame, window_should_close);
        flecs.ADD_SYSTEM(ecs_world, "check_exit", flecs.PostFrame, check_exit);

        _ = flecs.singleton_set(ecs_world, Allocator, allocator);
        _ = flecs.singleton_set(ecs_world, Settings, .{});

        const state_stack = GameStateStack.new(.MainMenu);
        _ = flecs.singleton_set(ecs_world, GameStateStack, state_stack);

        const camera = rl.Camera2D{
            .offset = rl.Vector2{ .x = 0.0, .y = 0.0 },
            .target = rl.Vector2{ .x = 0.0, .y = 0.0 },
            .rotation = 0.0,
            .zoom = 1.0,
        };
        _ = flecs.singleton_set(ecs_world, GameCamera, .{ .camera = camera });
        _ = flecs.singleton_set(ecs_world, EditorCamera, .{ .camera = camera });

        _ = flecs.singleton_set(ecs_world, PhysicsWorld, .{ .id = physics_world });
        _ = flecs.singleton_set(ecs_world, MousePosition, .{
            .world_position = Vector2.ZERO,
            .screen_position = Vector2.ZERO,
        });

        const levels = try Levels.init(allocator);
        _ = flecs.singleton_set(ecs_world, Levels, levels);
        _ = flecs.singleton_set(ecs_world, CurrentLevel, .{});

        return Self{
            .allocator = allocator,
            .ecs_world = ecs_world,
            .physics_world = physics_world,
        };
    }

    pub fn deinit(self: *Self) void {
        _ = flecs.fini(self.ecs_world);
        b2.b2DestroyWorld(self.physics_world);
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

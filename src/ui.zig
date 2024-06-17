const std = @import("std");
const Allocator = std.mem.Allocator;

const rl = @import("deps/raylib.zig");
const flecs = @import("deps/flecs.zig");

const SPT = flecs.SYSTEM_PARAMETER_TAG;
const SPW = flecs.SYSTEM_PARAMETER_WORLD;
const SP_CONTEXT = flecs.SYSTEM_PARAMETER_CONTEXT;
const SP_CONTEXT_MUT = flecs.SYSTEM_PARAMETER_CONTEXT_MUT;
const SP_DELTA_TIME = flecs.SYSTEM_PARAMETER_DELTA_TIME;
const SPC = flecs.SYSTEM_PARAMETER_COMPONENT;
const SPC_MUT = flecs.SYSTEM_PARAMETER_COMPONENT;
const SPS = flecs.SYSTEM_PARAMETER_SINGLETON;
const SPS_MUT = flecs.SYSTEM_PARAMETER_SINGLETON_MUT;

const _game = @import("game.zig");
const GameCamera = _game.GameCamera;
const GameStateStack = _game.GameStateStack;

const _level = @import("level.zig");
const Levels = _level.Levels;
const CurrentLevel = _level.CurrentLevel;

const _settings = @import("settings.zig");
const Settings = _settings.Settings;

const _editor = @import("editor.zig");
const EditorState = _editor.EditorState;

const Vector2 = @import("vector.zig");

pub const UI_ELEMENT_WIDTH = 300.0;
pub const UI_ELEMENT_HEIGHT = 100.0;

pub const UiTimer = struct {
    time: f32 = 0.0,
    color: rl.Color = rl.WHITE,
    font_size: f32 = 50.0,
    spacing: f32 = 1.0,
};

fn update_timer(
    _delta_time: SP_DELTA_TIME(),
    _state_stack: SPS(GameStateStack),
    _timer: SPS_MUT(UiTimer),
) void {
    const time = _delta_time.data;
    const state_stack = _state_stack.data;
    var timer = _timer.data;

    if (state_stack.current_state() != .Running) {
        return;
    }

    timer.time += time;
}

fn draw_main_menu(
    __settings: SPS(Settings),
    _levels: SPS_MUT(Levels),
    _state_stack: SPS_MUT(GameStateStack),
) void {
    const settings = __settings.data;
    const levels = _levels.data;
    const state_stack = _state_stack.data;

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

fn draw_level_selection(
    _world: SPW(),
    _state_stack: SPS_MUT(GameStateStack),
) void {
    const world = _world.data;
    const state_stack = _state_stack.data;

    if (state_stack.current_state() != .LevelSelection) {
        return;
    }

    const settings = flecs.singleton_get(world, Settings).?;
    const levels = flecs.singleton_get_mut(world, Levels).?;
    const current_level = flecs.singleton_get_mut(world, CurrentLevel).?;
    const editor_state = flecs.singleton_get_mut(world, EditorState).?;

    levels.draw(settings, state_stack, current_level);

    if (current_level.load_path) |path| {
        @memcpy(editor_state.level_path[0..path.len], path);
    }
}

fn draw_timer(
    _state_stack: SPS_MUT(GameStateStack),
    _timer: SPS(UiTimer),
) void {
    const state_stack = _state_stack.data;
    const timer = _timer.data;

    if (state_stack.current_state() != .Running) {
        return;
    }

    const font = rl.GetFontDefault();
    const position = Vector2.ZERO;

    var buf: [8:0]u8 = undefined;
    const s = std.fmt.bufPrintZ(&buf, "{d:.2}", .{timer.time}) catch unreachable;

    rl.DrawTextEx(
        font,
        s.ptr,
        position.to_rl_as_pos(),
        timer.font_size,
        timer.spacing,
        timer.color,
    );
}

fn draw_settings(
    _camera: SPS_MUT(GameCamera),
    __settings: SPS_MUT(Settings),
    _state_stack: SPS_MUT(GameStateStack),
) void {
    const camera = _camera.data;
    const settings = __settings.data;
    const state_stack = _state_stack.data;

    if (state_stack.current_state() != .Settings) {
        return;
    }

    settings.draw(camera, state_stack) catch {
        state_stack.push_state(.Exit);
    };
}

pub fn draw_paused(
    __settings: SPS_MUT(Settings),
    _state_stack: SPS_MUT(GameStateStack),
    _current_level: SPS_MUT(CurrentLevel),
) void {
    const settings = __settings.data;
    const state_stack = _state_stack.data;
    const current_level = _current_level.data;

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

fn draw_win(
    __settings: SPS_MUT(Settings),
    _state_stack: SPS_MUT(GameStateStack),
    _current_level: SPS_MUT(CurrentLevel),
) void {
    const settings = __settings.data;
    const state_stack = _state_stack.data;
    const current_level = _current_level.data;

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
        state_stack.pop_state();
        state_stack.pop_state();
        state_stack.pop_state();
        current_level.need_to_clean = true;
    }
}

pub fn FLECS_INIT_COMPONENTS(world: *flecs.world_t, allocator: Allocator) !void {
    _ = allocator;

    flecs.COMPONENT(world, UiTimer);

    _ = flecs.singleton_set(world, UiTimer, .{});
}

pub fn FLECS_INIT_SYSTEMS(world: *flecs.world_t, allocator: Allocator) !void {
    _ = allocator;
    flecs.ADD_SYSTEM(world, "update_timer", flecs.PreFrame, update_timer);

    flecs.ADD_SYSTEM(world, "draw_main_menu", flecs.PreStore, draw_main_menu);
    flecs.ADD_SYSTEM(world, "draw_level_selection", flecs.PreStore, draw_level_selection);
    flecs.ADD_SYSTEM(world, "draw_timer", flecs.PreStore, draw_timer);
    flecs.ADD_SYSTEM(world, "draw_settings", flecs.PreStore, draw_settings);
    flecs.ADD_SYSTEM(world, "draw_paused", flecs.PreStore, draw_paused);
    flecs.ADD_SYSTEM(world, "draw_win", flecs.PreStore, draw_win);
}

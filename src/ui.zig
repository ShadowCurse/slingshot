const std = @import("std");
const Allocator = std.mem.Allocator;

const rl = @import("deps/raylib.zig");
const flecs = @import("deps/flecs.zig");

const DELTA_TIME = flecs.SYSTEM_PARAMETER_DELTA_TIME;
const SINGLETON = flecs.SYSTEM_PARAMETER_SINGLETON;
const SINGLETON_MUT = flecs.SYSTEM_PARAMETER_SINGLETON_MUT;

const __game = @import("game.zig");
const GameCamera = __game.GameCamera;
const GameStateStack = __game.GameStateStack;

const __level = @import("level.zig");
const Levels = __level.Levels;
const LevelState = __level.LevelState;
const CurrentLevel = __level.CurrentLevel;

const __settings = @import("settings.zig");
const Settings = __settings.Settings;

const __editor = @import("editor.zig");
const EditorState = __editor.EditorState;

const Vector2 = @import("vector.zig");

pub const UI_ELEMENT_WIDTH = 300.0;
pub const UI_ELEMENT_HEIGHT = 100.0;

pub const UI_LEVEL_FONT_SIZE = 50.0;
pub const UI_LEVEL_FONT_SPACING = 2.0;
pub const UI_LEVEL_FONT_COLOR = rl.WHITE;
pub const UI_LEVEL_NAME_POSITION = Vector2{ .x = 10.0, .y = 10.0 };
pub const UI_TIMER_POSITION = Vector2{ .x = 10.0, .y = 70.0 };
pub const UI_BEST_TIME_POSITION = Vector2{ .x = 10.0, .y = 150.0 };

pub const UiTimer = struct {
    time: f32 = 0.0,
};

fn update_timer(
    _delta_time: DELTA_TIME(),
    _state_stack: SINGLETON(GameStateStack),
    _timer: SINGLETON_MUT(UiTimer),
) void {
    const time = _delta_time.get();
    const state_stack = _state_stack.get();
    var timer = _timer.get_mut();

    if (state_stack.current_state() != .Running) {
        return;
    }

    timer.time += time;
}

fn draw_main_menu(
    _settings: SINGLETON(Settings),
    _levels: SINGLETON_MUT(Levels),
    _state_stack: SINGLETON_MUT(GameStateStack),
) void {
    const settings = _settings.get();
    const levels = _levels.get_mut();
    const state_stack = _state_stack.get_mut();

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
        levels.load_metadata() catch {
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
    _settings: SINGLETON(Settings),
    _levels: SINGLETON_MUT(Levels),
    _level_state: SINGLETON_MUT(LevelState),
    _current_level: SINGLETON_MUT(CurrentLevel),
    _state_stack: SINGLETON_MUT(GameStateStack),
    _editor_state: SINGLETON_MUT(EditorState),
) void {
    const settings = _settings.get();
    const levels = _levels.get_mut();
    const level_state = _level_state.get_mut();
    const current_level = _current_level.get_mut();
    const state_stack = _state_stack.get_mut();
    const editor_state = _editor_state.get_mut();

    if (state_stack.current_state() != .LevelSelection) {
        return;
    }

    var rectangle = rl.Rectangle{
        .x = @as(f32, @floatFromInt(settings.resolution_width)) / 2.0 - UI_ELEMENT_WIDTH / 2.0,
        .y = @as(f32, @floatFromInt(settings.resolution_height)) / 2.0 - UI_ELEMENT_HEIGHT * 2.0,
        .width = UI_ELEMENT_WIDTH,
        .height = UI_ELEMENT_HEIGHT * 2.0,
    };

    _ = rl.GuiListViewEx(
        rectangle,
        @ptrCast(levels.unlocked_names.items.ptr),
        @intCast(levels.unlocked_names.items.len),
        &levels.scroll_index,
        &levels.active,
        &levels.focus,
    );

    rectangle.y += UI_ELEMENT_HEIGHT * 3.0;
    rectangle.height = UI_ELEMENT_HEIGHT;
    const load = rl.GuiButton(
        rectangle,
        "Load",
    );
    if (load != 0) {
        if (levels.active != -1) {
            const i: usize = @intCast(levels.active);
            const level_idx = levels.unlocked_idx.items[i];
            const level_metadata = &levels.levels_metadata.items[level_idx];

            current_level.name = level_metadata.name;
            current_level.finished = level_metadata.finished;
            current_level.best_time = level_metadata.best_time;

            const level_path = level_metadata.path;
            level_state.load_path = level_path;
            // Editor needs to have it's own copy
            @memcpy(
                editor_state.level_path[0..level_path.len],
                level_path,
            );
        }
    }

    rectangle.y += UI_ELEMENT_HEIGHT;
    const main_menu = rl.GuiButton(
        rectangle,
        "Main menu",
    );
    if (main_menu != 0) {
        state_stack.pop_state();
    }
}

fn draw_timer(
    _timer: SINGLETON(UiTimer),
    _state_stack: SINGLETON_MUT(GameStateStack),
) void {
    const timer = _timer.get();
    const state_stack = _state_stack.get_mut();

    if (state_stack.current_state() != .Running) {
        return;
    }

    const font = rl.GetFontDefault();

    var buf: [16:0]u8 = undefined;
    const s = std.fmt.bufPrintZ(&buf, "Current: {d:.2}", .{timer.time}) catch unreachable;

    rl.DrawTextEx(
        font,
        s.ptr,
        UI_TIMER_POSITION.to_rl(),
        UI_LEVEL_FONT_SIZE,
        UI_LEVEL_FONT_SPACING,
        UI_LEVEL_FONT_COLOR,
    );
}

fn draw_current_level_info(
    _current_level: SINGLETON(CurrentLevel),
    _state_stack: SINGLETON_MUT(GameStateStack),
) void {
    const current_level = _current_level.get();
    const state_stack = _state_stack.get_mut();

    if (state_stack.current_state() != .Running) {
        return;
    }

    const font = rl.GetFontDefault();

    {
        var buf: [64:0]u8 = undefined;
        const s = std.fmt.bufPrintZ(&buf, "Level: {s}", .{current_level.name.?}) catch unreachable;
        rl.DrawTextEx(
            font,
            s.ptr,
            UI_LEVEL_NAME_POSITION.to_rl(),
            UI_LEVEL_FONT_SIZE,
            UI_LEVEL_FONT_SPACING,
            UI_LEVEL_FONT_COLOR,
        );
    }

    {
        var buf: [16:0]u8 = undefined;
        const s = std.fmt.bufPrintZ(&buf, "Best: {d:.2}", .{current_level.best_time}) catch unreachable;
        rl.DrawTextEx(
            font,
            s.ptr,
            UI_BEST_TIME_POSITION.to_rl(),
            UI_LEVEL_FONT_SIZE,
            UI_LEVEL_FONT_SPACING,
            UI_LEVEL_FONT_COLOR,
        );
    }
}

fn draw_settings(
    _camera: SINGLETON_MUT(GameCamera),
    _settings: SINGLETON_MUT(Settings),
    _state_stack: SINGLETON_MUT(GameStateStack),
) void {
    const camera = _camera.get_mut();
    const settings = _settings.get_mut();
    const state_stack = _state_stack.get_mut();

    if (state_stack.current_state() != .Settings) {
        return;
    }

    var rectangle = rl.Rectangle{
        .x = @as(f32, @floatFromInt(settings.resolution_width)) / 2.0 - UI_ELEMENT_WIDTH,
        .y = @as(f32, @floatFromInt(settings.resolution_height)) / 2.0 - UI_ELEMENT_HEIGHT * 2.0,
        .width = UI_ELEMENT_WIDTH,
        .height = UI_ELEMENT_HEIGHT,
    };
    _ = rl.GuiToggle(rectangle, "Fullscreen", &settings.is_fullscreen);

    rectangle.x += UI_ELEMENT_WIDTH;
    _ = rl.GuiToggle(rectangle, "Borderless", &settings.is_borderless);

    rectangle.x -= UI_ELEMENT_WIDTH;
    rectangle.y += UI_ELEMENT_HEIGHT;
    _ = rl.GuiLabel(
        rectangle,
        "Resolution",
    );

    rectangle.x += UI_ELEMENT_WIDTH;
    const r = rl.GuiDropdownBox(
        rectangle,
        Settings.RESOLUTIONS_STR,
        &settings.selected_resolution,
        settings.select_resolution_active,
    );
    if (r == 1) {
        settings.select_resolution_active = !settings.select_resolution_active;
    }

    rectangle.x -= UI_ELEMENT_WIDTH / 2.0;
    rectangle.y += UI_ELEMENT_HEIGHT * 2.5;
    const apply_button = rl.GuiButton(
        rectangle,
        "Apply",
    );
    if (apply_button != 0) {
        if (settings.fullscreen != settings.is_fullscreen) {
            settings.toggle_fullscreen();
        } else if (settings.borderless != settings.is_borderless) {
            settings.toggle_borderless_window();
        } else if (!settings.fullscreen and !settings.borderless) {
            settings.use_selected_resolution();
        }
        settings.set_window_size(camera);
        settings.save() catch {
            state_stack.push_state(.Exit);
        };
    }

    rectangle.y += UI_ELEMENT_HEIGHT;
    const back_button = rl.GuiButton(
        rectangle,
        "Back",
    );
    if (back_button != 0) {
        state_stack.pop_state();
    }
}

pub fn draw_paused(
    _settings: SINGLETON_MUT(Settings),
    _state_stack: SINGLETON_MUT(GameStateStack),
    _level_state: SINGLETON_MUT(LevelState),
) void {
    const settings = _settings.get_mut();
    const state_stack = _state_stack.get_mut();
    const level_state = _level_state.get_mut();

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
        level_state.need_to_clean = true;
    }
}

fn draw_win(
    _settings: SINGLETON_MUT(Settings),
    _state_stack: SINGLETON_MUT(GameStateStack),
    _level_state: SINGLETON_MUT(LevelState),
) void {
    const settings = _settings.get_mut();
    const state_stack = _state_stack.get_mut();
    const level_state = _level_state.get_mut();

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
        level_state.need_to_clean = true;
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
    flecs.ADD_SYSTEM(world, "draw_current_level_info", flecs.PreStore, draw_current_level_info);
    flecs.ADD_SYSTEM(world, "draw_settings", flecs.PreStore, draw_settings);
    flecs.ADD_SYSTEM(world, "draw_paused", flecs.PreStore, draw_paused);
    flecs.ADD_SYSTEM(world, "draw_win", flecs.PreStore, draw_win);
}

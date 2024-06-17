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
    __settings: SPS(Settings),
    _levels: SPS_MUT(Levels),
    _current_level: SPS_MUT(CurrentLevel),
    _state_stack: SPS_MUT(GameStateStack),
    _editor_state: SPS_MUT(EditorState),
) void {
    const settings = __settings.data;
    const levels = _levels.data;
    const current_level = _current_level.data;
    const state_stack = _state_stack.data;
    const editor_state = _editor_state.data;

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
        @ptrCast(levels.level_names_list.items.ptr),
        @intCast(levels.level_names_list.items.len),
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
            const level_path = levels.levels.items[i].path;
            current_level.load_path = level_path;
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

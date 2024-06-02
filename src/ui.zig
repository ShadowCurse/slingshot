const std = @import("std");
const Allocator = std.mem.Allocator;

const rl = @import("deps/raylib.zig");
const flecs = @import("deps/flecs.zig");

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

pub const UI_ELEMENT_WIDTH = 300.0;
pub const UI_ELEMENT_HEIGHT = 100.0;

fn draw_main_menu(iter: *flecs.iter_t) void {
    const state_stack = flecs.singleton_get_mut(iter.world, GameStateStack).?;
    if (state_stack.current_state() != .MainMenu) {
        return;
    }

    const settings = flecs.singleton_get(iter.world, Settings).?;
    const levels = flecs.singleton_get_mut(iter.world, Levels).?;

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
    const state_stack = flecs.singleton_get_mut(iter.world, GameStateStack).?;
    if (state_stack.current_state() != .LevelSelection) {
        return;
    }

    const settings = flecs.singleton_get(iter.world, Settings).?;
    const levels = flecs.singleton_get_mut(iter.world, Levels).?;
    const current_level = flecs.singleton_get_mut(iter.world, CurrentLevel).?;
    const editor_state = flecs.singleton_get_mut(iter.world, EditorState).?;

    levels.draw(settings, state_stack, current_level);

    if (current_level.load_path) |path| {
        @memcpy(editor_state.level_path[0..path.len], path);
    }
}

fn draw_settings(iter: *flecs.iter_t) void {
    const state_stack = flecs.singleton_get_mut(iter.world, GameStateStack).?;
    if (state_stack.current_state() != .Settings) {
        return;
    }

    const camera = flecs.singleton_get_mut(iter.world, GameCamera).?;
    const settings = flecs.singleton_get_mut(iter.world, Settings).?;

    settings.draw(camera, state_stack) catch {
        state_stack.push_state(.Exit);
    };
}

pub fn draw_paused(iter: *flecs.iter_t) void {
    const state_stack = flecs.singleton_get_mut(iter.world, GameStateStack).?;
    if (state_stack.current_state() != .Paused) {
        return;
    }

    const settings = flecs.singleton_get(iter.world, Settings).?;
    const current_level = flecs.singleton_get_mut(iter.world, CurrentLevel).?;

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
    const state_stack = flecs.singleton_get_mut(iter.world, GameStateStack).?;
    if (state_stack.current_state() != .Win) {
        return;
    }

    const settings = flecs.singleton_get(iter.world, Settings).?;
    const current_level = flecs.singleton_get_mut(iter.world, CurrentLevel).?;

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
    _ = world;
    _ = allocator;
}

pub fn FLECS_INIT_SYSTEMS(world: *flecs.world_t, allocator: Allocator) !void {
    _ = allocator;
    flecs.ADD_SYSTEM(world, "draw_main_menu", flecs.PreStore, draw_main_menu);
    flecs.ADD_SYSTEM(world, "draw_level_selection", flecs.PreStore, draw_level_selection);
    flecs.ADD_SYSTEM(world, "draw_settings", flecs.PreStore, draw_settings);
    flecs.ADD_SYSTEM(world, "draw_paused", flecs.PreStore, draw_paused);
    flecs.ADD_SYSTEM(world, "draw_win", flecs.PreStore, draw_win);
}

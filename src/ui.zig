const std = @import("std");
const Allocator = std.mem.Allocator;

const rl = @import("deps/raylib.zig");
const flecs = @import("deps/flecs.zig");

const DELTA_TIME = flecs.SYSTEM_PARAMETER_DELTA_TIME;
const SINGLETON = flecs.SYSTEM_PARAMETER_SINGLETON;
const SINGLETON_MUT = flecs.SYSTEM_PARAMETER_SINGLETON_MUT;

const __game = @import("game.zig");
const LevelTimer = __game.LevelTimer;
const MousePosition = __game.MousePosition;
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
pub const UI_TOGGLE_SIZE = 50.0;
pub const UI_ARROW_SIZE = 20.0;

pub const UI_LEVEL_NAME_POSITION = Vector2{ .x = 10.0, .y = 10.0 };
pub const UI_TIMER_POSITION = Vector2{ .x = 10.0, .y = 70.0 };
pub const UI_BEST_TIME_POSITION = Vector2{ .x = 10.0, .y = 150.0 };

const UiTextSize = enum {
    Default,
    Big,
};

const UiArrowDirection = enum {
    Left,
    Right,
};

const UiStyle = struct {
    font: rl.Font,
    font_default_size: f32 = 20.0,
    font_default_spacing: f32 = 1.0,
    font_big_size: f32 = 50.0,
    font_big_spacing: f32 = 2.0,

    color_default: rl.Color = rl.WHITE,
    color_hovered: rl.Color = rl.RED,
    color_active: rl.Color = rl.GREEN,

    toggle_border_size: f32 = 5.0,
    toggle_rondness: f32 = 0.1,
    toggle_segments: i32 = 10.0,

    arrow_size: f32 = 15.0,

    color_white: rl.Color = rl.WHITE,

    const Self = @This();

    fn text_params(self: *const Self, text_size: UiTextSize) struct { size: f32, spacing: f32 } {
        return switch (text_size) {
            .Default => .{ .size = self.font_default_size, .spacing = self.font_default_spacing },
            .Big => .{ .size = self.font_big_size, .spacing = self.font_big_spacing },
        };
    }

    fn text_width(self: *const Self, text: []const u8, text_size: UiTextSize) f32 {
        const parms = self.text_params(text_size);
        const scale_factor = parms.size / @as(f32, @floatFromInt(self.font.baseSize));
        var width: f32 = 0;
        var i: i32 = 0;
        var codepoint_size: i32 = 0;
        while (i < text.len) : (i += codepoint_size) {
            const index: usize = @intCast(i);
            const codepoint = rl.GetCodepointNext(&text[index], &codepoint_size);
            const codepoint_index: usize = @intCast(rl.GetGlyphIndex(self.font, codepoint));
            const glyph_widht = if (self.font.glyphs[codepoint_index].advanceX == 0) blk: {
                break :blk self.font.recs[codepoint_index].width * scale_factor;
            } else blk: {
                break :blk @as(f32, @floatFromInt(self.font.glyphs[codepoint_index].advanceX)) * scale_factor;
            };
            width += (glyph_widht + parms.spacing);
        }
        return width;
    }
};

const UiBox = struct {
    position: Vector2,
    size: Vector2,

    const Self = @This();

    fn is_hovered(self: *const Self, mouse_pos: Vector2) bool {
        const left = self.position.x - self.size.x / 2.0;
        const right = self.position.x + self.size.x / 2.0;
        const top = -self.position.y + self.size.y / 2.0;
        const bottom = -self.position.y - self.size.y / 2.0;
        return left < mouse_pos.x and mouse_pos.x < right and bottom < mouse_pos.y and mouse_pos.y < top;
    }

    fn is_clicked(self: *const Self, mouse_pos: Vector2) bool {
        return self.is_hovered(mouse_pos) and rl.IsMouseButtonPressed(rl.MOUSE_BUTTON_LEFT);
    }
};

const UiButton = struct {
    box: UiBox,
    text: []const u8,

    const Self = @This();

    fn is_hovered(self: *const Self, mouse_pos: Vector2) bool {
        return self.box.is_hovered(mouse_pos);
    }

    fn is_clicked(self: *const Self, mouse_pos: Vector2) bool {
        return self.box.is_clicked(mouse_pos);
    }

    fn draw(self: *const Self, mouse_pos: Vector2, style: *const UiStyle, text_size: UiTextSize) void {
        const color = if (self.is_hovered(mouse_pos)) blk: {
            break :blk style.color_hovered;
        } else blk: {
            break :blk style.color_default;
        };

        const rect_pos = (Vector2{
            .x = self.box.position.x - self.box.size.x / 2.0,
            .y = self.box.position.y - self.box.size.y / 2.0,
        }).to_rl();
        const rect_size = self.box.size.to_rl();
        rl.DrawRectangleV(
            rect_pos,
            rect_size,
            rl.BLANK,
        );

        const text_width = style.text_width(self.text, .Default);
        const text_parms = style.text_params(text_size);
        const text_pos = (Vector2{
            .x = self.box.position.x - text_width / 2.0,
            .y = self.box.position.y - text_parms.size / 2.0,
        }).to_rl();
        rl.DrawTextEx(
            style.font,
            self.text.ptr,
            text_pos,
            text_parms.size,
            text_parms.spacing,
            color,
        );
    }

    fn draw_arrow(
        self: *const Self,
        mouse_pos: Vector2,
        style: *const UiStyle,
        arrow_direction: UiArrowDirection,
    ) void {
        const color = if (self.is_hovered(mouse_pos)) blk: {
            break :blk style.color_hovered;
        } else blk: {
            break :blk style.color_default;
        };

        const rect_pos = (Vector2{
            .x = self.box.position.x - self.box.size.x / 2.0,
            .y = self.box.position.y - self.box.size.y / 2.0,
        }).to_rl();
        const rect_size = self.box.size.to_rl();
        rl.DrawRectangleV(
            rect_pos,
            rect_size,
            rl.BLANK,
        );

        const sin_30 = 0.5;
        const cos_30 = std.math.sqrt(3.0) / 2.0;
        const dx = style.arrow_size * sin_30;
        const dy = style.arrow_size * cos_30;
        switch (arrow_direction) {
            .Left => {
                const v1 = (Vector2{
                    .x = self.box.position.x - style.arrow_size,
                    .y = self.box.position.y,
                }).to_rl();
                const v2 = (Vector2{
                    .x = self.box.position.x + dx,
                    .y = self.box.position.y + dy,
                }).to_rl();
                const v3 = (Vector2{
                    .x = self.box.position.x + dx,
                    .y = self.box.position.y - dy,
                }).to_rl();
                rl.DrawTriangle(v1, v2, v3, color);
            },
            .Right => {
                const v1 = (Vector2{
                    .x = self.box.position.x + style.arrow_size,
                    .y = self.box.position.y,
                }).to_rl();
                const v2 = (Vector2{
                    .x = self.box.position.x - dx,
                    .y = self.box.position.y - dy,
                }).to_rl();
                const v3 = (Vector2{
                    .x = self.box.position.x - dx,
                    .y = self.box.position.y + dy,
                }).to_rl();
                rl.DrawTriangle(v1, v2, v3, color);
            },
        }
    }

    fn draw_text(self: *const Self, style: *const UiStyle, text_size: UiTextSize) void {
        const color = style.color_default;

        const rect_pos = (Vector2{
            .x = self.box.position.x - self.box.size.x / 2.0,
            .y = self.box.position.y - self.box.size.y / 2.0,
        }).to_rl();
        const rect_size = self.box.size.to_rl();
        rl.DrawRectangleV(
            rect_pos,
            rect_size,
            rl.BLANK,
        );

        const text_width = style.text_width(self.text, .Default);
        const text_parms = style.text_params(text_size);
        const text_pos = (Vector2{
            .x = self.box.position.x - text_width / 2.0,
            .y = self.box.position.y - text_parms.size / 2.0,
        }).to_rl();
        rl.DrawTextEx(
            style.font,
            self.text.ptr,
            text_pos,
            text_parms.size,
            text_parms.spacing,
            color,
        );
    }
};

const UiToggle = struct {
    box: UiBox,
    toggled: bool,

    const Self = @This();

    fn is_hovered(self: *const Self, mouse_pos: Vector2) bool {
        return self.box.is_hovered(mouse_pos);
    }

    fn is_clicked(self: *const Self, mouse_pos: Vector2) bool {
        return self.box.is_clicked(mouse_pos);
    }

    fn draw(self: *const Self, mouse_pos: Vector2, style: *const UiStyle) void {
        const color = if (self.is_hovered(mouse_pos)) blk: {
            break :blk style.color_hovered;
        } else if (self.toggled) blk: {
            break :blk style.color_active;
        } else blk: {
            break :blk style.color_default;
        };

        // Outer rect
        rl.DrawRectangleRounded(
            rl.Rectangle{
                .x = self.box.position.x - self.box.size.x / 2.0,
                .y = self.box.position.y - self.box.size.y / 2.0,
                .width = self.box.size.x,
                .height = self.box.size.y,
            },
            style.toggle_rondness,
            style.toggle_segments,
            color,
        );

        // Inner rect background
        rl.DrawRectangleRounded(
            rl.Rectangle{
                .x = self.box.position.x - self.box.size.x / 2.0 + style.toggle_border_size,
                .y = self.box.position.y - self.box.size.y / 2.0 + style.toggle_border_size,
                .width = self.box.size.x - style.toggle_border_size * 2.0,
                .height = self.box.size.y - style.toggle_border_size * 2.0,
            },
            style.toggle_rondness,
            style.toggle_segments,
            rl.BLACK,
        );

        // Inner rect foreground
        if (self.toggled) {
            rl.DrawRectangleRounded(
                rl.Rectangle{
                    .x = self.box.position.x - self.box.size.x / 2.0 + style.toggle_border_size * 2.0,
                    .y = self.box.position.y - self.box.size.y / 2.0 + style.toggle_border_size * 2.0,
                    .width = self.box.size.x - style.toggle_border_size * 4.0,
                    .height = self.box.size.y - style.toggle_border_size * 4.0,
                },
                style.toggle_rondness,
                style.toggle_segments,
                color,
            );
        }
    }
};

fn draw_main_menu(
    _settings: SINGLETON(Settings),
    _ui_style: SINGLETON(UiStyle),
    _mouse_pos: SINGLETON(MousePosition),
    _levels: SINGLETON_MUT(Levels),
    _state_stack: SINGLETON_MUT(GameStateStack),
) void {
    const settings = _settings.get();
    const ui_style = _ui_style.get();
    const mouse_pos = _mouse_pos.get();
    const levels = _levels.get_mut();
    const state_stack = _state_stack.get_mut();

    if (state_stack.current_state() != .MainMenu) {
        return;
    }

    var position = Vector2{
        .x = @as(f32, @floatFromInt(settings.resolution_width)) / 2.0,
        .y = @as(f32, @floatFromInt(settings.resolution_height)) / 2.0,
    };

    const size = Vector2{
        .x = UI_ELEMENT_WIDTH,
        .y = UI_ELEMENT_HEIGHT,
    };

    const select_level_button = UiButton{
        .box = .{
            .position = position,
            .size = size,
        },
        .text = "Select level",
    };
    select_level_button.draw(mouse_pos.screen_position, ui_style, .Default);
    if (select_level_button.is_clicked(mouse_pos.screen_position)) {
        levels.reload() catch {
            state_stack.push_state(.Exit);
            return;
        };
        state_stack.push_state(.LevelSelection);
    }

    position.y += UI_ELEMENT_HEIGHT;
    const settings_button = UiButton{
        .box = .{
            .position = position,
            .size = size,
        },
        .text = "Settings",
    };
    settings_button.draw(mouse_pos.screen_position, ui_style, .Default);
    if (settings_button.is_clicked(mouse_pos.screen_position)) {
        state_stack.push_state(.Settings);
    }

    position.y += UI_ELEMENT_HEIGHT;
    const exit_button = UiButton{
        .box = .{
            .position = position,
            .size = size,
        },
        .text = "Exit",
    };
    exit_button.draw(mouse_pos.screen_position, ui_style, .Default);
    if (exit_button.is_clicked(mouse_pos.screen_position)) {
        state_stack.push_state(.Exit);
    }
}

fn draw_level_selection(
    _settings: SINGLETON(Settings),
    _ui_style: SINGLETON(UiStyle),
    _mouse_pos: SINGLETON(MousePosition),
    _levels: SINGLETON_MUT(Levels),
    _level_state: SINGLETON_MUT(LevelState),
    _state_stack: SINGLETON_MUT(GameStateStack),
    _editor_state: SINGLETON_MUT(EditorState),
) void {
    const settings = _settings.get();
    const ui_style = _ui_style.get();
    const mouse_pos = _mouse_pos.get();
    const levels = _levels.get_mut();
    const level_state = _level_state.get_mut();
    const state_stack = _state_stack.get_mut();
    const editor_state = _editor_state.get_mut();

    if (state_stack.current_state() != .LevelSelection) {
        return;
    }

    const rectangle = rl.Rectangle{
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

    var position = Vector2{
        .x = @as(f32, @floatFromInt(settings.resolution_width)) / 2.0,
        .y = @as(f32, @floatFromInt(settings.resolution_height)) / 2.0 + UI_ELEMENT_HEIGHT,
    };

    const size = Vector2{
        .x = UI_ELEMENT_WIDTH,
        .y = UI_ELEMENT_HEIGHT,
    };

    const load_button = UiButton{
        .box = .{
            .position = position,
            .size = size,
        },
        .text = "Load",
    };
    load_button.draw(mouse_pos.screen_position, ui_style, .Default);
    if (load_button.is_clicked(mouse_pos.screen_position)) {
        if (levels.active_level()) |level_metadata| {
            const level_path = level_metadata.path;
            level_state.load_path = level_path;
            // Editor needs to have it's own copy
            @memcpy(
                editor_state.level_path[0..level_path.len],
                level_path,
            );
        }
    }

    position.y += UI_ELEMENT_HEIGHT;
    const back_button = UiButton{
        .box = .{
            .position = position,
            .size = size,
        },
        .text = "Back",
    };
    back_button.draw(mouse_pos.screen_position, ui_style, .Default);
    if (back_button.is_clicked(mouse_pos.screen_position)) {
        state_stack.pop_state();
    }
}

fn draw_timer(
    _timer: SINGLETON(LevelTimer),
    _ui_style: SINGLETON(UiStyle),
    _state_stack: SINGLETON_MUT(GameStateStack),
) void {
    const timer = _timer.get();
    const ui_style = _ui_style.get();
    const state_stack = _state_stack.get_mut();

    if (state_stack.current_state() != .Running) {
        return;
    }

    var buf: [16:0]u8 = undefined;
    const s = std.fmt.bufPrintZ(&buf, "Current: {d:.2}", .{timer.time}) catch unreachable;

    rl.DrawTextEx(
        ui_style.font,
        s.ptr,
        UI_TIMER_POSITION.to_rl(),
        ui_style.font_big_size,
        ui_style.font_big_spacing,
        ui_style.color_white,
    );
}

fn draw_current_level_info(
    _levels: SINGLETON(Levels),
    _ui_style: SINGLETON(UiStyle),
    _state_stack: SINGLETON_MUT(GameStateStack),
) void {
    const levels = _levels.get();
    const ui_style = _ui_style.get();
    const state_stack = _state_stack.get_mut();

    if (state_stack.current_state() != .Running) {
        return;
    }

    const current_level = levels.active_level().?;
    {
        var buf: [64:0]u8 = undefined;
        const s = std.fmt.bufPrintZ(&buf, "Level: {s}", .{current_level.name}) catch unreachable;
        rl.DrawTextEx(
            ui_style.font,
            s.ptr,
            UI_LEVEL_NAME_POSITION.to_rl(),
            ui_style.font_big_size,
            ui_style.font_big_spacing,
            ui_style.color_white,
        );
    }

    {
        var buf: [16:0]u8 = undefined;
        const s = if (current_level.best_time) |bt| blk: {
            break :blk std.fmt.bufPrintZ(&buf, "Best: {d:.2}", .{bt}) catch unreachable;
        } else blk: {
            break :blk "Best: ---";
        };
        rl.DrawTextEx(
            ui_style.font,
            s.ptr,
            UI_BEST_TIME_POSITION.to_rl(),
            ui_style.font_big_size,
            ui_style.font_big_spacing,
            ui_style.color_white,
        );
    }
}

fn draw_settings(
    _ui_style: SINGLETON(UiStyle),
    _mouse_pos: SINGLETON(MousePosition),
    _camera: SINGLETON_MUT(GameCamera),
    _settings: SINGLETON_MUT(Settings),
    _state_stack: SINGLETON_MUT(GameStateStack),
) void {
    const ui_style = _ui_style.get();
    const mouse_pos = _mouse_pos.get();
    const camera = _camera.get_mut();
    const settings = _settings.get_mut();
    const state_stack = _state_stack.get_mut();

    if (state_stack.current_state() != .Settings) {
        return;
    }

    const resolution_text = UiButton{
        .box = .{
            .position = Vector2{
                .x = @as(f32, @floatFromInt(settings.resolution_width)) / 2.0 - UI_ELEMENT_WIDTH / 2.0,
                .y = @as(f32, @floatFromInt(settings.resolution_height)) / 2.0,
            },
            .size = Vector2{
                .x = UI_ELEMENT_WIDTH,
                .y = UI_ELEMENT_HEIGHT,
            },
        },
        .text = "Resolution",
    };
    resolution_text.draw_text(ui_style, .Default);

    const resolution_prev = UiButton{
        .box = .{
            .position = Vector2{
                .x = @as(f32, @floatFromInt(settings.resolution_width)) / 2.0 + UI_ARROW_SIZE / 2.0,
                .y = @as(f32, @floatFromInt(settings.resolution_height)) / 2.0,
            },
            .size = Vector2{
                .x = UI_ARROW_SIZE,
                .y = UI_ARROW_SIZE,
            },
        },
        .text = "",
    };
    resolution_prev.draw_arrow(mouse_pos.screen_position, ui_style, .Left);
    if (resolution_prev.is_clicked(mouse_pos.screen_position)) {
        settings.prev_resolution();
    }

    const resolution_value_text = UiButton{
        .box = .{
            .position = Vector2{
                .x = @as(f32, @floatFromInt(settings.resolution_width)) / 2.0 + UI_ARROW_SIZE + UI_ELEMENT_WIDTH / 2.0,
                .y = @as(f32, @floatFromInt(settings.resolution_height)) / 2.0,
            },
            .size = Vector2{
                .x = UI_ELEMENT_WIDTH,
                .y = UI_ELEMENT_HEIGHT,
            },
        },
        .text = Settings.RESOLUTIONS_STRINGS[settings.selected_resolution],
    };
    resolution_value_text.draw_text(ui_style, .Default);

    const resolution_next = UiButton{
        .box = .{
            .position = Vector2{
                .x = @as(f32, @floatFromInt(settings.resolution_width)) / 2.0 + UI_ARROW_SIZE + UI_ELEMENT_WIDTH,
                .y = @as(f32, @floatFromInt(settings.resolution_height)) / 2.0,
            },
            .size = Vector2{
                .x = UI_ARROW_SIZE,
                .y = UI_ARROW_SIZE,
            },
        },
        .text = "",
    };
    resolution_next.draw_arrow(mouse_pos.screen_position, ui_style, .Right);
    if (resolution_next.is_clicked(mouse_pos.screen_position)) {
        settings.next_resolution();
    }

    const fullscreen_text = UiButton{
        .box = .{
            .position = Vector2{
                .x = @as(f32, @floatFromInt(settings.resolution_width)) / 2.0 - UI_ELEMENT_WIDTH / 2.0,
                .y = @as(f32, @floatFromInt(settings.resolution_height)) / 2.0 + UI_ELEMENT_HEIGHT / 2.0 + 10.0,
            },
            .size = Vector2{
                .x = UI_ELEMENT_WIDTH,
                .y = UI_ELEMENT_HEIGHT,
            },
        },
        .text = "Fullscreen",
    };
    fullscreen_text.draw_text(ui_style, .Default);

    const fullscreen_toggle = UiToggle{
        .box = .{
            .position = Vector2{
                .x = @as(f32, @floatFromInt(settings.resolution_width)) / 2.0 + UI_ELEMENT_WIDTH / 2.0,
                .y = @as(f32, @floatFromInt(settings.resolution_height)) / 2.0 + UI_ELEMENT_HEIGHT / 2.0 + 10.0,
            },
            .size = Vector2{
                .x = UI_TOGGLE_SIZE,
                .y = UI_TOGGLE_SIZE,
            },
        },
        .toggled = settings.is_fullscreen,
    };
    fullscreen_toggle.draw(mouse_pos.screen_position, ui_style);
    if (fullscreen_toggle.is_clicked(mouse_pos.screen_position)) {
        settings.is_fullscreen = !settings.is_fullscreen;
    }

    const borderless_text = UiButton{
        .box = .{
            .position = Vector2{
                .x = @as(f32, @floatFromInt(settings.resolution_width)) / 2.0 - UI_ELEMENT_WIDTH / 2.0,
                .y = @as(f32, @floatFromInt(settings.resolution_height)) / 2.0 + (UI_ELEMENT_HEIGHT / 2.0 + 10.0) * 2.0,
            },
            .size = Vector2{
                .x = UI_ELEMENT_WIDTH,
                .y = UI_ELEMENT_HEIGHT,
            },
        },
        .text = "Borderless",
    };
    borderless_text.draw_text(ui_style, .Default);

    const borderless_toggle = UiToggle{
        .box = .{
            .position = Vector2{
                .x = @as(f32, @floatFromInt(settings.resolution_width)) / 2.0 + UI_ELEMENT_WIDTH / 2.0,
                .y = @as(f32, @floatFromInt(settings.resolution_height)) / 2.0 + (UI_ELEMENT_HEIGHT / 2.0 + 10.0) * 2.0,
            },
            .size = Vector2{
                .x = UI_TOGGLE_SIZE,
                .y = UI_TOGGLE_SIZE,
            },
        },
        .toggled = settings.is_borderless,
    };
    borderless_toggle.draw(mouse_pos.screen_position, ui_style);
    if (borderless_toggle.is_clicked(mouse_pos.screen_position)) {
        settings.is_borderless = !settings.is_borderless;
    }

    const apply_button = UiButton{
        .box = .{
            .position = Vector2{
                .x = @as(f32, @floatFromInt(settings.resolution_width)) / 2.0,
                .y = @as(f32, @floatFromInt(settings.resolution_height)) / 2.0 + (UI_ELEMENT_HEIGHT / 2.0 + 10.0) * 3.0,
            },
            .size = Vector2{
                .x = UI_ELEMENT_WIDTH,
                .y = UI_ELEMENT_HEIGHT,
            },
        },
        .text = "Apply",
    };
    apply_button.draw(mouse_pos.screen_position, ui_style, .Default);
    if (apply_button.is_clicked(mouse_pos.screen_position)) {
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

    const back_button = UiButton{
        .box = .{
            .position = Vector2{
                .x = @as(f32, @floatFromInt(settings.resolution_width)) / 2.0,
                .y = @as(f32, @floatFromInt(settings.resolution_height)) / 2.0 + (UI_ELEMENT_HEIGHT / 2.0 + 10.0) * 4.0,
            },
            .size = Vector2{
                .x = UI_ELEMENT_WIDTH,
                .y = UI_ELEMENT_HEIGHT,
            },
        },
        .text = "Back",
    };
    back_button.draw(mouse_pos.screen_position, ui_style, .Default);
    if (back_button.is_clicked(mouse_pos.screen_position)) {
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
    _timer: SINGLETON(LevelTimer),
    _ui_style: SINGLETON(UiStyle),
    _levels: SINGLETON(Levels),
    _settings: SINGLETON_MUT(Settings),
    _state_stack: SINGLETON_MUT(GameStateStack),
    _level_state: SINGLETON_MUT(LevelState),
) void {
    const timer = _timer.get();
    const ui_style = _ui_style.get();
    const levels = _levels.get();
    const settings = _settings.get_mut();
    const state_stack = _state_stack.get_mut();
    const level_state = _level_state.get_mut();

    if (state_stack.current_state() != .Win) {
        return;
    }

    const current_level = levels.active_level().?;

    var rect = rl.Rectangle{
        .x = @as(f32, @floatFromInt(settings.resolution_width)) / 2.0 - UI_ELEMENT_WIDTH / 2.0,
        .y = @as(f32, @floatFromInt(settings.resolution_height)) / 2.0 - UI_ELEMENT_HEIGHT / 2.0,
        .width = UI_ELEMENT_WIDTH,
        .height = UI_ELEMENT_HEIGHT,
    };

    {
        const positin = Vector2{ .x = rect.x - UI_ELEMENT_WIDTH / 2.0, .y = rect.y };
        const best_time = current_level.best_time.?;
        var buf: [16:0]u8 = undefined;
        const s = std.fmt.bufPrintZ(&buf, "Best: {d:.2}", .{best_time}) catch unreachable;
        rl.DrawTextEx(
            ui_style.font,
            s.ptr,
            positin.to_rl(),
            ui_style.font_big_size,
            ui_style.font_big_spacing,
            ui_style.color_white,
        );
    }
    {
        const positin = Vector2{ .x = rect.x + UI_ELEMENT_WIDTH / 2.0, .y = rect.y };
        const current_time = timer.time;
        var buf: [16:0]u8 = undefined;
        const s = std.fmt.bufPrintZ(&buf, "Current: {d:.2}", .{current_time}) catch unreachable;
        rl.DrawTextEx(
            ui_style.font,
            s.ptr,
            positin.to_rl(),
            ui_style.font_big_size,
            ui_style.font_big_spacing,
            ui_style.color_white,
        );
    }

    rect.y += UI_ELEMENT_WIDTH / 2.0;
    const restart_button = rl.GuiButton(
        rect,
        "Restart",
    );
    if (restart_button != 0) {
        state_stack.pop_state();
        level_state.need_to_restart = true;
    }

    rect.y += UI_ELEMENT_HEIGHT;
    const win_button = rl.GuiButton(
        rect,
        "Main menu",
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

    flecs.COMPONENT(world, UiStyle);

    const font = rl.LoadFont("resources/font.ttf");
    const style = UiStyle{
        .font = font,
    };

    _ = flecs.singleton_set(world, UiStyle, style);
}

pub fn FLECS_INIT_SYSTEMS(world: *flecs.world_t, allocator: Allocator) !void {
    _ = allocator;
    flecs.ADD_SYSTEM(world, "draw_main_menu", flecs.PreStore, draw_main_menu);
    flecs.ADD_SYSTEM(world, "draw_level_selection", flecs.PreStore, draw_level_selection);
    flecs.ADD_SYSTEM(world, "draw_timer", flecs.PreStore, draw_timer);
    flecs.ADD_SYSTEM(world, "draw_current_level_info", flecs.PreStore, draw_current_level_info);
    flecs.ADD_SYSTEM(world, "draw_settings", flecs.PreStore, draw_settings);
    flecs.ADD_SYSTEM(world, "draw_paused", flecs.PreStore, draw_paused);
    flecs.ADD_SYSTEM(world, "t raw_win", flecs.PreStore, draw_win);
}

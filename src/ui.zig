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
const DEFAULT_SCREEN_WIDTH = __game.DEFAULT_SCREEN_WIDTH;

const __level = @import("level.zig");
const Levels = __level.Levels;
const LevelState = __level.LevelState;
const CurrentLevel = __level.CurrentLevel;

const __settings = @import("settings.zig");
const Settings = __settings.Settings;

const __editor = @import("editor.zig");
const EditorState = __editor.EditorState;

const Vector2 = @import("vector.zig");

pub const UI_ELEMENT_SIZE = Vector2{
    .x = 200.0,
    .y = 50.0,
};
pub const UI_ELEMENT_OFFSET_SIZE = Vector2{
    .x = UI_ELEMENT_SIZE.x + 50.0,
    .y = UI_ELEMENT_SIZE.y + 20.0,
};
pub const UI_TOGGLE_SIZE = Vector2{
    .x = 50.0,
    .y = 50.0,
};
pub const UI_ARROW_SIZE = Vector2{
    .x = 20.0,
    .y = 20.0,
};

// TODO find a better way
var BUTTON_PRESSED_THIS_FRAME: bool = false;

const UiTextSize = enum {
    Default,
    Big,
};

const UiArrowDirection = enum {
    Left,
    Right,
};

const UiStyle = struct {
    scale: f32 = 1.0,

    font: rl.Font,
    font_default_size: f32 = 20.0,
    font_default_spacing: f32 = 1.0,
    font_big_size: f32 = 25.0,
    font_big_spacing: f32 = 1.0,

    color_default: rl.Color = rl.WHITE,
    color_hovered: rl.Color = rl.RED,
    color_active: rl.Color = rl.GREEN,

    debug: bool = false,
    color_background_default: rl.Color = rl.BLANK,
    color_background_debug: rl.Color = rl.BROWN,

    toggle_border_size: f32 = 5.0,
    toggle_rondness: f32 = 0.1,
    toggle_segments: i32 = 10.0,

    arrow_size: f32 = 15.0,

    color_white: rl.Color = rl.WHITE,

    const Self = @This();

    fn update_scale(self: *Self, resolution_width: u32) void {
        self.scale = @as(f32, @floatFromInt(resolution_width)) / DEFAULT_SCREEN_WIDTH;
    }

    fn apply_scale(self: *const Self, v: Vector2) Vector2 {
        return .{
            .x = v.x * self.scale,
            .y = v.y * self.scale,
        };
    }

    fn text_params(self: *const Self, text_size: UiTextSize) struct { size: f32, spacing: f32 } {
        return switch (text_size) {
            .Default => .{ .size = self.font_default_size * self.scale, .spacing = self.font_default_spacing * self.scale },
            .Big => .{ .size = self.font_big_size * self.scale, .spacing = self.font_big_spacing * self.scale },
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
        if (self.is_hovered(mouse_pos) and rl.IsMouseButtonPressed(rl.MOUSE_BUTTON_LEFT) and !BUTTON_PRESSED_THIS_FRAME) {
            BUTTON_PRESSED_THIS_FRAME = true;
            return true;
        } else {
            return false;
        }
    }
};

const UiText = struct {
    box: UiBox,
    text: []const u8,
    alignment: Aligment = .Center,

    const Self = @This();

    const Aligment = enum {
        Left,
        Center,
    };

    fn draw(self: *const Self, style: *const UiStyle, text_size: UiTextSize) void {
        const rect_pos = (Vector2{
            .x = self.box.position.x - self.box.size.x / 2.0,
            .y = self.box.position.y - self.box.size.y / 2.0,
        }).to_rl();
        const rect_size = self.box.size.to_rl();
        rl.DrawRectangleV(
            rect_pos,
            rect_size,
            if (style.debug) style.color_background_debug else style.color_background_default,
        );

        const text_width = style.text_width(self.text, .Default);
        const text_parms = style.text_params(text_size);
        const text_pos = switch (self.alignment) {
            .Left => (Vector2{
                .x = self.box.position.x,
                .y = self.box.position.y,
            }).to_rl(),
            .Center => (Vector2{
                .x = self.box.position.x - text_width / 2.0,
                .y = self.box.position.y - text_parms.size / 2.0,
            }).to_rl(),
        };

        rl.DrawTextEx(
            style.font,
            self.text.ptr,
            text_pos,
            text_parms.size,
            text_parms.spacing,
            style.color_default,
        );
    }
};

const UiButton = struct {
    box: UiBox,
    text: []const u8,
    active: bool = false,

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
        } else if (self.active) blk: {
            break :blk style.color_active;
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
            if (style.debug) style.color_background_debug else style.color_background_default,
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

const UiArrow = struct {
    box: UiBox,

    const Self = @This();

    fn is_hovered(self: *const Self, mouse_pos: Vector2) bool {
        return self.box.is_hovered(mouse_pos);
    }

    fn is_clicked(self: *const Self, mouse_pos: Vector2) bool {
        return self.box.is_clicked(mouse_pos);
    }

    fn draw(
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
            if (style.debug) style.color_background_debug else style.color_background_default,
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

fn reset_button() void {
    BUTTON_PRESSED_THIS_FRAME = false;
}

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

    const title_text = UiText{
        .box = .{
            .position = settings.screen_center().add(
                &ui_style.apply_scale(.{
                    .x = -20.0,
                    .y = -UI_ELEMENT_OFFSET_SIZE.y * 2.0,
                }),
            ),
            .size = ui_style.apply_scale(UI_ELEMENT_SIZE),
        },
        .text = "SLINGSHOT",
    };
    title_text.draw(ui_style, .Big);

    const play_button = UiButton{
        .box = .{
            .position = settings.screen_center(),
            .size = ui_style.apply_scale(UI_ELEMENT_SIZE),
        },
        .text = "Play",
    };
    play_button.draw(mouse_pos.screen_position, ui_style, .Default);
    if (play_button.is_clicked(mouse_pos.screen_position)) {
        levels.reload() catch {
            state_stack.push_state(.Exit);
            return;
        };
        state_stack.push_state(.LevelSelection);
    }

    const settings_button = UiButton{
        .box = .{
            .position = settings.screen_center().add(
                &ui_style.apply_scale(.{
                    .x = 0,
                    .y = UI_ELEMENT_OFFSET_SIZE.y,
                }),
            ),
            .size = ui_style.apply_scale(UI_ELEMENT_SIZE),
        },
        .text = "Settings",
    };
    settings_button.draw(mouse_pos.screen_position, ui_style, .Default);
    if (settings_button.is_clicked(mouse_pos.screen_position)) {
        state_stack.push_state(.Settings);
    }

    const exit_button = UiButton{
        .box = .{
            .position = settings.screen_center().add(
                &ui_style.apply_scale(.{
                    .x = 0,
                    .y = UI_ELEMENT_OFFSET_SIZE.y * 2.0,
                }),
            ),
            .size = ui_style.apply_scale(UI_ELEMENT_SIZE),
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

    if (levels.active_group) |ag| {
        const level_title_text = UiText{
            .box = .{
                .position = settings.screen_center().add(
                    &ui_style.apply_scale(.{
                        .x = -20.0,
                        .y = -UI_ELEMENT_OFFSET_SIZE.y * 3.0,
                    }),
                ),
                .size = ui_style.apply_scale(UI_ELEMENT_SIZE),
            },
            .text = "LEVEL",
        };
        level_title_text.draw(ui_style, .Big);

        const colunm_size = 3;
        const columns = levels.level_groups.items[ag].levels.len / colunm_size + 1;
        std.log.info("columns: {}", .{columns});
        const initial_offset = -UI_ELEMENT_OFFSET_SIZE.x * @as(f32, @floatFromInt(columns / 2));
        for (levels.level_groups.items[ag].levels, 0..) |metadata, i| {
            if (metadata.locked) {
                continue;
            }
            const name = metadata.name;

            const level_button = UiButton{
                .box = .{
                    .position = settings.screen_center().add(
                        &ui_style.apply_scale(.{
                            .x = initial_offset + (UI_ELEMENT_OFFSET_SIZE.x * 2.0) * @as(f32, @floatFromInt(i / colunm_size)),
                            .y = -UI_ELEMENT_OFFSET_SIZE.y * @as(f32, @floatFromInt(i - colunm_size * (i / colunm_size))),
                        }),
                    ),
                    .size = ui_style.apply_scale(UI_ELEMENT_SIZE),
                },
                .text = name,
                .active = levels.active_level == i,
            };
            level_button.draw(mouse_pos.screen_position, ui_style, .Default);
            if (level_button.is_clicked(mouse_pos.screen_position)) {
                levels.active_level = i;
            }
        }

        const load_button = UiButton{
            .box = .{
                .position = settings.screen_center().add(
                    &ui_style.apply_scale(.{
                        .x = 0,
                        .y = UI_ELEMENT_OFFSET_SIZE.y,
                    }),
                ),
                .size = ui_style.apply_scale(UI_ELEMENT_SIZE),
            },
            .text = "Load",
        };
        load_button.draw(mouse_pos.screen_position, ui_style, .Default);
        if (load_button.is_clicked(mouse_pos.screen_position)) {
            if (levels.active_level_metadata()) |level_metadata| {
                const level_path = level_metadata.path;
                level_state.load_path = level_path;
                // Editor needs to have it's own copy
                @memcpy(
                    editor_state.level_path[0..level_path.len],
                    level_path,
                );
            }
        }
    } else {
        const group_title_text = UiText{
            .box = .{
                .position = settings.screen_center().add(
                    &ui_style.apply_scale(.{
                        .x = -20.0,
                        .y = -UI_ELEMENT_OFFSET_SIZE.y * 3.0,
                    }),
                ),
                .size = ui_style.apply_scale(UI_ELEMENT_SIZE),
            },
            .text = "GROUP",
        };
        group_title_text.draw(ui_style, .Big);

        for (levels.level_groups.items, 0..) |group, i| {
            if (group.locked) {
                continue;
            }
            const name = group.name;
            const group_button = UiButton{
                .box = .{
                    .position = settings.screen_center().add(
                        &ui_style.apply_scale(.{
                            .x = 0,
                            .y = -UI_ELEMENT_OFFSET_SIZE.y * @as(f32, @floatFromInt(i)),
                        }),
                    ),
                    .size = ui_style.apply_scale(UI_ELEMENT_SIZE),
                },
                .text = name,
                .active = levels.active_group == i,
            };
            group_button.draw(mouse_pos.screen_position, ui_style, .Default);
            if (group_button.is_clicked(mouse_pos.screen_position)) {
                levels.active_group = i;
            }
        }
    }

    const back_button = UiButton{
        .box = .{
            .position = settings.screen_center().add(
                &ui_style.apply_scale(.{
                    .x = 0,
                    .y = UI_ELEMENT_OFFSET_SIZE.y * 2.0,
                }),
            ),
            .size = ui_style.apply_scale(UI_ELEMENT_SIZE),
        },
        .text = "Back",
    };
    back_button.draw(mouse_pos.screen_position, ui_style, .Default);
    if (back_button.is_clicked(mouse_pos.screen_position)) {
        if (levels.active_group) |_| {
            levels.active_group = null;
            levels.active_level = null;
        } else {
            state_stack.pop_state();
        }
    }
}

fn draw_current_level_info(
    _timer: SINGLETON(LevelTimer),
    _levels: SINGLETON(Levels),
    _ui_style: SINGLETON(UiStyle),
    _state_stack: SINGLETON_MUT(GameStateStack),
) void {
    const timer = _timer.get();
    const levels = _levels.get();
    const ui_style = _ui_style.get();
    const state_stack = _state_stack.get_mut();

    if (state_stack.current_state() != .Running) {
        return;
    }

    const current_level = levels.active_level_metadata().?;
    {
        const level_name_text = UiText{
            .box = .{
                .position = ui_style.apply_scale(.{
                    .x = 10.0,
                    .y = 10.0,
                }),
                .size = ui_style.apply_scale(UI_ELEMENT_SIZE),
            },
            .text = current_level.name,
            .alignment = .Left,
        };
        level_name_text.draw(ui_style, .Big);
    }
    {
        var buf: [16:0]u8 = undefined;
        const current_time = std.fmt.bufPrintZ(&buf, "Current: {d:.2}", .{timer.time}) catch unreachable;

        const timer_text = UiText{
            .box = .{
                .position = ui_style.apply_scale(.{
                    .x = 10.0,
                    .y = 10.0 + UI_ELEMENT_OFFSET_SIZE.y,
                }),
                .size = ui_style.apply_scale(UI_ELEMENT_SIZE),
            },
            .text = current_time,
            .alignment = .Left,
        };
        timer_text.draw(ui_style, .Big);
    }
    {
        var buf: [16:0]u8 = undefined;
        const best_time = if (current_level.best_time) |bt| blk: {
            break :blk std.fmt.bufPrintZ(&buf, "Best: {d:.2}", .{bt}) catch unreachable;
        } else blk: {
            break :blk "Best: ---";
        };
        const timer_text = UiText{
            .box = .{
                .position = ui_style.apply_scale(.{
                    .x = 10.0,
                    .y = 10.0 + UI_ELEMENT_OFFSET_SIZE.y * 2.0,
                }),
                .size = ui_style.apply_scale(UI_ELEMENT_SIZE),
            },
            .text = best_time,
            .alignment = .Left,
        };
        timer_text.draw(ui_style, .Big);
    }
}

fn draw_settings(
    _mouse_pos: SINGLETON(MousePosition),
    _ui_style: SINGLETON_MUT(UiStyle),
    _camera: SINGLETON_MUT(GameCamera),
    _settings: SINGLETON_MUT(Settings),
    _state_stack: SINGLETON_MUT(GameStateStack),
) void {
    const mouse_pos = _mouse_pos.get();
    const ui_style = _ui_style.get_mut();
    const camera = _camera.get_mut();
    const settings = _settings.get_mut();
    const state_stack = _state_stack.get_mut();

    if (state_stack.current_state() != .Settings) {
        return;
    }

    const resolution_text = UiText{
        .box = .{
            .position = settings.screen_center().add(
                &ui_style.apply_scale(.{
                    .x = -UI_ELEMENT_OFFSET_SIZE.x / 2.0,
                    .y = -UI_ELEMENT_OFFSET_SIZE.y,
                }),
            ),
            .size = ui_style.apply_scale(UI_ELEMENT_SIZE),
        },
        .text = "Resolution",
    };
    resolution_text.draw(ui_style, .Default);

    const resolution_prev = UiArrow{
        .box = .{
            .position = settings.screen_center().add(
                &ui_style.apply_scale(.{
                    .x = UI_ARROW_SIZE.x / 2.0,
                    .y = -UI_ELEMENT_OFFSET_SIZE.y,
                }),
            ),
            .size = ui_style.apply_scale(UI_ARROW_SIZE),
        },
    };
    resolution_prev.draw(mouse_pos.screen_position, ui_style, .Left);
    if (resolution_prev.is_clicked(mouse_pos.screen_position)) {
        settings.prev_resolution();
    }

    const resolution_value_text = UiText{
        .box = .{
            .position = settings.screen_center().add(
                &ui_style.apply_scale(.{
                    .x = UI_ARROW_SIZE.x + UI_ELEMENT_OFFSET_SIZE.x / 2.0,
                    .y = -UI_ELEMENT_OFFSET_SIZE.y,
                }),
            ),
            .size = ui_style.apply_scale(UI_ELEMENT_SIZE),
        },
        .text = Settings.RESOLUTIONS_STRINGS[settings.selected_resolution],
    };
    resolution_value_text.draw(ui_style, .Default);

    const resolution_next = UiArrow{
        .box = .{
            .position = settings.screen_center().add(
                &ui_style.apply_scale(.{
                    .x = UI_ARROW_SIZE.x + UI_ELEMENT_OFFSET_SIZE.x,
                    .y = -UI_ELEMENT_OFFSET_SIZE.y,
                }),
            ),
            .size = ui_style.apply_scale(UI_ARROW_SIZE),
        },
    };
    resolution_next.draw(mouse_pos.screen_position, ui_style, .Right);
    if (resolution_next.is_clicked(mouse_pos.screen_position)) {
        settings.next_resolution();
    }

    const fullscreen_text = UiText{
        .box = .{
            .position = settings.screen_center().add(
                &ui_style.apply_scale(.{
                    .x = -UI_ELEMENT_OFFSET_SIZE.x / 2.0,
                    .y = 0.0,
                }),
            ),
            .size = ui_style.apply_scale(UI_ELEMENT_SIZE),
        },
        .text = "Fullscreen",
    };
    fullscreen_text.draw(ui_style, .Default);

    const fullscreen_toggle = UiToggle{
        .box = .{
            .position = settings.screen_center().add(
                &ui_style.apply_scale(.{
                    .x = UI_ELEMENT_OFFSET_SIZE.x / 2.0,
                    .y = 0.0,
                }),
            ),
            .size = ui_style.apply_scale(UI_TOGGLE_SIZE),
        },
        .toggled = settings.is_fullscreen,
    };
    fullscreen_toggle.draw(mouse_pos.screen_position, ui_style);
    if (fullscreen_toggle.is_clicked(mouse_pos.screen_position)) {
        settings.is_fullscreen = !settings.is_fullscreen;
    }

    const borderless_text = UiText{
        .box = .{
            .position = settings.screen_center().add(
                &ui_style.apply_scale(.{
                    .x = -UI_ELEMENT_OFFSET_SIZE.x / 2.0,
                    .y = UI_ELEMENT_OFFSET_SIZE.y,
                }),
            ),
            .size = ui_style.apply_scale(UI_ELEMENT_SIZE),
        },
        .text = "Borderless",
    };
    borderless_text.draw(ui_style, .Default);

    const borderless_toggle = UiToggle{
        .box = .{
            .position = settings.screen_center().add(
                &ui_style.apply_scale(.{
                    .x = UI_ELEMENT_OFFSET_SIZE.x / 2.0,
                    .y = UI_ELEMENT_OFFSET_SIZE.y,
                }),
            ),
            .size = ui_style.apply_scale(UI_TOGGLE_SIZE),
        },
        .toggled = settings.is_borderless,
    };
    borderless_toggle.draw(mouse_pos.screen_position, ui_style);
    if (borderless_toggle.is_clicked(mouse_pos.screen_position)) {
        settings.is_borderless = !settings.is_borderless;
    }

    const apply_button = UiButton{
        .box = .{
            .position = settings.screen_center().add(
                &ui_style.apply_scale(.{
                    .x = 0.0,
                    .y = UI_ELEMENT_OFFSET_SIZE.y * 3.0,
                }),
            ),
            .size = ui_style.apply_scale(UI_ELEMENT_SIZE),
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

        settings.set_window_size();
        camera.update_resolution(settings.resolution_width, settings.resolution_height);
        ui_style.update_scale(settings.resolution_width);

        settings.save() catch {
            state_stack.push_state(.Exit);
        };
    }

    const back_button = UiButton{
        .box = .{
            .position = settings.screen_center().add(
                &ui_style.apply_scale(.{
                    .x = 0.0,
                    .y = UI_ELEMENT_OFFSET_SIZE.y * 4.0,
                }),
            ),
            .size = ui_style.apply_scale(UI_ELEMENT_SIZE),
        },
        .text = "Back",
    };
    back_button.draw(mouse_pos.screen_position, ui_style, .Default);
    if (back_button.is_clicked(mouse_pos.screen_position)) {
        state_stack.pop_state();
    }
}

pub fn draw_paused(
    _ui_style: SINGLETON(UiStyle),
    _mouse_pos: SINGLETON(MousePosition),
    _settings: SINGLETON_MUT(Settings),
    _state_stack: SINGLETON_MUT(GameStateStack),
    _level_state: SINGLETON_MUT(LevelState),
) void {
    const ui_style = _ui_style.get();
    const mouse_pos = _mouse_pos.get();
    const settings = _settings.get_mut();
    const state_stack = _state_stack.get_mut();
    const level_state = _level_state.get_mut();

    if (state_stack.current_state() != .Paused) {
        return;
    }

    const resume_button = UiButton{
        .box = .{
            .position = settings.screen_center(),
            .size = ui_style.apply_scale(UI_ELEMENT_SIZE),
        },
        .text = "Resume",
    };
    resume_button.draw(mouse_pos.screen_position, ui_style, .Default);
    if (resume_button.is_clicked(mouse_pos.screen_position)) {
        state_stack.pop_state();
    }

    const settings_button = UiButton{
        .box = .{
            .position = settings.screen_center().add(
                &ui_style.apply_scale(.{
                    .x = 0.0,
                    .y = UI_ELEMENT_OFFSET_SIZE.y,
                }),
            ),
            .size = ui_style.apply_scale(UI_ELEMENT_SIZE),
        },
        .text = "Settings",
    };
    settings_button.draw(mouse_pos.screen_position, ui_style, .Default);
    if (settings_button.is_clicked(mouse_pos.screen_position)) {
        state_stack.push_state(.Settings);
    }

    const main_menu_button = UiButton{
        .box = .{
            .position = settings.screen_center().add(
                &ui_style.apply_scale(.{
                    .x = 0.0,
                    .y = UI_ELEMENT_OFFSET_SIZE.y * 2.0,
                }),
            ),
            .size = ui_style.apply_scale(UI_ELEMENT_SIZE),
        },
        .text = "Main menu",
    };
    main_menu_button.draw(mouse_pos.screen_position, ui_style, .Default);
    if (main_menu_button.is_clicked(mouse_pos.screen_position)) {
        state_stack.pop_state();
        state_stack.pop_state();
        state_stack.pop_state();
        level_state.need_to_clean = true;
    }
}

fn draw_win(
    _timer: SINGLETON(LevelTimer),
    _ui_style: SINGLETON(UiStyle),
    _mouse_pos: SINGLETON(MousePosition),
    _levels: SINGLETON(Levels),
    _settings: SINGLETON_MUT(Settings),
    _state_stack: SINGLETON_MUT(GameStateStack),
    _level_state: SINGLETON_MUT(LevelState),
) void {
    const timer = _timer.get();
    const ui_style = _ui_style.get();
    const mouse_pos = _mouse_pos.get();
    const levels = _levels.get();
    const settings = _settings.get_mut();
    const state_stack = _state_stack.get_mut();
    const level_state = _level_state.get_mut();

    if (state_stack.current_state() != .Win) {
        return;
    }

    const current_level = levels.active_level_metadata().?;

    {
        var buf: [16:0]u8 = undefined;
        const best_time = std.fmt.bufPrintZ(&buf, "Best: {d:.2}", .{current_level.best_time.?}) catch unreachable;
        const best_time_text = UiText{
            .box = .{
                .position = settings.screen_center().add(
                    &ui_style.apply_scale(.{
                        .x = -UI_ELEMENT_OFFSET_SIZE.x,
                        .y = 0.0,
                    }),
                ),
                .size = ui_style.apply_scale(UI_ELEMENT_SIZE),
            },
            .text = best_time,
        };
        best_time_text.draw(ui_style, .Default);
    }
    {
        var buf: [16:0]u8 = undefined;
        const current_time = std.fmt.bufPrintZ(&buf, "Current: {d:.2}", .{timer.time}) catch unreachable;
        const best_time_text = UiText{
            .box = .{
                .position = settings.screen_center().add(
                    &ui_style.apply_scale(.{
                        .x = UI_ELEMENT_OFFSET_SIZE.x,
                        .y = 0.0,
                    }),
                ),
                .size = ui_style.apply_scale(UI_ELEMENT_SIZE),
            },
            .text = current_time,
        };
        best_time_text.draw(ui_style, .Default);
    }

    const restart_button = UiButton{
        .box = .{
            .position = settings.screen_center().add(
                &ui_style.apply_scale(.{
                    .x = 0.0,
                    .y = UI_ELEMENT_OFFSET_SIZE.y,
                }),
            ),
            .size = ui_style.apply_scale(UI_ELEMENT_SIZE),
        },
        .text = "Restart",
    };
    restart_button.draw(mouse_pos.screen_position, ui_style, .Default);
    if (restart_button.is_clicked(mouse_pos.screen_position)) {
        state_stack.pop_state();
        level_state.need_to_restart = true;
    }

    const main_menu_button = UiButton{
        .box = .{
            .position = settings.screen_center().add(
                &ui_style.apply_scale(.{
                    .x = 0.0,
                    .y = UI_ELEMENT_OFFSET_SIZE.y * 2.0,
                }),
            ),
            .size = ui_style.apply_scale(UI_ELEMENT_SIZE),
        },
        .text = "Main Menu",
    };
    main_menu_button.draw(mouse_pos.screen_position, ui_style, .Default);
    if (main_menu_button.is_clicked(mouse_pos.screen_position)) {
        state_stack.pop_state();
        state_stack.pop_state();
        state_stack.pop_state();
        level_state.need_to_clean = true;
    }
}

pub fn FLECS_INIT_COMPONENTS(world: *flecs.world_t, settings: *const Settings) !void {
    flecs.COMPONENT(world, UiStyle);

    const font = rl.LoadFont("resources/font.ttf");
    var style = UiStyle{
        .font = font,
    };
    style.update_scale(settings.resolution_width);

    _ = flecs.singleton_set(world, UiStyle, style);
}

pub fn FLECS_INIT_SYSTEMS(world: *flecs.world_t, allocator: Allocator) !void {
    _ = allocator;
    flecs.ADD_SYSTEM(world, "reset_button", flecs.PreStore, reset_button);
    flecs.ADD_SYSTEM(world, "draw_main_menu", flecs.PreStore, draw_main_menu);
    flecs.ADD_SYSTEM(world, "draw_level_selection", flecs.PreStore, draw_level_selection);
    flecs.ADD_SYSTEM(world, "draw_current_level_info", flecs.PreStore, draw_current_level_info);
    flecs.ADD_SYSTEM(world, "draw_settings", flecs.PreStore, draw_settings);
    flecs.ADD_SYSTEM(world, "draw_paused", flecs.PreStore, draw_paused);
    flecs.ADD_SYSTEM(world, "draw_win", flecs.PreStore, draw_win);
}

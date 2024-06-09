const std = @import("std");
const Allocator = std.mem.Allocator;

const builtin = @import("builtin");

const rl = @import("deps/raylib.zig");

const _game = @import("game.zig");
const GameStateStack = _game.GameStateStack;

const _ui = @import("ui.zig");
const UI_ELEMENT_WIDTH = _ui.UI_ELEMENT_WIDTH;
const UI_ELEMENT_HEIGHT = _ui.UI_ELEMENT_HEIGHT;

const _objects = @import("objects.zig");
const ObjectParams = _objects.ObjectParams;

const Settings = @import("settings.zig").Settings;

pub const DEFAULT_LEVELS_PATH = "resources/levels";
pub const DEFAULT_SAVE_PATH = "resources/levels/save.json";

pub const EMSCRIPTEN_LEVEL_NAMES = [_][]const u8{
    "level_1.json",
    "tutorial_detach.json",
    "tutorial_drag.json",
    "tutorial_sling.json",
};

pub const LevelSave = struct {
    objects: []ObjectParams,
};

pub const CurrentLevel = struct {
    load_path: ?[]const u8 = null,
    save_path: ?[]const u8 = null,
    need_to_clean: bool = false,
    need_to_restart: bool = false,
};

pub const Levels = struct {
    allocator: Allocator,
    levels: std.ArrayList(Self.LevelInfo),
    level_names_list: std.ArrayList(*const u8),

    scroll_index: i32 = 0,
    active: i32 = 0,
    focus: i32 = 0,

    const LevelInfo = struct {
        name: [:0]const u8,
        path: []const u8,

        fn init(allocator: Allocator, name: []const u8) !LevelInfo {
            return LevelInfo{
                .name = try allocator.dupeZ(u8, name),
                .path = try std.fs.path.join(allocator, &.{ DEFAULT_LEVELS_PATH, name }),
            };
        }

        fn deinit(self: *const LevelInfo, allocator: Allocator) void {
            allocator.free(self.name);
            allocator.free(self.path);
        }

        fn cmp(context: void, a: LevelInfo, b: LevelInfo) bool {
            _ = context;
            const min_len = @min(a.name.len, b.name.len);
            for (a.name[0..min_len], b.name[0..min_len]) |a_char, b_char| {
                if (a_char == b_char) {
                    continue;
                } else {
                    if (a_char < b_char) {
                        return true;
                    } else {
                        return false;
                    }
                }
            }
            return false;
        }
    };

    const Self = @This();

    pub fn init(allocator: Allocator) !Self {
        const levels = std.ArrayList(Self.LevelInfo).init(allocator);
        const level_names_list = std.ArrayList(*const u8).init(allocator);
        return Self{
            .allocator = allocator,
            .levels = levels,
            .level_names_list = level_names_list,
        };
    }

    pub fn deinit(self: *Self) void {
        for (self.levels.items) |level_info| {
            level_info.deinit(self.allocator);
        }
        self.levels.deinit();
        self.level_names_list.deinit();
    }

    pub fn scan(self: *Self) !void {
        for (self.levels.items) |level_info| {
            level_info.deinit(self.allocator);
        }
        self.levels.clearRetainingCapacity();
        self.level_names_list.clearRetainingCapacity();

        if (builtin.os.tag == .emscripten) {
            for (EMSCRIPTEN_LEVEL_NAMES) |level_name| {
                const level_info = try LevelInfo.init(self.allocator, level_name);
                try self.levels.append(level_info);
            }
        } else {
            const levels_dir = try std.fs.cwd().openDir(DEFAULT_LEVELS_PATH, .{ .iterate = true });
            var iterator = levels_dir.iterate();
            while (try iterator.next()) |entry| {
                if (entry.kind == .file) {
                    if (std.mem.endsWith(u8, entry.name, ".json")) {
                        const level_info = try LevelInfo.init(self.allocator, entry.name);
                        try self.levels.append(level_info);
                    }
                }
            }
        }

        std.sort.heap(LevelInfo, self.levels.items, {}, LevelInfo.cmp);
        for (self.levels.items) |level_info| {
            try self.level_names_list.append(@ptrCast(level_info.name.ptr));
        }

        for (self.levels.items) |level_info| {
            std.log.debug(
                "found level: name: {s}, path: {s}",
                .{
                    level_info.name,
                    level_info.path,
                },
            );
        }
    }

    pub fn draw(
        self: *Self,
        settings: *const Settings,
        state_stack: *GameStateStack,
        current_level: *CurrentLevel,
    ) void {
        var rectangle = rl.Rectangle{
            .x = @as(f32, @floatFromInt(settings.resolution_width)) / 2.0 - UI_ELEMENT_WIDTH / 2.0,
            .y = @as(f32, @floatFromInt(settings.resolution_height)) / 2.0 - UI_ELEMENT_HEIGHT * 2.0,
            .width = UI_ELEMENT_WIDTH,
            .height = UI_ELEMENT_HEIGHT * 2.0,
        };

        _ = rl.GuiListViewEx(
            rectangle,
            @ptrCast(self.level_names_list.items.ptr),
            @intCast(self.level_names_list.items.len),
            &self.scroll_index,
            &self.active,
            &self.focus,
        );

        rectangle.y += UI_ELEMENT_HEIGHT * 3.0;
        rectangle.height = UI_ELEMENT_HEIGHT;
        const load = rl.GuiButton(
            rectangle,
            "Load",
        );
        if (load != 0) {
            if (self.active != -1) {
                const i: usize = @intCast(self.active);
                current_level.load_path = self.levels.items[i].path;
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
};

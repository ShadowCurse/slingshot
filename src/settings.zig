const std = @import("std");
const Allocator = std.mem.Allocator;

const rl = @import("deps/raylib.zig");

const __game = @import("game.zig");
const GameCamera = __game.GameCamera;
const GameStateStack = __game.GameStateStack;

const __ui = @import("ui.zig");
const UI_ELEMENT_WIDTH = __ui.UI_ELEMENT_WIDTH;
const UI_ELEMENT_HEIGHT = __ui.UI_ELEMENT_HEIGHT;

const Vector2 = @import("vector.zig");

pub const DEFAULT_SETTINGS_PATH = "resources/settings.json";

pub const SettingsSave = struct {
    resolution_width: u32,
    resolution_height: u32,
    fullscreen: bool,
    borderless: bool,
};

pub const Settings = struct {
    pub const RESOLUTIONS = [_]struct { u32, u32 }{
        .{ 960, 540 },
        .{ 1280, 720 },
        .{ 1920, 1080 },
        .{ 2560, 1440 },
    };
    pub const RESOLUTIONS_STRINGS = [_][:0]const u8{
        std.fmt.comptimePrint("{}x{}", .{ RESOLUTIONS[0][0], RESOLUTIONS[0][1] }),
        std.fmt.comptimePrint("{}x{}", .{ RESOLUTIONS[1][0], RESOLUTIONS[1][1] }),
        std.fmt.comptimePrint("{}x{}", .{ RESOLUTIONS[2][0], RESOLUTIONS[2][1] }),
        std.fmt.comptimePrint("{}x{}", .{ RESOLUTIONS[3][0], RESOLUTIONS[3][1] }),
    };

    const Self = @This();

    // UI state
    selected_resolution: usize = 0,
    select_resolution_active: bool = false,
    is_fullscreen: bool = false,
    is_borderless: bool = false,

    resolution_width: u32 = 0,
    resolution_height: u32 = 0,
    fullscreen: bool = false,
    borderless: bool = false,

    pub fn next_resolution(self: *Self) void {
        self.selected_resolution += 1;
        self.selected_resolution = self.selected_resolution % Self.RESOLUTIONS_STRINGS.len;
    }

    pub fn prev_resolution(self: *Self) void {
        if (self.selected_resolution == 0) {
            self.selected_resolution = Self.RESOLUTIONS_STRINGS.len - 1;
        } else {
            self.selected_resolution -= 1;
        }
    }

    pub fn use_selected_resolution(self: *Self) void {
        self.resolution_width = Self.RESOLUTIONS[self.selected_resolution][0];
        self.resolution_height = Self.RESOLUTIONS[self.selected_resolution][1];
    }

    pub fn toggle_fullscreen(self: *Self) void {
        rl.ToggleFullscreen();
        self.fullscreen = self.is_fullscreen;

        if (self.fullscreen) {
            const m = rl.GetCurrentMonitor();
            self.resolution_width = @intCast(rl.GetMonitorWidth(m));
            self.resolution_height = @intCast(rl.GetMonitorHeight(m));
        } else {
            self.use_selected_resolution();
        }
    }

    pub fn toggle_borderless_window(self: *Self) void {
        rl.ToggleBorderlessWindowed();
        self.borderless = self.is_borderless;

        if (self.borderless) {
            const m = rl.GetCurrentMonitor();
            self.resolution_width = @intCast(rl.GetMonitorWidth(m));
            self.resolution_height = @intCast(rl.GetMonitorHeight(m));
        } else {
            self.use_selected_resolution();
        }
    }

    pub fn set_window_size(self: *Self) void {
        rl.SetWindowSize(
            @intCast(self.resolution_width),
            @intCast(self.resolution_height),
        );
        // NOTE: this needs a modification to raylib to make this
        // method extern
        rl.SetupViewport(@intCast(self.resolution_width), @intCast(self.resolution_height));
    }

    pub fn screen_center(self: *const Self) Vector2 {
        return Vector2{
            .x = @as(f32, @floatFromInt(self.resolution_width)) / 2.0,
            .y = @as(f32, @floatFromInt(self.resolution_height)) / 2.0,
        };
    }

    pub fn save(self: *const Self) !void {
        var file = try std.fs.cwd().createFile(DEFAULT_SETTINGS_PATH, .{});
        defer file.close();

        const config_save = SettingsSave{
            .resolution_width = self.resolution_width,
            .resolution_height = self.resolution_height,
            .fullscreen = self.is_fullscreen,
            .borderless = self.is_borderless,
        };

        const options = std.json.StringifyOptions{
            .whitespace = .indent_4,
        };

        try std.json.stringify(config_save, options, file.writer());
    }

    pub fn load(allocator: Allocator, path: []const u8) !Self {
        var file = try std.fs.cwd().openFile(path, .{});
        defer file.close();

        const file_data = try file.readToEndAlloc(allocator, 1024 * 1024 * 1024);
        defer allocator.free(file_data);

        const self_state = try std.json.parseFromSlice(Self, allocator, file_data, .{});
        defer self_state.deinit();

        var s = std.mem.zeroInit(Self, .{});
        s.resolution_width = self_state.value.resolution_width;
        s.resolution_height = self_state.value.resolution_height;

        return s;
    }
};

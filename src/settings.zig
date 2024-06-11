const std = @import("std");
const Allocator = std.mem.Allocator;

const rl = @import("deps/raylib.zig");

const _game = @import("game.zig");
const GameCamera = _game.GameCamera;
const GameStateStack = _game.GameStateStack;

const _ui = @import("ui.zig");
const UI_ELEMENT_WIDTH = _ui.UI_ELEMENT_WIDTH;
const UI_ELEMENT_HEIGHT = _ui.UI_ELEMENT_HEIGHT;

pub const DEFAULT_SETTINGS_PATH = "resources/settings.json";

pub const SettingsSave = struct {
    resolution_width: u32,
    resolution_height: u32,
};

pub const Settings = struct {
    const RESOLUTIONS = [_]struct { u32, u32 }{
        .{ 960, 540 },
        .{ 1280, 720 },
        .{ 1920, 1080 },
        .{ 2560, 1440 },
    };
    const RESOLUTIONS_STR: [:0]const u8 = std.fmt.comptimePrint("{};{};{};{}", .{
        RESOLUTIONS[0],
        RESOLUTIONS[1],
        RESOLUTIONS[2],
        RESOLUTIONS[3],
    });

    const Self = @This();

    // UI state
    selected_resolution: i32 = 0,
    select_resolution_active: bool = false,

    resolution_width: u32 = 0,
    resolution_height: u32 = 0,

    pub fn update_selected_resolution(self: *Self) void {
        const selected_resolution: usize = @intCast(self.selected_resolution);
        self.resolution_width = Self.RESOLUTIONS[selected_resolution][0];
        self.resolution_height = Self.RESOLUTIONS[selected_resolution][1];
    }

    pub fn draw(self: *Self, camera: *GameCamera, state_stack: *GameStateStack) !void {
        var rectangle = rl.Rectangle{
            .x = @as(f32, @floatFromInt(self.resolution_width)) / 2.0 - UI_ELEMENT_WIDTH,
            .y = @as(f32, @floatFromInt(self.resolution_height)) / 2.0 - UI_ELEMENT_HEIGHT * 2.0,
            .width = UI_ELEMENT_WIDTH,
            .height = UI_ELEMENT_HEIGHT,
        };
        _ = rl.GuiLabel(
            rectangle,
            "Resolution",
        );

        rectangle.x += UI_ELEMENT_WIDTH;
        const r = rl.GuiDropdownBox(
            rectangle,
            Self.RESOLUTIONS_STR,
            &self.selected_resolution,
            self.select_resolution_active,
        );
        if (r == 1) {
            self.select_resolution_active = !self.select_resolution_active;
        }

        rectangle.x -= UI_ELEMENT_WIDTH / 2.0;
        rectangle.y += UI_ELEMENT_HEIGHT * 3.5;
        const apply_button = rl.GuiButton(
            rectangle,
            "Apply",
        );
        if (apply_button != 0) {
            self.update_selected_resolution();
            self.set_window_size(camera);
            try self.save();
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

    pub fn set_window_size(self: *Self, camera: *GameCamera) void {
        const c = rl.Camera2D{
            .offset = rl.Vector2{
                .x = @as(f32, @floatFromInt(self.resolution_width)) / 2.0,
                .y = @as(f32, @floatFromInt(self.resolution_height)) / 2.0,
            },
            .target = rl.Vector2{ .x = 0.0, .y = 0.0 },
            .rotation = 0.0,
            .zoom = 1.0,
        };
        camera.camera = c;
        rl.SetWindowSize(
            @intCast(self.resolution_width),
            @intCast(self.resolution_height),
        );
        // NOTE: this needs a modification to raylib to make this
        // method extern
        rl.SetupViewport(@intCast(self.resolution_width), @intCast(self.resolution_height));
    }

    pub fn save(self: *const Self) !void {
        var file = try std.fs.cwd().createFile(DEFAULT_SETTINGS_PATH, .{});
        defer file.close();

        const config_save = SettingsSave{
            .resolution_width = self.resolution_width,
            .resolution_height = self.resolution_height,
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

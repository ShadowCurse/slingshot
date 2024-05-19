const std = @import("std");
const builtin = @import("builtin");
const rl = @import("raylib.zig");
const b2 = @import("box2d.zig");
const Game = @import("game.zig").Game;
const GameV2 = @import("game.zig").GameV2;
const _settings = @import("settings.zig");
const Settings = _settings.Settings;
const DEFAULT_SETTINGS_PATH = _settings.DEFAULT_SETTINGS_PATH;

fn emscripten_log(
    comptime message_level: std.log.Level,
    comptime scope: @Type(.EnumLiteral),
    comptime format: []const u8,
    args: anytype,
) void {
    const level_txt = comptime message_level.asText();
    const prefix2 = if (scope == .default) ": " else "(" ++ @tagName(scope) ++ "): ";

    var buffer: [1024:0]u8 = undefined;
    _ = std.fmt.bufPrint(&buffer, level_txt ++ prefix2 ++ format ++ "\n", args) catch return;
    std.os.emscripten.emscripten_log(0, &buffer);
}

fn emscripten_loop() callconv(.C) void {
    const dt = rl.GetFrameTime();
    game.run_once(dt);
}

pub const std_options = if (builtin.os.tag != .emscripten) .{} else std.Options{
    .log_level = .debug,
    .logFn = emscripten_log,
};

pub const os = if (builtin.os.tag != .emscripten) std.os else struct {
    pub const heap = struct {
        pub const page_allocator = std.heap.c_allocator;
    };
};

var game: GameV2 = undefined;

pub fn main() anyerror!void {
    var gpa = std.heap.GeneralPurposeAllocator(.{}){};
    defer _ = gpa.deinit();
    const allocator = gpa.allocator();

    game = try GameV2.new(allocator);
    defer game.deinit();

    if (builtin.os.tag == .emscripten) {
        std.os.emscripten.emscripten_set_main_loop(emscripten_loop, -1, 1);
    } else {
        game.run();
    }
}

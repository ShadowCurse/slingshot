const std = @import("std");
const builtin = @import("builtin");
const rl = @import("raylib.zig");
const b2 = @import("box2d.zig");
const Game = @import("game.zig").Game;
const GameSettings = @import("game.zig").GameSettings;

const WIDTH = 1280;
const HEIGHT = 720;
const TARGET_FPS = 80;
const BACKGROUND_COLOR = rl.BLACK;

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

    game.update(dt) catch unreachable;
    game.draw() catch unreachable;
}

pub const std_options = if (builtin.os.tag != .emscripten) .{} else std.Options{
    .log_level = .info,
    .logFn = emscripten_log,
};

pub const os = if (builtin.os.tag != .emscripten) std.os else struct {
    pub const heap = struct {
        pub const page_allocator = std.heap.c_allocator;
    };
};

var game: Game = undefined;

pub fn main() anyerror!void {
    var gpa = std.heap.GeneralPurposeAllocator(.{}){};
    defer _ = gpa.deinit();
    const allocator = gpa.allocator();

    const settings = try GameSettings.load(allocator, "resources/settings.json");

    rl.InitWindow(
        @intCast(settings.resolution_width),
        @intCast(settings.resolution_height),
        "Slingshot",
    );
    defer rl.CloseWindow();

    rl.SetExitKey(rl.KEY_NULL);

    rl.GuiLoadStyleDefault();

    game = try Game.new(allocator, settings);
    defer game.deinit();

    if (builtin.os.tag == .emscripten) {
        std.os.emscripten.emscripten_set_main_loop(emscripten_loop, -1, 1);
    } else {
        rl.SetTargetFPS(TARGET_FPS);

        while (game.state_stack.current_state() != .Exit) {
            const dt = rl.GetFrameTime();

            try game.update(dt);
            try game.draw();

            if (rl.WindowShouldClose()) {
                game.state_stack.push_state(.Exit);
            }
        }
    }
}

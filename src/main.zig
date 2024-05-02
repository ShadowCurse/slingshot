const std = @import("std");
const rl = @import("raylib.zig");
const b2 = @import("box2d.zig");
const Game = @import("game.zig").Game;
const GameSettings = @import("game.zig").GameSettings;

const WIDTH = 1280;
const HEIGHT = 720;
const TARGET_FPS = 80;
const BACKGROUND_COLOR = rl.BLACK;

pub fn main() anyerror!void {
    var gpa = std.heap.GeneralPurposeAllocator(.{}){};
    defer _ = gpa.deinit();
    const allocator = gpa.allocator();

    const settings = try GameSettings.load(allocator, "settings.json");

    rl.InitWindow(
        @intCast(settings.resolution_width),
        @intCast(settings.resolution_height),
        "Slingshot",
    );
    defer rl.CloseWindow();

    rl.SetTargetFPS(TARGET_FPS);

    rl.GuiLoadStyleDefault();

    var game = try Game.new(allocator, settings);
    defer game.deinit();

    while (!rl.WindowShouldClose()) {
        const dt = rl.GetFrameTime();

        try game.update(dt);
        try game.draw();
    }
}

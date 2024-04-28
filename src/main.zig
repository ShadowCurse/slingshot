const std = @import("std");
const rl = @import("raylib.zig");
const b2 = @import("box2d.zig");
const Game = @import("game.zig").Game;

const WIDTH = 1280;
const HEIGHT = 720;
const TARGET_FPS = 80;
const BACKGROUND_COLOR = rl.BLACK;

pub fn main() anyerror!void {
    var gpa = std.heap.GeneralPurposeAllocator(.{}){};
    defer _ = gpa.deinit();
    const allocator = gpa.allocator();

    rl.InitWindow(WIDTH, HEIGHT, "Breakout");
    defer rl.CloseWindow();

    rl.GuiLoadStyleDefault();

    rl.SetTargetFPS(TARGET_FPS);

    var game = try Game.new(allocator, WIDTH, HEIGHT);
    defer game.deinit();

    while (!rl.WindowShouldClose()) {
        const dt = rl.GetFrameTime();

        try game.update(dt);
        try game.draw();
    }
}

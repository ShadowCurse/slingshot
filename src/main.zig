const std = @import("std");
const rl = @import("raylib.zig");
const b2 = @import("box2d.zig");
const shapes = @import("shapes.zig");
const Vector2 = @import("vector.zig");

const WIDTH = 800;
const HEIGHT = 450;
const TARGET_FPS = 80;
const CAMERA_OFFSET = rl.Vector2{ .x = WIDTH / 2, .y = HEIGHT / 2 };
const BACKGROUND_COLOR = rl.BLACK;
const BALL_COLOR = rl.GREEN;

const PLATFORM_SIZE = rl.Vector2{ .x = 100.0, .y = 20.0 };
const PLATFORM_VELOCITY: f32 = 100.0;
const PLATFORM_COLOR = rl.RED;

pub fn mouse_position() Vector2 {
    return Vector2.from_rl_pos(rl.GetMousePosition()).sub(&Vector2.from_rl_pos(CAMERA_OFFSET));
}

pub fn main() anyerror!void {
    var gpa = std.heap.GeneralPurposeAllocator(.{}){};
    defer _ = gpa.deinit();
    const allocator = gpa.allocator();

    rl.InitWindow(WIDTH, HEIGHT, "Breakout");
    defer rl.CloseWindow();

    rl.SetTargetFPS(TARGET_FPS);

    const camera = rl.Camera2D{
        .offset = rl.Vector2{ .x = WIDTH / 2, .y = HEIGHT / 2 },
        .target = rl.Vector2{ .x = 0, .y = 0 },
        .rotation = 0.0,
        .zoom = 1.0,
    };

    var world_def = b2.b2DefaultWorldDef();
    world_def.gravity = b2.b2Vec2{ .x = 0, .y = -100 };
    const world_id = b2.b2CreateWorld(&world_def);
    defer b2.b2DestroyWorld(world_id);

    const platform = shapes.Rectangle.new(
        world_id,
        Vector2{ .x = 0.0, .y = -100.0 },
        Vector2{ .x = -10.0, .y = 0.0 },
        Vector2{ .x = 10.0, .y = 0.0 },
        10.0,
        1.0,
        PLATFORM_COLOR,
    );
    defer platform.deinit();
    const ball = shapes.Ball.new(
        world_id,
        Vector2{ .x = 240.0, .y = 100.0 },
        10.0,
        BALL_COLOR,
    );
    defer ball.deinit();
    const arc = shapes.Arc.new(
        world_id,
        b2.b2_staticBody,
        Vector2{ .x = -150.0, .y = -80.0 },
        30.0,
        rl.GOLD,
    );
    defer arc.deinit();
    const rect_chain = try shapes.RectangleChain.new(
        allocator,
        world_id,
        Vector2{ .x = 0.0, .y = 0.0 },
        &.{
            Vector2{ .x = -100.0, .y = -60.0 },
            Vector2{ .x = -80.0, .y = -10.0 },
            Vector2{ .x = 0.0, .y = 20.0 },
            Vector2{ .x = 80.0, .y = -10.0 },
            Vector2{ .x = 100.0, .y = -60.0 },
        },
        10.0,
        0.0,
        rl.ORANGE,
    );
    defer rect_chain.deinit(allocator);
    var anchor = shapes.Anchor.new(
        world_id,
        Vector2{ .x = 240.0, .y = 0.0 },
        5.0,
        rl.LIME,
    );
    defer anchor.deinit();

    const sub_steps: i32 = 4;
    while (!rl.WindowShouldClose()) {
        const dt = rl.GetFrameTime();

        platform.update(PLATFORM_VELOCITY);
        rect_chain.update();
        anchor.update(world_id, &ball);

        rl.BeginDrawing();
        rl.ClearBackground(BACKGROUND_COLOR);
        rl.BeginMode2D(camera);

        b2.b2World_Step(world_id, dt, sub_steps);

        platform.draw();
        ball.draw();
        arc.draw();
        rect_chain.draw();
        anchor.draw();

        const mouse_pos = mouse_position();
        rl.DrawCircleV(mouse_pos.to_rl_as_pos(), 2.0, rl.YELLOW);

        rl.EndMode2D();
        rl.EndDrawing();
    }
}

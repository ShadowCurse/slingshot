const rl = @import("raylib.zig");
const b2 = @import("box2d.zig");
const std = @import("std");

const WIDTH = 800;
const HEIGHT = 450;
const TARGET_FPS = 80;
const BACKGROUND_COLOR = rl.BLACK;
const BALL_COLOR = rl.GREEN;

const PLATFORM_SIZE = rl.Vector2{ .x = 100.0, .y = 20.0 };
const PLATFORM_VELOCITY: f32 = 100.0;
const PLATFORM_COLOR = rl.RED;

pub fn main() anyerror!void {
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
    world_def.gravity = b2.b2Vec2{ .x = 0, .y = -10 };
    const world_id = b2.b2CreateWorld(&world_def);
    defer b2.b2DestroyWorld(world_id);

    var ground_body_def = b2.b2DefaultBodyDef();
    ground_body_def.type = b2.b2_kinematicBody;
    ground_body_def.position = b2.b2Vec2{ .x = 0, .y = -10 };
    const ground_body_id = b2.b2CreateBody(world_id, &ground_body_def);

    const ground_box = b2.b2MakeBox(50, 10);
    const ground_shape_def = b2.b2DefaultShapeDef();
    const ground_shape_id = b2.b2CreatePolygonShape(ground_body_id, &ground_shape_def, &ground_box);
    _ = ground_shape_id;

    var body_def = b2.b2DefaultBodyDef();
    body_def.type = b2.b2_dynamicBody;
    body_def.position = b2.b2Vec2{ .x = 0, .y = 100 };
    const body_id = b2.b2CreateBody(world_id, &body_def);

    var shape_def = b2.b2DefaultShapeDef();
    shape_def.density = 1.0;
    shape_def.friction = 0.5;

    var circle = b2.b2Circle{
        .point = b2.b2Vec2{ .x = 0, .y = 0 },
        .radius = 10,
    };
    const circle_shape_id = b2.b2CreateCircleShape(body_id, &shape_def, &circle);
    _ = circle_shape_id;

    const sub_steps: i32 = 4;

    while (!rl.WindowShouldClose()) {
        const dt = rl.GetFrameTime();

        var platform_velocity = b2.b2Vec2{ .x = 0, .y = 0 };
        if (rl.IsKeyDown(rl.KEY_A)) {
            platform_velocity.x = -PLATFORM_VELOCITY;
        }
        if (rl.IsKeyDown(rl.KEY_D)) {
            platform_velocity.x = PLATFORM_VELOCITY;
        }
        if (rl.IsKeyDown(rl.KEY_W)) {
            platform_velocity.y = PLATFORM_VELOCITY;
        }
        if (rl.IsKeyDown(rl.KEY_S)) {
            platform_velocity.y = -PLATFORM_VELOCITY;
        }

        b2.b2Body_SetLinearVelocity(ground_body_id, platform_velocity);

        b2.b2Body_Wake(body_id);

        rl.BeginDrawing();
        rl.ClearBackground(BACKGROUND_COLOR);
        rl.BeginMode2D(camera);

        b2.b2World_Step(world_id, dt, sub_steps);
        const ball_position = b2.b2Body_GetPosition(body_id);
        const platform_position = b2.b2Body_GetPosition(ground_body_id);
        rl.DrawRectangleV(rl.Vector2{ .x = platform_position.x - 50.0, .y = -platform_position.y }, PLATFORM_SIZE, PLATFORM_COLOR);
        rl.DrawCircle(@as(i32, @intFromFloat(ball_position.x)), -@as(i32, @intFromFloat(ball_position.y)), 20.0, BALL_COLOR);

        rl.EndMode2D();
        rl.EndDrawing();
    }
}

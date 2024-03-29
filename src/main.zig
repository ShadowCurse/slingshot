const rl = @import("raylib.zig");
const b2 = @import("box2d.zig");
const std = @import("std");
const shapes = @import("shapes.zig");

const WIDTH = 800;
const HEIGHT = 450;
const TARGET_FPS = 80;
const BACKGROUND_COLOR = rl.BLACK;
const BALL_COLOR = rl.GREEN;

const PLATFORM_SIZE = rl.Vector2{ .x = 100.0, .y = 20.0 };
const PLATFORM_VELOCITY: f32 = 100.0;
const PLATFORM_COLOR = rl.RED;

pub const Vector2 = struct {
    x: f32,
    y: f32,

    const Self = @This();

    pub const ZERO = Self{
        .x = 0.0,
        .y = 0.0,
    };

    pub fn from_b2(vec: b2.b2Vec2) Self {
        return Self{
            .x = vec.x,
            .y = vec.y,
        };
    }

    pub fn to_rl(self: *const Self) rl.Vector2 {
        return rl.Vector2{
            .x = self.x,
            .y = self.y,
        };
    }

    pub fn to_rl_as_pos(self: *const Self) rl.Vector2 {
        return rl.Vector2{
            .x = self.x,
            .y = -self.y,
        };
    }

    pub fn to_b2(self: *const Self) b2.b2Vec2 {
        return b2.b2Vec2{
            .x = self.x,
            .y = self.y,
        };
    }

    pub fn add(self: *const Self, other: *const Self) Self {
        return Self{
            .x = self.x + other.x,
            .y = self.y + other.y,
        };
    }
};

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
    world_def.gravity = b2.b2Vec2{ .x = 0, .y = -100 };
    const world_id = b2.b2CreateWorld(&world_def);
    defer b2.b2DestroyWorld(world_id);

    var platform_body_def = b2.b2DefaultBodyDef();
    platform_body_def.type = b2.b2_kinematicBody;
    platform_body_def.position = b2.b2Vec2{ .x = 0, .y = -100 };
    const platform_body_id = b2.b2CreateBody(world_id, &platform_body_def);

    const platform_box = b2.b2MakeBox(50, 10);
    const platform_shape_def = b2.b2DefaultShapeDef();
    const platform_shape_id = b2.b2CreatePolygonShape(platform_body_id, &platform_shape_def, &platform_box);
    _ = platform_shape_id;

    const ball = shapes.Ball.new(world_id, Vector2{ .x = 0.0, .y = 40.0 }, 10.0, BALL_COLOR);
    const arc = shapes.Arc.new(world_id, Vector2{ .x = 0.0, .y = -40.0 }, 30.0, rl.GOLD);

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

        b2.b2Body_SetLinearVelocity(platform_body_id, platform_velocity);

        arc.update();

        rl.BeginDrawing();
        rl.ClearBackground(BACKGROUND_COLOR);
        rl.BeginMode2D(camera);

        b2.b2World_Step(world_id, dt, sub_steps);
        const platform_position = Vector2.from_b2(b2.b2Body_GetPosition(platform_body_id));
        rl.DrawRectangleV(platform_position.add(&Vector2{ .x = -50.0, .y = 10.0 }).to_rl_as_pos(), PLATFORM_SIZE, PLATFORM_COLOR);
        ball.draw();
        arc.draw();

        rl.EndMode2D();
        rl.EndDrawing();
    }
}

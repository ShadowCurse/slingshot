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

    pub fn sub(self: *const Self, other: *const Self) Self {
        return Self{
            .x = self.x - other.x,
            .y = self.y - other.y,
        };
    }

    pub fn mul(self: *const Self, v: f32) Self {
        return Self{
            .x = self.x * v,
            .y = self.y * v,
        };
    }

    pub fn div(self: *const Self, v: f32) Self {
        return Self{
            .x = self.x / v,
            .y = self.y / v,
        };
    }

    pub fn orthogonal(self: *const Self) Self {
        return Self{
            .x = self.y,
            .y = -self.x,
        };
    }

    pub fn length(self: *const Self) f32 {
        return std.math.sqrt(self.x * self.x + self.y * self.y);
    }

    pub fn normalized(self: *const Self) Self {
        const l = self.length();
        return self.div(l);
    }

    pub fn angle(self: *const Self) f32 {
        return std.math.atan2(f32, self.y, self.x);
    }

    pub fn rotate(self: *const Self, rad: f32) Self {
        const sin = std.math.sin(rad);
        const cos = std.math.cos(rad);
        return Self{
            .x = cos * self.x - sin * self.y,
            .y = sin * self.x + cos * self.y,
        };
    }
};

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
        Vector2{ .x = 0.0, .y = 40.0 },
        10.0,
        BALL_COLOR,
    );
    defer ball.deinit();
    const arc = shapes.Arc.new(
        world_id,
        Vector2{ .x = 0.0, .y = -40.0 },
        30.0,
        rl.GOLD,
    );
    defer arc.deinit();
    const rect_chain = try shapes.RectangleChain.new(
        allocator,
        world_id,
        Vector2{ .x = 0.0, .y = -100.0 },
        &.{
            Vector2{ .x = -100.0, .y = 20.0 },
            Vector2{ .x = -80.0, .y = -20.0 },
            Vector2{ .x = 0.0, .y = 20.0 },
            Vector2{ .x = 80.0, .y = -20.0 },
            Vector2{ .x = 100.0, .y = 20.0 },
        },
        10.0,
        0.0,
        rl.ORANGE,
    );
    defer rect_chain.deinit(allocator);

    const sub_steps: i32 = 4;
    while (!rl.WindowShouldClose()) {
        const dt = rl.GetFrameTime();

        platform.update(PLATFORM_VELOCITY);
        arc.update();
        rect_chain.update();

        rl.BeginDrawing();
        rl.ClearBackground(BACKGROUND_COLOR);
        rl.BeginMode2D(camera);

        b2.b2World_Step(world_id, dt, sub_steps);

        platform.draw();
        ball.draw();
        arc.draw();
        rect_chain.draw();

        rl.EndMode2D();
        rl.EndDrawing();
    }
}

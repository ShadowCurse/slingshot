const std = @import("std");
const rl = @import("raylib.zig");
const b2 = @import("box2d.zig");
const objects = @import("objects.zig");
const Object = objects.Object;
const Arc = objects.Arc;
const Ball = objects.Ball;
const Anchor = objects.Anchor;
const Rectangle = objects.Rectangle;
const RectangleChain = objects.RectangleChain;

const Vector2 = @import("vector.zig");
const Allocator = std.mem.Allocator;

const WIDTH = 800;
const HEIGHT = 450;
const TARGET_FPS = 80;
const CAMERA_OFFSET = rl.Vector2{ .x = WIDTH / 2, .y = HEIGHT / 2 };
const BACKGROUND_COLOR = rl.BLACK;
const BALL_COLOR = rl.GREEN;

const PLATFORM_SIZE = rl.Vector2{ .x = 100.0, .y = 20.0 };
const PLATFORM_VELOCITY: f32 = 100.0;
const PLATFORM_COLOR = rl.RED;

pub const Game = struct {
    world_id: b2.b2WorldId,
    ball: objects.Ball,
    objects: std.ArrayList(objects.Object),
    allocator: Allocator,

    const Self = @This();

    pub fn new(allocator: Allocator) Self {
        var world_def = b2.b2DefaultWorldDef();
        world_def.gravity = b2.b2Vec2{ .x = 0, .y = -100 };
        const world_id = b2.b2CreateWorld(&world_def);

        const ball = objects.Ball.new(
            world_id,
            Vector2{ .x = 240.0, .y = 100.0 },
            10.0,
            BALL_COLOR,
        );

        return Self{
            .world_id = world_id,
            .ball = ball,
            .objects = std.ArrayList(Object).init(allocator),
            .allocator = allocator,
        };
    }

    pub fn deinit(self: *const Self) void {
        self.ball.deinit();
        for (self.objects.items) |object| {
            switch (object) {
                .Arc => |arc| arc.deinit(),
                .Ball => |ball| ball.deinit(),
                .Anchor => |anchor| anchor.deinit(),
                .Rectangle => |rectangle| rectangle.deinit(),
                .RectangleChain => |rectangle_chain| rectangle_chain.deinit(self.allocator),
            }
        }
        self.objects.deinit();
        defer b2.b2DestroyWorld(self.world_id);
    }

    pub fn add(self: *Self, object: objects.Object) !void {
        try self.objects.append(object);
    }

    pub fn update(self: *Self, dt: f32) void {
        b2.b2World_Step(self.world_id, dt, 4);

        for (self.objects.items) |*object| {
            switch (object.*) {
                .Arc => |_| {},
                .Ball => |_| {},
                .Anchor => |*anchor| anchor.update(self.world_id, &self.ball),
                .Rectangle => |_| {},
                .RectangleChain => |_| {},
            }
        }
    }

    pub fn draw(self: *const Self) void {
        for (self.objects.items) |object| {
            switch (object) {
                .Arc => |arc| arc.draw(),
                .Ball => |ball| ball.draw(),
                .Anchor => |anchor| anchor.draw(),
                .Rectangle => |rectangle| rectangle.draw(),
                .RectangleChain => |rectangle_chain| rectangle_chain.draw(),
            }
        }
        self.ball.draw();
    }
};

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

    var game = Game.new(allocator);
    defer game.deinit();

    const platform = objects.Rectangle.new(
        game.world_id,
        Vector2{ .x = 0.0, .y = -100.0 },
        Vector2{ .x = -10.0, .y = 0.0 },
        Vector2{ .x = 10.0, .y = 0.0 },
        10.0,
        1.0,
        PLATFORM_COLOR,
    );
    try game.add(.{ .Rectangle = platform });

    const arc = objects.Arc.new(
        game.world_id,
        Vector2{ .x = -150.0, .y = -80.0 },
        30.0,
        rl.GOLD,
    );
    try game.add(.{ .Arc = arc });

    const rect_chain = try objects.RectangleChain.new(
        allocator,
        game.world_id,
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
    try game.add(.{ .RectangleChain = rect_chain });

    var anchor = objects.Anchor.new(
        game.world_id,
        Vector2{ .x = 240.0, .y = 0.0 },
        5.0,
        rl.LIME,
    );
    try game.add(.{ .Anchor = anchor });

    while (!rl.WindowShouldClose()) {
        const dt = rl.GetFrameTime();

        game.update(dt);

        rl.BeginDrawing();
        rl.ClearBackground(BACKGROUND_COLOR);
        rl.BeginMode2D(camera);

        game.draw();

        const mouse_pos = mouse_position();
        rl.DrawCircleV(mouse_pos.to_rl_as_pos(), 2.0, rl.YELLOW);

        rl.EndMode2D();
        rl.EndDrawing();
    }
}

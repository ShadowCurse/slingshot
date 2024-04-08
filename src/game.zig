const std = @import("std");
const rl = @import("raylib.zig");
const b2 = @import("box2d.zig");
const objects = @import("objects.zig");
const Object = objects.Object;
const DebugDraw = objects.DebugDraw;
const Arc = objects.Arc;
const Ball = objects.Ball;
const Anchor = objects.Anchor;
const Rectangle = objects.Rectangle;
const RectangleChain = objects.RectangleChain;

const Vector2 = @import("vector.zig");
const Allocator = std.mem.Allocator;

pub const Game = struct {
    world_id: b2.b2WorldId,
    camera: rl.Camera2D,

    ball: objects.Ball,
    objects: std.ArrayList(objects.Object),
    allocator: Allocator,

    state: GameState,
    selected_object: ?*Object,

    const GameState = enum {
        Running,
        Paused,
    };

    const BALL_COLOR = rl.GREEN;
    const PLATFORM_SIZE = rl.Vector2{ .x = 100.0, .y = 20.0 };
    const PLATFORM_VELOCITY: f32 = 100.0;
    const PLATFORM_COLOR = rl.RED;

    const Self = @This();

    pub fn new(allocator: Allocator, screen_width: f32, screen_height: f32) !Self {
        var world_def = b2.b2DefaultWorldDef();
        world_def.gravity = b2.b2Vec2{ .x = 0, .y = -100 };
        const world_id = b2.b2CreateWorld(&world_def);

        const camera = rl.Camera2D{
            .offset = rl.Vector2{ .x = screen_width / 2.0, .y = screen_height / 2.0 },
            .target = rl.Vector2{ .x = 0.0, .y = 0.0 },
            .rotation = 0.0,
            .zoom = 1.0,
        };

        const ball = objects.Ball.new(
            world_id,
            Vector2{ .x = 240.0, .y = 100.0 },
            10.0,
            BALL_COLOR,
        );

        var self = Self{
            .world_id = world_id,
            .camera = camera,

            .ball = ball,
            .objects = std.ArrayList(Object).init(allocator),
            .allocator = allocator,

            .state = .Running,
            .selected_object = null,
        };

        const platform = objects.Rectangle.new(
            self.world_id,
            Vector2{ .x = 0.0, .y = -100.0 },
            Vector2{ .x = -10.0, .y = 0.0 },
            Vector2{ .x = 10.0, .y = 0.0 },
            10.0,
            1.0,
            PLATFORM_COLOR,
        );
        try self.add(.{ .Rectangle = platform });

        const arc = objects.Arc.new(
            self.world_id,
            Vector2{ .x = -150.0, .y = -80.0 },
            30.0,
            rl.GOLD,
        );
        try self.add(.{ .Arc = arc });

        const rect_chain = try objects.RectangleChain.new(
            allocator,
            self.world_id,
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
        try self.add(.{ .RectangleChain = rect_chain });

        var anchor = objects.Anchor.new(
            self.world_id,
            Vector2{ .x = 240.0, .y = 0.0 },
            5.0,
            rl.LIME,
        );
        try self.add(.{ .Anchor = anchor });

        return self;
    }

    pub fn deinit(self: *const Self) void {
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
        self.ball.deinit();
        b2.b2DestroyWorld(self.world_id);
    }

    pub fn mouse_position(self: *const Self) Vector2 {
        return Vector2.from_rl_pos(rl.GetMousePosition())
            .sub(&Vector2.from_rl_pos(self.camera.offset));
    }

    pub fn add(self: *Self, object: objects.Object) !void {
        try self.objects.append(object);
    }

    pub fn update(self: *Self, dt: f32) !void {
        if (rl.IsKeyPressed(rl.KEY_R)) {
            self.deinit();
            self.* = try Self.new(self.allocator, self.camera.offset.x * 2.0, self.camera.offset.y * 2.0);
        }

        if (rl.IsKeyPressed(rl.KEY_P)) {
            switch (self.state) {
                .Running => self.state = .Paused,
                .Paused => self.state = .Running,
            }
        }

        switch (self.state) {
            .Running => {
                b2.b2World_Step(self.world_id, dt, 4);
                for (self.objects.items) |*object| {
                    switch (object.*) {
                        .Arc => |_| {},
                        .Ball => |_| {},
                        .Anchor => |*anchor| anchor.update(
                            self.world_id,
                            self.mouse_position(),
                            &self.ball,
                        ),
                        .Rectangle => |_| {},
                        .RectangleChain => |_| {},
                    }
                }
            },
            .Paused => {
                if (rl.IsMouseButtonPressed(rl.MOUSE_BUTTON_LEFT)) {
                    const mp = self.mouse_position();
                    self.selected_object = null;
                    for (self.objects.items) |*object| {
                        switch (object.*) {
                            .Arc => |arc| if (arc.aabb_contains(mp)) {
                                self.selected_object = object;
                            },
                            .Ball => |ball| if (ball.aabb_contains(mp)) {
                                self.selected_object = object;
                            },
                            .Anchor => |anchor| if (anchor.aabb_contains(mp)) {
                                self.selected_object = object;
                            },
                            .Rectangle => |rect| if (rect.aabb_contains(mp)) {
                                self.selected_object = object;
                            },
                            .RectangleChain => |rc| if (rc.aabb_contains(mp)) {
                                self.selected_object = object;
                            },
                        }
                    }
                }
                if (rl.IsMouseButtonDown(rl.MOUSE_BUTTON_LEFT)) {
                    if (self.selected_object) |so| {
                        const mouse_pos = self.mouse_position();
                        switch (so.*) {
                            .Arc => |arc| arc.set_position(mouse_pos),
                            .Ball => |ball| ball.set_position(mouse_pos),
                            .Anchor => |anchor| anchor.set_position(mouse_pos),
                            .Rectangle => |rectangle| rectangle.set_position(mouse_pos),
                            .RectangleChain => |rectangle_chain| rectangle_chain.set_position(mouse_pos),
                        }
                    }
                }
            },
        }
    }

    pub fn draw(self: *const Self) void {
        const debug_draw = switch (self.state) {
            .Running => DebugDraw.NoDebugDraw,
            .Paused => DebugDraw{ .DebugOutline = rl.SKYBLUE },
        };

        rl.BeginMode2D(self.camera);
        defer rl.EndMode2D();

        for (self.objects.items) |object| {
            switch (object) {
                .Arc => |arc| arc.draw(debug_draw),
                .Ball => |ball| ball.draw(debug_draw),
                .Anchor => |anchor| anchor.draw(debug_draw),
                .Rectangle => |rectangle| rectangle.draw(debug_draw),
                .RectangleChain => |rectangle_chain| rectangle_chain.draw(debug_draw),
            }
        }
        self.ball.draw(debug_draw);

        if (self.state == .Paused) {
            const selected_debug_draw = .{ .DebugOutline = rl.ORANGE };
            if (self.selected_object) |so| {
                switch (so.*) {
                    .Arc => |arc| arc.draw(selected_debug_draw),
                    .Ball => |ball| ball.draw(selected_debug_draw),
                    .Anchor => |anchor| anchor.draw(selected_debug_draw),
                    .Rectangle => |rectangle| rectangle.draw(selected_debug_draw),
                    .RectangleChain => |rectangle_chain| rectangle_chain.draw(selected_debug_draw),
                }
            }
        }

        const mouse_pos = self.mouse_position();
        rl.DrawCircleV(mouse_pos.to_rl_as_pos(), 2.0, rl.YELLOW);
    }
};

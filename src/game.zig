const std = @import("std");
const rl = @import("raylib.zig");
const b2 = @import("box2d.zig");
const objects = @import("objects.zig");
const Object = objects.Object;
const ObjectParams = objects.ObjectParams;
const DebugDraw = objects.DebugDraw;
const Arc = objects.Arc;
const Ball = objects.Ball;
const Anchor = objects.Anchor;
const Rectangle = objects.Rectangle;
const RectangleChain = objects.RectangleChain;

const Vector2 = @import("vector.zig");
const Allocator = std.mem.Allocator;

pub const GameState = enum {
    Running,
    Paused,
};

pub const Game = struct {
    allocator: Allocator,

    world_id: b2.b2WorldId,

    camera: rl.Camera2D,
    initial_camera: rl.Camera2D,

    ball: objects.Ball,
    initial_ball_params: objects.BallParams,

    objects: std.ArrayList(Object),
    state: GameState,

    editor_camera: rl.Camera2D,
    editor_selected_object: ?*Object,

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
        const initial_ball_params = objects.BallParams{
            .position = Vector2{ .x = 240.0, .y = 100.0 },
            .radius = 10.0,
            .color = BALL_COLOR,
        };
        const game_ball = Ball.new(world_id, initial_ball_params);

        var objects_params = std.ArrayList(ObjectParams).init(allocator);
        defer objects_params.deinit();

        const ball_params = objects.BallParams{
            .position = Vector2{ .x = 100.0, .y = 100.0 },
            .radius = 10.0,
            .color = BALL_COLOR,
        };
        try objects_params.append(.{ .Ball = ball_params });

        const rectangle_params = objects.RectangleParams{
            .position = Vector2{ .x = 0.0, .y = -100.0 },
            .point_1 = Vector2{ .x = -10.0, .y = 0.0 },
            .point_2 = Vector2{ .x = 10.0, .y = 0.0 },
            .width = 10.0,
            .height_offset = 1.0,
            .color = PLATFORM_COLOR,
        };
        try objects_params.append(.{ .Rectangle = rectangle_params });

        const arc_params = objects.ArcParams{
            .position = Vector2{ .x = -150.0, .y = -80.0 },
            .radius = 30.0,
            .color = rl.GOLD,
        };
        try objects_params.append(.{ .Arc = arc_params });

        var points = std.ArrayList(Vector2).init(allocator);
        try points.appendSlice(
            &.{
                Vector2{ .x = -100.0, .y = -60.0 },
                Vector2{ .x = -80.0, .y = -10.0 },
                Vector2{ .x = 0.0, .y = 20.0 },
                Vector2{ .x = 80.0, .y = -10.0 },
                Vector2{ .x = 100.0, .y = -60.0 },
            },
        );
        const rect_chain_params = objects.RectangleChainParams{
            .position = Vector2{ .x = 0.0, .y = 0.0 },
            .points = points,
            .width = 10.0,
            .height_offset = 0.0,
            .color = rl.ORANGE,
        };
        try objects_params.append(.{ .RectangleChain = rect_chain_params });

        const anchor_params = objects.AnchorParams{
            .position = Vector2{ .x = 240.0, .y = 0.0 },
            .radius = 5.0,
            .color = rl.LIME,
        };
        try objects_params.append(.{ .Anchor = anchor_params });

        var game_objects = std.ArrayList(objects.Object).init(allocator);
        for (objects_params.items) |*params| {
            switch (params.*) {
                .Arc => |p| {
                    const arc = Arc.new(world_id, p);
                    try game_objects.append(.{ .Arc = arc });
                },
                .Ball => |p| {
                    const ball = Ball.new(world_id, p);
                    try game_objects.append(.{ .Ball = ball });
                },
                .Anchor => |p| {
                    const anchor = Anchor.new(world_id, p);
                    try game_objects.append(.{ .Anchor = anchor });
                },
                .Rectangle => |p| {
                    const rectangle = Rectangle.new(world_id, p);
                    try game_objects.append(.{ .Rectangle = rectangle });
                },
                .RectangleChain => |p| {
                    const rectangle_chain = try RectangleChain.new(world_id, allocator, p);
                    try game_objects.append(.{ .RectangleChain = rectangle_chain });
                },
            }
        }

        return Self{
            .allocator = allocator,

            .world_id = world_id,

            .camera = camera,
            .initial_camera = camera,

            .ball = game_ball,
            .initial_ball_params = initial_ball_params,

            .objects = game_objects,

            .state = GameState.Running,

            .editor_camera = camera,
            .editor_selected_object = null,
        };
    }

    pub fn restart(self: *Self) !void {
        self.camera = self.initial_camera;

        for (self.objects.items) |*object| {
            switch (object.*) {
                .Arc => |*arc| arc.recreate(self.world_id),
                .Ball => |*ball| ball.recreate(self.world_id),
                .Anchor => |*anchor| anchor.recreate(self.world_id),
                .Rectangle => |*rectangle| rectangle.recreate(self.world_id),
                .RectangleChain => |*rectangle_chain| try rectangle_chain.recreate(
                    self.world_id,
                ),
            }
        }

        self.ball.recreate(self.world_id);
        self.ball = Ball.new(self.world_id, self.initial_ball_params);
    }

    pub fn deinit(self: *const Self) void {
        for (self.objects.items) |object| {
            switch (object) {
                .Arc => |arc| arc.deinit(),
                .Ball => |ball| ball.deinit(),
                .Anchor => |anchor| anchor.deinit(),
                .Rectangle => |rectangle| rectangle.deinit(),
                .RectangleChain => |rectangle_chain| rectangle_chain.deinit(),
            }
        }
        self.objects.deinit();
        self.ball.deinit();
        b2.b2DestroyWorld(self.world_id);
    }

    pub fn mouse_position(self: *const Self) Vector2 {
        const camera = switch (self.state) {
            .Running => &self.camera,
            .Paused => &self.editor_camera,
        };
        return Vector2.from_rl_pos(rl.GetMousePosition())
            .sub(&Vector2.from_rl_pos(camera.offset));
    }

    pub fn update(self: *Self, dt: f32) !void {
        if (rl.IsKeyPressed(rl.KEY_R)) {
            try self.restart();
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
                if (rl.IsMouseButtonPressed(rl.MOUSE_BUTTON_RIGHT)) {
                    const mp = self.mouse_position();
                    self.editor_selected_object = null;
                    for (self.objects.items) |*object| {
                        switch (object.*) {
                            .Arc => |arc| if (arc.aabb_contains(mp)) {
                                self.editor_selected_object = object;
                            },
                            .Ball => |ball| if (ball.aabb_contains(mp)) {
                                self.editor_selected_object = object;
                            },
                            .Anchor => |anchor| if (anchor.aabb_contains(mp)) {
                                self.editor_selected_object = object;
                            },
                            .Rectangle => |rect| if (rect.aabb_contains(mp)) {
                                self.editor_selected_object = object;
                            },
                            .RectangleChain => |rc| if (rc.aabb_contains(mp)) {
                                self.editor_selected_object = object;
                            },
                        }
                    }
                }
                if (rl.IsMouseButtonDown(rl.MOUSE_BUTTON_SIDE)) {
                    const mouse_pos = self.mouse_position();
                    if (self.editor_selected_object) |so| {
                        switch (so.*) {
                            .Arc => |*arc| arc.set_position(mouse_pos),
                            .Ball => |*ball| ball.set_position(mouse_pos),
                            .Anchor => |*anchor| anchor.set_position(mouse_pos),
                            .Rectangle => |*rectangle| rectangle.set_position(mouse_pos),
                            .RectangleChain => |*rectangle_chain| rectangle_chain.set_position(mouse_pos),
                        }
                    }
                }
                if (rl.IsMouseButtonDown(rl.MOUSE_BUTTON_MIDDLE)) {
                    const delta = rl.GetMouseDelta();
                    self.editor_camera.offset.x += delta.x;
                    self.editor_camera.offset.y += delta.y;
                }

                if (self.editor_selected_object) |so| {
                    switch (so.*) {
                        .Arc => |*arc| arc.draw_editor(self.world_id),
                        .Ball => |*ball| ball.draw_editor(self.world_id),
                        .Anchor => |*anchor| anchor.draw_editor(self.world_id),
                        .Rectangle => |*rectangle| rectangle.draw_editor(self.world_id),
                        .RectangleChain => |*rectangle_chain| try rectangle_chain.draw_editor(self.world_id),
                    }
                }
            },
        }
    }

    pub fn draw(self: *const Self) void {
        const camera = switch (self.state) {
            .Running => &self.camera,
            .Paused => &self.editor_camera,
        };

        rl.BeginMode2D(camera.*);
        defer rl.EndMode2D();

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

        if (self.state == .Paused) {
            const aabb_color = rl.SKYBLUE;
            for (self.objects.items) |object| {
                switch (object) {
                    .Arc => |arc| arc.draw_aabb(aabb_color),
                    .Ball => |ball| ball.draw_aabb(aabb_color),
                    .Anchor => |anchor| anchor.draw_aabb(aabb_color),
                    .Rectangle => |rectangle| rectangle.draw_aabb(aabb_color),
                    .RectangleChain => |rectangle_chain| rectangle_chain.draw_aabb(aabb_color),
                }
            }
            self.ball.draw_aabb(aabb_color);

            const selected_color = rl.ORANGE;
            if (self.editor_selected_object) |so| {
                switch (so.*) {
                    .Arc => |arc| arc.draw_aabb(selected_color),
                    .Ball => |ball| ball.draw_aabb(selected_color),
                    .Anchor => |anchor| anchor.draw_aabb(selected_color),
                    .Rectangle => |rectangle| rectangle.draw_aabb(selected_color),
                    .RectangleChain => |rectangle_chain| rectangle_chain.draw_aabb(selected_color),
                }
            }
        }

        const mouse_pos = self.mouse_position();
        rl.DrawCircleV(mouse_pos.to_rl_as_pos(), 2.0, rl.YELLOW);
    }
};

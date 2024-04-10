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

pub const GameState = enum {
    Running,
    Paused,
};

pub const GameConsistentState = struct {
    camera: rl.Camera2D,
    ball_params: objects.BallParams,
    objects_params: std.ArrayList(objects.ObjectParams),

    const Self = @This();

    pub fn deinit(self: *const Self) void {
        for (self.objects_params.items) |object_param| {
            switch (object_param) {
                .Arc => |_| {},
                .Ball => |_| {},
                .Anchor => |_| {},
                .Rectangle => |_| {},
                .RectangleChain => |rectangle_chain| rectangle_chain.deinit(),
            }
        }
        self.objects_params.deinit();
    }
};

pub const RuntimeCommandTag = enum { Reload, Add };

pub const RuntimeCommand = union(RuntimeCommandTag) {
    Reload: void,
    Add: objects.ObjectParams,
};

pub const GameRuntimeState = struct {
    camera: rl.Camera2D,
    world_id: b2.b2WorldId,
    ball: objects.Ball,
    objects: std.ArrayList(objects.Object),

    state: GameState,
    selected_object: ?*Object,

    const Self = @This();

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

    pub fn from_consistent_state(
        allocator: Allocator,
        consistent_state: *const GameConsistentState,
    ) !Self {
        var world_def = b2.b2DefaultWorldDef();
        world_def.gravity = b2.b2Vec2{ .x = 0, .y = -100 };
        const world_id = b2.b2CreateWorld(&world_def);

        const new_ball = consistent_state.ball_params.to_object(world_id);

        var new_objects = std.ArrayList(objects.Object).init(allocator);
        for (consistent_state.objects_params.items) |*params| {
            switch (params.*) {
                .Arc => |arc_params| {
                    const arc = arc_params.to_object(world_id);
                    try new_objects.append(objects.Object{ .Arc = arc });
                },
                .Ball => |ball_params| {
                    const ball = ball_params.to_object(world_id);
                    try new_objects.append(objects.Object{ .Ball = ball });
                },
                .Anchor => |anchor_params| {
                    const anchor = anchor_params.to_object(world_id);
                    try new_objects.append(objects.Object{ .Anchor = anchor });
                },
                .Rectangle => |rectangle_params| {
                    const rectangle = rectangle_params.to_object(world_id);
                    try new_objects.append(objects.Object{ .Rectangle = rectangle });
                },
                .RectangleChain => |rectangle_chain_params| {
                    const rectangle_chain = try rectangle_chain_params.to_object(
                        world_id,
                        allocator,
                    );
                    try new_objects.append(objects.Object{ .RectangleChain = rectangle_chain });
                },
            }
        }

        return Self{
            .camera = consistent_state.camera,
            .world_id = world_id,
            .ball = new_ball,
            .objects = new_objects,
            .state = .Running,
            .selected_object = null,
        };
    }

    pub fn mouse_position(self: *const Self) Vector2 {
        return Vector2.from_rl_pos(rl.GetMousePosition())
            .sub(&Vector2.from_rl_pos(self.camera.offset));
    }

    pub fn handle_interactions(self: *Self) !?RuntimeCommand {
        if (rl.IsKeyPressed(rl.KEY_R)) {
            return RuntimeCommand.Reload;
        }

        if (rl.IsKeyPressed(rl.KEY_P)) {
            switch (self.state) {
                .Running => self.state = .Paused,
                .Paused => self.state = .Running,
            }
        }

        switch (self.state) {
            .Running => {},
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
                if (rl.IsMouseButtonDown(rl.MOUSE_BUTTON_MIDDLE)) {
                    const delta = rl.GetMouseDelta();
                    self.camera.offset.x += delta.x;
                    self.camera.offset.y += delta.y;
                }
            },
        }
        return null;
    }

    pub fn update(self: *Self, dt: f32) void {
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
            .Paused => {},
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

pub const Game = struct {
    allocator: Allocator,
    consistent_state: GameConsistentState,
    runtime_state: GameRuntimeState,

    const BALL_COLOR = rl.GREEN;
    const PLATFORM_SIZE = rl.Vector2{ .x = 100.0, .y = 20.0 };
    const PLATFORM_VELOCITY: f32 = 100.0;
    const PLATFORM_COLOR = rl.RED;

    const Self = @This();

    pub fn new(allocator: Allocator, screen_width: f32, screen_height: f32) !Self {
        const camera = rl.Camera2D{
            .offset = rl.Vector2{ .x = screen_width / 2.0, .y = screen_height / 2.0 },
            .target = rl.Vector2{ .x = 0.0, .y = 0.0 },
            .rotation = 0.0,
            .zoom = 1.0,
        };
        const ball_params = objects.BallParams{
            .position = Vector2{ .x = 240.0, .y = 100.0 },
            .radius = 10.0,
            .color = BALL_COLOR,
        };
        var objects_params = std.ArrayList(objects.ObjectParams).init(allocator);

        const platform = objects.RectangleParams{
            .position = Vector2{ .x = 0.0, .y = -100.0 },
            .point_1 = Vector2{ .x = -10.0, .y = 0.0 },
            .point_2 = Vector2{ .x = 10.0, .y = 0.0 },
            .width = 10.0,
            .height_offset = 1.0,
            .color = PLATFORM_COLOR,
        };
        try objects_params.append(objects.ObjectParams{ .Rectangle = platform });

        const arc = objects.ArcParams{
            .position = Vector2{ .x = -150.0, .y = -80.0 },
            .radius = 30.0,
            .color = rl.GOLD,
        };
        try objects_params.append(objects.ObjectParams{ .Arc = arc });

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
        const rect_chain = objects.RectangleChainParams{
            .position = Vector2{ .x = 0.0, .y = 0.0 },
            .points = points,
            .width = 10.0,
            .height_offset = 0.0,
            .color = rl.ORANGE,
        };
        try objects_params.append(objects.ObjectParams{ .RectangleChain = rect_chain });

        const anchor = objects.AnchorParams{
            .position = Vector2{ .x = 240.0, .y = 0.0 },
            .radius = 5.0,
            .color = rl.LIME,
        };
        try objects_params.append(objects.ObjectParams{ .Anchor = anchor });

        const consistent_state = GameConsistentState{
            .camera = camera,
            .ball_params = ball_params,
            .objects_params = objects_params,
        };
        const runtime_state = try GameRuntimeState.from_consistent_state(allocator, &consistent_state);

        return Self{
            .allocator = allocator,
            .consistent_state = consistent_state,
            .runtime_state = runtime_state,
        };
    }

    pub fn recreate(self: *Self) !void {
        const allocator = self.allocator;
        const consistent_state = self.consistent_state;

        self.runtime_state.deinit();
        const runtime_state = try GameRuntimeState.from_consistent_state(allocator, &consistent_state);

        self.* = Self{
            .allocator = allocator,
            .consistent_state = consistent_state,
            .runtime_state = runtime_state,
        };
    }

    pub fn deinit(self: *const Self) void {
        self.runtime_state.deinit();
        self.consistent_state.deinit();
    }

    pub fn update(self: *Self, dt: f32) !void {
        self.runtime_state.update(dt);
        if (try self.runtime_state.handle_interactions()) |command| {
            switch (command) {
                .Reload => try self.recreate(),
                .Add => |_| {},
            }
        }
    }

    pub fn draw(self: *const Self) void {
        self.runtime_state.draw();
    }
};

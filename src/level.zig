const std = @import("std");
const builtin = @import("builtin");
const rl = @import("raylib.zig");
const b2 = @import("box2d.zig");
const flecs = @import("flecs.zig");

const _game = @import("game.zig");
const Game = _game.Game;
const SensorEvents = _game.SensorEvents;
const UI_ELEMENT_WIDTH = _game.UI_ELEMENT_WIDTH;
const UI_ELEMENT_HEIGHT = _game.UI_ELEMENT_HEIGHT;

const _objects = @import("objects.zig");
const Object = _objects.Object;
const ObjectParams = _objects.ObjectParams;
const BallParams = _objects.BallParams;
const Ball = _objects.Ball;
const Anchor = _objects.Anchor;
const Rectangle = _objects.Rectangle;
const RectangleChain = _objects.RectangleChain;

const Vector2 = @import("vector.zig");
const Allocator = std.mem.Allocator;

pub const DEFAULT_LEVELS_PATH = "resources/levels";
pub const DEFAULT_SAVE_PATH = "resources/levels/save.json";

pub const EMSCRIPTEN_LEVEL_NAMES = [_][]const u8{
    "level_1.json",
};

fn draw_balls(balls: []const Ball) void {
    for (balls) |*ball| {
        ball.draw();
    }
}

fn draw_anchors(anchors: []const Anchor) void {
    for (anchors) |*anchor| {
        anchor.draw();
    }
}

fn draw_rectangles(rectangles: []const Rectangle) void {
    for (rectangles) |*rect| {
        rect.draw();
    }
}

fn draw_rectangle_chains(rc: []const RectangleChain) void {
    for (rc) |*r| {
        r.draw();
    }
}

fn draw_mouse_pos(iter: *flecs.iter_t) void {
    const mouse_pos = flecs.singleton_get(iter.world, MousePosition).?;
    rl.DrawCircleV(mouse_pos.position.to_rl_as_pos(), 2.0, rl.YELLOW);
}

fn draw_start(iter: *flecs.iter_t, balls: []const Ball) void {
    const game_camera = flecs.singleton_get_mut(iter.world, GameCamera).?;

    const ball = balls[0];
    const ball_pos = ball.get_position();
    const camera_pos = Vector2.from_rl_pos(game_camera.camera.target);
    const p = ball_pos.lerp(&camera_pos, iter.delta_time);
    game_camera.camera.target.y = p.to_rl_as_pos().y;

    rl.BeginMode2D(game_camera.camera);
}

fn draw_end(iter: *flecs.iter_t) void {
    _ = iter;
    rl.EndMode2D();
}

fn update_mouse_pos(iter: *flecs.iter_t) void {
    const game_camera = flecs.singleton_get(iter.world, GameCamera).?;
    const mouse_pos = flecs.singleton_get_mut(iter.world, MousePosition).?;

    mouse_pos.position = Vector2.from_rl_pos(
        rl.GetScreenToWorld2D(
            rl.GetMousePosition(),
            game_camera.camera,
        ),
    );
}

fn update_anchor(iter: *flecs.iter_t, balls: []const Ball, anchors: []Anchor) void {
    const ball = balls[0];
    const physics_world = flecs.singleton_get(iter.world, PhysicsWorld).?;
    const mouse_pos = flecs.singleton_get(iter.world, MousePosition).?;

    for (anchors) |*anchor| {
        const self_position = Vector2.from_b2(b2.b2Body_GetPosition(anchor.body_id));
        const ball_position = Vector2.from_b2(b2.b2Body_GetPosition(ball.body_id));

        if (rl.IsKeyDown(rl.KEY_SPACE)) {
            if (anchor.length_joint_id) |id| {
                b2.b2DestroyJoint(id);
                anchor.length_joint_id = null;
                anchor.attached_body_id = null;
            }
        } else {
            if (anchor.length_joint_id == null) {
                if (self_position.sub(&ball_position).length() < anchor.params.radius + ball.params.radius) {
                    var joint_def = b2.b2DefaultDistanceJointDef();
                    joint_def.bodyIdA = anchor.body_id;
                    joint_def.bodyIdB = ball.body_id;
                    joint_def.length = 0.0;
                    joint_def.minLength = anchor.params.min_length;
                    joint_def.maxLength = anchor.params.max_length;
                    joint_def.dampingRatio = anchor.params.damping_ratio;
                    joint_def.hertz = anchor.params.hertz;

                    const joint_id = b2.b2CreateDistanceJoint(physics_world.*.id, &joint_def);
                    anchor.length_joint_id = joint_id;
                    anchor.attached_body_id = ball.body_id;
                }
            } else {
                if (rl.IsMouseButtonDown(rl.MOUSE_BUTTON_LEFT)) {
                    const to_mouse = mouse_pos.position
                        .sub(&self_position)
                        .normalized()
                        .mul(anchor.params.pull_force);
                    b2.b2Body_SetLinearVelocity(ball.body_id, to_mouse.to_b2());
                }
            }
        }
    }
}

pub const GameCamera = struct {
    camera: rl.Camera2D,
};

pub const PhysicsWorld = struct {
    id: b2.b2WorldId,
};

pub const MousePosition = struct {
    position: Vector2,
};

pub const LevelSave = struct {
    objects: []ObjectParams,
    initial_ball_params: BallParams,
};

pub const Level = struct {
    ecs_world: *flecs.world_t,
    physics_world: b2.b2WorldId,

    const Self = @This();

    pub fn default(allocator: Allocator) Self {
        _ = allocator;

        var physics_world_def = b2.b2DefaultWorldDef();
        physics_world_def.gravity = b2.b2Vec2{ .x = 0, .y = -100 };
        const physics_world = b2.b2CreateWorld(&physics_world_def);

        const ecs_world = flecs.init();

        flecs.COMPONENT(ecs_world, Ball);
        flecs.COMPONENT(ecs_world, Anchor);
        flecs.COMPONENT(ecs_world, Rectangle);
        flecs.COMPONENT(ecs_world, RectangleChain);

        // flecs.COMPONENT(ecs_world, flecs.EcsRest);
        flecs.COMPONENT(ecs_world, GameCamera);
        flecs.COMPONENT(ecs_world, PhysicsWorld);
        flecs.COMPONENT(ecs_world, MousePosition);

        flecs.ADD_SYSTEM(ecs_world, "update_mouse_pos", flecs.PreUpdate, update_mouse_pos);
        flecs.ADD_SYSTEM(ecs_world, "draw_start", flecs.PreUpdate, draw_start);
        flecs.ADD_SYSTEM(ecs_world, "draw_balls", flecs.OnUpdate, draw_balls);
        flecs.ADD_SYSTEM(ecs_world, "draw_anchors", flecs.OnUpdate, draw_anchors);
        flecs.ADD_SYSTEM(ecs_world, "draw_rectangles", flecs.OnUpdate, draw_rectangles);
        flecs.ADD_SYSTEM(ecs_world, "draw_rectangle_chains", flecs.OnUpdate, draw_rectangle_chains);
        flecs.ADD_SYSTEM(ecs_world, "draw_mouse_pos", flecs.OnUpdate, draw_mouse_pos);
        flecs.ADD_SYSTEM(ecs_world, "update_anchor", flecs.OnUpdate, update_anchor);
        flecs.ADD_SYSTEM(ecs_world, "draw_end", flecs.PostUpdate, draw_end);

        const camera = rl.Camera2D{
            .offset = rl.Vector2{
                .x = 1280.0 / 2.0,
                .y = 720.0 / 2.0,
            },
            .target = rl.Vector2{ .x = 0.0, .y = 0.0 },
            .rotation = 0.0,
            .zoom = 1.0,
        };
        // _ = flecs.singleton_set(ecs_world, flecs.EcsRest, .{});
        _ = flecs.singleton_set(ecs_world, GameCamera, .{ .camera = camera });
        _ = flecs.singleton_set(ecs_world, PhysicsWorld, .{ .id = physics_world });
        _ = flecs.singleton_set(ecs_world, MousePosition, .{ .position = Vector2.ZERO });

        return Self{
            .ecs_world = ecs_world,
            .physics_world = physics_world,
        };
    }

    pub fn deinit(self: *const Self) void {
        b2.b2DestroyWorld(self.physics_world);
        _ = flecs.fini(self.ecs_world);
    }

    fn from_safe(allocator: Allocator, level_save: *const LevelSave) !Self {
        const self = Self.default(allocator);

        const b = flecs.new_id(self.ecs_world);
        _ = flecs.set(self.ecs_world, b, Ball, Ball.new(self.physics_world, level_save.initial_ball_params));

        for (level_save.objects) |*obj| {
            switch (obj.*) {
                .Anchor => |r| {
                    const n = flecs.new_id(self.ecs_world);
                    _ = flecs.set(self.ecs_world, n, Anchor, Anchor.new(self.physics_world, r));
                },
                .Rectangle => |r| {
                    const n = flecs.new_id(self.ecs_world);
                    _ = flecs.set(self.ecs_world, n, Rectangle, try Rectangle.new(self.physics_world, r));
                },
                .RectangleChain => |r| {
                    const n = flecs.new_id(self.ecs_world);
                    _ = flecs.set(self.ecs_world, n, RectangleChain, try RectangleChain.new(self.physics_world, allocator, r));
                },
                else => {},
            }
        }

        return self;
    }

    pub fn update(self: *Self, dt: f32) void {
        // const sensor_events = SensorEvents.new(self.world_id);

        b2.b2World_Step(self.physics_world, dt, 4);
        _ = flecs.progress(self.ecs_world, dt);
    }

    pub fn recreate(self: *Self) !void {
        _ = self;
        // for (self.objects.items) |*object| {
        //     try object.recreate(world_id);
        // }
        // self.ball.recreate(world_id);
    }

    pub fn save(self: *const Self, allocator: Allocator, path: []const u8) !void {
        _ = path;
        _ = allocator;
        _ = self;
        // const save_path = std.mem.sliceTo(path, 0);
        //
        // std.log.debug("Saving level to: {s}", .{save_path});
        //
        // var file = try std.fs.cwd().createFile(save_path, .{});
        // defer file.close();
        //
        // const objects_params = try allocator.alloc(ObjectParams, self.objects.items.len);
        // for (self.objects.items, objects_params) |*item, *param| {
        //     param.* = try item.params(allocator);
        // }
        // defer {
        //     for (objects_params) |*p| {
        //         switch (p.*) {
        //             .RectangleChain => |*rc| rc.deinit(allocator),
        //             else => {},
        //         }
        //     }
        //     allocator.free(objects_params);
        // }
        //
        // const save_state = LevelSave{
        //     .objects = objects_params,
        //     .initial_ball_params = self.initial_ball_params,
        // };
        //
        // const options = std.json.StringifyOptions{
        //     .whitespace = .indent_4,
        // };
        //
        // try std.json.stringify(save_state, options, file.writer());
    }

    pub fn load(allocator: Allocator, path: []const u8) !Self {
        std.log.debug("Loading level from path: {s}", .{path});

        var file = try std.fs.cwd().openFile(path, .{});
        defer file.close();

        const file_data = try file.readToEndAlloc(allocator, 1024 * 1024 * 1024);
        defer allocator.free(file_data);

        const save_state = try std.json.parseFromSlice(LevelSave, allocator, file_data, .{});
        defer save_state.deinit();

        return try Self.from_safe(allocator, &save_state.value);
    }
};

pub const Levels = struct {
    allocator: Allocator,
    levels: std.ArrayList(Self.LevelInfo),
    level_names_list: std.ArrayList(*const u8),

    scroll_index: i32 = 0,
    active: i32 = 0,
    focus: i32 = 0,

    const LevelInfo = struct {
        name: [:0]const u8,
        path: []const u8,

        fn init(allocator: Allocator, name: []const u8) !LevelInfo {
            return LevelInfo{
                .name = try allocator.dupeZ(u8, name),
                .path = try std.fs.path.join(allocator, &.{ DEFAULT_LEVELS_PATH, name }),
            };
        }

        fn deinit(self: *const LevelInfo, allocator: Allocator) void {
            allocator.free(self.name);
            allocator.free(self.path);
        }

        fn cmp(context: void, a: LevelInfo, b: LevelInfo) bool {
            _ = context;
            const min_len = @min(a.name.len, b.name.len);
            for (a.name[0..min_len], b.name[0..min_len]) |a_char, b_char| {
                if (a_char == b_char) {
                    continue;
                } else {
                    if (a_char < b_char) {
                        return true;
                    } else {
                        return false;
                    }
                }
            }
            return false;
        }
    };

    const Self = @This();

    pub fn init(allocator: Allocator) !Self {
        const levels = std.ArrayList(Self.LevelInfo).init(allocator);
        const level_names_list = std.ArrayList(*const u8).init(allocator);
        return Self{
            .allocator = allocator,
            .levels = levels,
            .level_names_list = level_names_list,
        };
    }

    pub fn deinit(self: *Self) void {
        for (self.levels.items) |level_info| {
            level_info.deinit(self.allocator);
        }
        self.levels.deinit();
        self.level_names_list.deinit();
    }

    pub fn scan(self: *Self) !void {
        for (self.levels.items) |level_info| {
            level_info.deinit(self.allocator);
        }
        self.levels.clearRetainingCapacity();
        self.level_names_list.clearRetainingCapacity();

        if (builtin.os.tag == .emscripten) {
            for (EMSCRIPTEN_LEVEL_NAMES) |level_name| {
                const level_info = try LevelInfo.init(self.allocator, level_name);
                try self.levels.append(level_info);
            }
        } else {
            const levels_dir = try std.fs.cwd().openDir(DEFAULT_LEVELS_PATH, .{ .iterate = true });
            var iterator = levels_dir.iterate();
            while (try iterator.next()) |entry| {
                if (entry.kind == .file) {
                    if (std.mem.endsWith(u8, entry.name, ".json")) {
                        const level_info = try LevelInfo.init(self.allocator, entry.name);
                        try self.levels.append(level_info);
                    }
                }
            }
        }

        std.sort.heap(LevelInfo, self.levels.items, {}, LevelInfo.cmp);
        for (self.levels.items) |level_info| {
            try self.level_names_list.append(@ptrCast(level_info.name.ptr));
        }

        for (self.levels.items) |level_info| {
            std.log.debug(
                "found level: name: {s}, path: {s}",
                .{
                    level_info.name,
                    level_info.path,
                },
            );
        }
    }

    pub fn draw(self: *Self, game: *Game) !void {
        var rectangle = rl.Rectangle{
            .x = @as(f32, @floatFromInt(game.settings.resolution_width)) / 2.0 - UI_ELEMENT_WIDTH / 2.0,
            .y = @as(f32, @floatFromInt(game.settings.resolution_height)) / 2.0 - UI_ELEMENT_HEIGHT * 2.0,
            .width = UI_ELEMENT_WIDTH,
            .height = UI_ELEMENT_HEIGHT * 2.0,
        };

        _ = rl.GuiListViewEx(
            rectangle,
            @ptrCast(self.level_names_list.items.ptr),
            @intCast(self.level_names_list.items.len),
            &self.scroll_index,
            &self.active,
            &self.focus,
        );

        rectangle.y += UI_ELEMENT_HEIGHT * 3.0;
        rectangle.height = UI_ELEMENT_HEIGHT;
        const load = rl.GuiButton(
            rectangle,
            "Load",
        );
        if (load != 0) {
            if (self.active != -1) {
                const i: usize = @intCast(self.active);
                try game.load(self.levels.items[i].path);
            }
        }

        rectangle.y += UI_ELEMENT_HEIGHT;
        const main_menu = rl.GuiButton(
            rectangle,
            "Main menu",
        );
        if (main_menu != 0) {
            game.state_stack.pop_state();
        }
    }
};

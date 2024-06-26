const std = @import("std");

const rl = @import("deps/raylib.zig");
const b2 = @import("deps/box2d.zig");
const flecs = @import("deps/flecs.zig");

const WORLD = flecs.SYSTEM_PARAMETER_WORLD;
const STATIC = flecs.SYSTEM_PARAMETER_STATIC;
const SINGLETON = flecs.SYSTEM_PARAMETER_SINGLETON;
const SINGLETON_MUT = flecs.SYSTEM_PARAMETER_SINGLETON_MUT;
const COMPONENT_ID = flecs.SYSTEM_PARAMETER_COMPONENT_ID;

const __game = @import("game.zig");
const LevelTimer = __game.LevelTimer;
const GameStateStack = __game.GameStateStack;
const PhysicsWorld = __game.PhysicsWorld;

const __ui = @import("ui.zig");
const UI_ELEMENT_WIDTH = __ui.UI_ELEMENT_WIDTH;
const UI_ELEMENT_HEIGHT = __ui.UI_ELEMENT_HEIGHT;

const __objects = @import("objects.zig");
const ObjectParams = __objects.ObjectParams;

const Color = __objects.Color;
const BodyId = __objects.BodyId;
const Position = __objects.Position;

const create_text = __objects.create_text;
const TextText = __objects.TextText;
const TextParams = __objects.TextParams;

const create_spawner = __objects.create_spawner;
const SpawnerTag = __objects.SpawnerTag;
const SpawnerParams = __objects.SpawnerParams;

const create_ball = __objects.create_ball;
const BallTag = __objects.BallTag;
const BallShape = __objects.BallShape;
const BallParams = __objects.BallParams;
const BallAttachment = __objects.BallAttachment;

const create_anchor = __objects.create_anchor;
const AnchorShape = __objects.AnchorShape;
const AnchorParams = __objects.AnchorParams;
const AnchoraJointParams = __objects.AnchoraJointParams;

const JointTag = __objects.JointTag;

const create_rectangle = __objects.create_rectangle;
const RectangleShape = __objects.RectangleShape;
const RectangleParams = __objects.RectangleParams;

const Settings = @import("settings.zig").Settings;

const Vector2 = @import("vector.zig");
const Allocator = std.mem.Allocator;

pub const DEFAULT_LEVEL_GROUPS_PATH = "resources/level_groups.json";
pub const DEFAULT_LEVELS_PATH = "resources/levels";
pub const DEFAULT_SAVE_PATH = "resources/levels/save.json";

pub const LevelObject = struct {
    destruction_order: usize,
};

pub const LevelMetadata = struct {
    name: [:0]const u8,
    path: []const u8,
    best_time: ?f32,
    locked: bool,

    const Self = @This();

    pub fn clone(self: *const Self, allocator: Allocator) !Self {
        const name = try allocator.dupeZ(u8, self.name);
        const path = try allocator.dupe(u8, self.path);
        return .{
            .name = name,
            .path = path,
            .best_time = self.best_time,
            .locked = self.locked,
        };
    }

    pub fn deinit(self: *const Self, allocator: Allocator) void {
        allocator.free(self.name);
        allocator.free(self.path);
    }
};

pub const LevelGroup = struct {
    name: [:0]const u8,
    locked: bool,
    levels: []LevelMetadata,

    const Self = @This();

    pub fn clone(self: *const Self, allocator: Allocator) !Self {
        const name = try allocator.dupeZ(u8, self.name);
        const levels = try allocator.alloc(LevelMetadata, self.levels.len);
        for (self.levels, levels) |*sl, *l| {
            l.* = try sl.clone(allocator);
        }
        return .{
            .name = name,
            .locked = self.locked,
            .levels = levels,
        };
    }

    pub fn deinit(self: *const Self, allocator: Allocator) void {
        allocator.free(self.name);
        for (self.levels) |*level| {
            level.deinit(allocator);
        }
        allocator.free(self.levels);
    }
};

pub const LevelGroupsSave = struct {
    groups: []LevelGroup,
};

pub const LevelSave = struct {
    objects: []ObjectParams,
};

pub const LevelState = struct {
    load_path: ?[]const u8 = null,
    save_path: ?[]const u8 = null,
    need_to_clean: bool = false,
    need_to_restart: bool = false,
};

pub const Levels = struct {
    allocator: Allocator,
    level_groups: std.ArrayList(LevelGroup),
    active_level: ?usize = null,

    const Self = @This();

    pub fn init(allocator: Allocator) !Self {
        const levels_groups = std.ArrayList(LevelGroup).init(allocator);

        return Self{
            .allocator = allocator,
            .level_groups = levels_groups,
        };
    }

    pub fn deinit(self: *Self) void {
        for (self.level_groups.items) |*group| {
            group.deinit(self.allocator);
        }
        self.level_groups.deinit();
    }

    pub fn reload(self: *Self) !void {
        var file = try std.fs.cwd().openFile(DEFAULT_LEVEL_GROUPS_PATH, .{});
        defer file.close();

        const file_data = try file.readToEndAlloc(self.allocator, 1024 * 1024 * 1024);
        defer self.allocator.free(file_data);

        const level_groups = try std.json.parseFromSlice(LevelGroupsSave, self.allocator, file_data, .{});
        defer level_groups.deinit();

        const data = &level_groups.value;

        for (self.level_groups.items) |*group| {
            group.deinit(self.allocator);
        }
        self.level_groups.clearRetainingCapacity();
        try self.level_groups.resize(data.groups.len);

        for (self.level_groups.items, data.groups) |*i, *g| {
            i.* = try g.clone(self.allocator);
        }
    }

    pub fn save(self: *const Self) !void {
        const save_state = LevelGroupsSave{
            .groups = self.level_groups.items,
        };

        var file = try std.fs.cwd().openFile(DEFAULT_LEVEL_GROUPS_PATH, .{ .mode = .write_only });
        defer file.close();

        const options = std.json.StringifyOptions{
            .whitespace = .indent_4,
        };
        try std.json.stringify(save_state, options, file.writer());
    }

    pub fn active_level_metadata(self: *const Self) ?*LevelMetadata {
        if (self.active_level) |a| {
            return &self.level_groups.items[0].levels[a];
        } else {
            return null;
        }
    }

    pub fn finish_active_level(self: *Self) void {
        _ = self;
        // const al = self.active_level().?;
        // for (al.unlocks) |level_to_unlock| {
        //     for (self.levels_metadata.items) |*meta| {
        //         if (std.mem.eql(u8, meta.name, level_to_unlock)) {
        //             meta.locked = false;
        //         }
        //     }
        // }
    }
};

pub fn load_level(
    _world: WORLD(),
    _allocator: SINGLETON(Allocator),
    _physical_world: SINGLETON(PhysicsWorld),
    _state_stack: SINGLETON_MUT(GameStateStack),
    _level_state: SINGLETON_MUT(LevelState),
    _: COMPONENT_ID(&flecs.Wildcard, .{
        .inout = .Out,
        .src = .{ .flags = flecs.IsEntity, .id = 0 },
    }),
) void {
    const world = _world.get_mut();
    const allocator = _allocator.get();
    const physics_world = _physical_world.get();
    const state_stack = _state_stack.get_mut();
    const level_state = _level_state.get_mut();

    if (level_state.load_path == null) {
        return;
    }

    const path = level_state.load_path.?;
    level_state.load_path = null;

    std.log.debug("Loading level from path: {s}", .{path});

    var file = std.fs.cwd().openFile(path, .{}) catch {
        state_stack.push_state(.Exit);
        return;
    };
    defer file.close();

    const file_data = file.readToEndAlloc(allocator.*, 1024 * 1024 * 1024) catch {
        state_stack.push_state(.Exit);
        return;
    };
    defer allocator.free(file_data);

    const save_state = std.json.parseFromSlice(LevelSave, allocator.*, file_data, .{}) catch {
        state_stack.push_state(.Exit);
        return;
    };
    defer save_state.deinit();

    const level_save = &save_state.value;

    for (level_save.objects) |*obj| {
        switch (obj.*) {
            .Text => |*r| {
                create_text(world, r);
            },
            .Spawner => |*r| {
                create_spawner(world, r);
            },
            .Ball => |*r| {
                create_ball(world, physics_world.id, r);
            },
            .Anchor => |*r| {
                create_anchor(world, physics_world.id, r);
            },
            .Rectangle => |*r| {
                create_rectangle(world, physics_world.id, r) catch {
                    state_stack.push_state(.Exit);
                    return;
                };
            },
        }
    }

    state_stack.push_state(.LevelLoaded);
}

const StartLevelCtx = struct {
    ball_query: *flecs.query_t,
    spawner_query: *flecs.query_t,

    const Self = @This();
    pub fn init(world: *flecs.world_t) !Self {
        var ball_query: flecs.query_desc_t = .{};
        ball_query.filter.terms[0].inout = .In;
        ball_query.filter.terms[0].id = flecs.id(BodyId);
        ball_query.filter.terms[1].inout = .In;
        ball_query.filter.terms[1].id = flecs.id(BallTag);
        const bq = try flecs.query_init(world, &ball_query);

        var spawner_query: flecs.query_desc_t = .{};
        spawner_query.filter.terms[0].inout = .In;
        spawner_query.filter.terms[0].id = flecs.id(Position);
        spawner_query.filter.terms[1].inout = .In;
        spawner_query.filter.terms[1].id = flecs.id(SpawnerTag);
        const sq = try flecs.query_init(world, &spawner_query);

        return .{
            .ball_query = bq,
            .spawner_query = sq,
        };
    }
};
pub fn start_level(
    _world: WORLD(),
    _ctx: STATIC(StartLevelCtx),
    _state_stack: SINGLETON_MUT(GameStateStack),
    _timer: SINGLETON_MUT(LevelTimer),
) void {
    const world = _world.get_mut();
    const ctx = _ctx.get();
    const state_stack = _state_stack.get_mut();
    const timer = _timer.get_mut();

    if (state_stack.current_state() != .LevelLoaded) {
        return;
    }

    const ball_query: *flecs.query_t = ctx.ball_query;
    var ball_iter = flecs.query_iter(world, ball_query);
    std.debug.assert(flecs.query_next(&ball_iter));
    const ball_body = flecs.field(&ball_iter, BodyId, 1).?[0];
    std.debug.assert(!flecs.query_next(&ball_iter));

    const spawner_query: *flecs.query_t = ctx.spawner_query;
    var spawner_iter = flecs.query_iter(world, spawner_query);
    std.debug.assert(flecs.query_next(&spawner_iter));
    const spawner_position = flecs.field(&spawner_iter, Position, 1).?[0];
    std.debug.assert(!flecs.query_next(&spawner_iter));

    b2.b2Body_SetTransform(ball_body.id, spawner_position.value.to_b2(), 0.0);
    timer.time = 0.0;

    state_stack.pop_state();
    state_stack.push_state(.Running);
}

const CleanLevelCtx = struct {
    level_objects_query: *flecs.query_t,

    const Self = @This();
    pub fn init(world: *flecs.world_t) !Self {
        var level_objects_query: flecs.query_desc_t = .{};
        level_objects_query.filter.terms[0].inout = .InOutNone;
        level_objects_query.filter.terms[0].id = flecs.id(LevelObject);
        level_objects_query.order_by_component = flecs.id(LevelObject);
        level_objects_query.order_by = &Self.sort;
        const q = try flecs.query_init(world, &level_objects_query);

        return .{
            .level_objects_query = q,
        };
    }

    fn sort(
        e1: flecs.entity_t,
        ptr1: *const anyopaque,
        e2: flecs.entity_t,
        ptr2: *const anyopaque,
    ) callconv(.C) i32 {
        _ = e2;
        _ = e1;
        const lo_1: *const LevelObject = @alignCast(@ptrCast(ptr1));
        const lo_2: *const LevelObject = @alignCast(@ptrCast(ptr2));
        return @as(i32, @intFromBool(lo_1.destruction_order > lo_2.destruction_order)) -
            @as(i32, @intFromBool(lo_1.destruction_order < lo_2.destruction_order));
    }
};
pub fn clean_level(
    _world: WORLD(),
    _ctx: STATIC(CleanLevelCtx),
    _level_state: SINGLETON_MUT(LevelState),
) void {
    const world = _world.get_mut();
    const ctx = _ctx.get();
    const level_state = _level_state.get_mut();

    if (!level_state.need_to_clean) {
        return;
    }

    level_state.need_to_clean = false;

    var level_object_iter = flecs.query_iter(world, ctx.level_objects_query);
    while (flecs.query_next(&level_object_iter)) {
        std.log.info("cleaning the level. Deleting {} entities", .{level_object_iter.entities().len});

        for (level_object_iter.entities()) |e| {
            flecs.delete(world, e);
        }
    }
}

const RecreateLevelCtx = struct {
    ball_query: *flecs.query_t,
    joint_query: *flecs.query_t,

    const Self = @This();
    pub fn init(world: *flecs.world_t) !Self {
        var ball_query: flecs.query_desc_t = .{};
        ball_query.filter.terms[0].inout = .In;
        ball_query.filter.terms[0].id = flecs.id(BodyId);
        ball_query.filter.terms[1].inout = .InOut;
        ball_query.filter.terms[1].id = flecs.id(BallAttachment);
        const bq = try flecs.query_init(world, &ball_query);

        var joint_query: flecs.query_desc_t = .{};
        joint_query.filter.terms[0].inout = .In;
        joint_query.filter.terms[0].id = flecs.id(JointTag);
        const jq = try flecs.query_init(world, &joint_query);

        return .{
            .ball_query = bq,
            .joint_query = jq,
        };
    }
};
pub fn recreate_level(
    _world: WORLD(),
    _ctx: STATIC(RecreateLevelCtx),
    _level_state: SINGLETON_MUT(LevelState),
    _state_stack: SINGLETON_MUT(GameStateStack),
) void {
    const world = _world.get_mut();
    const ctx = _ctx.get();
    const level_state = _level_state.get_mut();
    const state_stack = _state_stack.get_mut();

    if (!level_state.need_to_restart) {
        return;
    }

    level_state.need_to_restart = false;

    const joint_query: *flecs.query_t = ctx.joint_query;
    var joint_iter = flecs.query_iter(world, joint_query);
    while (flecs.query_next(&joint_iter)) {
        for (joint_iter.entities()) |e| {
            _ = flecs.delete(world, e);
        }
    }

    const ball_query: *flecs.query_t = ctx.ball_query;
    var ball_iter = flecs.query_iter(world, ball_query);
    std.debug.assert(flecs.query_next(&ball_iter));
    const ball_body_id = &flecs.field(&ball_iter, BodyId, 1).?[0];
    var ball_attachment = &flecs.field(&ball_iter, BallAttachment, 2).?[0];
    std.debug.assert(!flecs.query_next(&ball_iter));

    b2.b2Body_SetLinearVelocity(ball_body_id.id, Vector2.ZERO.to_b2());
    ball_attachment.attached = false;

    state_stack.pop_state();
    state_stack.push_state(.LevelLoaded);
}

pub const SaveLevelCtx = struct {
    text_query: *flecs.query_t,
    spawner_query: *flecs.query_t,
    ball_query: *flecs.query_t,
    anchor_query: *flecs.query_t,
    rectangle_query: *flecs.query_t,

    const Self = @This();
    pub fn init(world: *flecs.world_t) !Self {
        var text_query: flecs.query_desc_t = .{};
        text_query.filter.terms[0].inout = .In;
        text_query.filter.terms[0].id = flecs.id(Color);
        text_query.filter.terms[1].inout = .In;
        text_query.filter.terms[1].id = flecs.id(Position);
        text_query.filter.terms[2].inout = .In;
        text_query.filter.terms[2].id = flecs.id(TextText);
        const tq = try flecs.query_init(world, &text_query);

        var spawner_query: flecs.query_desc_t = .{};
        spawner_query.filter.terms[0].inout = .In;
        spawner_query.filter.terms[0].id = flecs.id(Position);
        spawner_query.filter.terms[1].inout = .In;
        spawner_query.filter.terms[1].id = flecs.id(SpawnerTag);
        const sq = try flecs.query_init(world, &spawner_query);

        var ball_query: flecs.query_desc_t = .{};
        ball_query.filter.terms[0].inout = .In;
        ball_query.filter.terms[0].id = flecs.id(Color);
        ball_query.filter.terms[1].inout = .In;
        ball_query.filter.terms[1].id = flecs.id(BallShape);
        const bq = try flecs.query_init(world, &ball_query);

        var anchor_query: flecs.query_desc_t = .{};
        anchor_query.filter.terms[0].inout = .In;
        anchor_query.filter.terms[0].id = flecs.id(Color);
        anchor_query.filter.terms[1].inout = .In;
        anchor_query.filter.terms[1].id = flecs.id(Position);
        anchor_query.filter.terms[2].inout = .In;
        anchor_query.filter.terms[2].id = flecs.id(AnchorShape);
        anchor_query.filter.terms[3].inout = .In;
        anchor_query.filter.terms[3].id = flecs.id(AnchoraJointParams);
        const aq = try flecs.query_init(world, &anchor_query);

        var rectangle_query: flecs.query_desc_t = .{};
        rectangle_query.filter.terms[0].inout = .In;
        rectangle_query.filter.terms[0].id = flecs.id(Color);
        rectangle_query.filter.terms[1].inout = .In;
        rectangle_query.filter.terms[1].id = flecs.id(Position);
        rectangle_query.filter.terms[2].inout = .In;
        rectangle_query.filter.terms[2].id = flecs.id(RectangleShape);
        const rq = try flecs.query_init(world, &rectangle_query);

        return .{
            .text_query = tq,
            .spawner_query = sq,
            .ball_query = bq,
            .anchor_query = aq,
            .rectangle_query = rq,
        };
    }
};
pub fn save_level(
    _world: WORLD(),
    _ctx: STATIC(SaveLevelCtx),
    _allocator: SINGLETON(Allocator),
    _level_state: SINGLETON_MUT(LevelState),
    _state_stack: SINGLETON_MUT(GameStateStack),
) void {
    const world = _world.get_mut();
    const ctx = _ctx.get();
    const allocator = _allocator.get();
    const level_state = _level_state.get_mut();
    const state_stack = _state_stack.get_mut();

    if (level_state.save_path == null) {
        return;
    }

    const path = level_state.save_path.?;
    level_state.save_path = null;

    std.log.debug("Saving level to path: {s}", .{path});

    var objects_params = std.ArrayList(ObjectParams).init(allocator.*);
    defer objects_params.deinit();

    const text_query: *flecs.query_t = @ptrCast(ctx.text_query);
    var text_iter = flecs.query_iter(world, text_query);
    while (flecs.query_next(&text_iter)) {
        const colors = flecs.field(&text_iter, Color, 1).?;
        const positions = flecs.field(&text_iter, Position, 2).?;
        const texts = flecs.field(&text_iter, TextText, 3).?;
        for (colors, positions, texts) |*color, *position, *text| {
            const params = TextParams.new(position, color, text);
            objects_params.append(.{ .Text = params }) catch {
                state_stack.push_state(.Exit);
                return;
            };
        }
    }

    const spawner_query: *flecs.query_t = @ptrCast(ctx.spawner_query);
    var spawner_iter = flecs.query_iter(world, spawner_query);
    while (flecs.query_next(&spawner_iter)) {
        const positions = flecs.field(&spawner_iter, Position, 1).?;
        for (positions) |*position| {
            const params = SpawnerParams.new(position);
            objects_params.append(.{ .Spawner = params }) catch {
                state_stack.push_state(.Exit);
                return;
            };
        }
    }

    const ball_query: *flecs.query_t = @ptrCast(ctx.ball_query);
    var ball_iter = flecs.query_iter(world, ball_query);
    while (flecs.query_next(&ball_iter)) {
        const colors = flecs.field(&ball_iter, Color, 1).?;
        const shapes = flecs.field(&ball_iter, BallShape, 2).?;
        for (colors, shapes) |*color, *shape| {
            const params = BallParams.new(color, shape);
            objects_params.append(.{ .Ball = params }) catch {
                state_stack.push_state(.Exit);
                return;
            };
        }
    }

    const anchor_query: *flecs.query_t = @ptrCast(ctx.anchor_query);
    var anchor_iter = flecs.query_iter(world, anchor_query);
    while (flecs.query_next(&anchor_iter)) {
        const colors = flecs.field(&anchor_iter, Color, 1).?;
        const positions = flecs.field(&anchor_iter, Position, 2).?;
        const shapes = flecs.field(&anchor_iter, AnchorShape, 3).?;
        const joint_params = flecs.field(&anchor_iter, AnchoraJointParams, 4).?;
        for (colors, positions, shapes, joint_params) |*color, *position, *shape, *joint_param| {
            const params = AnchorParams.new(color, position, shape, joint_param);
            objects_params.append(.{ .Anchor = params }) catch {
                state_stack.push_state(.Exit);
                return;
            };
        }
    }

    const rectangle_query: *flecs.query_t = @ptrCast(ctx.rectangle_query);
    var rectangle_iter = flecs.query_iter(world, rectangle_query);
    while (flecs.query_next(&rectangle_iter)) {
        const colors = flecs.field(&rectangle_iter, Color, 1).?;
        const positions = flecs.field(&rectangle_iter, Position, 2).?;
        const shapes = flecs.field(&rectangle_iter, RectangleShape, 3).?;
        for (colors, positions, shapes) |*color, *position, *shape| {
            const params = RectangleParams.new(color, position, shape);
            objects_params.append(.{ .Rectangle = params }) catch {
                state_stack.push_state(.Exit);
                return;
            };
        }
    }

    const save_state = LevelSave{
        .objects = objects_params.items,
    };

    var file = std.fs.cwd().createFile(path, .{}) catch {
        state_stack.push_state(.Exit);
        return;
    };
    defer file.close();

    const options = std.json.StringifyOptions{
        .whitespace = .indent_4,
    };
    std.json.stringify(save_state, options, file.writer()) catch {
        state_stack.push_state(.Exit);
        return;
    };
}

pub fn FLECS_INIT_COMPONENTS(world: *flecs.world_t, allocator: Allocator) !void {
    flecs.COMPONENT(world, Levels);
    flecs.COMPONENT(world, LevelState);
    flecs.COMPONENT(world, LevelObject);

    const levels = try Levels.init(allocator);
    _ = flecs.singleton_set(world, Levels, levels);
    _ = flecs.singleton_set(world, LevelState, .{});
}

pub fn FLECS_INIT_SYSTEMS(world: *flecs.world_t, allocator: Allocator) !void {
    _ = allocator;
    flecs.ADD_SYSTEM(world, "clean_level", flecs.PreFrame, clean_level);
    flecs.ADD_SYSTEM(world, "start_level", flecs.PreFrame, start_level);
    flecs.ADD_SYSTEM(world, "load_level", flecs.PreFrame, load_level);
    flecs.ADD_SYSTEM(world, "recreate_level", flecs.PreFrame, recreate_level);
    flecs.ADD_SYSTEM(world, "save_level", flecs.PreFrame, save_level);
}

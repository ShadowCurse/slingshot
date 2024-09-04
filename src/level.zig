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
const GameState = __game.GameState;
const PhysicsWorld = __game.PhysicsWorld;

const __ui = @import("ui.zig");
const UI_ELEMENT_WIDTH = __ui.UI_ELEMENT_WIDTH;
const UI_ELEMENT_HEIGHT = __ui.UI_ELEMENT_HEIGHT;

const __objects = @import("objects.zig");

const Color = __objects.Color;
const BodyId = __objects.BodyId;
const Position = __objects.Position;

const TextText = __objects.TextText;
const TextBundle = __objects.TextBundle;

const SpawnerTag = __objects.SpawnerTag;
const SpawnerBundle = __objects.SpawnerBundle;

const BallTag = __objects.BallTag;
const BallShape = __objects.BallShape;
const BallBundle = __objects.BallBundle;
const BallAttachment = __objects.BallAttachment;

const AnchorShape = __objects.AnchorShape;
const AnchorBundle = __objects.AnchorBundle;
const AnchoraJointParams = __objects.AnchoraJointParams;

const JointTag = __objects.JointTag;

const PortalShape = __objects.PortalShape;
const PortalId = __objects.PortalId;
const PortalTarget = __objects.PortalTarget;
const PortalBundle = __objects.PortalBundle;

const BlackHoleShape = __objects.BlackHoleShape;
const BlackHoleStrength = __objects.BlackHoleStrength;
const BlackHoleBundle = __objects.BlackHoleBundle;

const RectangleShape = __objects.RectangleShape;
const RectangleBundle = __objects.RectangleBundle;

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

pub fn NewLevelSave(comptime T: type) type {
    const type_info = @typeInfo(T);
    const fields = type_info.Struct.fields;
    var new_fields: [fields.len]std.builtin.Type.StructField = undefined;

    inline for (fields, 0..) |field, i| {
        new_fields[i] = .{
            .name = @typeName(field.type),
            .type = []field.type.Save,
            .default_value = null,
            .is_comptime = false,
            .alignment = @alignOf([]field.type.Save),
        };
    }

    return @Type(.{
        .Struct = .{
            .layout = .auto,
            .fields = new_fields[0..],
            .decls = &[_]std.builtin.Type.Declaration{},
            .is_tuple = false,
        },
    });
}

const LevelSave = NewLevelSave(struct {
    TextBundle,
    SpawnerBundle,
    BallBundle,
    AnchorBundle,
    PortalBundle,
    BlackHoleBundle,
    RectangleBundle,
});

pub const LevelState = struct {
    load_path: ?[]const u8 = null,
    save_path: ?[]const u8 = null,
    need_to_clean: bool = false,
    need_to_restart: bool = false,
};

pub const Levels = struct {
    allocator: Allocator,
    level_groups: std.ArrayList(LevelGroup),
    active_group: ?usize = null,
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
        if (self.active_group) |ag| {
            if (self.active_level) |al| {
                return &self.level_groups.items[ag].levels[al];
            } else {
                return null;
            }
        } else {
            return null;
        }
    }
};

pub fn load_level(
    _world: WORLD(),
    _allocator: SINGLETON(Allocator),
    _game_state: SINGLETON_MUT(GameState),
    _level_state: SINGLETON_MUT(LevelState),
    _: COMPONENT_ID(&flecs.Wildcard, .{
        .inout = .Out,
        .src = .{ .flags = flecs.IsEntity, .id = 0 },
    }),
) void {
    const world = _world.get_mut();
    const allocator = _allocator.get();
    const game_state = _game_state.get_mut();
    const level_state = _level_state.get_mut();

    if (level_state.load_path == null) {
        return;
    }

    const path = level_state.load_path.?;
    level_state.load_path = null;

    std.log.debug("Loading level from path: {s}", .{path});

    var file = std.fs.cwd().openFile(path, .{}) catch {
        game_state.set(world, .{ .Exit = true });
        return;
    };
    defer file.close();

    const file_data = file.readToEndAlloc(allocator.*, 1024 * 1024 * 1024) catch {
        game_state.set(world, .{ .Exit = true });
        return;
    };
    defer allocator.free(file_data);

    const save_state = std.json.parseFromSlice(LevelSave, allocator.*, file_data, .{}) catch {
        game_state.set(world, .{ .Exit = true });
        return;
    };
    defer save_state.deinit();

    const level_save = &save_state.value;

    for (@field(level_save, @typeName(TextBundle))) |*save| {
        const bundle = TextBundle.restore(save, world);
        _ = flecs.spawn_bundle(bundle, world);
    }
    for (@field(level_save, @typeName(SpawnerBundle))) |*save| {
        const bundle = SpawnerBundle.restore(save, world);
        _ = flecs.spawn_bundle(bundle, world);
    }
    for (@field(level_save, @typeName(BallBundle))) |*save| {
        const bundle = BallBundle.restore(save, world);
        _ = flecs.spawn_bundle(bundle, world);
    }
    for (@field(level_save, @typeName(AnchorBundle))) |*save| {
        const bundle = AnchorBundle.restore(save, world);
        _ = flecs.spawn_bundle(bundle, world);
    }
    for (@field(level_save, @typeName(PortalBundle))) |*save| {
        const bundle = PortalBundle.restore(save, world);
        _ = flecs.spawn_bundle(bundle, world);
    }
    for (@field(level_save, @typeName(BlackHoleBundle))) |*save| {
        const bundle = BlackHoleBundle.restore(save, world);
        _ = flecs.spawn_bundle(bundle, world);
    }
    for (@field(level_save, @typeName(RectangleBundle))) |*save| {
        const bundle = RectangleBundle.restore(save, world);
        _ = flecs.spawn_bundle(bundle, world);
    }

    game_state.set(world, .{ .LevelLoaded = true });
}

const StartLevelCtx = struct {
    ball_query: *flecs.query_t,
    spawner_query: *flecs.query_t,

    const Self = @This();
    pub fn init(world: *flecs.world_t) !Self {
        return .{
            .ball_query = try flecs.query_components(
                struct { *const BodyId, *const BallTag },
                world,
            ),
            .spawner_query = try flecs.query_components(
                struct { *const Position, *const SpawnerTag },
                world,
            ),
        };
    }
};
pub fn start_level(
    _world: WORLD(),
    _ctx: STATIC(StartLevelCtx),
    _game_state: SINGLETON_MUT(GameState),
    _timer: SINGLETON_MUT(LevelTimer),
) void {
    const world = _world.get_mut();
    const ctx = _ctx.get();
    const game_state = _game_state.get_mut();
    const timer = _timer.get_mut();

    if (!game_state.current_state.LevelLoaded) {
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

    game_state.set(world, .{ .Running = true });
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
        return .{
            .ball_query = try flecs.query_components(
                struct { *const BodyId, *BallAttachment },
                world,
            ),
            .joint_query = try flecs.query_components(
                struct { *const JointTag },
                world,
            ),
        };
    }
};
pub fn recreate_level(
    _world: WORLD(),
    _ctx: STATIC(RecreateLevelCtx),
    _level_state: SINGLETON_MUT(LevelState),
    _game_state: SINGLETON_MUT(GameState),
) void {
    const world = _world.get_mut();
    const ctx = _ctx.get();
    const level_state = _level_state.get_mut();
    const game_state = _game_state.get_mut();

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

    game_state.set(world, .{ .LevelLoaded = true });
}

pub const SaveLevelCtx = struct {
    text_query: *flecs.query_t,
    spawner_query: *flecs.query_t,
    ball_query: *flecs.query_t,
    anchor_query: *flecs.query_t,
    portal_query: *flecs.query_t,
    black_hole_query: *flecs.query_t,
    rectangle_query: *flecs.query_t,

    const Self = @This();
    pub fn init(world: *flecs.world_t) !Self {
        return .{
            .text_query = try flecs.query_bundle(TextBundle.Save, world),
            .spawner_query = try flecs.query_bundle(SpawnerBundle.Save, world),
            .ball_query = try flecs.query_bundle(BallBundle.Save, world),
            .anchor_query = try flecs.query_bundle(AnchorBundle.Save, world),
            .portal_query = try flecs.query_bundle(PortalBundle.Save, world),
            .black_hole_query = try flecs.query_bundle(BlackHoleBundle.Save, world),
            .rectangle_query = try flecs.query_bundle(RectangleBundle.Save, world),
        };
    }
};
pub fn save_level(
    _world: WORLD(),
    _ctx: STATIC(SaveLevelCtx),
    _allocator: SINGLETON(Allocator),
    _level_state: SINGLETON_MUT(LevelState),
    _game_state: SINGLETON_MUT(GameState),
) void {
    const world = _world.get_mut();
    const ctx = _ctx.get();
    const allocator = _allocator.get();
    const level_state = _level_state.get_mut();
    const game_state = _game_state.get_mut();

    if (level_state.save_path == null) {
        return;
    }

    const path = level_state.save_path.?;
    level_state.save_path = null;

    std.log.debug("Saving level to path: {s}", .{path});

    const saved_texts = flecs.save_bundles(allocator.*, TextBundle.Save, world, ctx.text_query) catch {
        game_state.set(world, .{ .Exit = true });
        return;
    };
    defer saved_texts.deinit();

    const saved_spawners = flecs.save_bundles(allocator.*, SpawnerBundle.Save, world, ctx.spawner_query) catch {
        game_state.set(world, .{ .Exit = true });
        return;
    };
    defer saved_spawners.deinit();

    const saved_balls = flecs.save_bundles(allocator.*, BallBundle.Save, world, ctx.ball_query) catch {
        game_state.set(world, .{ .Exit = true });
        return;
    };
    defer saved_balls.deinit();

    const saved_anchors = flecs.save_bundles(allocator.*, AnchorBundle.Save, world, ctx.anchor_query) catch {
        game_state.set(world, .{ .Exit = true });
        return;
    };
    defer saved_anchors.deinit();

    const saved_portals = flecs.save_bundles(allocator.*, PortalBundle.Save, world, ctx.portal_query) catch {
        game_state.set(world, .{ .Exit = true });
        return;
    };
    defer saved_portals.deinit();

    const saved_black_holes = flecs.save_bundles(allocator.*, BlackHoleBundle.Save, world, ctx.black_hole_query) catch {
        game_state.set(world, .{ .Exit = true });
        return;
    };
    defer saved_black_holes.deinit();

    const saved_rectangles = flecs.save_bundles(allocator.*, RectangleBundle.Save, world, ctx.rectangle_query) catch {
        game_state.set(world, .{ .Exit = true });
        return;
    };
    defer saved_rectangles.deinit();

    var save_state: LevelSave = undefined;
    @field(save_state, @typeName(TextBundle)) = saved_texts.items;
    @field(save_state, @typeName(SpawnerBundle)) = saved_spawners.items;
    @field(save_state, @typeName(BallBundle)) = saved_balls.items;
    @field(save_state, @typeName(AnchorBundle)) = saved_anchors.items;
    @field(save_state, @typeName(PortalBundle)) = saved_portals.items;
    @field(save_state, @typeName(BlackHoleBundle)) = saved_black_holes.items;
    @field(save_state, @typeName(RectangleBundle)) = saved_rectangles.items;

    var file = std.fs.cwd().createFile(path, .{}) catch {
        game_state.set(world, .{ .Exit = true });
        return;
    };
    defer file.close();

    const options = std.json.StringifyOptions{
        .whitespace = .indent_4,
    };
    std.json.stringify(save_state, options, file.writer()) catch {
        game_state.set(world, .{ .Exit = true });
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
    _ = flecs.ADD_SYSTEM(world, "clean_level", flecs.PreFrame, clean_level);
    _ = flecs.ADD_SYSTEM(world, "start_level", flecs.PreFrame, start_level);
    _ = flecs.ADD_SYSTEM(world, "load_level", flecs.PreFrame, load_level);
    _ = flecs.ADD_SYSTEM(world, "recreate_level", flecs.PreFrame, recreate_level);
    _ = flecs.ADD_SYSTEM(world, "save_level", flecs.PreFrame, save_level);
}

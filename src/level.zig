const std = @import("std");
const builtin = @import("builtin");
const rl = @import("raylib.zig");
const b2 = @import("box2d.zig");

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

const Allocator = std.mem.Allocator;

pub const DEFAULT_LEVELS_PATH = "resources/levels";
pub const DEFAULT_SAVE_PATH = "resources/levels/save.json";

pub const EMSCRIPTEN_LEVEL_NAMES = [_][]const u8{
    "level_1.json",
};

pub const LevelSave = struct {
    objects: []ObjectParams,
    initial_ball_params: BallParams,
};

pub const Level = struct {
    ball: Ball,
    objects: std.ArrayList(Object),

    initial_ball_params: BallParams,

    const Self = @This();

    pub fn default(allocator: Allocator, world_id: b2.b2WorldId) Self {
        const initial_ball_params = .{};
        const ball = Ball.new(world_id, initial_ball_params);
        const objects = std.ArrayList(Object).init(allocator);

        return Self{
            .ball = ball,
            .objects = objects,
            .initial_ball_params = initial_ball_params,
        };
    }

    pub fn deinit(self: *const Self) void {
        std.log.debug("level deinit", .{});
        for (self.objects.items) |*o| {
            o.deinit();
        }
        self.ball.deinit();
        self.objects.deinit();
    }

    fn from_safe(allocator: Allocator, world_id: b2.b2WorldId, level_save: *const LevelSave) !Self {
        const initial_ball_params = level_save.initial_ball_params;
        const ball = Ball.new(world_id, initial_ball_params);

        var o = std.ArrayList(Object).init(allocator);
        for (level_save.objects) |*p| {
            const obj = try Object.init(allocator, world_id, p);
            try o.append(obj);
        }

        return Self{
            .ball = ball,
            .objects = o,
            .initial_ball_params = initial_ball_params,
        };
    }

    pub fn update(self: *Self, game: *Game, sensor_events: *const SensorEvents) void {
        for (self.objects.items) |*object| {
            object.update(game, sensor_events);
        }
    }

    pub fn draw(self: *const Self) void {
        for (self.objects.items) |object| {
            object.draw();
        }
        self.ball.draw();
    }

    pub fn draw_aabb(self: *const Self, color: rl.Color) void {
        for (self.objects.items) |object| {
            object.draw_aabb(color);
        }
        self.ball.draw_aabb(color);
    }

    pub fn recreate(self: *Self, world_id: b2.b2WorldId) !void {
        for (self.objects.items) |*object| {
            try object.recreate(world_id);
        }
        self.ball.recreate(world_id);
    }

    pub fn save(self: *const Self, allocator: Allocator, path: []const u8) !void {
        const save_path = std.mem.sliceTo(path, 0);

        std.log.debug("Saving level to: {s}", .{save_path});

        var file = try std.fs.cwd().createFile(save_path, .{});
        defer file.close();

        const objects_params = try allocator.alloc(ObjectParams, self.objects.items.len);
        for (self.objects.items, objects_params) |*item, *param| {
            param.* = try item.params(allocator);
        }
        defer {
            for (objects_params) |*p| {
                switch (p.*) {
                    .RectangleChain => |*rc| rc.deinit(allocator),
                    else => {},
                }
            }
            allocator.free(objects_params);
        }

        const save_state = LevelSave{
            .objects = objects_params,
            .initial_ball_params = self.initial_ball_params,
        };

        const options = std.json.StringifyOptions{
            .whitespace = .indent_4,
        };

        try std.json.stringify(save_state, options, file.writer());
    }

    pub fn load(allocator: Allocator, world_id: b2.b2WorldId, path: []const u8) !Self {
        std.log.debug("Loading level from path: {s}", .{path});

        var file = try std.fs.cwd().openFile(path, .{});
        defer file.close();

        const file_data = try file.readToEndAlloc(allocator, 1024 * 1024 * 1024);
        defer allocator.free(file_data);

        const save_state = try std.json.parseFromSlice(LevelSave, allocator, file_data, .{});
        defer save_state.deinit();

        return try Self.from_safe(allocator, world_id, &save_state.value);
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

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

const UI_ELEMENT_WIDTH = 300.0;
const UI_ELEMENT_HEIGHT = 100.0;

pub const GameSaveState = struct {
    camera: rl.Camera2D,
    initial_camera: rl.Camera2D,

    ball: objects.BallParams,
    initial_ball_params: objects.BallParams,

    objects: []ObjectParams,
    state: GameState,

    editor_camera: rl.Camera2D,
};

pub const SensorEvents = struct {
    begin_events: []b2.b2SensorBeginTouchEvent,
    end_events: []b2.b2SensorEndTouchEvent,

    const Self = @This();

    pub fn new(world_id: b2.b2WorldId) Self {
        const events = b2.b2World_GetSensorEvents(world_id);

        var begin_events: []b2.b2SensorBeginTouchEvent = undefined;
        begin_events.ptr = events.beginEvents;
        begin_events.len = @intCast(events.beginCount);

        var end_events: []b2.b2SensorEndTouchEvent = undefined;
        end_events.ptr = events.endEvents;
        end_events.len = @intCast(events.endCount);
        return Self{
            .begin_events = begin_events,
            .end_events = end_events,
        };
    }
};

pub const GameSettings = struct {
    const RESOLUTIONS = [_]struct { u32, u32 }{
        .{ 960, 540 },
        .{ 1280, 720 },
        .{ 1920, 1080 },
        .{ 2560, 1440 },
    };
    const RESOLUTIONS_STR: [:0]const u8 = std.fmt.comptimePrint("{};{};{};{}", .{
        RESOLUTIONS[0],
        RESOLUTIONS[1],
        RESOLUTIONS[2],
        RESOLUTIONS[3],
    });

    const SaveState = struct {
        resolution_width: u32,
        resolution_height: u32,
    };

    const Self = @This();

    // UI state
    selected_resolution: i32 = 0,
    select_resolution_active: bool = false,

    resolution_width: u32,
    resolution_height: u32,

    pub fn update_selected_resolution(self: *Self) void {
        const selected_resolution: usize = @intCast(self.selected_resolution);
        self.resolution_width = Self.RESOLUTIONS[selected_resolution][0];
        self.resolution_height = Self.RESOLUTIONS[selected_resolution][1];
    }

    pub fn draw(self: *Self, game: *Game) !void {
        var rectangle = rl.Rectangle{
            .x = @as(f32, @floatFromInt(game.settings.resolution_width)) / 2.0 - UI_ELEMENT_WIDTH,
            .y = @as(f32, @floatFromInt(game.settings.resolution_height)) / 2.0 - UI_ELEMENT_HEIGHT * 2.0,
            .width = UI_ELEMENT_WIDTH,
            .height = UI_ELEMENT_HEIGHT,
        };
        _ = rl.GuiLabel(
            rectangle,
            "Resolution",
        );

        rectangle.x += UI_ELEMENT_WIDTH;
        const r = rl.GuiDropdownBox(
            rectangle,
            Self.RESOLUTIONS_STR,
            &self.selected_resolution,
            self.select_resolution_active,
        );
        if (r == 1) {
            self.select_resolution_active = !self.select_resolution_active;
        }

        rectangle.x -= UI_ELEMENT_WIDTH / 2.0;
        rectangle.y += UI_ELEMENT_HEIGHT * 3.5;
        const apply_button = rl.GuiButton(
            rectangle,
            "Apply",
        );
        if (apply_button != 0) {
            self.update_selected_resolution();
            game.set_window_size();
            try self.save();
        }

        rectangle.y += UI_ELEMENT_HEIGHT;
        const back_button = rl.GuiButton(
            rectangle,
            "Back",
        );
        if (back_button != 0) {
            game.state = .MainMenu;
        }
    }

    pub fn save(self: *const Self) !void {
        var file = try std.fs.cwd().createFile("settings.json", .{});
        defer file.close();

        const settings_save = Self.SaveState{
            .resolution_width = self.resolution_width,
            .resolution_height = self.resolution_height,
        };

        const options = std.json.StringifyOptions{
            .whitespace = .indent_4,
        };

        try std.json.stringify(settings_save, options, file.writer());
    }

    pub fn load(allocator: Allocator, path: []const u8) !Self {
        var file = try std.fs.cwd().openFile(path, .{});
        defer file.close();

        const file_data = try file.readToEndAlloc(allocator, 1024 * 1024 * 1024);
        defer allocator.free(file_data);

        const self_state = try std.json.parseFromSlice(Self, allocator, file_data, .{});
        defer self_state.deinit();

        var s = std.mem.zeroInit(Self, .{});
        s.resolution_width = self_state.value.resolution_width;
        s.resolution_height = self_state.value.resolution_height;

        return s;
    }
};

pub const GameState = enum {
    MainMenu,
    Settings,
    Running,
    Editor,
    Win,
    Exit,
};

pub const EditorSelection = union(enum) {
    Ball,
    Object: usize,
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
    editor_selection: ?EditorSelection,

    settings: GameSettings,

    const Self = @This();

    pub fn new(allocator: Allocator, settings: GameSettings) !Self {
        var world_def = b2.b2DefaultWorldDef();
        world_def.gravity = b2.b2Vec2{ .x = 0, .y = -100 };
        const world_id = b2.b2CreateWorld(&world_def);

        const camera = rl.Camera2D{
            .offset = rl.Vector2{
                .x = @as(f32, @floatFromInt(settings.resolution_width)) / 2.0,
                .y = @as(f32, @floatFromInt(settings.resolution_height)) / 2.0,
            },
            .target = rl.Vector2{ .x = 0.0, .y = 0.0 },
            .rotation = 0.0,
            .zoom = 1.0,
        };
        const initial_ball_params = objects.BallParams{
            .position = Vector2{ .x = 0.0, .y = 100.0 },
            .radius = 10.0,
        };
        const game_ball = Ball.new(world_id, initial_ball_params);

        var objects_params = std.ArrayList(ObjectParams).init(allocator);
        defer objects_params.deinit();
        const anchor_params = objects.AnchorParams{
            .position = Vector2{ .x = 0.0, .y = 0.0 },
            .radius = 5.0,
        };
        try objects_params.append(.{ .Anchor = anchor_params });

        var game_objects = std.ArrayList(objects.Object).init(allocator);
        const anchor = Anchor.new(world_id, anchor_params);
        try game_objects.append(.{ .Anchor = anchor });

        return Self{
            .allocator = allocator,

            .world_id = world_id,

            .camera = camera,
            .initial_camera = camera,

            .ball = game_ball,
            .initial_ball_params = initial_ball_params,

            .objects = game_objects,

            .state = .MainMenu,

            .editor_camera = camera,
            .editor_selection = null,

            .settings = settings,
        };
    }

    pub fn from_state(allocator: Allocator, state: *const GameSaveState, settings: GameSettings) !Self {
        var world_def = b2.b2DefaultWorldDef();
        world_def.gravity = b2.b2Vec2{ .x = 0, .y = -100 };
        const world_id = b2.b2CreateWorld(&world_def);

        const game_ball = Ball.new(world_id, state.initial_ball_params);

        var game_objects = std.ArrayList(objects.Object).init(allocator);
        for (state.objects) |*params| {
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
                    const rectangle = try Rectangle.new(world_id, p);
                    try game_objects.append(.{ .Rectangle = rectangle });
                },
                .RectangleChain => |p| {
                    // state will be deallocated, so need to clone params
                    const p_clone = try p.clone(allocator);
                    const rectangle_chain = try RectangleChain.new(world_id, allocator, p_clone);
                    try game_objects.append(.{ .RectangleChain = rectangle_chain });
                },
            }
        }

        return Self{
            .allocator = allocator,

            .world_id = world_id,

            .camera = state.camera,
            .initial_camera = state.camera,

            .ball = game_ball,
            .initial_ball_params = state.initial_ball_params,

            .objects = game_objects,

            .state = GameState.Running,

            .editor_camera = state.editor_camera,
            .editor_selection = null,

            .settings = settings,
        };
    }

    pub fn restart(self: *Self) !void {
        self.camera = self.initial_camera;
        self.state = .Running;

        for (self.objects.items) |*object| {
            try object.recreate(self.world_id);
        }

        self.ball.recreate(self.world_id);
    }

    pub fn deinit(self: *const Self) void {
        for (self.objects.items) |object| {
            object.deinit();
        }
        self.objects.deinit();
        self.ball.deinit();
        b2.b2DestroyWorld(self.world_id);
    }

    pub fn set_window_size(self: *Self) void {
        const camera = rl.Camera2D{
            .offset = rl.Vector2{
                .x = @as(f32, @floatFromInt(self.settings.resolution_width)) / 2.0,
                .y = @as(f32, @floatFromInt(self.settings.resolution_height)) / 2.0,
            },
            .target = rl.Vector2{ .x = 0.0, .y = 0.0 },
            .rotation = 0.0,
            .zoom = 1.0,
        };
        self.camera = camera;
        self.initial_camera = camera;
        self.editor_camera = camera;
        // TODO is there a better workaround?
        // Currently this is needed, because when
        // only SetWindowSize is used, the inner viewport
        // is not resized
        rl.ToggleFullscreen();
        rl.ToggleFullscreen();
        rl.SetWindowSize(
            @intCast(self.settings.resolution_width),
            @intCast(self.settings.resolution_height),
        );
    }

    pub fn mouse_position(self: *const Self) Vector2 {
        const camera = switch (self.state) {
            .Editor => &self.editor_camera,
            else => &self.camera,
        };
        return Vector2.from_rl_pos(
            rl.GetScreenToWorld2D(
                rl.GetMousePosition(),
                camera.*,
            ),
        );
    }

    pub fn update_camera(self: *Self, dt: f32) void {
        const ball_pos = self.ball.get_position();
        const camera_pos = Vector2.from_rl_pos(self.camera.target);
        const p = ball_pos.lerp(&camera_pos, dt);
        self.camera.target.y = p.to_rl_as_pos().y;
    }

    pub fn update(self: *Self, dt: f32) !void {
        switch (self.state) {
            .Running => try self.update_running(dt),
            .Editor => try self.update_editor(dt),
            else => {},
        }
    }

    pub fn update_running(self: *Self, dt: f32) !void {
        if (rl.IsKeyPressed(rl.KEY_R)) {
            try self.restart();
        }

        if (rl.IsKeyPressed(rl.KEY_P)) {
            self.state = .Editor;
        }

        b2.b2World_Step(self.world_id, dt, 4);

        const sensor_events = SensorEvents.new(self.world_id);
        self.update_camera(dt);
        for (self.objects.items) |*object| {
            object.update(self, &sensor_events);
        }
    }

    pub fn update_editor(self: *Self, dt: f32) !void {
        _ = dt;
        if (rl.IsKeyPressed(rl.KEY_R)) {
            try self.restart();
        }

        if (rl.IsKeyPressed(rl.KEY_P)) {
            self.state = .Running;
        }

        if (rl.IsMouseButtonPressed(rl.MOUSE_BUTTON_RIGHT)) {
            const mp = self.mouse_position();
            self.editor_selection = null;
            for (self.objects.items, 0..) |*object, i| {
                if (object.aabb_contains(mp)) {
                    self.editor_selection = .{ .Object = i };
                    break;
                }
            }
            if (self.ball.aabb_contains(mp)) {
                self.editor_selection = .Ball;
            }
        }
        if (rl.IsMouseButtonDown(rl.MOUSE_BUTTON_SIDE)) {
            const mouse_pos = self.mouse_position();
            if (self.editor_selection) |s| {
                switch (s) {
                    .Ball => self.ball.set_position(mouse_pos),
                    .Object => |i| try self.objects.items[i].set_position(mouse_pos),
                }
            }
        }
        if (rl.IsMouseButtonDown(rl.MOUSE_BUTTON_MIDDLE)) {
            const delta = rl.GetMouseDelta();
            self.editor_camera.target.x -= delta.x;
            self.editor_camera.target.y -= delta.y;
        }

        const mouse_wheel_move = rl.GetMouseWheelMove() / 10.0;
        self.editor_camera.zoom += mouse_wheel_move;
    }

    pub fn draw(self: *Self) !void {
        rl.BeginDrawing();
        defer rl.EndDrawing();
        rl.ClearBackground(rl.BLACK);

        switch (self.state) {
            .MainMenu => self.draw_main_menu(),
            .Settings => try self.draw_settings(),
            .Running => self.draw_running(),
            .Editor => try self.draw_editor(),
            .Win => try self.draw_win(),
            .Exit => {},
        }
    }

    pub fn draw_main_menu(self: *Self) void {
        var rectangle = rl.Rectangle{
            .x = @as(f32, @floatFromInt(self.settings.resolution_width)) / 2.0 - UI_ELEMENT_WIDTH / 2.0,
            .y = @as(f32, @floatFromInt(self.settings.resolution_height)) / 2.0 - UI_ELEMENT_HEIGHT / 2.0,
            .width = UI_ELEMENT_WIDTH,
            .height = UI_ELEMENT_HEIGHT,
        };
        const win_button = rl.GuiButton(
            rectangle,
            "Start",
        );
        if (win_button != 0) {
            self.state = .Running;
        }

        rectangle.y += UI_ELEMENT_HEIGHT;
        const settings_button = rl.GuiButton(
            rectangle,
            "Settings",
        );
        if (settings_button != 0) {
            self.state = .Settings;
        }

        rectangle.y += UI_ELEMENT_HEIGHT;
        const exit_button = rl.GuiButton(
            rectangle,
            "Exit",
        );
        if (exit_button != 0) {
            self.state = .Exit;
        }
    }

    pub fn draw_settings(self: *Self) !void {
        try self.settings.draw(self);
    }

    pub fn draw_running(self: *const Self) void {
        rl.BeginMode2D(self.camera);
        defer rl.EndMode2D();

        for (self.objects.items) |object| {
            object.draw();
        }
        self.ball.draw();

        const mouse_pos = self.mouse_position();
        rl.DrawCircleV(mouse_pos.to_rl_as_pos(), 2.0, rl.YELLOW);
    }

    pub fn draw_editor(self: *Self) !void {
        {
            rl.BeginMode2D(self.editor_camera);
            defer rl.EndMode2D();

            for (self.objects.items) |object| {
                object.draw();
            }
            self.ball.draw();

            const aabb_color = rl.SKYBLUE;
            for (self.objects.items) |object| {
                object.draw_aabb(aabb_color);
            }
            self.ball.draw_aabb(aabb_color);

            const selected_color = rl.ORANGE;
            if (self.editor_selection) |s| {
                switch (s) {
                    .Ball => self.ball.draw_aabb(selected_color),
                    .Object => |i| self.objects.items[i].draw_aabb(selected_color),
                }
            }

            const mouse_pos = self.mouse_position();
            rl.DrawCircleV(mouse_pos.to_rl_as_pos(), 2.0, rl.YELLOW);
        }

        if (self.editor_selection) |s| {
            switch (s) {
                .Ball => self.ball.draw_editor(self.world_id),
                .Object => |i| try self.objects.items[i].draw_editor(self.world_id),
            }
        }

        var save_button_rect = rl.Rectangle{
            .x = @as(f32, @floatFromInt(self.settings.resolution_width)) - 50.0,
            .y = 0.0,
            .width = 50.0,
            .height = 50.0,
        };
        const b_save = rl.GuiButton(
            save_button_rect,
            "Save",
        );
        if (b_save != 0) {
            try self.save();
        }
        save_button_rect.y += 50.0;
        const b_load = rl.GuiButton(
            save_button_rect,
            "Load",
        );
        if (b_load != 0) {
            try self.load();
        }

        const button_width = 100.0;
        const button_height = 20.0;
        var button_rect = rl.Rectangle{
            .x = 0.0,
            .y = @as(f32, @floatFromInt(self.settings.resolution_height)) - button_height,
            .width = button_width,
            .height = button_height,
        };
        const remove = rl.GuiButton(
            button_rect,
            "Remove",
        );
        if (remove != 0) {
            if (self.editor_selection) |s| {
                switch (s) {
                    .Ball => {},
                    .Object => |i| {
                        const object = self.objects.swapRemove(i);
                        object.deinit();
                        self.editor_selection = null;
                    },
                }
            }
        }

        button_rect.x += button_width;
        const add_ball = rl.GuiButton(
            button_rect,
            "Add ball",
        );
        if (add_ball != 0) {
            const ball = Ball.new(self.world_id, .{
                .position = Vector2.from_rl_pos(self.editor_camera.target),
            });
            try self.objects.append(.{ .Ball = ball });
        }

        button_rect.x += button_width;
        const add_arc = rl.GuiButton(
            button_rect,
            "Add arc",
        );
        if (add_arc != 0) {
            const arc = Arc.new(self.world_id, .{
                .position = Vector2.from_rl_pos(self.editor_camera.target),
            });
            try self.objects.append(.{ .Arc = arc });
        }

        button_rect.x += button_width;
        const add_anchor = rl.GuiButton(
            button_rect,
            "Add anchor",
        );
        if (add_anchor != 0) {
            const anchor = Anchor.new(self.world_id, .{
                .position = Vector2.from_rl_pos(self.editor_camera.target),
            });
            try self.objects.append(.{ .Anchor = anchor });
        }

        button_rect.x += button_width;
        const add_rect = rl.GuiButton(
            button_rect,
            "Add rect",
        );
        if (add_rect != 0) {
            const rect = try Rectangle.new(self.world_id, .{
                .position = Vector2.from_rl_pos(self.editor_camera.target),
            });
            try self.objects.append(.{ .Rectangle = rect });
        }

        button_rect.x += button_width;
        const add_rect_chain = rl.GuiButton(
            button_rect,
            "Add rect chain",
        );
        if (add_rect_chain != 0) {
            const rc_points = [_]Vector2{
                Vector2.X,
                Vector2.NEG_X,
            };
            const points = try self.allocator.alloc(Vector2, rc_points.len);
            @memcpy(points, &rc_points);

            const rect_chain_params = objects.RectangleChainParams{
                .position = Vector2.from_rl_pos(self.editor_camera.target),
                .points = points,
            };
            const rect_chain = try RectangleChain.new(self.world_id, self.allocator, rect_chain_params);
            try self.objects.append(.{ .RectangleChain = rect_chain });
        }
    }

    pub fn draw_win(self: *Self) !void {
        const win_button_rect = rl.Rectangle{
            .x = @as(f32, @floatFromInt(self.settings.resolution_width)) / 2.0,
            .y = @as(f32, @floatFromInt(self.settings.resolution_height)) / 2.0,
            .width = 100.0,
            .height = 100.0,
        };
        const win_button = rl.GuiButton(
            win_button_rect,
            "You won",
        );
        if (win_button != 0) {
            try self.restart();
        }
    }

    pub fn save(self: *const Self) !void {
        var file = try std.fs.cwd().createFile("resources/save.json", .{});
        defer file.close();

        const objects_params = try self.allocator.alloc(ObjectParams, self.objects.items.len);
        for (self.objects.items, objects_params) |*item, *param| {
            param.* = try item.params(self.allocator);
        }
        defer {
            for (objects_params) |*p| {
                switch (p.*) {
                    .RectangleChain => |*rc| rc.deinit(self.allocator),
                    else => {},
                }
            }
            self.allocator.free(objects_params);
        }

        const save_state = GameSaveState{
            .camera = self.camera,
            .initial_camera = self.initial_camera,
            .ball = self.ball.params,
            .initial_ball_params = self.initial_ball_params,
            .objects = objects_params,
            .state = self.state,
            .editor_camera = self.editor_camera,
        };

        const options = std.json.StringifyOptions{
            .whitespace = .indent_4,
        };

        try std.json.stringify(save_state, options, file.writer());
    }

    pub fn load(self: *Self) !void {
        var file = try std.fs.cwd().openFile("resources/save.json", .{});
        defer file.close();

        const file_data = try file.readToEndAlloc(self.allocator, 1024 * 1024 * 1024);
        defer self.allocator.free(file_data);

        const save_state = try std.json.parseFromSlice(GameSaveState, self.allocator, file_data, .{});
        defer save_state.deinit();

        const allocator = self.allocator;
        self.deinit();
        self.* = try Game.from_state(allocator, &save_state.value, self.settings);
    }
};

const std = @import("std");
const rl = @import("raylib.zig");
const b2 = @import("box2d.zig");
const ParamEditor = @import("editor.zig").ParamEditor;
const Game = @import("game.zig").Game;
const SensorEvents = @import("game.zig").SensorEvents;
const Vector2 = @import("vector.zig");
const Allocator = std.mem.Allocator;

const AABB_LINE_THICKNESS = 1.5;

pub const AABB = struct {
    aabb: b2.b2AABB,

    const Self = @This();

    pub fn new() Self {
        return Self{
            .aabb = b2.b2AABB{
                .lowerBound = Vector2.MAX.to_b2(),
                .upperBound = Vector2.MIN.to_b2(),
            },
        };
    }

    pub fn from_b2(aabb: b2.b2AABB) Self {
        return Self{
            .aabb = aabb,
        };
    }

    pub fn to_rl_rect(self: *const Self, position: Vector2) rl.Rectangle {
        const rl_position = position.add(&self.center().sub(&position)).to_rl_as_pos();
        return rl.Rectangle{
            .x = rl_position.x - (self.aabb.upperBound.x - self.aabb.lowerBound.x) / 2.0,
            .y = rl_position.y - (self.aabb.upperBound.y - self.aabb.lowerBound.y) / 2.0,
            .width = self.aabb.upperBound.x - self.aabb.lowerBound.x,
            .height = self.aabb.upperBound.y - self.aabb.lowerBound.y,
        };
    }

    pub fn center(self: *const Self) Vector2 {
        return Vector2.from_b2(b2.b2AABB_Center(self.aabb));
    }

    pub fn contains(self: *const Self, position: Vector2, point: Vector2) bool {
        const self_position = position.add(&self.center().sub(&position));
        const self_half_extends = Vector2.from_b2(b2.b2AABB_Extents(self.aabb));
        const left = self_position.x - self_half_extends.x;
        const right = self_position.x + self_half_extends.x;
        const top = self_position.y + self_half_extends.y;
        const bot = self_position.y - self_half_extends.y;
        return left < point.x and
            point.x < right and
            bot < point.y and
            point.y < top;
    }

    pub fn union_with(self: *const Self, other: *const Self) Self {
        return Self{
            .aabb = b2.b2AABB_Union(self.aabb, other.aabb),
        };
    }
};

pub const BallParams = struct {
    position: Vector2 = Vector2.ZERO,
    radius: f32 = 10.0,
    color: rl.Color = rl.WHITE,
    fast_color: rl.Color = rl.GOLD,
};

pub const Ball = struct {
    body_def: b2.b2BodyDef,
    body_id: b2.b2BodyId,
    shape_def: b2.b2ShapeDef,
    shape_id: b2.b2ShapeId,
    circle: b2.b2Circle,

    const Self = @This();

    pub fn new(
        world_id: b2.b2WorldId,
        params: BallParams,
    ) Self {
        var body_def = b2.b2DefaultBodyDef();
        body_def.type = b2.b2_dynamicBody;
        body_def.position = params.position.to_b2();
        const body_id = b2.b2CreateBody(world_id, &body_def);

        var shape_def = b2.b2DefaultShapeDef();
        shape_def.density = 100.0;
        shape_def.friction = 0.5;
        shape_def.restitution = 0.3;

        const circle = b2.b2Circle{
            .point = b2.b2Vec2{ .x = 0.0, .y = 0.0 },
            .radius = params.radius,
        };
        const shape_id = b2.b2CreateCircleShape(body_id, &shape_def, &circle);

        return Self{
            .body_def = body_def,
            .body_id = body_id,
            .shape_def = shape_def,
            .shape_id = shape_id,
            .circle = circle,
        };
    }

    pub fn deinit(self: *const Self) void {
        // flecs calls dtor on zero init value
        // during first `ecs_set` call
        var self_slice: []const u8 = undefined;
        self_slice.ptr = @ptrCast(self);
        self_slice.len = @sizeOf(Self);
        if (std.mem.allEqual(u8, self_slice, 0)) {
            return;
        }

        b2.b2DestroyShape(self.shape_id);
        b2.b2DestroyBody(self.body_id);
    }

    pub fn aabb_contains(self: *const Self, point: Vector2) bool {
        const position = Vector2.from_b2(b2.b2Body_GetPosition(self.body_id));
        const aabb = AABB.from_b2(b2.b2Shape_GetAABB(self.shape_id));
        return aabb.contains(position, point);
    }

    pub fn get_position(self: *const Self) Vector2 {
        return Vector2.from_b2(b2.b2Body_GetPosition(self.body_id));
    }

    pub fn set_position(self: *Self, position: Vector2) void {
        self.params.position = position;
        self.params_editor = ParamEditor(BallParams).new(&self.params);

        const angle = b2.b2Body_GetAngle(self.body_id);
        b2.b2Body_SetTransform(self.body_id, position.to_b2(), angle);
    }

    pub fn draw_editor(self: *Self, world_id: b2.b2WorldId) void {
        if (self.params_editor.draw(Vector2{ .x = 0.0, .y = 0.0 })) |new_params| {
            self.deinit();
            self.* = Self.new(world_id, new_params);
        }
    }
};

pub const AnchorParams = struct {
    position: Vector2 = Vector2.ZERO,
    radius: f32 = 10.0,
    color: rl.Color = rl.GREEN,

    min_length: f32 = 0.0,
    max_length: f32 = 100.0,
    damping_ratio: f32 = 0.5,
    hertz: f32 = 1.0,
    pull_force: f32 = 200.0,
};

pub const Anchor = struct {
    body_def: b2.b2BodyDef,
    body_id: b2.b2BodyId,
    length_joint_id: ?b2.b2JointId,
    attached_body_id: ?b2.b2BodyId,

    const Self = @This();

    pub fn new(
        world_id: b2.b2WorldId,
        params: AnchorParams,
    ) Self {
        var body_def = b2.b2DefaultBodyDef();
        body_def.type = b2.b2_staticBody;
        body_def.position = params.position.to_b2();
        const body_id = b2.b2CreateBody(world_id, &body_def);

        return Self{
            .body_def = body_def,
            .body_id = body_id,
            .length_joint_id = null,
            .attached_body_id = null,
        };
    }

    pub fn deinit(self: *const Self) void {
        // flecs calls dtor on zero init value
        // during first `ecs_set` call
        var self_slice: []const u8 = undefined;
        self_slice.ptr = @ptrCast(self);
        self_slice.len = @sizeOf(Self);
        if (std.mem.allEqual(u8, self_slice, 0)) {
            return;
        }

        if (self.length_joint_id) |id| {
            b2.b2DestroyJoint(id);
        }
        b2.b2DestroyBody(self.body_id);
    }

    pub fn aabb_contains(self: *const Self, point: Vector2) bool {
        const position = Vector2.from_b2(b2.b2Body_GetPosition(self.body_id));
        const aabb = AABB.from_b2(b2.b2AABB{
            .lowerBound = (Vector2{
                .x = -self.params.radius,
                .y = -self.params.radius,
            }).add(&position).to_b2(),
            .upperBound = (Vector2{
                .x = self.params.radius,
                .y = self.params.radius,
            }).add(&position).to_b2(),
        });
        return aabb.contains(position, point);
    }

    pub fn set_position(self: *Self, position: Vector2) void {
        self.params.position = position;
        self.params_editor = ParamEditor(AnchorParams).new(&self.params);

        const angle = b2.b2Body_GetAngle(self.body_id);
        b2.b2Body_SetTransform(self.body_id, position.to_b2(), angle);
    }

    pub fn draw_editor(self: *Self, world_id: b2.b2WorldId) void {
        if (self.params_editor.draw(Vector2{ .x = 0.0, .y = 0.0 })) |new_params| {
            self.deinit();
            self.* = Self.new(world_id, new_params);
        }
    }
};

pub const ArcParams = struct {
    position: Vector2 = Vector2.ZERO,
    radius: f32 = 10.0,
    color: rl.Color = rl.WHITE,
};

pub const Arc = struct {
    body_id: b2.b2BodyId,

    sub_circles: [SUBCIRCLES_NUM]SubCircle,
    sub_circle_radius: f32,

    params: ArcParams,
    params_editor: ParamEditor(ArcParams),

    const SubCircle = struct {
        offset: Vector2,
        shape_id: b2.b2ShapeId,
    };

    const Self = @This();
    const SUBCIRCLES_NUM: usize = 8;
    const SUBCIRCLE_RADIUS_DIVISOR: f32 = 4.0;

    pub fn new(world_id: b2.b2WorldId, params: ArcParams) Self {
        var sub_circles: [SUBCIRCLES_NUM]SubCircle = undefined;
        const sub_circle_radius = params.radius / SUBCIRCLE_RADIUS_DIVISOR;

        var body_def = b2.b2DefaultBodyDef();
        body_def.type = b2.b2_staticBody;
        body_def.position = params.position.to_b2();
        const body_id = b2.b2CreateBody(world_id, &body_def);

        const initial_angle = 0.0;
        const angle_step = std.math.pi / @as(f32, @floatFromInt(SUBCIRCLES_NUM - 1));
        for (0..SUBCIRCLES_NUM) |i| {
            const angle: f32 = initial_angle - angle_step * @as(f32, @floatFromInt(i));
            const sin = std.math.sin(angle);
            const cos = std.math.cos(angle);
            const offset = (Vector2{ .x = cos, .y = sin }).mul(params.radius);

            const circle = b2.b2Circle{
                .point = offset.to_b2(),
                .radius = sub_circle_radius,
            };

            const shape_def = b2.b2DefaultShapeDef();
            const shape_id = b2.b2CreateCircleShape(body_id, &shape_def, &circle);

            sub_circles[i] = SubCircle{
                .offset = offset,
                .shape_id = shape_id,
            };
        }

        return Self{
            .body_id = body_id,
            .sub_circles = sub_circles,
            .sub_circle_radius = sub_circle_radius,
            .params = params,
            .params_editor = ParamEditor(ArcParams).new(&params),
        };
    }

    pub fn deinit(self: *const Self) void {
        // flecs calls dtor on zero init value
        // during first `ecs_set` call
        var self_slice: []const u8 = undefined;
        self_slice.ptr = @ptrCast(self);
        self_slice.len = @sizeOf(Self);
        if (std.mem.allEqual(u8, self_slice, 0)) {
            return;
        }

        for (&self.sub_circles) |*sub_circle| {
            b2.b2DestroyShape(sub_circle.shape_id);
        }
        b2.b2DestroyBody(self.body_id);
    }

    pub fn recreate(self: *Self, world_id: b2.b2WorldId) void {
        self.deinit();
        self.* = Self.new(world_id, self.params);
    }

    pub fn aabb(self: *const Self) AABB {
        var local_aabb = AABB.new();
        for (&self.sub_circles) |*sub_circle| {
            const sub_circle_aabb = AABB.from_b2(b2.b2Shape_GetAABB(sub_circle.shape_id));
            local_aabb = local_aabb.union_with(&sub_circle_aabb);
        }
        return local_aabb;
    }

    pub fn aabb_contains(self: *const Self, point: Vector2) bool {
        const position = Vector2.from_b2(b2.b2Body_GetPosition(self.body_id));
        const local_aabb = self.aabb();
        return local_aabb.contains(position, point);
    }

    pub fn set_position(self: *Self, position: Vector2) void {
        self.params.position = position;
        self.params_editor = ParamEditor(ArcParams).new(&self.params);

        const angle = b2.b2Body_GetAngle(self.body_id);
        b2.b2Body_SetTransform(self.body_id, position.to_b2(), angle);
    }

    pub fn draw(self: *const Self) void {
        const body_position = Vector2.from_b2(b2.b2Body_GetPosition(self.body_id));
        const angle = b2.b2Body_GetAngle(self.body_id);
        for (&self.sub_circles) |*sub_circle| {
            const rotated_offset = sub_circle.offset.rotate(angle);
            const position = body_position.add(&rotated_offset);
            const rl_position = position.to_rl_as_pos();
            rl.DrawCircleV(rl_position, self.sub_circle_radius, self.params.color);
        }
    }

    pub fn draw_aabb(self: *const Self, color: rl.Color) void {
        const body_position = Vector2.from_b2(b2.b2Body_GetPosition(self.body_id));
        const local_aabb = self.aabb();
        const rl_aabb_rect = local_aabb.to_rl_rect(body_position);
        rl.DrawRectangleLinesEx(
            rl_aabb_rect,
            AABB_LINE_THICKNESS,
            color,
        );
    }

    pub fn draw_editor(self: *Self, world_id: b2.b2WorldId) void {
        if (self.params_editor.draw(Vector2{ .x = 0.0, .y = 0.0 })) |new_params| {
            self.deinit();
            self.* = Self.new(world_id, new_params);
        }
    }
};

pub const RectangleShape = struct {
    shape: b2.b2Polygon,
    shape_id: b2.b2ShapeId,
    width: f32,
    height: f32,
    angle: f32,

    pub const E = error{SamePoints};

    const Self = @This();

    /// Creates rectangle shape that passes though 2 points in the middle of it.
    ///       width
    /// 3-----------------2
    ///  |               |
    ///  |       p1      |
    ///  |      v^       | h
    ///  |       |       | e
    ///  |       |       | i
    ///  |       |->orth | g
    ///  |       |       | h
    ///  |       |       | t
    ///  |       |       |
    ///  |       p2       |
    ///  |               |
    /// 0-----------------1
    fn new(
        body_id: b2.b2BodyId,
        shape_def: *const b2.b2ShapeDef,
        point_1: Vector2,
        point_2: Vector2,
        width: f32,
        height_offset: f32,
    ) !RectangleShape {
        if (point_1.eq(&point_2)) {
            return E.SamePoints;
        }
        const v = point_1.sub(&point_2);
        const v_len = v.length();
        const v_norm = v.div(v_len);
        const v_orth = v_norm.orthogonal();

        const width_offset = width / 2.0;

        const v_offset = v_norm.mul(height_offset);
        const v_orth_offset = v_orth.mul(width_offset);
        var shape = std.mem.zeroInit(b2.b2Polygon, .{});
        shape.count = 4;
        shape.vertices[0] = (point_2.sub(&v_offset).sub(&v_orth_offset)).to_b2();
        shape.vertices[1] = (point_2.sub(&v_offset).add(&v_orth_offset)).to_b2();
        shape.vertices[2] = (point_1.add(&v_offset).add(&v_orth_offset)).to_b2();
        shape.vertices[3] = (point_1.add(&v_offset).sub(&v_orth_offset)).to_b2();
        shape.normals[0] = v_norm.mul(-1.0).to_b2();
        shape.normals[1] = v_orth.to_b2();
        shape.normals[2] = v_norm.to_b2();
        shape.normals[3] = v_orth.mul(-1.0).to_b2();
        shape.radius = 0.0;
        shape.centroid = (Vector2.ZERO).to_b2();

        // the angle is calcutated with respect to (1, 0)
        // while "direction" of a rectangle is initially (0, 1)
        // so we need to rotate -90 deg to get the correct rotation
        const angle = v.angle() - std.math.pi / 2.0;
        const height = v_len + height_offset * 2.0;

        const shape_id = b2.b2CreatePolygonShape(body_id, shape_def, &shape);
        return RectangleShape{
            .shape = shape,
            .shape_id = shape_id,
            .width = width,
            .height = height,
            .angle = angle,
        };
    }

    pub fn deinit(self: *const Self) void {
        b2.b2DestroyShape(self.shape_id);
    }

    /// Creates a vertical raylib rectangle with origin in vextex[3] corner
    /// Corner is additionally moved to [`position`] and rotated around (0, 0) by
    /// [`angle`] rad
    pub fn rl_rect(
        self: *const RectangleShape,
        position: Vector2,
        angle: f32,
    ) rl.Rectangle {
        const corner = Vector2.from_b2(self.shape.vertices[3]);
        const corner_pos = corner.rotate(angle).add(&position).to_rl_as_pos();
        return rl.Rectangle{
            .x = corner_pos.x,
            .y = corner_pos.y,
            .width = self.width,
            .height = self.height,
        };
    }
};

pub const RectangleParams = struct {
    position: Vector2 = Vector2.ZERO,
    point_1: Vector2 = Vector2.X,
    point_2: Vector2 = Vector2.NEG_X,
    width: f32 = 10.0,
    height_offset: f32 = 10.0,
    restitution: f32 = 0.0,
    is_sensor: bool = false,
    color: rl.Color = rl.WHITE,
};

pub const Rectangle = struct {
    world_id: b2.b2WorldId,
    body_id: b2.b2BodyId,
    rectangle: RectangleShape,

    const Self = @This();

    pub fn new(
        world_id: b2.b2WorldId,
        params: RectangleParams,
    ) !Self {
        var body_def = b2.b2DefaultBodyDef();
        body_def.type = b2.b2_staticBody;
        body_def.position = params.position.to_b2();
        const body_id = b2.b2CreateBody(world_id, &body_def);
        errdefer b2.b2DestroyBody(body_id);

        var shape_def = b2.b2DefaultShapeDef();
        shape_def.restitution = params.restitution;
        shape_def.isSensor = params.is_sensor;
        const rectangle = try RectangleShape.new(
            body_id,
            &shape_def,
            params.point_1,
            params.point_2,
            params.width,
            params.height_offset,
        );

        return Self{
            .world_id = world_id,
            .body_id = body_id,
            .rectangle = rectangle,
        };
    }

    pub fn deinit(self: *const Self) void {
        // flecs calls dtor on zero init value
        // during first `ecs_set` call
        var self_slice: []const u8 = undefined;
        self_slice.ptr = @ptrCast(self);
        self_slice.len = @sizeOf(Self);
        if (std.mem.allEqual(u8, self_slice, 0)) {
            return;
        }

        self.rectangle.deinit();
        b2.b2DestroyBody(self.body_id);
    }

    pub fn aabb_contains(self: *const Self, point: Vector2) bool {
        const position = Vector2.from_b2(b2.b2Body_GetPosition(self.body_id));
        const aabb = AABB.from_b2(b2.b2Shape_GetAABB(self.rectangle.shape_id));
        return aabb.contains(position, point);
    }

    pub fn set_position(self: *Self, position: Vector2) void {
        self.params.position = position;
        self.params_editor = ParamEditor(RectangleParams).new(&self.params);

        const angle = b2.b2Body_GetAngle(self.body_id);
        b2.b2Body_SetTransform(self.body_id, position.to_b2(), angle);
    }

    pub fn draw_editor(self: *Self, world_id: b2.b2WorldId) void {
        if (self.params_editor.draw(Vector2{ .x = 0.0, .y = 0.0 })) |new_params| {
            if (Self.new(world_id, new_params)) |new_self| {
                self.deinit();
                self.* = new_self;
            } else |e| {
                std.log.err("Error recreating {any}: {}", .{ Self, e });
            }
        }
    }
};

pub const RectangleChainParams = struct {
    position: Vector2 = Vector2.ZERO,
    points: []Vector2,
    width: f32 = 10.0,
    height_offset: f32 = 10.0,
    color: rl.Color = rl.WHITE,

    const Self = @This();

    pub fn deinit(self: *const Self, allocator: Allocator) void {
        allocator.free(self.points);
    }

    pub fn clone(self: *const Self, allocator: Allocator) !Self {
        const points_clone = try allocator.dupe(Vector2, self.points);
        return Self{
            .position = self.position,
            .points = points_clone,
            .width = self.width,
            .height_offset = self.height_offset,
            .color = self.color,
        };
    }
};

pub const RectangleChain = struct {
    allocator: Allocator,

    body_id: b2.b2BodyId,
    rectangles: std.ArrayList(RectangleShape),
    params: RectangleChainParams,
    params_editor: ParamEditor(RectangleChainParams),

    const Self = @This();

    pub fn new(
        world_id: b2.b2WorldId,
        allocator: Allocator,
        params: RectangleChainParams,
    ) !Self {
        var body_def = b2.b2DefaultBodyDef();
        body_def.type = b2.b2_staticBody;
        body_def.position = params.position.to_b2();
        const body_id = b2.b2CreateBody(world_id, &body_def);
        errdefer b2.b2DestroyBody(body_id);

        var rectangles = std.ArrayList(RectangleShape).init(allocator);
        errdefer rectangles.deinit();

        try rectangles.resize(params.points.len - 1);

        for (0..params.points.len - 1) |i| {
            const p_1 = params.points[i];
            const p_2 = params.points[i + 1];

            const shape_def = b2.b2DefaultShapeDef();
            const rect = try RectangleShape.new(
                body_id,
                &shape_def,
                p_1,
                p_2,
                params.width,
                params.height_offset,
            );
            rectangles.items[i] = rect;
        }
        const params_editor = try ParamEditor(RectangleChainParams).new_with_alloc(&params, allocator);

        return Self{
            .allocator = allocator,
            .body_id = body_id,
            .rectangles = rectangles,
            .params = params,
            .params_editor = params_editor,
        };
    }

    pub fn deinit(self: *const Self) void {
        // flecs calls dtor on zero init value
        // during first `ecs_set` call
        var self_slice: []const u8 = undefined;
        self_slice.ptr = @ptrCast(self);
        self_slice.len = @sizeOf(Self);
        if (std.mem.allEqual(u8, self_slice, 0)) {
            return;
        }

        for (self.rectangles.items) |*rectangle| {
            rectangle.deinit();
        }
        b2.b2DestroyBody(self.body_id);
        self.rectangles.deinit();
        self.params.deinit(self.allocator);
        self.params_editor.deinit_with_alloc(self.allocator);
    }

    pub fn recreate(self: *Self, world_id: b2.b2WorldId) !void {
        const params = try self.params.clone(self.allocator);
        self.deinit();
        self.* = try Self.new(world_id, self.allocator, params);
    }

    pub fn aabb(self: *const Self) AABB {
        var local_aabb = AABB.new();
        for (self.rectangles.items) |*rectangle| {
            const rectangle_aabb = AABB.from_b2(b2.b2Shape_GetAABB(rectangle.shape_id));
            local_aabb = local_aabb.union_with(&rectangle_aabb);
        }
        return local_aabb;
    }

    pub fn aabb_contains(self: *const Self, point: Vector2) bool {
        const position = Vector2.from_b2(b2.b2Body_GetPosition(self.body_id));
        const local_aabb = self.aabb();
        return local_aabb.contains(position, point);
    }

    pub fn set_position(self: *Self, position: Vector2) !void {
        self.params.position = position;
        self.params_editor.deinit(self.allocator);
        self.params_editor = try ParamEditor(RectangleChainParams).new_with_alloc(
            &self.params,
            self.allocator,
        );

        const angle = b2.b2Body_GetAngle(self.body_id);
        b2.b2Body_SetTransform(self.body_id, position.to_b2(), angle);
    }

    pub fn draw(self: *const Self) void {
        const body_position = Vector2.from_b2(b2.b2Body_GetPosition(self.body_id));
        const body_angle = b2.b2Body_GetAngle(self.body_id);
        for (self.rectangles.items) |*rectangle| {
            const rl_rect = rectangle.rl_rect(body_position, body_angle);
            const angle = rectangle.angle + body_angle;
            // raylib rotates in clock wise order
            // we negeate degrees to chacnge it to ccw
            const rl_angle = -(angle / std.math.pi * 180.0);
            rl.DrawRectanglePro(rl_rect, rl.Vector2{
                .x = 0.0,
                .y = 0.0,
            }, rl_angle, self.params.color);
        }
    }

    pub fn draw_aabb(self: *const Self, color: rl.Color) void {
        const body_position = Vector2.from_b2(b2.b2Body_GetPosition(self.body_id));
        const local_aabb = self.aabb();
        const rl_aabb_rect = local_aabb.to_rl_rect(body_position);
        rl.DrawRectangleLinesEx(
            rl_aabb_rect,
            AABB_LINE_THICKNESS,
            color,
        );
    }

    pub fn draw_editor(self: *Self, world_id: b2.b2WorldId) !void {
        if (try self.params_editor.draw_alloc(
            self.allocator,
            Vector2{ .x = 0.0, .y = 0.0 },
        )) |new_params| {
            if (Self.new(world_id, self.allocator, new_params)) |new_self| {
                self.deinit();
                self.* = new_self;
            } else |e| {
                std.log.err("Error recreating {any}: {}", .{ Self, e });
            }
        }
    }
};

pub const ObjectTags = enum {
    Arc,
    Ball,
    Anchor,
    Rectangle,
    RectangleChain,
};

pub const ObjectParams = union(ObjectTags) {
    Arc: ArcParams,
    Ball: BallParams,
    Anchor: AnchorParams,
    Rectangle: RectangleParams,
    RectangleChain: RectangleChainParams,
};

pub const Object = union(ObjectTags) {
    Arc: Arc,
    Ball: Ball,
    Anchor: Anchor,
    Rectangle: Rectangle,
    RectangleChain: RectangleChain,

    const Self = @This();

    pub fn init(allocator: Allocator, world_id: b2.b2WorldId, p: *const ObjectParams) !Self {
        return switch (p.*) {
            .Arc => |*arc_params| .{ .Arc = Arc.new(world_id, arc_params.*) },
            .Ball => |*ball_params| .{ .Ball = Ball.new(world_id, ball_params.*) },
            .Anchor => |*anchor_params| .{ .Anchor = Anchor.new(world_id, anchor_params.*) },
            .Rectangle => |*rectangle_params| .{ .Rectangle = try Rectangle.new(world_id, rectangle_params.*) },
            .RectangleChain => |*rectangle_chain_params| {
                const c = try rectangle_chain_params.clone(allocator);
                return .{
                    .RectangleChain = try RectangleChain.new(world_id, allocator, c),
                };
            },
        };
    }

    pub fn deinit(self: *const Self) void {
        switch (self.*) {
            .Arc => |*arc| arc.deinit(),
            .Ball => |*ball| ball.deinit(),
            .Anchor => |*anchor| anchor.deinit(),
            .Rectangle => |*rectangle| rectangle.deinit(),
            .RectangleChain => |*rectangle_chain| rectangle_chain.deinit(),
        }
    }

    pub fn recreate(self: *Self, world_id: b2.b2WorldId) !void {
        switch (self.*) {
            .Arc => |*arc| arc.recreate(world_id),
            .Ball => |*ball| ball.recreate(world_id),
            .Anchor => |*anchor| anchor.recreate(world_id),
            .Rectangle => |*rectangle| try rectangle.recreate(world_id),
            .RectangleChain => |*rectangle_chain| try rectangle_chain.recreate(
                world_id,
            ),
        }
    }

    pub fn draw(self: *const Self) void {
        switch (self.*) {
            .Arc => |*arc| arc.draw(),
            .Ball => |*ball| ball.draw(),
            .Anchor => |*anchor| anchor.draw(),
            .Rectangle => |*rectangle| rectangle.draw(),
            .RectangleChain => |*rectangle_chain| rectangle_chain.draw(),
        }
    }

    pub fn draw_aabb(self: *const Self, color: rl.Color) void {
        switch (self.*) {
            .Arc => |*arc| arc.draw_aabb(color),
            .Ball => |*ball| ball.draw_aabb(color),
            .Anchor => |*anchor| anchor.draw_aabb(color),
            .Rectangle => |*rectangle| rectangle.draw_aabb(color),
            .RectangleChain => |*rectangle_chain| rectangle_chain.draw_aabb(color),
        }
    }

    pub fn draw_editor(self: *Self, world_id: b2.b2WorldId) !void {
        switch (self.*) {
            .Arc => |*arc| arc.draw_editor(world_id),
            .Ball => |*ball| ball.draw_editor(world_id),
            .Anchor => |*anchor| anchor.draw_editor(world_id),
            .Rectangle => |*rectangle| rectangle.draw_editor(world_id),
            .RectangleChain => |*rectangle_chain| try rectangle_chain.draw_editor(world_id),
        }
    }

    pub fn set_position(self: *Self, position: Vector2) !void {
        switch (self.*) {
            .Arc => |*arc| arc.set_position(position),
            .Ball => |*ball| ball.set_position(position),
            .Anchor => |*anchor| anchor.set_position(position),
            .Rectangle => |*rectangle| rectangle.set_position(position),
            .RectangleChain => |*rectangle_chain| try rectangle_chain.set_position(position),
        }
    }

    pub fn aabb_contains(self: *Self, position: Vector2) bool {
        return switch (self.*) {
            .Arc => |*arc| arc.aabb_contains(position),
            .Ball => |*ball| ball.aabb_contains(position),
            .Anchor => |*anchor| anchor.aabb_contains(position),
            .Rectangle => |*rectangle| rectangle.aabb_contains(position),
            .RectangleChain => |*rectangle_chain| rectangle_chain.aabb_contains(position),
        };
    }

    pub fn params(self: *const Self, allocator: Allocator) !ObjectParams {
        return switch (self.*) {
            .Arc => |*arc| .{ .Arc = arc.params },
            .Ball => |*ball| .{ .Ball = ball.params },
            .Anchor => |*anchor| .{ .Anchor = anchor.params },
            .Rectangle => |*rectangle| .{ .Rectangle = rectangle.params },
            .RectangleChain => |*rectangle_chain| .{ .RectangleChain = try rectangle_chain.params.clone(allocator) },
        };
    }

    pub fn update(self: *Self, game: *Game, sensor_events: *const SensorEvents) void {
        switch (self.*) {
            .Arc => |_| {},
            .Ball => |_| {},
            .Anchor => |*anchor| anchor.update(game),
            .Rectangle => |*rectangle| rectangle.update(game, sensor_events),
            .RectangleChain => |_| {},
        }
    }
};

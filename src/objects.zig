const std = @import("std");
const Allocator = std.mem.Allocator;

const rl = @import("deps/raylib.zig");
const b2 = @import("deps/box2d.zig");
const flecs = @import("deps/flecs.zig");

const _game = @import("game.zig");
const WinTarget = _game.WinTarget;
const LevelObject = _game.LevelObject;
const GameStateStack = _game.GameStateStack;
const MousePosition = _game.MousePosition;
const PhysicsWorld = _game.PhysicsWorld;

const Vector2 = @import("vector.zig");

const AABB_LINE_THICKNESS = 1.5;

pub const BallShader = struct {
    ball_shader: rl.Shader,

    const Self = @This();

    pub fn new(vs_path: [*c]const u8, fs_path: [*c]const u8) Self {
        const shader = rl.LoadShader(vs_path, fs_path);
        return Self{
            .ball_shader = shader,
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

        rl.UnloadShader(self.ball_shader);
    }
};

pub const BodyId = struct {
    id: b2.b2BodyId,

    const Self = @This();

    pub fn deinit(self: *const Self) void {
        // flecs calls dtor on zero init value
        // during first `ecs_set` call
        var self_slice: []const u8 = undefined;
        self_slice.ptr = @ptrCast(self);
        self_slice.len = @sizeOf(Self);
        if (std.mem.allEqual(u8, self_slice, 0)) {
            return;
        }

        b2.b2DestroyBody(self.id);
    }
};

pub const ShapeId = struct {
    id: b2.b2ShapeId,

    // we don't need to clean shapes
    // because they are deleated with body
};

pub const Position = struct {
    value: Vector2,
};

pub const Color = struct {
    value: rl.Color,
};

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
        const top_left = (Vector2{
            .x = self.aabb.lowerBound.x,
            .y = self.aabb.upperBound.y,
        }).add(&position).to_rl_as_pos();
        const width = self.aabb.upperBound.x - self.aabb.lowerBound.x;
        const height = self.aabb.upperBound.y - self.aabb.lowerBound.y;
        return rl.Rectangle{
            .x = top_left.x,
            .y = top_left.y,
            .width = width,
            .height = height,
        };
    }

    pub fn move(self: *Self, offset: Vector2) void {
        self.aabb.lowerBound.x += offset.x;
        self.aabb.lowerBound.y += offset.y;
        self.aabb.upperBound.x += offset.x;
        self.aabb.upperBound.y += offset.y;
    }

    pub fn center(self: *const Self) Vector2 {
        return Vector2.from_b2(b2.b2AABB_Center(self.aabb));
    }

    pub fn contains(self: *const Self, position: Vector2, point: Vector2) bool {
        const self_position = self.center().add(&position);
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

fn update_positions(iter: *flecs.iter_t, bodies: []const BodyId, positions: []Position) void {
    const state_stack = flecs.singleton_get_mut(iter.world, GameStateStack).?;
    const current_state = state_stack.current_state();
    if (!(current_state == .Running or
        current_state == .Editor))
    {
        return;
    }

    for (bodies, positions) |*body, *position| {
        position.value = Vector2.from_b2(b2.b2Body_GetPosition(body.id));
    }
}

pub const SpawnerTag = struct {};

pub const SpawnerParams = struct {
    position: Vector2 = Vector2.ZERO,

    const Self = @This();

    pub fn new(position: *const Position) Self {
        return Self{
            .position = position.value,
        };
    }
};

pub fn create_spawner(ecs_world: *flecs.world_t, params: *const SpawnerParams) void {
    const n = flecs.new_id(ecs_world);
    _ = flecs.add(ecs_world, n, SpawnerTag);
    _ = flecs.set(ecs_world, n, Position, .{ .value = params.position });
    _ = flecs.set(ecs_world, n, LevelObject, .{ .destruction_order = 1 });
}

pub const BallTag = struct {};

pub const BallShape = struct {
    radius: f32,
};

pub const BallAttachment = struct {
    should_attach: bool,
    attached: bool,
};

// Used only for serialization/deserialization
pub const BallParams = struct {
    color: rl.Color = rl.WHITE,
    radius: f32 = 10.0,

    const Self = @This();

    pub fn new(color: *const Color, shape: *const BallShape) Self {
        return Self{
            .color = color.value,
            .radius = shape.radius,
        };
    }
};

pub fn create_ball(ecs_world: *flecs.world_t, physics_world: b2.b2WorldId, params: *const BallParams) void {
    var body_def = b2.b2DefaultBodyDef();
    body_def.type = b2.b2_dynamicBody;
    const body_id = b2.b2CreateBody(physics_world, &body_def);

    var shape_def = b2.b2DefaultShapeDef();
    shape_def.density = 100.0;
    shape_def.friction = 0.5;
    shape_def.restitution = 0.3;

    const circle = b2.b2Circle{
        .point = b2.b2Vec2{ .x = 0.0, .y = 0.0 },
        .radius = params.radius,
    };
    const shape_id = b2.b2CreateCircleShape(body_id, &shape_def, &circle);

    const n = flecs.new_id(ecs_world);
    _ = flecs.add(ecs_world, n, BallTag);

    _ = flecs.set(ecs_world, n, Color, .{ .value = params.color });
    _ = flecs.set(ecs_world, n, Position, .{ .value = Vector2.ZERO });
    _ = flecs.set(ecs_world, n, BodyId, .{ .id = body_id });
    _ = flecs.set(ecs_world, n, ShapeId, .{ .id = shape_id });
    _ = flecs.set(ecs_world, n, BallShape, .{ .radius = params.radius });
    _ = flecs.set(ecs_world, n, BallAttachment, .{
        .should_attach = true,
        .attached = false,
    });

    const aabb = AABB.from_b2(b2.b2Shape_GetAABB(shape_id));
    _ = flecs.set(ecs_world, n, AABB, aabb);

    _ = flecs.set(ecs_world, n, LevelObject, .{ .destruction_order = 1 });
}

fn draw_balls(
    iter: *flecs.iter_t,
    positions: []const Position,
    bodies: []const BodyId,
    shapes: []const BallShape,
    colors: []const Color,
) void {
    const state_stack = flecs.singleton_get(iter.world, GameStateStack).?;
    const current_state = state_stack.current_state();
    if (!(current_state == .Running or
        current_state == .Editor or
        current_state == .Paused))
    {
        return;
    }

    const shaders = flecs.singleton_get(iter.world, BallShader).?;

    for (positions, bodies, shapes, colors) |*position, *body, *shape, *color| {
        {
            rl.BeginShaderMode(shaders.ball_shader);
            defer rl.EndShaderMode();

            rl.DrawCircleV(position.value.to_rl_as_pos(), shape.radius, color.value);
            const velocity = Vector2.from_b2(b2.b2Body_GetLinearVelocity(body.id)).div(2.0);
            const target = position.value.add(&velocity);
            rl.DrawLineV(
                position.value.to_rl_as_pos(),
                target.to_rl_as_pos(),
                color.value,
            );
        }
    }
}

fn update_balls(iter: *flecs.iter_t, attachments: []BallAttachment) void {
    const state_stack = flecs.singleton_get(iter.world, GameStateStack).?;
    if (state_stack.current_state() != .Running) {
        return;
    }

    for (attachments) |*a| {
        if (rl.IsKeyDown(rl.KEY_SPACE)) {
            a.should_attach = false;
        } else {
            a.should_attach = true;
        }
    }
}

pub const AnchorTag = struct {};

pub const AnchorShape = struct {
    radius: f32,
};

pub const AnchoraJointParams = struct {
    min_length: f32 = 0.0,
    max_length: f32 = 100.0,
    damping_ratio: f32 = 0.5,
    hertz: f32 = 1.0,
    pull_force: f32 = 200.0,
};

pub const AnchorParams = struct {
    color: rl.Color = rl.GREEN,
    position: Vector2 = Vector2.ZERO,
    radius: f32 = 10.0,

    min_length: f32 = 0.0,
    max_length: f32 = 100.0,
    damping_ratio: f32 = 0.5,
    hertz: f32 = 1.0,
    pull_force: f32 = 200.0,

    const Self = @This();

    pub fn new(
        color: *const Color,
        position: *const Position,
        shape: *const AnchorShape,
        joint_params: *const AnchoraJointParams,
    ) Self {
        return Self{
            .position = position.value,
            .radius = shape.radius,
            .color = color.value,

            .min_length = joint_params.min_length,
            .max_length = joint_params.max_length,
            .damping_ratio = joint_params.damping_ratio,
            .hertz = joint_params.hertz,
            .pull_force = joint_params.pull_force,
        };
    }
};

pub fn create_anchor(
    ecs_world: *flecs.world_t,
    physics_world: b2.b2WorldId,
    params: *const AnchorParams,
) void {
    var body_def = b2.b2DefaultBodyDef();
    body_def.type = b2.b2_staticBody;
    body_def.position = params.position.to_b2();
    const body_id = b2.b2CreateBody(physics_world, &body_def);

    const n = flecs.new_id(ecs_world);
    _ = flecs.add(ecs_world, n, AnchorTag);

    _ = flecs.set(ecs_world, n, Color, .{ .value = params.color });
    _ = flecs.set(ecs_world, n, Position, .{ .value = params.position });
    _ = flecs.set(ecs_world, n, BodyId, .{ .id = body_id });
    _ = flecs.set(ecs_world, n, AnchorShape, .{ .radius = params.radius });

    const anchor_joint_params = AnchoraJointParams{
        .min_length = params.min_length,
        .max_length = params.max_length,
        .damping_ratio = params.damping_ratio,
        .hertz = params.hertz,
        .pull_force = params.pull_force,
    };

    _ = flecs.set(ecs_world, n, AnchoraJointParams, anchor_joint_params);

    const aabb = AABB.from_b2(b2.b2AABB{
        .lowerBound = (Vector2{
            .x = -params.radius,
            .y = -params.radius,
        }).to_b2(),
        .upperBound = (Vector2{
            .x = params.radius,
            .y = params.radius,
        }).to_b2(),
    });
    _ = flecs.set(ecs_world, n, AABB, aabb);

    _ = flecs.set(ecs_world, n, LevelObject, .{ .destruction_order = 1 });
}

fn draw_anchors(
    iter: *flecs.iter_t,
    positions: []const Position,
    colors: []const Color,
    shapes: []const AnchorShape,
    joint_params: []const AnchoraJointParams,
) void {
    const state_stack = flecs.singleton_get(iter.world, GameStateStack).?;
    const current_state = state_stack.current_state();
    if (!(current_state == .Running or
        current_state == .Editor or
        current_state == .Paused))
    {
        return;
    }

    for (positions, colors, shapes, joint_params) |*position, *color, *shape, *joint_param| {
        rl.DrawCircleV(position.value.to_rl_as_pos(), shape.radius, color.value);
        var radius_color = color.value;
        radius_color.a = 30;
        rl.DrawCircleV(position.value.to_rl_as_pos(), joint_param.max_length, radius_color);
    }
}

fn update_anchors_try_attach(
    iter: *flecs.iter_t,
    positons: []const Position,
    colors: []const Color,
    bodies: []const BodyId,
    shapes: []const AnchorShape,
    joint_params: []const AnchoraJointParams,
    // Not AnchorJointId
) void {
    const state_stack = flecs.singleton_get(iter.world, GameStateStack).?;
    if (state_stack.current_state() != .Running) {
        return;
    }

    const physics_world = flecs.singleton_get(iter.world, PhysicsWorld).?;

    const ball_query: *flecs.query_t = @ptrCast(iter.ctx.?);
    var ball_iter = flecs.query_iter(iter.world, ball_query);
    std.debug.assert(flecs.query_next(&ball_iter));
    const ball_body = flecs.field(&ball_iter, BodyId, 1).?[0];
    const ball_shape = flecs.field(&ball_iter, BallShape, 2).?[0];
    const ball_position = flecs.field(&ball_iter, Position, 3).?[0];
    var ball_attachment = &flecs.field(&ball_iter, BallAttachment, 4).?[0];
    std.debug.assert(!flecs.query_next(&ball_iter));

    if (!ball_attachment.should_attach or ball_attachment.attached) {
        return;
    }

    for (positons, colors, bodies, shapes, joint_params) |*position, *color, *body, *shape, *joint_param| {
        if (position.value.sub(&ball_position.value).length() < shape.radius + ball_shape.radius) {
            create_joint(
                iter.world,
                physics_world.id,
                joint_param,
                body.id,
                ball_body.id,
                color.value,
            );
            ball_attachment.attached = true;
        }
    }
}

pub const JointTag = struct {};

pub const JointId = struct {
    id: b2.b2JointId,
    attached_body_id: b2.b2BodyId,
    attached_anchor_id: b2.b2BodyId,

    const Self = @This();

    pub fn deinit(self: *const Self) void {
        // flecs calls dtor on zero init value
        // during first `ecs_set` call
        var self_slice: []const u8 = undefined;
        self_slice.ptr = @ptrCast(self);
        self_slice.len = @sizeOf(Self);
        if (std.mem.allEqual(u8, self_slice, 0)) {
            return;
        }

        b2.b2DestroyJoint(self.id);
    }
};

pub const JointStrength = struct {
    value: f32,
};

pub fn create_joint(
    ecs_world: *flecs.world_t,
    physics_world: b2.b2WorldId,
    params: *const AnchoraJointParams,
    anchor_id: b2.b2BodyId,
    ball_id: b2.b2BodyId,
    color: rl.Color,
) void {
    var joint_def = b2.b2DefaultDistanceJointDef();
    joint_def.bodyIdA = anchor_id;
    joint_def.bodyIdB = ball_id;
    joint_def.length = 0.0;
    joint_def.minLength = params.min_length;
    joint_def.maxLength = params.max_length;
    joint_def.dampingRatio = params.damping_ratio;
    joint_def.hertz = params.hertz;

    const joint_id = b2.b2CreateDistanceJoint(physics_world, &joint_def);

    const n = flecs.new_id(ecs_world);
    _ = flecs.add(ecs_world, n, JointTag);

    _ = flecs.set(ecs_world, n, Color, .{ .value = color });
    _ = flecs.set(ecs_world, n, JointId, .{
        .id = joint_id,
        .attached_body_id = ball_id,
        .attached_anchor_id = anchor_id,
    });
    _ = flecs.set(ecs_world, n, JointStrength, .{ .value = params.pull_force });

    _ = flecs.set(ecs_world, n, LevelObject, .{ .destruction_order = 0 });
}

fn draw_joints(iter: *flecs.iter_t, ids: []const JointId, colors: []const Color) void {
    const state_stack = flecs.singleton_get(iter.world, GameStateStack).?;
    const current_state = state_stack.current_state();
    if (!(current_state == .Running or
        current_state == .Editor or
        current_state == .Paused))
    {
        return;
    }

    for (ids, colors) |*id, *color| {
        const ball_position = Vector2.from_b2(b2.b2Body_GetPosition(id.attached_body_id));
        const anchor_position = Vector2.from_b2(b2.b2Body_GetPosition(id.attached_anchor_id));
        rl.DrawLineV(
            ball_position.to_rl_as_pos(),
            anchor_position.to_rl_as_pos(),
            color.value,
        );
    }
}

fn update_joints(
    iter: *flecs.iter_t,
    joint_ids: []const JointId,
    joint_stengths: []const JointStrength,
) void {
    const state_stack = flecs.singleton_get(iter.world, GameStateStack).?;
    if (state_stack.current_state() != .Running) {
        return;
    }

    const mouse_pos = flecs.singleton_get(iter.world, MousePosition).?;

    const ball_query: *flecs.query_t = @ptrCast(iter.ctx.?);
    var ball_iter = flecs.query_iter(iter.world, ball_query);
    std.debug.assert(flecs.query_next(&ball_iter));
    var ball_attachment = &flecs.field(&ball_iter, BallAttachment, 1).?[0];
    std.debug.assert(!flecs.query_next(&ball_iter));

    for (iter.entities(), joint_ids, joint_stengths) |e, *joint_id, *joint_stength| {
        if (rl.IsKeyDown(rl.KEY_SPACE)) {
            ball_attachment.attached = false;
            _ = flecs.delete(iter.world, e);
        }

        if (rl.IsMouseButtonDown(rl.MOUSE_BUTTON_LEFT)) {
            const anchor_position = Vector2.from_b2(b2.b2Body_GetPosition(joint_id.attached_anchor_id));
            const to_mouse = mouse_pos.world_position
                .sub(&anchor_position)
                .normalized()
                .mul(joint_stength.value);
            b2.b2Body_SetLinearVelocity(joint_id.attached_body_id, to_mouse.to_b2());
        }
    }
}

pub const RectangleTag = struct {};

pub const RectangleShape = struct {
    shape: b2.b2Polygon,
    height: f32,
    angle: f32,

    point_1: Vector2 = Vector2.X,
    point_2: Vector2 = Vector2.NEG_X,
    width: f32 = 10.0,
    height_offset: f32 = 10.0,
    restitution: f32 = 0.0,
    is_sensor: bool = false,

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
    pub fn new(
        point_1: Vector2,
        point_2: Vector2,
        width: f32,
        height_offset: f32,
        restitution: f32,
        is_sensor: bool,
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

        return RectangleShape{
            .shape = shape,
            .height = height,
            .angle = angle,

            .point_1 = point_1,
            .point_2 = point_2,
            .width = width,
            .height_offset = height_offset,
            .restitution = restitution,
            .is_sensor = is_sensor,
        };
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
    color: rl.Color = rl.WHITE,
    position: Vector2 = Vector2.ZERO,

    point_1: Vector2 = Vector2.X,
    point_2: Vector2 = Vector2.NEG_X,
    width: f32 = 10.0,
    height_offset: f32 = 10.0,
    restitution: f32 = 0.0,
    is_sensor: bool = false,

    const Self = @This();

    pub fn new(color: *const Color, position: *const Position, shape: *const RectangleShape) Self {
        return Self{
            .color = color.value,
            .position = position.value,

            .point_1 = shape.point_1,
            .point_2 = shape.point_2,
            .width = shape.width,
            .height_offset = shape.height_offset,
            .restitution = shape.restitution,
            .is_sensor = shape.is_sensor,
        };
    }
};

pub fn create_rectangle(
    ecs_world: *flecs.world_t,
    physics_world: b2.b2WorldId,
    params: *const RectangleParams,
) !void {
    var body_def = b2.b2DefaultBodyDef();
    body_def.type = b2.b2_staticBody;
    body_def.position = params.position.to_b2();
    const body_id = b2.b2CreateBody(physics_world, &body_def);
    errdefer b2.b2DestroyBody(body_id);

    var shape_def = b2.b2DefaultShapeDef();
    shape_def.restitution = params.restitution;
    shape_def.isSensor = params.is_sensor;
    const rectangle = try RectangleShape.new(
        params.point_1,
        params.point_2,
        params.width,
        params.height_offset,
        params.restitution,
        params.is_sensor,
    );
    const shape_id = b2.b2CreatePolygonShape(body_id, &shape_def, &rectangle.shape);

    const n = flecs.new_id(ecs_world);
    _ = flecs.add(ecs_world, n, RectangleTag);

    _ = flecs.set(ecs_world, n, Color, .{ .value = params.color });
    _ = flecs.set(ecs_world, n, Position, .{ .value = params.position });
    _ = flecs.set(ecs_world, n, BodyId, .{ .id = body_id });
    _ = flecs.set(ecs_world, n, ShapeId, .{ .id = shape_id });
    _ = flecs.set(ecs_world, n, RectangleShape, rectangle);

    var aabb = AABB.from_b2(b2.b2Shape_GetAABB(shape_id));
    // move aabb back to 0,0
    aabb.move(params.position.mul(-1));
    _ = flecs.set(ecs_world, n, AABB, aabb);

    _ = flecs.set(ecs_world, n, LevelObject, .{ .destruction_order = 0 });

    if (params.is_sensor) {
        _ = flecs.add(ecs_world, n, WinTarget);
    }
}

fn draw_rectangles(
    iter: *flecs.iter_t,
    positions: []const Position,
    shapes: []const RectangleShape,
    colors: []const Color,
) void {
    const state_stack = flecs.singleton_get(iter.world, GameStateStack).?;
    const current_state = state_stack.current_state();
    if (!(current_state == .Running or
        current_state == .Editor or
        current_state == .Paused))
    {
        return;
    }

    for (positions, shapes, colors) |*position, *shape, *color| {
        // const body_angle = b2.b2Body_GetAngle(rect.body_id);
        const body_angle = 0.0;
        const rl_rect = shape.rl_rect(position.value, body_angle);
        const angle = shape.angle + body_angle;
        // raylib rotates in clock wise order
        // we negeate degrees to chacnge it to ccw
        const rl_angle = -(angle / std.math.pi * 180.0);
        rl.DrawRectanglePro(
            rl_rect,
            rl.Vector2{
                .x = 0.0,
                .y = 0.0,
            },
            rl_angle,
            color.value,
        );
    }
}

pub const ObjectTags = enum {
    Spawner,
    Ball,
    Anchor,
    Rectangle,
};

pub const ObjectParams = union(ObjectTags) {
    Spawner: SpawnerParams,
    Ball: BallParams,
    Anchor: AnchorParams,
    Rectangle: RectangleParams,
};

pub fn FLECS_INIT_COMPONENTS(world: *flecs.world_t, allocator: Allocator) !void {
    _ = allocator;
    flecs.COMPONENT(world, AABB);
    flecs.COMPONENT(world, Color);
    flecs.COMPONENT(world, Position);
    flecs.COMPONENT(world, BodyId);
    flecs.COMPONENT(world, ShapeId);

    flecs.COMPONENT(world, BallShader);

    flecs.TAG(world, SpawnerTag);

    flecs.TAG(world, BallTag);
    flecs.COMPONENT(world, BallShape);
    flecs.COMPONENT(world, BallAttachment);

    flecs.TAG(world, AnchorTag);
    flecs.COMPONENT(world, AnchorShape);
    flecs.COMPONENT(world, AnchoraJointParams);

    flecs.TAG(world, JointTag);
    flecs.COMPONENT(world, JointId);
    flecs.COMPONENT(world, JointStrength);

    flecs.TAG(world, RectangleTag);
    flecs.COMPONENT(world, RectangleShape);

    const shaders = BallShader.new(null, "./resources/shaders/base.fs");
    _ = flecs.singleton_set(world, BallShader, shaders);
}

pub fn FLECS_INIT_SYSTEMS(world: *flecs.world_t, allocator: Allocator) !void {
    _ = allocator;

    flecs.ADD_SYSTEM(world, "update_positions", flecs.PreUpdate, update_positions);
    flecs.ADD_SYSTEM(world, "update_balls", flecs.PreUpdate, update_balls);
    {
        var desc = flecs.SYSTEM_DESC(update_anchors_try_attach);

        var ball_query: flecs.query_desc_t = .{};
        ball_query.filter.terms[0].id = flecs.id(BodyId);
        ball_query.filter.terms[0].inout = .In;
        ball_query.filter.terms[1].id = flecs.id(BallShape);
        ball_query.filter.terms[1].inout = .In;
        ball_query.filter.terms[2].id = flecs.id(Position);
        ball_query.filter.terms[2].inout = .In;
        ball_query.filter.terms[3].id = flecs.id(BallAttachment);
        ball_query.filter.terms[3].inout = .InOut;
        const q = try flecs.query_init(world, &ball_query);
        desc.ctx = q;
        // No need to clean ctx, query seems to be cleaned automatically.

        flecs.SYSTEM(world, "update_anchors_try_attach", flecs.OnUpdate, &desc);
    }
    {
        var desc = flecs.SYSTEM_DESC(update_joints);

        var ball_query: flecs.query_desc_t = .{};
        ball_query.filter.terms[0].id = flecs.id(BallAttachment);
        ball_query.filter.terms[0].inout = .InOut;
        const q = try flecs.query_init(world, &ball_query);
        desc.ctx = q;
        // No need to clean ctx, query seems to be cleaned automatically.

        flecs.SYSTEM(world, "update_joints", flecs.OnUpdate, &desc);
    }

    flecs.ADD_SYSTEM(world, "draw_balls", flecs.OnUpdate, draw_balls);
    flecs.ADD_SYSTEM(world, "draw_anchors", flecs.OnUpdate, draw_anchors);
    flecs.ADD_SYSTEM(world, "draw_joints", flecs.OnUpdate, draw_joints);
    flecs.ADD_SYSTEM(world, "draw_rectangles", flecs.OnUpdate, draw_rectangles);
}

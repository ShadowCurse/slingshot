const std = @import("std");
const rl = @import("raylib.zig");
const b2 = @import("box2d.zig");
const Vector2 = @import("vector.zig");
const Allocator = std.mem.Allocator;

pub const ObjectTags = enum {
    Arc,
    Ball,
    Anchor,
    Rectangle,
    RectangleChain,
};

pub const Object = union(ObjectTags) {
    Arc: Arc,
    Ball: Ball,
    Anchor: Anchor,
    Rectangle: Rectangle,
    RectangleChain: RectangleChain,
};

pub const Ball = struct {
    body_def: b2.b2BodyDef,
    body_id: b2.b2BodyId,
    shape_def: b2.b2ShapeDef,
    shape_id: b2.b2ShapeId,
    circle: b2.b2Circle,
    color: rl.Color,

    const Self = @This();

    pub fn new(
        world_id: b2.b2WorldId,
        position: Vector2,
        radius: f32,
        color: rl.Color,
    ) Self {
        var body_def = b2.b2DefaultBodyDef();
        body_def.type = b2.b2_dynamicBody;
        body_def.position = position.to_b2();
        const body_id = b2.b2CreateBody(world_id, &body_def);

        var shape_def = b2.b2DefaultShapeDef();
        shape_def.density = 100.0;
        shape_def.friction = 0.5;

        const circle = b2.b2Circle{
            // center of mass
            .point = b2.b2Vec2{ .x = 0.0, .y = 0.0 },
            .radius = radius,
        };
        const shape_id = b2.b2CreateCircleShape(body_id, &shape_def, &circle);

        return Self{
            .body_def = body_def,
            .body_id = body_id,
            .shape_def = shape_def,
            .shape_id = shape_id,
            .circle = circle,
            .color = color,
        };
    }

    pub fn deinit(self: *const Self) void {
        b2.b2DestroyShape(self.shape_id);
        b2.b2DestroyBody(self.body_id);
    }

    pub fn draw(self: *const Self) void {
        const position = Vector2.from_b2(b2.b2Body_GetPosition(self.body_id));
        rl.DrawCircleV(position.to_rl_as_pos(), self.circle.radius, self.color);
    }
};

pub const Anchor = struct {
    body_def: b2.b2BodyDef,
    body_id: b2.b2BodyId,
    length_joint_id: ?b2.b2JointId,
    mouse_joint_id: ?b2.b2JointId,
    attached_body_id: ?b2.b2BodyId,
    radius: f32,
    color: rl.Color,

    const Self = @This();

    pub fn new(
        world_id: b2.b2WorldId,
        position: Vector2,
        radius: f32,
        color: rl.Color,
    ) Self {
        var body_def = b2.b2DefaultBodyDef();
        body_def.type = b2.b2_staticBody;
        body_def.position = position.to_b2();
        const body_id = b2.b2CreateBody(world_id, &body_def);

        return Self{
            .body_def = body_def,
            .body_id = body_id,
            .length_joint_id = null,
            .mouse_joint_id = null,
            .attached_body_id = null,
            .radius = radius,
            .color = color,
        };
    }

    pub fn deinit(self: *const Self) void {
        if (self.length_joint_id) |id| {
            b2.b2DestroyJoint(id);
        }
        if (self.mouse_joint_id) |id| {
            b2.b2DestroyJoint(id);
        }
        b2.b2DestroyBody(self.body_id);
    }

    pub fn update(
        self: *Self,
        world_id: b2.b2WorldId,
        mouse_position: Vector2,
        ball: *const Ball,
    ) void {
        const self_position = Vector2.from_b2(b2.b2Body_GetPosition(self.body_id));
        const ball_position = Vector2.from_b2(b2.b2Body_GetPosition(ball.body_id));

        if (self.length_joint_id == null) {
            if (self_position.sub(&ball_position).length() < self.radius) {
                var joint_def = b2.b2DefaultDistanceJointDef();
                joint_def.bodyIdA = self.body_id;
                joint_def.bodyIdB = ball.body_id;
                joint_def.length = 0.0;
                joint_def.minLength = 0.0;
                joint_def.maxLength = 100.0;
                joint_def.dampingRatio = 0.5;
                joint_def.hertz = 1.0;

                const joint_id = b2.b2CreateDistanceJoint(world_id, &joint_def);
                self.length_joint_id = joint_id;
                self.attached_body_id = ball.body_id;
            }
        } else {
            if (rl.IsMouseButtonDown(rl.MOUSE_BUTTON_LEFT)) {
                if (self.mouse_joint_id) |id| {
                    b2.b2MouseJoint_SetTarget(id, mouse_position.to_b2());
                } else {
                    var joint_def = b2.b2DefaultMouseJointDef();
                    joint_def.bodyIdA = self.body_id;
                    joint_def.bodyIdB = ball.body_id;
                    joint_def.target = mouse_position.to_b2();
                    joint_def.dampingRatio = 10.0;
                    joint_def.hertz = 30.0;

                    const joint_id = b2.b2CreateMouseJoint(world_id, &joint_def);
                    self.mouse_joint_id = joint_id;
                }
            }

            if (rl.IsMouseButtonReleased(rl.MOUSE_BUTTON_LEFT)) {
                if (self.mouse_joint_id) |id| {
                    b2.b2DestroyJoint(id);
                    self.mouse_joint_id = null;
                }
            }

            if (rl.IsKeyDown(rl.KEY_SPACE)) {
                if (self.length_joint_id) |id| {
                    b2.b2DestroyJoint(id);
                    self.length_joint_id = null;
                    self.attached_body_id = null;
                }
            }
        }
    }

    pub fn draw(self: *const Self) void {
        const position = Vector2.from_b2(b2.b2Body_GetPosition(self.body_id));
        rl.DrawCircleV(position.to_rl_as_pos(), self.radius, self.color);

        if (self.attached_body_id) |id| {
            const attached_body_position = Vector2.from_b2(b2.b2Body_GetPosition(id));
            rl.DrawLineV(position.to_rl_as_pos(), attached_body_position.to_rl_as_pos(), self.color);
        }
    }
};

pub const Arc = struct {
    body_id: b2.b2BodyId,

    sub_circles: [SUBCIRCLES_NUM]SubCircle,
    sub_circle_radius: f32,
    color: rl.Color,

    const SubCircle = struct {
        offset: Vector2,
        shape_id: b2.b2ShapeId,
    };

    const Self = @This();
    const SUBCIRCLES_NUM: usize = 8;
    const SUBCIRCLE_RADIUS_DIVISOR: f32 = 4.0;

    pub fn new(
        world_id: b2.b2WorldId,
        position: Vector2,
        radius: f32,
        color: rl.Color,
    ) Self {
        var sub_circles: [SUBCIRCLES_NUM]SubCircle = undefined;
        const sub_circle_radius = radius / SUBCIRCLE_RADIUS_DIVISOR;

        var body_def = b2.b2DefaultBodyDef();
        body_def.type = b2.b2_staticBody;
        body_def.position = position.to_b2();
        const body_id = b2.b2CreateBody(world_id, &body_def);

        const initial_angle = 0.0;
        const angle_step = std.math.pi / @as(f32, @floatFromInt(SUBCIRCLES_NUM - 1));
        for (0..SUBCIRCLES_NUM) |i| {
            const angle: f32 = initial_angle - angle_step * @as(f32, @floatFromInt(i));
            const sin = std.math.sin(angle);
            const cos = std.math.cos(angle);
            const offset = Vector2{ .x = cos * radius, .y = sin * radius };

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
            .color = color,
        };
    }

    pub fn deinit(self: *const Self) void {
        for (&self.sub_circles) |*sub_circle| {
            b2.b2DestroyShape(sub_circle.shape_id);
        }
        b2.b2DestroyBody(self.body_id);
    }

    pub fn draw(self: *const Self) void {
        const body_position = Vector2.from_b2(b2.b2Body_GetPosition(self.body_id));
        const angle = b2.b2Body_GetAngle(self.body_id);
        for (&self.sub_circles) |*sub_circle| {
            const rotated_offset = sub_circle.offset.rotate(angle);
            const p = body_position.add(&rotated_offset).to_rl_as_pos();
            rl.DrawCircleV(p, self.sub_circle_radius, self.color);
        }
    }
};

pub const RectangleShape = struct {
    shape: b2.b2Polygon,
    shape_id: b2.b2ShapeId,
    width: f32,
    height: f32,
    angle: f32,

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
    ) RectangleShape {
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

pub const Rectangle = struct {
    body_id: b2.b2BodyId,
    rectangle: RectangleShape,
    color: rl.Color,

    const Self = @This();

    pub fn new(
        world_id: b2.b2WorldId,
        position: Vector2,
        point_1: Vector2,
        point_2: Vector2,
        width: f32,
        height_offset: f32,
        color: rl.Color,
    ) Self {
        var body_def = b2.b2DefaultBodyDef();
        body_def.type = b2.b2_staticBody;
        body_def.position = position.to_b2();
        const body_id = b2.b2CreateBody(world_id, &body_def);

        const shape_def = b2.b2DefaultShapeDef();
        const rectangle = RectangleShape.new(
            body_id,
            &shape_def,
            point_1,
            point_2,
            width,
            height_offset,
        );

        return Self{
            .body_id = body_id,
            .rectangle = rectangle,
            .color = color,
        };
    }

    pub fn deinit(self: *const Self) void {
        b2.b2DestroyShape(self.rectangle.shape_id);
        b2.b2DestroyBody(self.body_id);
    }

    pub fn draw(self: *const Self) void {
        const body_position = Vector2.from_b2(b2.b2Body_GetPosition(self.body_id));
        const body_angle = b2.b2Body_GetAngle(self.body_id);
        const rl_rect = self.rectangle.rl_rect(body_position, body_angle);
        const angle = self.rectangle.angle + body_angle;
        // raylib rotates in clock wise order
        // we negeate degrees to chacnge it to ccw
        const rl_angle = -(angle / std.math.pi * 180.0);
        rl.DrawRectanglePro(rl_rect, rl.Vector2{
            .x = 0.0,
            .y = 0.0,
        }, rl_angle, self.color);
    }
};

pub const RectangleChain = struct {
    body_id: b2.b2BodyId,
    rectangles: []RectangleShape,
    color: rl.Color,

    const Self = @This();

    pub fn new(
        allocator: Allocator,
        world_id: b2.b2WorldId,
        position: Vector2,
        points: []const Vector2,
        width: f32,
        height_offset: f32,
        color: rl.Color,
    ) !Self {
        var body_def = b2.b2DefaultBodyDef();
        body_def.type = b2.b2_staticBody;
        body_def.position = position.to_b2();
        const body_id = b2.b2CreateBody(world_id, &body_def);

        var rectangles = try allocator.alloc(RectangleShape, points.len - 1);
        for (0..points.len - 1) |i| {
            const p_1 = points[i];
            const p_2 = points[i + 1];

            const shape_def = b2.b2DefaultShapeDef();
            const rect = RectangleShape.new(
                body_id,
                &shape_def,
                p_1,
                p_2,
                width,
                height_offset,
            );
            rectangles[i] = rect;
        }

        return Self{
            .body_id = body_id,
            .rectangles = rectangles,
            .color = color,
        };
    }

    pub fn deinit(self: *const Self, allocator: Allocator) void {
        for (self.rectangles) |*rectangle| {
            b2.b2DestroyShape(rectangle.shape_id);
        }
        b2.b2DestroyBody(self.body_id);
        allocator.free(self.rectangles);
    }

    pub fn draw(self: *const Self) void {
        const body_position = Vector2.from_b2(b2.b2Body_GetPosition(self.body_id));
        const body_angle = b2.b2Body_GetAngle(self.body_id);
        for (self.rectangles) |*rectangle| {
            const rl_rect = rectangle.rl_rect(body_position, body_angle);
            const angle = rectangle.angle + body_angle;
            // raylib rotates in clock wise order
            // we negeate degrees to chacnge it to ccw
            const rl_angle = -(angle / std.math.pi * 180.0);
            rl.DrawRectanglePro(rl_rect, rl.Vector2{
                .x = 0.0,
                .y = 0.0,
            }, rl_angle, self.color);
        }
    }
};

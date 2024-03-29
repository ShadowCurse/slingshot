const rl = @import("raylib.zig");
const b2 = @import("box2d.zig");
const std = @import("std");
const Vector2 = @import("root").Vector2;

pub const Ball = struct {
    body_def: b2.b2BodyDef,
    body_id: b2.b2BodyId,
    shape_def: b2.b2ShapeDef,
    shape_id: b2.b2ShapeId,
    circle: b2.b2Circle,
    color: rl.Color,

    const Self = @This();

    pub fn new(world_id: b2.b2WorldId, position: Vector2, radius: f32, color: rl.Color) Self {
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

    pub fn draw(self: *const Self) void {
        const position = Vector2.from_b2(b2.b2Body_GetPosition(self.body_id));
        rl.DrawCircleV(position.to_rl_as_pos(), self.circle.radius, self.color);
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

    pub fn new(world_id: b2.b2WorldId, position: Vector2, radius: f32, color: rl.Color) Self {
        var sub_circles: [SUBCIRCLES_NUM]SubCircle = undefined;
        const sub_circle_radius = radius / SUBCIRCLE_RADIUS_DIVISOR;

        var body_def = b2.b2DefaultBodyDef();
        body_def.type = b2.b2_kinematicBody;
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

    pub fn update(self: *const Self) void {
        b2.b2Body_SetLinearVelocity(self.body_id, (Vector2{ .x = 0.0, .y = 5.0 }).to_b2());
        // b2.b2Body_SetAngularVelocity(self.body_id, 1.0);
    }

    pub fn draw(self: *const Self) void {
        const body_position = Vector2.from_b2(b2.b2Body_GetPosition(self.body_id));
        // const angle = b2.b2Body_GetAngle(self.body_id);
        for (&self.sub_circles) |*sub_circle| {
            const p = body_position.add(&sub_circle.offset).to_rl_as_pos();
            rl.DrawCircleV(p, self.sub_circle_radius, self.color);
        }
    }
};

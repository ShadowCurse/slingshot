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

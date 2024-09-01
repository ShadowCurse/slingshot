const std = @import("std");
const Allocator = std.mem.Allocator;

const builtin = @import("builtin");

const rl = @import("deps/raylib.zig");
const b2 = @import("deps/box2d.zig");
const flecs = @import("deps/flecs.zig");

const TAG = flecs.SYSTEM_PARAMETER_TAG;
const WORLD = flecs.SYSTEM_PARAMETER_WORLD;
const STATIC = flecs.SYSTEM_PARAMETER_STATIC;
const ENTITIES = flecs.SYSTEM_PARAMETER_ENTITIES;
const COMPONENT = flecs.SYSTEM_PARAMETER_COMPONENT;
const COMPONENT_MUT = flecs.SYSTEM_PARAMETER_COMPONENT_MUT;
const SINGLETON = flecs.SYSTEM_PARAMETER_SINGLETON;

const __game = @import("game.zig");
const WinTarget = __game.WinTarget;
const GameStateStack = __game.GameStateStack;
const GameState = __game.GameState;
const MousePosition = __game.MousePosition;
const PhysicsWorld = __game.PhysicsWorld;
const SensorEvents = __game.SensorEvents;

const __level = @import("level.zig");
const LevelObject = __level.LevelObject;

const Vector2 = @import("vector.zig");

const AABB_LINE_THICKNESS = 1.5;

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

    pub fn default() Self {
        return Self{
            .aabb = b2.b2AABB{
                .lowerBound = Vector2.MAX.to_b2(),
                .upperBound = Vector2.MIN.to_b2(),
            },
        };
    }

    pub fn new_square(half_side: f32) Self {
        return Self{
            .aabb = b2.b2AABB{
                .lowerBound = (Vector2{ .x = -half_side, .y = -half_side }).to_b2(),
                .upperBound = (Vector2{ .x = half_side, .y = half_side }).to_b2(),
            },
        };
    }

    pub fn new_rectangle(half_width: f32, half_height: f32) Self {
        return Self{
            .aabb = b2.b2AABB{
                .lowerBound = (Vector2{ .x = -half_width, .y = -half_height }).to_b2(),
                .upperBound = (Vector2{ .x = half_width, .y = half_height }).to_b2(),
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

fn update_positions(
    _bodies: COMPONENT(BodyId, .In),
    _positions: COMPONENT_MUT(Position, .Out),
) void {
    const bodies = _bodies.get();
    const positions = _positions.get_mut();

    for (bodies, positions) |*body, *position| {
        position.value = Vector2.from_b2(b2.b2Body_GetPosition(body.id));
    }
}

pub const TextTag = struct {};

pub const TextText = struct {
    text: TextParams.TEXT_TYPE = TextParams.TEXT_DEFAULT,
    font_size: f32 = 10.0,
    spacing: f32 = 1.0,
};

pub const TextParams = struct {
    position: Vector2 = Vector2.ZERO,
    color: rl.Color = rl.WHITE,
    text: TextParams.TEXT_TYPE = TextParams.TEXT_DEFAULT,
    font_size: f32 = 10.0,
    spacing: f32 = 1.0,

    const Self = @This();

    const TEXT_SIZE = 64;
    const FONT_WIDTH = 7.0;
    const MAX_WIDTH = TEXT_SIZE * FONT_WIDTH;

    pub const TEXT_TYPE = [TEXT_SIZE:0]u8;
    pub const TEXT_DEFAULT = .{0} ** TEXT_SIZE;

    pub fn new(position: *const Position, color: *const Color, text: *const TextText) Self {
        return Self{
            .position = position.value,
            .color = color.value,
            .text = text.text,
            .font_size = text.font_size,
            .spacing = text.spacing,
        };
    }
};

pub const TextBundle = struct {
    tag: TextTag,
    color: Color,
    position: Position,
    text: TextText,
    aabb: AABB,
    level_object: LevelObject,

    const Self = @This();

    pub const Save = struct {
        Color,
        Position,
        TextText,
    };

    pub fn default(_: *flecs.world_t) Self {
        const aabb = AABB.new_rectangle(TextParams.MAX_WIDTH / 2.0, 10.0);
        return Self{
            .tag = .{},
            .color = Color{ .value = rl.WHITE },
            .position = Position{ .value = Vector2.ZERO },
            .text = TextText{},
            .aabb = aabb,
            .level_object = .{ .destruction_order = 1 },
        };
    }

    pub fn restore(save: *const Self.Save, _: *flecs.world_t) Self {
        const aabb = AABB.new_rectangle(TextParams.MAX_WIDTH / 2.0, save[2].font_size);
        return Self{
            .tag = .{},
            .color = save[0],
            .position = save[1],
            .text = save[2],
            .aabb = aabb,
            .level_object = .{ .destruction_order = 1 },
        };
    }
};

fn draw_texts(
    _positions: COMPONENT(Position, .In),
    _colors: COMPONENT(Color, .In),
    _texts: COMPONENT(TextText, .In),
) void {
    const positions = _positions.get();
    const colors = _colors.get();
    const texts = _texts.get();

    const font = rl.GetFontDefault();
    for (positions, colors, texts) |*position, *color, *text| {
        const p = position.value.sub(&Vector2{ .x = TextParams.MAX_WIDTH / 2.0, .y = -text.font_size / 2.0 });
        rl.DrawTextEx(
            font,
            &text.text,
            p.to_rl_as_pos(),
            text.font_size,
            text.spacing,
            color.value,
        );
    }
}

pub const SpawnerTag = struct {};

pub const SpawnerBundle = struct {
    tag: SpawnerTag,
    position: Position,
    aabb: AABB,
    level_object: LevelObject,

    const Self = @This();

    const RADIUS: f32 = 10.0;
    const COLOR: rl.Color = rl.PINK;

    pub const Save = struct {
        Position,
        SpawnerTag,
    };

    pub fn default(_: *flecs.world_t) Self {
        const aabb = AABB.new_square(Self.RADIUS);
        return Self{
            .tag = .{},
            .position = Position{ .value = Vector2.ZERO },
            .aabb = aabb,
            .level_object = .{ .destruction_order = 1 },
        };
    }

    pub fn restore(save: *const Self.Save, _: *flecs.world_t) Self {
        const aabb = AABB.new_square(Self.RADIUS);
        return Self{
            .tag = .{},
            .position = save[0],
            .aabb = aabb,
            .level_object = .{ .destruction_order = 1 },
        };
    }
};

fn draw_spawners(
    _positions: COMPONENT(Position, .In),
    _: TAG(SpawnerTag),
) void {
    const positions = _positions.get();

    for (positions) |*position| {
        rl.DrawCircleV(
            position.value.to_rl_as_pos(),
            SpawnerBundle.RADIUS,
            SpawnerBundle.COLOR,
        );
    }
}

pub const BallTag = struct {};

pub const BallShape = struct {
    radius: f32,
};

pub const BallAttachment = struct {
    should_attach: bool,
    attached: bool,
};

pub const BallBundle = struct {
    tag: BallTag,
    color: Color,
    position: Position,
    body_id: BodyId,
    shape_id: ShapeId,
    ball_shape: BallShape,
    ball_attachment: BallAttachment,
    aabb: AABB,
    level_object: LevelObject,

    const Self = @This();

    pub const Save = struct {
        Color,
        BallShape,
    };

    pub fn default(ecs_world: *flecs.world_t) Self {
        const physics_world = flecs.singleton_get(ecs_world, PhysicsWorld).?.id;

        var body_def = b2.b2DefaultBodyDef();
        body_def.type = b2.b2_dynamicBody;
        const body_id = b2.b2CreateBody(physics_world, &body_def);

        var shape_def = b2.b2DefaultShapeDef();
        shape_def.density = 100.0;
        shape_def.friction = 0.5;
        shape_def.restitution = 0.3;

        const circle = b2.b2Circle{
            .point = b2.b2Vec2{ .x = 0.0, .y = 0.0 },
            .radius = 10.0,
        };
        const shape_id = b2.b2CreateCircleShape(body_id, &shape_def, &circle);
        const aabb = AABB.from_b2(b2.b2Shape_GetAABB(shape_id));

        return Self{
            .tag = .{},
            .color = Color{ .value = rl.WHITE },
            .position = .{ .value = Vector2.ZERO },
            .body_id = .{ .id = body_id },
            .shape_id = .{ .id = shape_id },
            .ball_shape = BallShape{ .radius = 10.0 },
            .ball_attachment = .{
                .should_attach = true,
                .attached = false,
            },
            .aabb = aabb,
            .level_object = .{ .destruction_order = 1 },
        };
    }

    pub fn restore(save: *const Self.Save, ecs_world: *flecs.world_t) Self {
        const physics_world = flecs.singleton_get(ecs_world, PhysicsWorld).?.id;

        var body_def = b2.b2DefaultBodyDef();
        body_def.type = b2.b2_dynamicBody;
        const body_id = b2.b2CreateBody(physics_world, &body_def);

        var shape_def = b2.b2DefaultShapeDef();
        shape_def.density = 100.0;
        shape_def.friction = 0.5;
        shape_def.restitution = 0.3;

        const circle = b2.b2Circle{
            .point = b2.b2Vec2{ .x = 0.0, .y = 0.0 },
            .radius = save[1].radius,
        };
        const shape_id = b2.b2CreateCircleShape(body_id, &shape_def, &circle);
        const aabb = AABB.from_b2(b2.b2Shape_GetAABB(shape_id));

        return Self{
            .tag = .{},
            .color = save[0],
            .position = .{ .value = Vector2.ZERO },
            .body_id = .{ .id = body_id },
            .shape_id = .{ .id = shape_id },
            .ball_shape = save[1],
            .ball_attachment = .{
                .should_attach = true,
                .attached = false,
            },
            .aabb = aabb,
            .level_object = .{ .destruction_order = 1 },
        };
    }
};

pub const BallShader = struct {
    render_texture: rl.RenderTexture,
    shader: rl.Shader,
    resolution_loc: i32,
    velocity_loc: i32,

    const Self = @This();

    pub const WIDTH = 400;
    pub const HEIGTH = 400;

    pub fn new() Self {
        const render_texture = rl.LoadRenderTexture(WIDTH, HEIGTH);

        const shader = if (builtin.os.tag == .emscripten) blk: {
            break :blk rl.LoadShader(null, "./resources/shaders/base_web.fs");
        } else blk: {
            break :blk rl.LoadShader(null, "./resources/shaders/base.fs");
        };

        const resolution_loc = rl.GetShaderLocation(shader, "resolution");
        const velocity_loc = rl.GetShaderLocation(shader, "velocity");
        return Self{
            .render_texture = render_texture,
            .shader = shader,
            .resolution_loc = resolution_loc,
            .velocity_loc = velocity_loc,
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

        rl.UnloadRenderTexture(self.render_texture);
        rl.UnloadShader(self.shader);
    }
};

fn pre_draw_balls(
    _shaders: SINGLETON(BallShader),
    _bodies: COMPONENT(BodyId, .In),
    _colors: COMPONENT(Color, .In),
    _: TAG(BallTag),
) void {
    const shaders = _shaders.get();
    const bodies = _bodies.get();
    const colors = _colors.get();

    const camera = rl.Camera2D{
        .offset = rl.Vector2{
            .x = BallShader.WIDTH / 2.0,
            .y = BallShader.HEIGTH / 2.0,
        },
        .target = rl.Vector2{ .x = 0.0, .y = 0.0 },
        .rotation = 0.0,
        .zoom = 1.0,
    };

    for (bodies, colors) |*body, *color| {
        {
            rl.BeginTextureMode(shaders.render_texture);
            defer rl.EndTextureMode();

            rl.ClearBackground(rl.BLANK);

            rl.BeginMode2D(camera);
            defer rl.EndMode2D();

            rl.BeginShaderMode(shaders.shader);
            defer rl.EndShaderMode();

            const resolution = Vector2{ .x = 400.0, .y = 400.0 };
            rl.SetShaderValue(shaders.shader, shaders.resolution_loc, &resolution, rl.SHADER_UNIFORM_VEC2);

            const velocity = Vector2.from_b2(b2.b2Body_GetLinearVelocity(body.id));
            const v_orth = velocity.orthogonal();
            rl.SetShaderValue(shaders.shader, shaders.velocity_loc, &v_orth, rl.SHADER_UNIFORM_VEC2);

            rl.DrawRectangleV(
                rl.Vector2{
                    .x = -BallShader.WIDTH / 2.0,
                    .y = -BallShader.HEIGTH / 2.0,
                },
                rl.Vector2{
                    .x = BallShader.WIDTH,
                    .y = BallShader.HEIGTH,
                },
                color.value,
            );
        }
    }
}

fn draw_balls(
    _shaders: SINGLETON(BallShader),
    _positions: COMPONENT(Position, .In),
    _: TAG(BallTag),
) void {
    const shaders = _shaders.get();
    const positions = _positions.get();

    for (positions) |*position| {
        const offset = Vector2{
            .x = -200.0,
            .y = 200.0,
        };
        rl.DrawTextureRec(
            shaders.render_texture.texture,
            rl.Rectangle{
                .x = 0.0,
                .y = 0.0,
                .width = 400.0,
                .height = -400.0,
            },
            position.value.add(&offset).to_rl_as_pos(),
            rl.WHITE,
        );
    }
}

fn update_balls(
    _attachments: COMPONENT_MUT(BallAttachment, .InOut),
) void {
    const attachments = _attachments.get_mut();

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

pub const AnchorBundle = struct {
    tag: AnchorTag,
    color: Color,
    position: Position,
    body_id: BodyId,
    shape: AnchorShape,
    joint_params: AnchoraJointParams,
    aabb: AABB,
    level_object: LevelObject,

    const Self = @This();

    pub const Save = struct {
        Color,
        Position,
        AnchorShape,
        AnchoraJointParams,
    };

    pub fn default(ecs_world: *flecs.world_t) Self {
        const physics_world = flecs.singleton_get(ecs_world, PhysicsWorld).?.id;

        var body_def = b2.b2DefaultBodyDef();
        body_def.type = b2.b2_staticBody;
        body_def.position = Vector2.ZERO.to_b2();
        const body_id = b2.b2CreateBody(physics_world, &body_def);
        const aabb = AABB.new_square(10.0);

        return Self{
            .tag = .{},
            .color = Color{ .value = rl.WHITE },
            .position = Position{ .value = Vector2.ZERO },
            .body_id = .{ .id = body_id },
            .shape = AnchorShape{ .radius = 10.0 },
            .joint_params = .{},
            .aabb = aabb,
            .level_object = .{ .destruction_order = 1 },
        };
    }

    pub fn restore(save: *const Self.Save, ecs_world: *flecs.world_t) Self {
        const physics_world = flecs.singleton_get(ecs_world, PhysicsWorld).?.id;

        var body_def = b2.b2DefaultBodyDef();
        body_def.type = b2.b2_staticBody;
        body_def.position = save[1].value.to_b2();
        const body_id = b2.b2CreateBody(physics_world, &body_def);
        const aabb = AABB.new_square(save[2].radius);

        return Self{
            .tag = .{},
            .color = save[0],
            .position = save[1],
            .body_id = .{ .id = body_id },
            .shape = save[2],
            .joint_params = save[3],
            .aabb = aabb,
            .level_object = .{ .destruction_order = 1 },
        };
    }
};

fn draw_anchors(
    _positions: COMPONENT(Position, .In),
    _colors: COMPONENT(Color, .In),
    _shapes: COMPONENT(AnchorShape, .In),
    _joint_params: COMPONENT(AnchoraJointParams, .In),
) void {
    const positions = _positions.get();
    const colors = _colors.get();
    const shapes = _shapes.get();
    const joint_params = _joint_params.get();

    for (positions, colors, shapes, joint_params) |*position, *color, *shape, *joint_param| {
        rl.DrawCircleV(position.value.to_rl_as_pos(), shape.radius, color.value);
        var radius_color = color.value;
        radius_color.a = 30;
        rl.DrawCircleV(position.value.to_rl_as_pos(), joint_param.max_length, radius_color);
    }
}

const UpdateAnchorsCtx = struct {
    ball_query: *flecs.query_t,

    const Self = @This();
    pub fn init(world: *flecs.world_t) !Self {
        return .{
            .ball_query = try flecs.query_components(
                struct { *const BodyId, *const BallShape, *const Position, *BallAttachment },
                world,
            ),
        };
    }
};
fn update_anchors_try_attach(
    _world: WORLD(),
    _ctx: STATIC(UpdateAnchorsCtx),
    _physics_world: SINGLETON(PhysicsWorld),
    _positions: COMPONENT(Position, .In),
    _colors: COMPONENT(Color, .In),
    _bodies: COMPONENT(BodyId, .In),
    _shapes: COMPONENT(AnchorShape, .In),
    _joint_params: COMPONENT(AnchoraJointParams, .In),
) void {
    const world = _world.get_mut();
    const ctx = _ctx.get();
    const physics_world = _physics_world.get();
    const positions = _positions.get();
    const colors = _colors.get();
    const bodies = _bodies.get();
    const shapes = _shapes.get();
    const joint_params = _joint_params.get();

    var ball_iter = flecs.query_iter(world, ctx.ball_query);
    std.debug.assert(flecs.query_next(&ball_iter));
    const ball_body = flecs.field(&ball_iter, BodyId, 1).?[0];
    const ball_shape = flecs.field(&ball_iter, BallShape, 2).?[0];
    const ball_position = flecs.field(&ball_iter, Position, 3).?[0];
    var ball_attachment = &flecs.field(&ball_iter, BallAttachment, 4).?[0];
    std.debug.assert(!flecs.query_next(&ball_iter));

    if (!ball_attachment.should_attach or ball_attachment.attached) {
        return;
    }

    for (positions, colors, bodies, shapes, joint_params) |*position, *color, *body, *shape, *joint_param| {
        if (position.value.sub(&ball_position.value).length() < shape.radius + ball_shape.radius) {
            create_joint(
                world,
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

fn draw_joints(
    _ids: COMPONENT(JointId, .In),
    _colors: COMPONENT(Color, .In),
) void {
    const ids = _ids.get();
    const colors = _colors.get();

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

const UpdateJointsCtx = struct {
    ball_query: *flecs.query_t,

    const Self = @This();
    pub fn init(world: *flecs.world_t) !Self {
        return .{
            .ball_query = try flecs.query_components(
                struct { *BallAttachment },
                world,
            ),
        };
    }
};
fn update_joints(
    _world: WORLD(),
    _entities: ENTITIES(),
    _ctx: STATIC(UpdateJointsCtx),
    _mouse_pos: SINGLETON(MousePosition),
    _joint_ids: COMPONENT(JointId, .In),
    _joint_stengths: COMPONENT(JointStrength, .In),
) void {
    const world = _world.get_mut();
    const entities = _entities.get();
    const ctx = _ctx.get();
    const mouse_pos = _mouse_pos.get();
    const joint_ids = _joint_ids.get();
    const joint_stengths = _joint_stengths.get();

    var ball_iter = flecs.query_iter(world, ctx.ball_query);
    std.debug.assert(flecs.query_next(&ball_iter));
    var ball_attachment = &flecs.field(&ball_iter, BallAttachment, 1).?[0];
    std.debug.assert(!flecs.query_next(&ball_iter));

    for (entities, joint_ids, joint_stengths) |e, *joint_id, *joint_stength| {
        if (rl.IsKeyDown(rl.KEY_SPACE)) {
            ball_attachment.attached = false;
            _ = flecs.delete(world, e);
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

pub const PortalTag = struct {};

pub const PortalShape = struct {
    radius: f32,
};

pub const PortalId = struct { id: i32 };

pub const PortalTarget = struct { id: i32 };

pub const PortalBundle = struct {
    tag: PortalTag,
    color: Color,
    position: Position,
    body_id: BodyId,
    shape_id: ShapeId,
    shape: PortalShape,
    id: PortalId,
    target: PortalTarget,
    aabb: AABB,
    level_object: LevelObject,

    const Self = @This();

    pub const Save = struct {
        Color,
        Position,
        PortalShape,
        PortalId,
        PortalTarget,
    };

    pub fn default(ecs_world: *flecs.world_t) Self {
        const physics_world = flecs.singleton_get(ecs_world, PhysicsWorld).?.id;

        var body_def = b2.b2DefaultBodyDef();
        body_def.type = b2.b2_staticBody;
        body_def.position = Vector2.ZERO.to_b2();
        const body_id = b2.b2CreateBody(physics_world, &body_def);

        var shape_def = b2.b2DefaultShapeDef();
        shape_def.isSensor = true;

        const circle = b2.b2Circle{
            .point = b2.b2Vec2{ .x = 0.0, .y = 0.0 },
            .radius = 10.0,
        };
        const shape_id = b2.b2CreateCircleShape(body_id, &shape_def, &circle);

        const aabb = AABB.new_square(10.0);

        return Self{
            .tag = .{},
            .color = Color{ .value = rl.WHITE },
            .position = Position{ .value = Vector2.ZERO },
            .body_id = .{ .id = body_id },
            .shape_id = .{ .id = shape_id },
            .shape = PortalShape{ .radius = 10.0 },
            .id = PortalId{ .id = 0 },
            .target = PortalTarget{ .id = 0 },
            .aabb = aabb,
            .level_object = .{ .destruction_order = 1 },
        };
    }

    pub fn restore(save: *const Self.Save, ecs_world: *flecs.world_t) Self {
        const physics_world = flecs.singleton_get(ecs_world, PhysicsWorld).?.id;

        var body_def = b2.b2DefaultBodyDef();
        body_def.type = b2.b2_staticBody;
        body_def.position = save[1].value.to_b2();
        const body_id = b2.b2CreateBody(physics_world, &body_def);

        var shape_def = b2.b2DefaultShapeDef();
        shape_def.isSensor = true;

        const circle = b2.b2Circle{
            .point = b2.b2Vec2{ .x = 0.0, .y = 0.0 },
            .radius = save[2].radius,
        };
        const shape_id = b2.b2CreateCircleShape(body_id, &shape_def, &circle);

        const aabb = AABB.new_square(save[2].radius);

        return Self{
            .tag = .{},
            .color = save[0],
            .position = save[1],
            .body_id = .{ .id = body_id },
            .shape_id = .{ .id = shape_id },
            .shape = save[2],
            .id = save[3],
            .target = save[4],
            .aabb = aabb,
            .level_object = .{ .destruction_order = 1 },
        };
    }
};

fn draw_portals(
    _positions: COMPONENT(Position, .In),
    _colors: COMPONENT(Color, .In),
    _shapes: COMPONENT(PortalShape, .In),
) void {
    const positions = _positions.get();
    const colors = _colors.get();
    const shapes = _shapes.get();

    for (positions, colors, shapes) |*position, *color, *shape| {
        rl.DrawCircleV(position.value.to_rl_as_pos(), shape.radius, color.value);
    }
}

const UpdatePortalsCtx = struct {
    ball_query: *flecs.query_t,
    portal_query: *flecs.query_t,

    const Self = @This();
    pub fn init(world: *flecs.world_t) !Self {
        return .{
            .ball_query = try flecs.query_components(
                struct { *const BodyId, *const ShapeId, *const BallAttachment },
                world,
            ),
            .portal_query = try flecs.query_components(
                struct { *const Position, *const PortalId },
                world,
            ),
        };
    }
};
fn update_portals(
    _world: WORLD(),
    _ctx: STATIC(UpdatePortalsCtx),
    _sensor_events: SINGLETON(SensorEvents),
    _shapes: COMPONENT(ShapeId, .In),
    _ids: COMPONENT(PortalId, .In),
    _targets: COMPONENT(PortalTarget, .In),
) void {
    const world = _world.get_mut();
    const ctx = _ctx.get();
    const sensor_events = _sensor_events.get();
    const shapes = _shapes.get();
    const targets = _targets.get();
    const ids = _ids.get();

    var ball_iter = flecs.query_iter(world, ctx.ball_query);
    std.debug.assert(flecs.query_next(&ball_iter));
    const ball_body = flecs.field(&ball_iter, BodyId, 1).?[0];
    const ball_shape = flecs.field(&ball_iter, ShapeId, 2).?[0];
    const ball_attachment = &flecs.field(&ball_iter, BallAttachment, 3).?[0];
    std.debug.assert(!flecs.query_next(&ball_iter));

    if (ball_attachment.attached) {
        return;
    }

    var target_portal: ?i32 = null;
    for (shapes, targets, ids) |*shape, *target, *id| blk: {
        // Skip invalid portals
        if (target.id == id.id) {
            continue;
        }
        for (sensor_events.begin_events) |be| {
            if (@as(u64, @bitCast(be.sensorShapeId)) == @as(u64, @bitCast(shape.id)) and
                @as(u64, @bitCast(be.visitorShapeId)) == @as(u64, @bitCast(ball_shape.id)))
            {
                target_portal = target.id;
                break :blk;
            }
        }
    }

    if (target_portal) |tp| {
        const portal_query: *flecs.query_t = @ptrCast(ctx.portal_query);
        var portal_iter = flecs.query_iter(world, portal_query);
        while (flecs.query_next(&portal_iter)) {
            const target_positions = flecs.field(&portal_iter, Position, 1).?;
            const target_ids = flecs.field(&portal_iter, PortalId, 2).?;
            for (target_positions, target_ids) |*position, *id| {
                if (id.id == tp) {
                    b2.b2Body_SetTransform(ball_body.id, position.value.to_b2(), 0.0);
                }
            }
        }
    }
}

pub const BlackHoleTag = struct {};

pub const BlackHoleShape = struct {
    radius: f32,
};

pub const BlackHoleStrength = struct {
    value: f32,
};

pub const BlackHoleBundle = struct {
    tag: BlackHoleTag,
    color: Color,
    position: Position,
    body_id: BodyId,
    shape: BlackHoleShape,
    strength: BlackHoleStrength,
    aabb: AABB,
    level_object: LevelObject,

    const Self = @This();

    pub const Save = struct {
        Color,
        Position,
        BlackHoleShape,
        BlackHoleStrength,
    };

    pub fn default(ecs_world: *flecs.world_t) Self {
        const physics_world = flecs.singleton_get(ecs_world, PhysicsWorld).?.id;

        var body_def = b2.b2DefaultBodyDef();
        body_def.type = b2.b2_staticBody;
        body_def.position = Vector2.ZERO.to_b2();
        const body_id = b2.b2CreateBody(physics_world, &body_def);

        const aabb = AABB.new_square(10.0);

        return Self{
            .tag = .{},
            .color = Color{ .value = rl.WHITE },
            .position = Position{ .value = Vector2.ZERO },
            .body_id = .{ .id = body_id },
            .shape = BlackHoleShape{ .radius = 10.0 },
            .strength = BlackHoleStrength{ .value = 1.0 },
            .aabb = aabb,
            .level_object = .{ .destruction_order = 1 },
        };
    }

    pub fn restore(save: *const Self.Save, ecs_world: *flecs.world_t) Self {
        const physics_world = flecs.singleton_get(ecs_world, PhysicsWorld).?.id;

        var body_def = b2.b2DefaultBodyDef();
        body_def.type = b2.b2_staticBody;
        body_def.position = save[1].value.to_b2();
        const body_id = b2.b2CreateBody(physics_world, &body_def);

        const aabb = AABB.new_square(save[2].radius);

        return Self{
            .tag = .{},
            .color = save[0],
            .position = save[1],
            .body_id = .{ .id = body_id },
            .shape = save[2],
            .strength = save[3],
            .aabb = aabb,
            .level_object = .{ .destruction_order = 1 },
        };
    }
};

fn draw_blackholes(
    _positions: COMPONENT(Position, .In),
    _colors: COMPONENT(Color, .In),
    _shapes: COMPONENT(BlackHoleShape, .In),
) void {
    const positions = _positions.get();
    const colors = _colors.get();
    const shapes = _shapes.get();

    for (positions, colors, shapes) |*position, *color, *shape| {
        rl.DrawCircleV(position.value.to_rl_as_pos(), shape.radius, color.value);
    }
}

const UpdateBlackHolesCtx = struct {
    ball_query: *flecs.query_t,

    const Self = @This();
    pub fn init(world: *flecs.world_t) !Self {
        return .{
            .ball_query = try flecs.query_components(
                struct { *const BodyId, *const BallShape, *const Position, *BallAttachment },
                world,
            ),
        };
    }
};
fn update_blackholes(
    _world: WORLD(),
    _ctx: STATIC(UpdateBlackHolesCtx),
    _positions: COMPONENT(Position, .In),
    _shapes: COMPONENT(BlackHoleShape, .In),
    _strengths: COMPONENT(BlackHoleStrength, .In),
) void {
    const world = _world.get_mut();
    const ctx = _ctx.get();
    const positions = _positions.get();
    const shapes = _shapes.get();
    const strengths = _strengths.get();

    var ball_iter = flecs.query_iter(world, ctx.ball_query);
    std.debug.assert(flecs.query_next(&ball_iter));
    const ball_body = flecs.field(&ball_iter, BodyId, 1).?[0];
    const ball_shape = flecs.field(&ball_iter, BallShape, 2).?[0];
    const ball_position = flecs.field(&ball_iter, Position, 3).?[0];
    std.debug.assert(!flecs.query_next(&ball_iter));

    for (positions, shapes, strengths) |*position, *shape, *strength| {
        const to_bh = position.value.sub(&ball_position.value);
        if (to_bh.length() < shape.radius + ball_shape.radius) {
            const to_bh_normalized = to_bh.normalized();
            var velocity = Vector2.from_b2(b2.b2Body_GetLinearVelocity(ball_body.id));
            velocity = velocity.add(&to_bh_normalized.mul(strength.value));
            b2.b2Body_SetLinearVelocity(ball_body.id, velocity.to_b2());
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

pub const RectangleBundle = struct {
    tag: RectangleTag,
    color: Color,
    position: Position,
    body_id: BodyId,
    shape_id: ShapeId,
    shape: RectangleShape,
    aabb: AABB,
    level_object: LevelObject,
    win_target: ?WinTarget,

    const Self = @This();

    pub const Save = struct {
        Color,
        Position,
        RectangleShape,
    };

    pub fn default(ecs_world: *flecs.world_t) Self {
        const physics_world = flecs.singleton_get(ecs_world, PhysicsWorld).?.id;

        var body_def = b2.b2DefaultBodyDef();
        body_def.type = b2.b2_staticBody;
        body_def.position = Vector2.ZERO.to_b2();
        const body_id = b2.b2CreateBody(physics_world, &body_def);
        errdefer b2.b2DestroyBody(body_id);

        var shape_def = b2.b2DefaultShapeDef();

        const shape = RectangleShape.new(
            .{ .x = -10.0, .y = 0.0 },
            .{ .x = 10.0, .y = 0.0 },
            10.0,
            0.0,
            0.0,
            false,
        ) catch {
            @panic("incorrect default rectangle shape");
        };
        const shape_id = b2.b2CreatePolygonShape(body_id, &shape_def, &shape.shape);

        const aabb = AABB.from_b2(b2.b2Shape_GetAABB(shape_id));

        return Self{
            .tag = .{},
            .color = Color{ .value = rl.WHITE },
            .position = Position{ .value = Vector2.ZERO },
            .body_id = .{ .id = body_id },
            .shape_id = .{ .id = shape_id },
            .shape = shape,
            .aabb = aabb,
            .level_object = .{ .destruction_order = 1 },
            .win_target = null,
        };
    }

    pub fn restore(save: *const Self.Save, ecs_world: *flecs.world_t) Self {
        const physics_world = flecs.singleton_get(ecs_world, PhysicsWorld).?.id;

        var body_def = b2.b2DefaultBodyDef();
        body_def.type = b2.b2_staticBody;
        body_def.position = save[1].value.to_b2();
        const body_id = b2.b2CreateBody(physics_world, &body_def);
        errdefer b2.b2DestroyBody(body_id);

        var shape_def = b2.b2DefaultShapeDef();
        shape_def.restitution = save[2].restitution;
        shape_def.isSensor = save[2].is_sensor;

        const shape_id = b2.b2CreatePolygonShape(body_id, &shape_def, &save[2].shape);

        var aabb = AABB.from_b2(b2.b2Shape_GetAABB(shape_id));
        // move aabb back to 0,0
        aabb.move(save[1].value.mul(-1));

        return Self{
            .tag = .{},
            .color = save[0],
            .position = save[1],
            .body_id = .{ .id = body_id },
            .shape_id = .{ .id = shape_id },
            .shape = save[2],
            .aabb = aabb,
            .level_object = .{ .destruction_order = 1 },
            .win_target = if (save[2].is_sensor) .{} else null,
        };
    }
};

fn draw_rectangles(
    _positions: COMPONENT(Position, .In),
    _shapes: COMPONENT(RectangleShape, .In),
    _colors: COMPONENT(Color, .In),
) void {
    const positions = _positions.get();
    const shapes = _shapes.get();
    const colors = _colors.get();

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

pub fn FLECS_INIT_COMPONENTS(world: *flecs.world_t, allocator: Allocator) !void {
    _ = allocator;
    flecs.COMPONENT(world, AABB);
    flecs.COMPONENT(world, Color);
    flecs.COMPONENT(world, Position);
    flecs.COMPONENT(world, BodyId);
    flecs.COMPONENT(world, ShapeId);

    flecs.COMPONENT(world, BallShader);

    flecs.TAG(world, TextTag);
    flecs.COMPONENT(world, TextText);

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

    flecs.TAG(world, PortalTag);
    flecs.COMPONENT(world, PortalShape);
    flecs.COMPONENT(world, PortalId);
    flecs.COMPONENT(world, PortalTarget);

    flecs.TAG(world, BlackHoleTag);
    flecs.COMPONENT(world, BlackHoleShape);
    flecs.COMPONENT(world, BlackHoleStrength);

    flecs.TAG(world, RectangleTag);
    flecs.COMPONENT(world, RectangleShape);

    const shaders = BallShader.new();
    _ = flecs.singleton_set(world, BallShader, shaders);
}

pub fn FLECS_INIT_SYSTEMS(world: *flecs.world_t, allocator: Allocator, state_stack: *GameStateStack) !void {
    _ = allocator;

    state_stack.add_system_run_condition(.{
        .entity = flecs.ADD_SYSTEM(world, "update_positions", flecs.PreUpdate, update_positions),
        .run_condition = struct {
            fn rc(gs: GameState) bool {
                return gs == .Running or gs == .Editor;
            }
        }.rc,
    });
    state_stack.add_system_run_condition(.{
        .entity = flecs.ADD_SYSTEM(world, "update_balls", flecs.PreUpdate, update_balls),
        .run_condition = struct {
            fn rc(gs: GameState) bool {
                return gs == .Running;
            }
        }.rc,
    });
    state_stack.add_system_run_condition(.{
        .entity = flecs.ADD_SYSTEM(world, "update_anchors_try_attach", flecs.OnUpdate, update_anchors_try_attach),
        .run_condition = struct {
            fn rc(gs: GameState) bool {
                return gs == .Running;
            }
        }.rc,
    });
    state_stack.add_system_run_condition(.{
        .entity = flecs.ADD_SYSTEM(world, "update_joints", flecs.OnUpdate, update_joints),
        .run_condition = struct {
            fn rc(gs: GameState) bool {
                return gs == .Running;
            }
        }.rc,
    });
    state_stack.add_system_run_condition(.{
        .entity = flecs.ADD_SYSTEM(world, "update_portals", flecs.OnUpdate, update_portals),
        .run_condition = struct {
            fn rc(gs: GameState) bool {
                return gs == .Running;
            }
        }.rc,
    });
    state_stack.add_system_run_condition(.{
        .entity = flecs.ADD_SYSTEM(world, "update_blackholes", flecs.OnUpdate, update_blackholes),
        .run_condition = struct {
            fn rc(gs: GameState) bool {
                return gs == .Running;
            }
        }.rc,
    });
    state_stack.add_system_run_condition(.{
        .entity = flecs.ADD_SYSTEM(world, "pre_draw_balls", flecs.PreFrame, pre_draw_balls),
        .run_condition = struct {
            fn rc(gs: GameState) bool {
                return gs == .Running or
                    gs == .Editor or
                    gs == .Paused;
            }
        }.rc,
    });

    state_stack.add_system_run_condition(.{
        .entity = flecs.ADD_SYSTEM(world, "draw_spawners", flecs.OnUpdate, draw_spawners),
        .run_condition = struct {
            fn rc(gs: GameState) bool {
                return gs == .Running or
                    gs == .Editor or
                    gs == .Paused;
            }
        }.rc,
    });
    state_stack.add_system_run_condition(.{
        .entity = flecs.ADD_SYSTEM(world, "draw_anchors", flecs.OnUpdate, draw_anchors),
        .run_condition = struct {
            fn rc(gs: GameState) bool {
                return gs == .Running or
                    gs == .Editor or
                    gs == .Paused;
            }
        }.rc,
    });
    state_stack.add_system_run_condition(.{
        .entity = flecs.ADD_SYSTEM(world, "draw_portals", flecs.OnUpdate, draw_portals),
        .run_condition = struct {
            fn rc(gs: GameState) bool {
                return gs == .Running or
                    gs == .Editor or
                    gs == .Paused;
            }
        }.rc,
    });
    state_stack.add_system_run_condition(.{
        .entity = flecs.ADD_SYSTEM(world, "draw_blackholes", flecs.OnUpdate, draw_blackholes),
        .run_condition = struct {
            fn rc(gs: GameState) bool {
                return gs == .Running or
                    gs == .Editor or
                    gs == .Paused;
            }
        }.rc,
    });
    state_stack.add_system_run_condition(.{
        .entity = flecs.ADD_SYSTEM(world, "draw_joints", flecs.OnUpdate, draw_joints),
        .run_condition = struct {
            fn rc(gs: GameState) bool {
                return gs == .Running or
                    gs == .Editor or
                    gs == .Paused;
            }
        }.rc,
    });
    state_stack.add_system_run_condition(.{
        .entity = flecs.ADD_SYSTEM(world, "draw_rectangles", flecs.OnUpdate, draw_rectangles),
        .run_condition = struct {
            fn rc(gs: GameState) bool {
                return gs == .Running or
                    gs == .Editor or
                    gs == .Paused;
            }
        }.rc,
    });
    state_stack.add_system_run_condition(.{
        .entity = flecs.ADD_SYSTEM(world, "draw_texts", flecs.OnUpdate, draw_texts),
        .run_condition = struct {
            fn rc(gs: GameState) bool {
                return gs == .Running or
                    gs == .Editor or
                    gs == .Paused;
            }
        }.rc,
    });
    state_stack.add_system_run_condition(.{
        .entity = flecs.ADD_SYSTEM(world, "draw_balls", flecs.OnUpdate, draw_balls),
        .run_condition = struct {
            fn rc(gs: GameState) bool {
                return gs == .Running or
                    gs == .Editor or
                    gs == .Paused;
            }
        }.rc,
    });
}

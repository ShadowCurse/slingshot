pub const __builtin_bswap16 = @import("std").zig.c_builtins.__builtin_bswap16;
pub const __builtin_bswap32 = @import("std").zig.c_builtins.__builtin_bswap32;
pub const __builtin_bswap64 = @import("std").zig.c_builtins.__builtin_bswap64;
pub const __builtin_signbit = @import("std").zig.c_builtins.__builtin_signbit;
pub const __builtin_signbitf = @import("std").zig.c_builtins.__builtin_signbitf;
pub const __builtin_popcount = @import("std").zig.c_builtins.__builtin_popcount;
pub const __builtin_ctz = @import("std").zig.c_builtins.__builtin_ctz;
pub const __builtin_clz = @import("std").zig.c_builtins.__builtin_clz;
pub const __builtin_sqrt = @import("std").zig.c_builtins.__builtin_sqrt;
pub const __builtin_sqrtf = @import("std").zig.c_builtins.__builtin_sqrtf;
pub const __builtin_sin = @import("std").zig.c_builtins.__builtin_sin;
pub const __builtin_sinf = @import("std").zig.c_builtins.__builtin_sinf;
pub const __builtin_cos = @import("std").zig.c_builtins.__builtin_cos;
pub const __builtin_cosf = @import("std").zig.c_builtins.__builtin_cosf;
pub const __builtin_exp = @import("std").zig.c_builtins.__builtin_exp;
pub const __builtin_expf = @import("std").zig.c_builtins.__builtin_expf;
pub const __builtin_exp2 = @import("std").zig.c_builtins.__builtin_exp2;
pub const __builtin_exp2f = @import("std").zig.c_builtins.__builtin_exp2f;
pub const __builtin_log = @import("std").zig.c_builtins.__builtin_log;
pub const __builtin_logf = @import("std").zig.c_builtins.__builtin_logf;
pub const __builtin_log2 = @import("std").zig.c_builtins.__builtin_log2;
pub const __builtin_log2f = @import("std").zig.c_builtins.__builtin_log2f;
pub const __builtin_log10 = @import("std").zig.c_builtins.__builtin_log10;
pub const __builtin_log10f = @import("std").zig.c_builtins.__builtin_log10f;
pub const __builtin_abs = @import("std").zig.c_builtins.__builtin_abs;
pub const __builtin_labs = @import("std").zig.c_builtins.__builtin_labs;
pub const __builtin_llabs = @import("std").zig.c_builtins.__builtin_llabs;
pub const __builtin_fabs = @import("std").zig.c_builtins.__builtin_fabs;
pub const __builtin_fabsf = @import("std").zig.c_builtins.__builtin_fabsf;
pub const __builtin_floor = @import("std").zig.c_builtins.__builtin_floor;
pub const __builtin_floorf = @import("std").zig.c_builtins.__builtin_floorf;
pub const __builtin_ceil = @import("std").zig.c_builtins.__builtin_ceil;
pub const __builtin_ceilf = @import("std").zig.c_builtins.__builtin_ceilf;
pub const __builtin_trunc = @import("std").zig.c_builtins.__builtin_trunc;
pub const __builtin_truncf = @import("std").zig.c_builtins.__builtin_truncf;
pub const __builtin_round = @import("std").zig.c_builtins.__builtin_round;
pub const __builtin_roundf = @import("std").zig.c_builtins.__builtin_roundf;
pub const __builtin_strlen = @import("std").zig.c_builtins.__builtin_strlen;
pub const __builtin_strcmp = @import("std").zig.c_builtins.__builtin_strcmp;
pub const __builtin_object_size = @import("std").zig.c_builtins.__builtin_object_size;
pub const __builtin___memset_chk = @import("std").zig.c_builtins.__builtin___memset_chk;
pub const __builtin_memset = @import("std").zig.c_builtins.__builtin_memset;
pub const __builtin___memcpy_chk = @import("std").zig.c_builtins.__builtin___memcpy_chk;
pub const __builtin_memcpy = @import("std").zig.c_builtins.__builtin_memcpy;
pub const __builtin_expect = @import("std").zig.c_builtins.__builtin_expect;
pub const __builtin_nanf = @import("std").zig.c_builtins.__builtin_nanf;
pub const __builtin_huge_valf = @import("std").zig.c_builtins.__builtin_huge_valf;
pub const __builtin_inff = @import("std").zig.c_builtins.__builtin_inff;
pub const __builtin_isnan = @import("std").zig.c_builtins.__builtin_isnan;
pub const __builtin_isinf = @import("std").zig.c_builtins.__builtin_isinf;
pub const __builtin_isinf_sign = @import("std").zig.c_builtins.__builtin_isinf_sign;
pub const __has_builtin = @import("std").zig.c_builtins.__has_builtin;
pub const __builtin_assume = @import("std").zig.c_builtins.__builtin_assume;
pub const __builtin_unreachable = @import("std").zig.c_builtins.__builtin_unreachable;
pub const __builtin_constant_p = @import("std").zig.c_builtins.__builtin_constant_p;
pub const __builtin_mul_overflow = @import("std").zig.c_builtins.__builtin_mul_overflow;
pub const __u_char = u8;
pub const __u_short = c_ushort;
pub const __u_int = c_uint;
pub const __u_long = c_ulong;
pub const __int8_t = i8;
pub const __uint8_t = u8;
pub const __int16_t = c_short;
pub const __uint16_t = c_ushort;
pub const __int32_t = c_int;
pub const __uint32_t = c_uint;
pub const __int64_t = c_long;
pub const __uint64_t = c_ulong;
pub const __int_least8_t = __int8_t;
pub const __uint_least8_t = __uint8_t;
pub const __int_least16_t = __int16_t;
pub const __uint_least16_t = __uint16_t;
pub const __int_least32_t = __int32_t;
pub const __uint_least32_t = __uint32_t;
pub const __int_least64_t = __int64_t;
pub const __uint_least64_t = __uint64_t;
pub const __quad_t = c_long;
pub const __u_quad_t = c_ulong;
pub const __intmax_t = c_long;
pub const __uintmax_t = c_ulong;
pub const __dev_t = c_ulong;
pub const __uid_t = c_uint;
pub const __gid_t = c_uint;
pub const __ino_t = c_ulong;
pub const __ino64_t = c_ulong;
pub const __mode_t = c_uint;
pub const __nlink_t = c_ulong;
pub const __off_t = c_long;
pub const __off64_t = c_long;
pub const __pid_t = c_int;
pub const __fsid_t = extern struct {
    __val: [2]c_int = @import("std").mem.zeroes([2]c_int),
};
pub const __clock_t = c_long;
pub const __rlim_t = c_ulong;
pub const __rlim64_t = c_ulong;
pub const __id_t = c_uint;
pub const __time_t = c_long;
pub const __useconds_t = c_uint;
pub const __suseconds_t = c_long;
pub const __suseconds64_t = c_long;
pub const __daddr_t = c_int;
pub const __key_t = c_int;
pub const __clockid_t = c_int;
pub const __timer_t = ?*anyopaque;
pub const __blksize_t = c_long;
pub const __blkcnt_t = c_long;
pub const __blkcnt64_t = c_long;
pub const __fsblkcnt_t = c_ulong;
pub const __fsblkcnt64_t = c_ulong;
pub const __fsfilcnt_t = c_ulong;
pub const __fsfilcnt64_t = c_ulong;
pub const __fsword_t = c_long;
pub const __ssize_t = c_long;
pub const __syscall_slong_t = c_long;
pub const __syscall_ulong_t = c_ulong;
pub const __loff_t = __off64_t;
pub const __caddr_t = [*c]u8;
pub const __intptr_t = c_long;
pub const __socklen_t = c_uint;
pub const __sig_atomic_t = c_int;
pub const int_least8_t = __int_least8_t;
pub const int_least16_t = __int_least16_t;
pub const int_least32_t = __int_least32_t;
pub const int_least64_t = __int_least64_t;
pub const uint_least8_t = __uint_least8_t;
pub const uint_least16_t = __uint_least16_t;
pub const uint_least32_t = __uint_least32_t;
pub const uint_least64_t = __uint_least64_t;
pub const int_fast8_t = i8;
pub const int_fast16_t = c_long;
pub const int_fast32_t = c_long;
pub const int_fast64_t = c_long;
pub const uint_fast8_t = u8;
pub const uint_fast16_t = c_ulong;
pub const uint_fast32_t = c_ulong;
pub const uint_fast64_t = c_ulong;
pub const intmax_t = __intmax_t;
pub const uintmax_t = __uintmax_t;
pub const b2AllocFcn = fn (u32, i32) callconv(.C) ?*anyopaque;
pub const b2FreeFcn = fn (?*anyopaque) callconv(.C) void;
pub const b2AssertFcn = fn ([*c]const u8, [*c]const u8, c_int) callconv(.C) c_int;
pub extern fn b2SetAllocator(allocFcn: ?*const b2AllocFcn, freeFcn: ?*const b2FreeFcn) void;
pub extern fn b2GetByteCount() u32;
pub extern fn b2SetAssertFcn(assertFcn: ?*const b2AssertFcn) void;
pub const struct_b2WorldId = extern struct {
    index: u16 = @import("std").mem.zeroes(u16),
    revision: u16 = @import("std").mem.zeroes(u16),
};
pub const b2WorldId = struct_b2WorldId;
pub const struct_b2BodyId = extern struct {
    index: i32 = @import("std").mem.zeroes(i32),
    world: u16 = @import("std").mem.zeroes(u16),
    revision: u16 = @import("std").mem.zeroes(u16),
};
pub const b2BodyId = struct_b2BodyId;
pub const struct_b2ShapeId = extern struct {
    index: i32 = @import("std").mem.zeroes(i32),
    world: u16 = @import("std").mem.zeroes(u16),
    revision: u16 = @import("std").mem.zeroes(u16),
};
pub const b2ShapeId = struct_b2ShapeId;
pub const struct_b2JointId = extern struct {
    index: i32 = @import("std").mem.zeroes(i32),
    world: u16 = @import("std").mem.zeroes(u16),
    revision: u16 = @import("std").mem.zeroes(u16),
};
pub const b2JointId = struct_b2JointId;
pub const struct_b2ChainId = extern struct {
    index: i32 = @import("std").mem.zeroes(i32),
    world: i16 = @import("std").mem.zeroes(i16),
    revision: u16 = @import("std").mem.zeroes(u16),
};
pub const b2ChainId = struct_b2ChainId;
pub const b2_nullWorldId: b2WorldId = b2WorldId{
    .index = @as(u16, @bitCast(@as(c_short, @truncate(@as(c_int, 0))))),
    .revision = @import("std").mem.zeroes(u16),
};
pub const b2_nullBodyId: b2BodyId = b2BodyId{
    .index = @as(c_int, 0),
    .world = @import("std").mem.zeroes(u16),
    .revision = @import("std").mem.zeroes(u16),
};
pub const b2_nullShapeId: b2ShapeId = b2ShapeId{
    .index = @as(c_int, 0),
    .world = @import("std").mem.zeroes(u16),
    .revision = @import("std").mem.zeroes(u16),
};
pub const b2_nullJointId: b2JointId = b2JointId{
    .index = @as(c_int, 0),
    .world = @import("std").mem.zeroes(u16),
    .revision = @import("std").mem.zeroes(u16),
};
pub const b2_nullChainId: b2ChainId = b2ChainId{
    .index = @as(c_int, 0),
    .world = @import("std").mem.zeroes(i16),
    .revision = @import("std").mem.zeroes(u16),
};
pub const struct_b2Vec2 = extern struct {
    x: f32 = @import("std").mem.zeroes(f32),
    y: f32 = @import("std").mem.zeroes(f32),
};
pub const b2Vec2 = struct_b2Vec2;
pub const struct_b2Rot = extern struct {
    s: f32 = @import("std").mem.zeroes(f32),
    c: f32 = @import("std").mem.zeroes(f32),
};
pub const b2Rot = struct_b2Rot;
pub const struct_b2Transform = extern struct {
    p: b2Vec2 = @import("std").mem.zeroes(b2Vec2),
    q: b2Rot = @import("std").mem.zeroes(b2Rot),
};
pub const b2Transform = struct_b2Transform;
pub const struct_b2Mat22 = extern struct {
    cx: b2Vec2 = @import("std").mem.zeroes(b2Vec2),
    cy: b2Vec2 = @import("std").mem.zeroes(b2Vec2),
};
pub const b2Mat22 = struct_b2Mat22;
pub const struct_b2AABB = extern struct {
    lowerBound: b2Vec2 = @import("std").mem.zeroes(b2Vec2),
    upperBound: b2Vec2 = @import("std").mem.zeroes(b2Vec2),
};
pub const b2AABB = struct_b2AABB;
pub const struct_b2Color = extern struct {
    r: f32 = @import("std").mem.zeroes(f32),
    g: f32 = @import("std").mem.zeroes(f32),
    b: f32 = @import("std").mem.zeroes(f32),
    a: f32 = @import("std").mem.zeroes(f32),
};
pub const b2Color = struct_b2Color;
pub const struct_b2ManifoldPoint = extern struct {
    point: b2Vec2 = @import("std").mem.zeroes(b2Vec2),
    anchorA: b2Vec2 = @import("std").mem.zeroes(b2Vec2),
    anchorB: b2Vec2 = @import("std").mem.zeroes(b2Vec2),
    separation: f32 = @import("std").mem.zeroes(f32),
    normalImpulse: f32 = @import("std").mem.zeroes(f32),
    tangentImpulse: f32 = @import("std").mem.zeroes(f32),
    maxNormalImpulse: f32 = @import("std").mem.zeroes(f32),
    id: u16 = @import("std").mem.zeroes(u16),
    persisted: bool = @import("std").mem.zeroes(bool),
};
pub const b2ManifoldPoint = struct_b2ManifoldPoint;
pub const struct_b2Manifold = extern struct {
    points: [2]b2ManifoldPoint = @import("std").mem.zeroes([2]b2ManifoldPoint),
    normal: b2Vec2 = @import("std").mem.zeroes(b2Vec2),
    pointCount: i32 = @import("std").mem.zeroes(i32),
};
pub const b2Manifold = struct_b2Manifold;
pub const b2TaskCallback = fn (i32, i32, u32, ?*anyopaque) callconv(.C) void;
pub const b2EnqueueTaskCallback = fn (?*const b2TaskCallback, i32, i32, ?*anyopaque, ?*anyopaque) callconv(.C) ?*anyopaque;
pub const b2FinishTaskCallback = fn (?*anyopaque, ?*anyopaque) callconv(.C) void;
pub const b2PreSolveFcn = fn (b2ShapeId, b2ShapeId, [*c]b2Manifold, ?*anyopaque) callconv(.C) bool;
pub const b2OverlapResultFcn = fn (b2ShapeId, ?*anyopaque) callconv(.C) bool;
pub const b2CastResultFcn = fn (b2ShapeId, b2Vec2, b2Vec2, f32, ?*anyopaque) callconv(.C) f32;
pub const struct_b2Version = extern struct {
    major: c_int = @import("std").mem.zeroes(c_int),
    minor: c_int = @import("std").mem.zeroes(c_int),
    revision: c_int = @import("std").mem.zeroes(c_int),
};
pub const b2Version = struct_b2Version;
pub const b2_version: b2Version = b2Version{
    .major = @as(c_int, 3),
    .minor = @as(c_int, 0),
    .revision = @as(c_int, 0),
};
pub const ptrdiff_t = c_long;
pub const wchar_t = c_int;
pub const max_align_t = extern struct {
    __clang_max_align_nonce1: c_longlong align(8) = @import("std").mem.zeroes(c_longlong),
    __clang_max_align_nonce2: c_longdouble align(16) = @import("std").mem.zeroes(c_longdouble),
};
pub const struct_b2RayResult = extern struct {
    shapeId: b2ShapeId = @import("std").mem.zeroes(b2ShapeId),
    point: b2Vec2 = @import("std").mem.zeroes(b2Vec2),
    normal: b2Vec2 = @import("std").mem.zeroes(b2Vec2),
    fraction: f32 = @import("std").mem.zeroes(f32),
    hit: bool = @import("std").mem.zeroes(bool),
};
pub const b2RayResult = struct_b2RayResult;
pub const struct_b2WorldDef = extern struct {
    gravity: b2Vec2 = @import("std").mem.zeroes(b2Vec2),
    restitutionThreshold: f32 = @import("std").mem.zeroes(f32),
    contactPushoutVelocity: f32 = @import("std").mem.zeroes(f32),
    contactHertz: f32 = @import("std").mem.zeroes(f32),
    contactDampingRatio: f32 = @import("std").mem.zeroes(f32),
    jointHertz: f32 = @import("std").mem.zeroes(f32),
    jointDampingRatio: f32 = @import("std").mem.zeroes(f32),
    enableSleep: bool = @import("std").mem.zeroes(bool),
    enableContinous: bool = @import("std").mem.zeroes(bool),
    bodyCapacity: i32 = @import("std").mem.zeroes(i32),
    shapeCapacity: i32 = @import("std").mem.zeroes(i32),
    contactCapacity: i32 = @import("std").mem.zeroes(i32),
    jointCapacity: i32 = @import("std").mem.zeroes(i32),
    stackAllocatorCapacity: i32 = @import("std").mem.zeroes(i32),
    workerCount: u32 = @import("std").mem.zeroes(u32),
    enqueueTask: ?*const b2EnqueueTaskCallback = @import("std").mem.zeroes(?*const b2EnqueueTaskCallback),
    finishTask: ?*const b2FinishTaskCallback = @import("std").mem.zeroes(?*const b2FinishTaskCallback),
    userTaskContext: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
};
pub const b2WorldDef = struct_b2WorldDef;
pub const b2_staticBody: c_int = 0;
pub const b2_kinematicBody: c_int = 1;
pub const b2_dynamicBody: c_int = 2;
pub const b2_bodyTypeCount: c_int = 3;
pub const enum_b2BodyType = c_uint;
pub const b2BodyType = enum_b2BodyType;
pub const struct_b2BodyDef = extern struct {
    type: b2BodyType = @import("std").mem.zeroes(b2BodyType),
    position: b2Vec2 = @import("std").mem.zeroes(b2Vec2),
    angle: f32 = @import("std").mem.zeroes(f32),
    linearVelocity: b2Vec2 = @import("std").mem.zeroes(b2Vec2),
    angularVelocity: f32 = @import("std").mem.zeroes(f32),
    linearDamping: f32 = @import("std").mem.zeroes(f32),
    angularDamping: f32 = @import("std").mem.zeroes(f32),
    gravityScale: f32 = @import("std").mem.zeroes(f32),
    userData: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    enableSleep: bool = @import("std").mem.zeroes(bool),
    isAwake: bool = @import("std").mem.zeroes(bool),
    fixedRotation: bool = @import("std").mem.zeroes(bool),
    isBullet: bool = @import("std").mem.zeroes(bool),
    isEnabled: bool = @import("std").mem.zeroes(bool),
};
pub const b2BodyDef = struct_b2BodyDef;
pub const struct_b2Filter = extern struct {
    categoryBits: u32 = @import("std").mem.zeroes(u32),
    maskBits: u32 = @import("std").mem.zeroes(u32),
    groupIndex: i32 = @import("std").mem.zeroes(i32),
};
pub const b2Filter = struct_b2Filter;
pub const struct_b2QueryFilter = extern struct {
    categoryBits: u32 = @import("std").mem.zeroes(u32),
    maskBits: u32 = @import("std").mem.zeroes(u32),
};
pub const b2QueryFilter = struct_b2QueryFilter;
pub const b2_circleShape: c_int = 0;
pub const b2_capsuleShape: c_int = 1;
pub const b2_segmentShape: c_int = 2;
pub const b2_polygonShape: c_int = 3;
pub const b2_smoothSegmentShape: c_int = 4;
pub const b2_shapeTypeCount: c_int = 5;
pub const enum_b2ShapeType = c_uint;
pub const b2ShapeType = enum_b2ShapeType;
pub const struct_b2ShapeDef = extern struct {
    userData: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    friction: f32 = @import("std").mem.zeroes(f32),
    restitution: f32 = @import("std").mem.zeroes(f32),
    density: f32 = @import("std").mem.zeroes(f32),
    filter: b2Filter = @import("std").mem.zeroes(b2Filter),
    isSensor: bool = @import("std").mem.zeroes(bool),
    enableSensorEvents: bool = @import("std").mem.zeroes(bool),
    enableContactEvents: bool = @import("std").mem.zeroes(bool),
    enablePreSolveEvents: bool = @import("std").mem.zeroes(bool),
};
pub const b2ShapeDef = struct_b2ShapeDef;
pub const struct_b2ChainDef = extern struct {
    points: [*c]const b2Vec2 = @import("std").mem.zeroes([*c]const b2Vec2),
    count: i32 = @import("std").mem.zeroes(i32),
    isLoop: bool = @import("std").mem.zeroes(bool),
    userData: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    friction: f32 = @import("std").mem.zeroes(f32),
    restitution: f32 = @import("std").mem.zeroes(f32),
    filter: b2Filter = @import("std").mem.zeroes(b2Filter),
};
pub const b2ChainDef = struct_b2ChainDef;
pub const struct_b2Profile = extern struct {
    step: f32 = @import("std").mem.zeroes(f32),
    pairs: f32 = @import("std").mem.zeroes(f32),
    collide: f32 = @import("std").mem.zeroes(f32),
    solve: f32 = @import("std").mem.zeroes(f32),
    buildIslands: f32 = @import("std").mem.zeroes(f32),
    solveConstraints: f32 = @import("std").mem.zeroes(f32),
    broadphase: f32 = @import("std").mem.zeroes(f32),
    continuous: f32 = @import("std").mem.zeroes(f32),
};
pub const b2Profile = struct_b2Profile;
pub const struct_b2Counters = extern struct {
    islandCount: i32 = @import("std").mem.zeroes(i32),
    bodyCount: i32 = @import("std").mem.zeroes(i32),
    contactCount: i32 = @import("std").mem.zeroes(i32),
    jointCount: i32 = @import("std").mem.zeroes(i32),
    proxyCount: i32 = @import("std").mem.zeroes(i32),
    pairCount: i32 = @import("std").mem.zeroes(i32),
    treeHeight: i32 = @import("std").mem.zeroes(i32),
    stackCapacity: i32 = @import("std").mem.zeroes(i32),
    stackUsed: i32 = @import("std").mem.zeroes(i32),
    byteCount: i32 = @import("std").mem.zeroes(i32),
    taskCount: i32 = @import("std").mem.zeroes(i32),
    colorCounts: [13]i32 = @import("std").mem.zeroes([13]i32),
};
pub const b2Counters = struct_b2Counters;
pub extern fn b2DefaultWorldDef() b2WorldDef;
pub extern fn b2DefaultBodyDef() b2BodyDef;
pub extern fn b2DefaultFilter() b2Filter;
pub extern fn b2DefaultQueryFilter() b2QueryFilter;
pub extern fn b2DefaultShapeDef() b2ShapeDef;
pub extern fn b2DefaultChainDef() b2ChainDef;
pub const struct_b2Circle = extern struct {
    point: b2Vec2 = @import("std").mem.zeroes(b2Vec2),
    radius: f32 = @import("std").mem.zeroes(f32),
};
pub const b2Circle = struct_b2Circle;
pub const struct_b2Capsule = extern struct {
    point1: b2Vec2 = @import("std").mem.zeroes(b2Vec2),
    point2: b2Vec2 = @import("std").mem.zeroes(b2Vec2),
    radius: f32 = @import("std").mem.zeroes(f32),
};
pub const b2Capsule = struct_b2Capsule;
pub const struct_b2DistanceCache = extern struct {
    metric: f32 = @import("std").mem.zeroes(f32),
    count: u16 = @import("std").mem.zeroes(u16),
    indexA: [3]u8 = @import("std").mem.zeroes([3]u8),
    indexB: [3]u8 = @import("std").mem.zeroes([3]u8),
};
pub const b2DistanceCache = struct_b2DistanceCache;
pub const struct_b2Polygon = extern struct {
    vertices: [8]b2Vec2 = @import("std").mem.zeroes([8]b2Vec2),
    normals: [8]b2Vec2 = @import("std").mem.zeroes([8]b2Vec2),
    centroid: b2Vec2 = @import("std").mem.zeroes(b2Vec2),
    radius: f32 = @import("std").mem.zeroes(f32),
    count: i32 = @import("std").mem.zeroes(i32),
};
pub const b2Polygon = struct_b2Polygon;
pub const struct_b2Segment = extern struct {
    point1: b2Vec2 = @import("std").mem.zeroes(b2Vec2),
    point2: b2Vec2 = @import("std").mem.zeroes(b2Vec2),
};
pub const b2Segment = struct_b2Segment;
pub const struct_b2SmoothSegment = extern struct {
    ghost1: b2Vec2 = @import("std").mem.zeroes(b2Vec2),
    segment: b2Segment = @import("std").mem.zeroes(b2Segment),
    ghost2: b2Vec2 = @import("std").mem.zeroes(b2Vec2),
    chainIndex: i32 = @import("std").mem.zeroes(i32),
};
pub const b2SmoothSegment = struct_b2SmoothSegment;
pub const b2_emptyManifold: b2Manifold = b2Manifold{
    .points = [1]b2ManifoldPoint{
        b2ManifoldPoint{
            .point = b2Vec2{
                .x = @as(f32, @floatFromInt(@as(c_int, 0))),
                .y = 0,
            },
            .anchorA = @import("std").mem.zeroes(b2Vec2),
            .anchorB = @import("std").mem.zeroes(b2Vec2),
            .separation = 0,
            .normalImpulse = 0,
            .tangentImpulse = 0,
            .maxNormalImpulse = 0,
            .id = @import("std").mem.zeroes(u16),
            .persisted = false,
        },
    } ++ [1]b2ManifoldPoint{@import("std").mem.zeroes(b2ManifoldPoint)} ** 1,
    .normal = @import("std").mem.zeroes(b2Vec2),
    .pointCount = @import("std").mem.zeroes(i32),
};
pub extern fn b2CollideCircles(circleA: [*c]const b2Circle, xfA: b2Transform, circleB: [*c]const b2Circle, xfB: b2Transform) b2Manifold;
pub extern fn b2CollideCapsuleAndCircle(capsuleA: [*c]const b2Capsule, xfA: b2Transform, circleB: [*c]const b2Circle, xfB: b2Transform) b2Manifold;
pub extern fn b2CollideSegmentAndCircle(segmentA: [*c]const b2Segment, xfA: b2Transform, circleB: [*c]const b2Circle, xfB: b2Transform) b2Manifold;
pub extern fn b2CollidePolygonAndCircle(polygonA: [*c]const b2Polygon, xfA: b2Transform, circleB: [*c]const b2Circle, xfB: b2Transform) b2Manifold;
pub extern fn b2CollideCapsules(capsuleA: [*c]const b2Capsule, xfA: b2Transform, capsuleB: [*c]const b2Capsule, xfB: b2Transform, cache: [*c]b2DistanceCache) b2Manifold;
pub extern fn b2CollideSegmentAndCapsule(segmentA: [*c]const b2Segment, xfA: b2Transform, capsuleB: [*c]const b2Capsule, xfB: b2Transform, cache: [*c]b2DistanceCache) b2Manifold;
pub extern fn b2CollidePolygonAndCapsule(polygonA: [*c]const b2Polygon, xfA: b2Transform, capsuleB: [*c]const b2Capsule, xfB: b2Transform, cache: [*c]b2DistanceCache) b2Manifold;
pub extern fn b2CollidePolygons(polyA: [*c]const b2Polygon, xfA: b2Transform, polyB: [*c]const b2Polygon, xfB: b2Transform, cache: [*c]b2DistanceCache) b2Manifold;
pub extern fn b2CollideSegmentAndPolygon(segmentA: [*c]const b2Segment, xfA: b2Transform, polygonB: [*c]const b2Polygon, xfB: b2Transform, cache: [*c]b2DistanceCache) b2Manifold;
pub extern fn b2CollideSmoothSegmentAndCircle(smoothSegmentA: [*c]const b2SmoothSegment, xfA: b2Transform, circleB: [*c]const b2Circle, xfB: b2Transform) b2Manifold;
pub extern fn b2CollideSmoothSegmentAndCapsule(smoothSegmentA: [*c]const b2SmoothSegment, xfA: b2Transform, capsuleB: [*c]const b2Capsule, xfB: b2Transform, cache: [*c]b2DistanceCache) b2Manifold;
pub extern fn b2CollideSmoothSegmentAndPolygon(smoothSegmentA: [*c]const b2SmoothSegment, xfA: b2Transform, polygonB: [*c]const b2Polygon, xfB: b2Transform, cache: [*c]b2DistanceCache) b2Manifold;
pub const struct_b2SensorBeginTouchEvent = extern struct {
    sensorShapeId: b2ShapeId = @import("std").mem.zeroes(b2ShapeId),
    visitorShapeId: b2ShapeId = @import("std").mem.zeroes(b2ShapeId),
};
pub const b2SensorBeginTouchEvent = struct_b2SensorBeginTouchEvent;
pub const struct_b2SensorEndTouchEvent = extern struct {
    sensorShapeId: b2ShapeId = @import("std").mem.zeroes(b2ShapeId),
    visitorShapeId: b2ShapeId = @import("std").mem.zeroes(b2ShapeId),
};
pub const b2SensorEndTouchEvent = struct_b2SensorEndTouchEvent;
pub const struct_b2SensorEvents = extern struct {
    beginEvents: [*c]b2SensorBeginTouchEvent = @import("std").mem.zeroes([*c]b2SensorBeginTouchEvent),
    endEvents: [*c]b2SensorEndTouchEvent = @import("std").mem.zeroes([*c]b2SensorEndTouchEvent),
    beginCount: c_int = @import("std").mem.zeroes(c_int),
    endCount: c_int = @import("std").mem.zeroes(c_int),
};
pub const b2SensorEvents = struct_b2SensorEvents;
pub const struct_b2ContactBeginTouchEvent = extern struct {
    shapeIdA: b2ShapeId = @import("std").mem.zeroes(b2ShapeId),
    shapeIdB: b2ShapeId = @import("std").mem.zeroes(b2ShapeId),
    manifold: b2Manifold = @import("std").mem.zeroes(b2Manifold),
};
pub const b2ContactBeginTouchEvent = struct_b2ContactBeginTouchEvent;
pub const struct_b2ContactEndTouchEvent = extern struct {
    shapeIdA: b2ShapeId = @import("std").mem.zeroes(b2ShapeId),
    shapeIdB: b2ShapeId = @import("std").mem.zeroes(b2ShapeId),
};
pub const b2ContactEndTouchEvent = struct_b2ContactEndTouchEvent;
pub const struct_b2ContactEvents = extern struct {
    beginEvents: [*c]b2ContactBeginTouchEvent = @import("std").mem.zeroes([*c]b2ContactBeginTouchEvent),
    endEvents: [*c]b2ContactEndTouchEvent = @import("std").mem.zeroes([*c]b2ContactEndTouchEvent),
    beginCount: c_int = @import("std").mem.zeroes(c_int),
    endCount: c_int = @import("std").mem.zeroes(c_int),
};
pub const b2ContactEvents = struct_b2ContactEvents;
pub const struct_b2ContactData = extern struct {
    shapeIdA: b2ShapeId = @import("std").mem.zeroes(b2ShapeId),
    shapeIdB: b2ShapeId = @import("std").mem.zeroes(b2ShapeId),
    manifold: b2Manifold = @import("std").mem.zeroes(b2Manifold),
};
pub const b2ContactData = struct_b2ContactData;
pub const struct_b2BodyMoveEvent = extern struct {
    transform: b2Transform = @import("std").mem.zeroes(b2Transform),
    bodyId: b2BodyId = @import("std").mem.zeroes(b2BodyId),
    userData: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    fellAsleep: bool = @import("std").mem.zeroes(bool),
};
pub const b2BodyMoveEvent = struct_b2BodyMoveEvent;
pub const struct_b2BodyEvents = extern struct {
    moveEvents: [*c]b2BodyMoveEvent = @import("std").mem.zeroes([*c]b2BodyMoveEvent),
    moveCount: c_int = @import("std").mem.zeroes(c_int),
};
pub const b2BodyEvents = struct_b2BodyEvents;
pub const struct_b2Hull = extern struct {
    points: [8]b2Vec2 = @import("std").mem.zeroes([8]b2Vec2),
    count: i32 = @import("std").mem.zeroes(i32),
};
pub const b2Hull = struct_b2Hull;
pub const struct_b2RayCastInput = extern struct {
    origin: b2Vec2 = @import("std").mem.zeroes(b2Vec2),
    translation: b2Vec2 = @import("std").mem.zeroes(b2Vec2),
    maxFraction: f32 = @import("std").mem.zeroes(f32),
};
pub const b2RayCastInput = struct_b2RayCastInput;
pub const struct_b2ShapeCastInput = extern struct {
    points: [8]b2Vec2 = @import("std").mem.zeroes([8]b2Vec2),
    count: i32 = @import("std").mem.zeroes(i32),
    radius: f32 = @import("std").mem.zeroes(f32),
    translation: b2Vec2 = @import("std").mem.zeroes(b2Vec2),
    maxFraction: f32 = @import("std").mem.zeroes(f32),
};
pub const b2ShapeCastInput = struct_b2ShapeCastInput;
pub const struct_b2CastOutput = extern struct {
    normal: b2Vec2 = @import("std").mem.zeroes(b2Vec2),
    point: b2Vec2 = @import("std").mem.zeroes(b2Vec2),
    fraction: f32 = @import("std").mem.zeroes(f32),
    iterations: i32 = @import("std").mem.zeroes(i32),
    hit: bool = @import("std").mem.zeroes(bool),
};
pub const b2CastOutput = struct_b2CastOutput;
pub const struct_b2MassData = extern struct {
    mass: f32 = @import("std").mem.zeroes(f32),
    center: b2Vec2 = @import("std").mem.zeroes(b2Vec2),
    I: f32 = @import("std").mem.zeroes(f32),
};
pub const b2MassData = struct_b2MassData;
pub extern fn b2IsValidRay(input: [*c]const b2RayCastInput) bool;
pub extern fn b2MakePolygon(hull: [*c]const b2Hull, radius: f32) b2Polygon;
pub extern fn b2MakeOffsetPolygon(hull: [*c]const b2Hull, radius: f32, transform: b2Transform) b2Polygon;
pub extern fn b2MakeSquare(h: f32) b2Polygon;
pub extern fn b2MakeBox(hx: f32, hy: f32) b2Polygon;
pub extern fn b2MakeRoundedBox(hx: f32, hy: f32, radius: f32) b2Polygon;
pub extern fn b2MakeOffsetBox(hx: f32, hy: f32, center: b2Vec2, angle: f32) b2Polygon;
pub extern fn b2TransformPolygon(transform: b2Transform, polygon: [*c]const b2Polygon) b2Polygon;
pub extern fn b2ComputeCircleMass(shape: [*c]const b2Circle, density: f32) b2MassData;
pub extern fn b2ComputeCapsuleMass(shape: [*c]const b2Capsule, density: f32) b2MassData;
pub extern fn b2ComputePolygonMass(shape: [*c]const b2Polygon, density: f32) b2MassData;
pub extern fn b2ComputeCircleAABB(shape: [*c]const b2Circle, transform: b2Transform) b2AABB;
pub extern fn b2ComputeCapsuleAABB(shape: [*c]const b2Capsule, transform: b2Transform) b2AABB;
pub extern fn b2ComputePolygonAABB(shape: [*c]const b2Polygon, transform: b2Transform) b2AABB;
pub extern fn b2ComputeSegmentAABB(shape: [*c]const b2Segment, transform: b2Transform) b2AABB;
pub extern fn b2PointInCircle(point: b2Vec2, shape: [*c]const b2Circle) bool;
pub extern fn b2PointInCapsule(point: b2Vec2, shape: [*c]const b2Capsule) bool;
pub extern fn b2PointInPolygon(point: b2Vec2, shape: [*c]const b2Polygon) bool;
pub extern fn b2RayCastCircle(input: [*c]const b2RayCastInput, shape: [*c]const b2Circle) b2CastOutput;
pub extern fn b2RayCastCapsule(input: [*c]const b2RayCastInput, shape: [*c]const b2Capsule) b2CastOutput;
pub extern fn b2RayCastSegment(input: [*c]const b2RayCastInput, shape: [*c]const b2Segment, oneSided: bool) b2CastOutput;
pub extern fn b2RayCastPolygon(input: [*c]const b2RayCastInput, shape: [*c]const b2Polygon) b2CastOutput;
pub extern fn b2ShapeCastCircle(input: [*c]const b2ShapeCastInput, shape: [*c]const b2Circle) b2CastOutput;
pub extern fn b2ShapeCastCapsule(input: [*c]const b2ShapeCastInput, shape: [*c]const b2Capsule) b2CastOutput;
pub extern fn b2ShapeCastSegment(input: [*c]const b2ShapeCastInput, shape: [*c]const b2Segment) b2CastOutput;
pub extern fn b2ShapeCastPolygon(input: [*c]const b2ShapeCastInput, shape: [*c]const b2Polygon) b2CastOutput;
pub const b2_distanceJoint: c_int = 0;
pub const b2_motorJoint: c_int = 1;
pub const b2_mouseJoint: c_int = 2;
pub const b2_prismaticJoint: c_int = 3;
pub const b2_revoluteJoint: c_int = 4;
pub const b2_weldJoint: c_int = 5;
pub const b2_wheelJoint: c_int = 6;
pub const enum_b2JointType = c_uint;
pub const b2JointType = enum_b2JointType;
pub const struct_b2DistanceJointDef = extern struct {
    bodyIdA: b2BodyId = @import("std").mem.zeroes(b2BodyId),
    bodyIdB: b2BodyId = @import("std").mem.zeroes(b2BodyId),
    localAnchorA: b2Vec2 = @import("std").mem.zeroes(b2Vec2),
    localAnchorB: b2Vec2 = @import("std").mem.zeroes(b2Vec2),
    length: f32 = @import("std").mem.zeroes(f32),
    minLength: f32 = @import("std").mem.zeroes(f32),
    maxLength: f32 = @import("std").mem.zeroes(f32),
    hertz: f32 = @import("std").mem.zeroes(f32),
    dampingRatio: f32 = @import("std").mem.zeroes(f32),
    collideConnected: bool = @import("std").mem.zeroes(bool),
    userData: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
};
pub const b2DistanceJointDef = struct_b2DistanceJointDef;
pub extern fn b2DefaultDistanceJointDef() b2DistanceJointDef;
pub const struct_b2MotorJointDef = extern struct {
    bodyIdA: b2BodyId = @import("std").mem.zeroes(b2BodyId),
    bodyIdB: b2BodyId = @import("std").mem.zeroes(b2BodyId),
    linearOffset: b2Vec2 = @import("std").mem.zeroes(b2Vec2),
    angularOffset: f32 = @import("std").mem.zeroes(f32),
    maxForce: f32 = @import("std").mem.zeroes(f32),
    maxTorque: f32 = @import("std").mem.zeroes(f32),
    correctionFactor: f32 = @import("std").mem.zeroes(f32),
    collideConnected: bool = @import("std").mem.zeroes(bool),
    userData: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
};
pub const b2MotorJointDef = struct_b2MotorJointDef;
pub extern fn b2DefaultMotorJointDef() b2MotorJointDef;
pub const struct_b2MouseJointDef = extern struct {
    bodyIdA: b2BodyId = @import("std").mem.zeroes(b2BodyId),
    bodyIdB: b2BodyId = @import("std").mem.zeroes(b2BodyId),
    target: b2Vec2 = @import("std").mem.zeroes(b2Vec2),
    hertz: f32 = @import("std").mem.zeroes(f32),
    dampingRatio: f32 = @import("std").mem.zeroes(f32),
    collideConnected: bool = @import("std").mem.zeroes(bool),
    userData: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
};
pub const b2MouseJointDef = struct_b2MouseJointDef;
pub extern fn b2DefaultMouseJointDef() b2MouseJointDef;
pub const struct_b2PrismaticJointDef = extern struct {
    bodyIdA: b2BodyId = @import("std").mem.zeroes(b2BodyId),
    bodyIdB: b2BodyId = @import("std").mem.zeroes(b2BodyId),
    localAnchorA: b2Vec2 = @import("std").mem.zeroes(b2Vec2),
    localAnchorB: b2Vec2 = @import("std").mem.zeroes(b2Vec2),
    localAxisA: b2Vec2 = @import("std").mem.zeroes(b2Vec2),
    referenceAngle: f32 = @import("std").mem.zeroes(f32),
    enableLimit: bool = @import("std").mem.zeroes(bool),
    lowerTranslation: f32 = @import("std").mem.zeroes(f32),
    upperTranslation: f32 = @import("std").mem.zeroes(f32),
    enableMotor: bool = @import("std").mem.zeroes(bool),
    maxMotorForce: f32 = @import("std").mem.zeroes(f32),
    motorSpeed: f32 = @import("std").mem.zeroes(f32),
    collideConnected: bool = @import("std").mem.zeroes(bool),
    userData: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
};
pub const b2PrismaticJointDef = struct_b2PrismaticJointDef;
pub extern fn b2DefaultPrismaticJointDef() b2PrismaticJointDef;
pub const struct_b2RevoluteJointDef = extern struct {
    bodyIdA: b2BodyId = @import("std").mem.zeroes(b2BodyId),
    bodyIdB: b2BodyId = @import("std").mem.zeroes(b2BodyId),
    localAnchorA: b2Vec2 = @import("std").mem.zeroes(b2Vec2),
    localAnchorB: b2Vec2 = @import("std").mem.zeroes(b2Vec2),
    referenceAngle: f32 = @import("std").mem.zeroes(f32),
    enableLimit: bool = @import("std").mem.zeroes(bool),
    lowerAngle: f32 = @import("std").mem.zeroes(f32),
    upperAngle: f32 = @import("std").mem.zeroes(f32),
    enableMotor: bool = @import("std").mem.zeroes(bool),
    maxMotorTorque: f32 = @import("std").mem.zeroes(f32),
    motorSpeed: f32 = @import("std").mem.zeroes(f32),
    drawSize: f32 = @import("std").mem.zeroes(f32),
    collideConnected: bool = @import("std").mem.zeroes(bool),
    userData: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
};
pub const b2RevoluteJointDef = struct_b2RevoluteJointDef;
pub extern fn b2DefaultRevoluteJointDef() b2RevoluteJointDef;
pub const struct_b2WeldJointDef = extern struct {
    bodyIdA: b2BodyId = @import("std").mem.zeroes(b2BodyId),
    bodyIdB: b2BodyId = @import("std").mem.zeroes(b2BodyId),
    localAnchorA: b2Vec2 = @import("std").mem.zeroes(b2Vec2),
    localAnchorB: b2Vec2 = @import("std").mem.zeroes(b2Vec2),
    referenceAngle: f32 = @import("std").mem.zeroes(f32),
    linearHertz: f32 = @import("std").mem.zeroes(f32),
    angularHertz: f32 = @import("std").mem.zeroes(f32),
    linearDampingRatio: f32 = @import("std").mem.zeroes(f32),
    angularDampingRatio: f32 = @import("std").mem.zeroes(f32),
    collideConnected: bool = @import("std").mem.zeroes(bool),
    userData: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
};
pub const b2WeldJointDef = struct_b2WeldJointDef;
pub extern fn b2DefaultWeldJointDef() b2WeldJointDef;
pub const struct_b2WheelJointDef = extern struct {
    bodyIdA: b2BodyId = @import("std").mem.zeroes(b2BodyId),
    bodyIdB: b2BodyId = @import("std").mem.zeroes(b2BodyId),
    localAnchorA: b2Vec2 = @import("std").mem.zeroes(b2Vec2),
    localAnchorB: b2Vec2 = @import("std").mem.zeroes(b2Vec2),
    localAxisA: b2Vec2 = @import("std").mem.zeroes(b2Vec2),
    enableLimit: bool = @import("std").mem.zeroes(bool),
    lowerTranslation: f32 = @import("std").mem.zeroes(f32),
    upperTranslation: f32 = @import("std").mem.zeroes(f32),
    enableMotor: bool = @import("std").mem.zeroes(bool),
    maxMotorTorque: f32 = @import("std").mem.zeroes(f32),
    motorSpeed: f32 = @import("std").mem.zeroes(f32),
    hertz: f32 = @import("std").mem.zeroes(f32),
    dampingRatio: f32 = @import("std").mem.zeroes(f32),
    collideConnected: bool = @import("std").mem.zeroes(bool),
    userData: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
};
pub const b2WheelJointDef = struct_b2WheelJointDef;
pub extern fn b2DefaultWheelJointDef() b2WheelJointDef;
pub const struct_b2DebugDraw = extern struct {
    DrawPolygon: ?*const fn ([*c]const b2Vec2, c_int, b2Color, ?*anyopaque) callconv(.C) void = @import("std").mem.zeroes(?*const fn ([*c]const b2Vec2, c_int, b2Color, ?*anyopaque) callconv(.C) void),
    DrawSolidPolygon: ?*const fn ([*c]const b2Vec2, c_int, b2Color, ?*anyopaque) callconv(.C) void = @import("std").mem.zeroes(?*const fn ([*c]const b2Vec2, c_int, b2Color, ?*anyopaque) callconv(.C) void),
    DrawRoundedPolygon: ?*const fn ([*c]const b2Vec2, c_int, f32, b2Color, b2Color, ?*anyopaque) callconv(.C) void = @import("std").mem.zeroes(?*const fn ([*c]const b2Vec2, c_int, f32, b2Color, b2Color, ?*anyopaque) callconv(.C) void),
    DrawCircle: ?*const fn (b2Vec2, f32, b2Color, ?*anyopaque) callconv(.C) void = @import("std").mem.zeroes(?*const fn (b2Vec2, f32, b2Color, ?*anyopaque) callconv(.C) void),
    DrawSolidCircle: ?*const fn (b2Vec2, f32, b2Vec2, b2Color, ?*anyopaque) callconv(.C) void = @import("std").mem.zeroes(?*const fn (b2Vec2, f32, b2Vec2, b2Color, ?*anyopaque) callconv(.C) void),
    DrawCapsule: ?*const fn (b2Vec2, b2Vec2, f32, b2Color, ?*anyopaque) callconv(.C) void = @import("std").mem.zeroes(?*const fn (b2Vec2, b2Vec2, f32, b2Color, ?*anyopaque) callconv(.C) void),
    DrawSolidCapsule: ?*const fn (b2Vec2, b2Vec2, f32, b2Color, ?*anyopaque) callconv(.C) void = @import("std").mem.zeroes(?*const fn (b2Vec2, b2Vec2, f32, b2Color, ?*anyopaque) callconv(.C) void),
    DrawSegment: ?*const fn (b2Vec2, b2Vec2, b2Color, ?*anyopaque) callconv(.C) void = @import("std").mem.zeroes(?*const fn (b2Vec2, b2Vec2, b2Color, ?*anyopaque) callconv(.C) void),
    DrawTransform: ?*const fn (b2Transform, ?*anyopaque) callconv(.C) void = @import("std").mem.zeroes(?*const fn (b2Transform, ?*anyopaque) callconv(.C) void),
    DrawPoint: ?*const fn (b2Vec2, f32, b2Color, ?*anyopaque) callconv(.C) void = @import("std").mem.zeroes(?*const fn (b2Vec2, f32, b2Color, ?*anyopaque) callconv(.C) void),
    DrawString: ?*const fn (b2Vec2, [*c]const u8, ?*anyopaque) callconv(.C) void = @import("std").mem.zeroes(?*const fn (b2Vec2, [*c]const u8, ?*anyopaque) callconv(.C) void),
    drawShapes: bool = @import("std").mem.zeroes(bool),
    drawJoints: bool = @import("std").mem.zeroes(bool),
    drawAABBs: bool = @import("std").mem.zeroes(bool),
    drawMass: bool = @import("std").mem.zeroes(bool),
    drawContacts: bool = @import("std").mem.zeroes(bool),
    drawGraphColors: bool = @import("std").mem.zeroes(bool),
    drawContactNormals: bool = @import("std").mem.zeroes(bool),
    drawContactImpulses: bool = @import("std").mem.zeroes(bool),
    drawFrictionImpulses: bool = @import("std").mem.zeroes(bool),
    context: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
};
pub const b2DebugDraw = struct_b2DebugDraw;
pub extern fn b2CreateWorld(def: [*c]const b2WorldDef) b2WorldId;
pub extern fn b2DestroyWorld(worldId: b2WorldId) void;
pub extern fn b2World_IsValid(id: b2WorldId) bool;
pub extern fn b2World_Step(worldId: b2WorldId, timeStep: f32, subStepCount: i32) void;
pub extern fn b2World_Draw(worldId: b2WorldId, debugDraw: [*c]b2DebugDraw) void;
pub extern fn b2World_GetBodyEvents(worldId: b2WorldId) b2BodyEvents;
pub extern fn b2World_GetSensorEvents(worldId: b2WorldId) b2SensorEvents;
pub extern fn b2World_GetContactEvents(worldId: b2WorldId) b2ContactEvents;
pub extern fn b2World_OverlapAABB(worldId: b2WorldId, aabb: b2AABB, filter: b2QueryFilter, fcn: ?*const b2OverlapResultFcn, context: ?*anyopaque) void;
pub extern fn b2World_OverlapCircle(worldId: b2WorldId, circle: [*c]const b2Circle, transform: b2Transform, filter: b2QueryFilter, fcn: ?*const b2OverlapResultFcn, context: ?*anyopaque) void;
pub extern fn b2World_OverlapCapsule(worldId: b2WorldId, capsule: [*c]const b2Capsule, transform: b2Transform, filter: b2QueryFilter, fcn: ?*const b2OverlapResultFcn, context: ?*anyopaque) void;
pub extern fn b2World_OverlapPolygon(worldId: b2WorldId, polygon: [*c]const b2Polygon, transform: b2Transform, filter: b2QueryFilter, fcn: ?*const b2OverlapResultFcn, context: ?*anyopaque) void;
pub extern fn b2World_RayCast(worldId: b2WorldId, origin: b2Vec2, translation: b2Vec2, filter: b2QueryFilter, fcn: ?*const b2CastResultFcn, context: ?*anyopaque) void;
pub extern fn b2World_RayCastClosest(worldId: b2WorldId, origin: b2Vec2, translation: b2Vec2, filter: b2QueryFilter) b2RayResult;
pub extern fn b2World_CircleCast(worldId: b2WorldId, circle: [*c]const b2Circle, originTransform: b2Transform, translation: b2Vec2, filter: b2QueryFilter, fcn: ?*const b2CastResultFcn, context: ?*anyopaque) void;
pub extern fn b2World_CapsuleCast(worldId: b2WorldId, capsule: [*c]const b2Capsule, originTransform: b2Transform, translation: b2Vec2, filter: b2QueryFilter, fcn: ?*const b2CastResultFcn, context: ?*anyopaque) void;
pub extern fn b2World_PolygonCast(worldId: b2WorldId, polygon: [*c]const b2Polygon, originTransform: b2Transform, translation: b2Vec2, filter: b2QueryFilter, fcn: ?*const b2CastResultFcn, context: ?*anyopaque) void;
pub extern fn b2World_EnableSleeping(worldId: b2WorldId, flag: bool) void;
pub extern fn b2World_EnableWarmStarting(worldId: b2WorldId, flag: bool) void;
pub extern fn b2World_EnableContinuous(worldId: b2WorldId, flag: bool) void;
pub extern fn b2World_SetRestitutionThreshold(worldId: b2WorldId, value: f32) void;
pub extern fn b2World_SetPreSolveCallback(worldId: b2WorldId, fcn: ?*const b2PreSolveFcn, context: ?*anyopaque) void;
pub extern fn b2World_SetContactTuning(worldId: b2WorldId, hertz: f32, dampingRatio: f32, pushVelocity: f32) void;
pub extern fn b2World_GetProfile(worldId: b2WorldId) b2Profile;
pub extern fn b2World_GetCounters(worldId: b2WorldId) b2Counters;
pub extern fn b2CreateBody(worldId: b2WorldId, def: [*c]const b2BodyDef) b2BodyId;
pub extern fn b2DestroyBody(bodyId: b2BodyId) void;
pub extern fn b2Body_IsValid(id: b2BodyId) bool;
pub extern fn b2DestroyBodyAndJoints(bodyId: b2BodyId) void;
pub extern fn b2Body_GetType(bodyId: b2BodyId) b2BodyType;
pub extern fn b2Body_SetType(bodyId: b2BodyId, @"type": b2BodyType) void;
pub extern fn b2Body_SetUserData(bodyId: b2BodyId, userData: ?*anyopaque) void;
pub extern fn b2Body_GetUserData(bodyId: b2BodyId) ?*anyopaque;
pub extern fn b2Body_GetPosition(bodyId: b2BodyId) b2Vec2;
pub extern fn b2Body_GetRotation(bodyId: b2BodyId) b2Rot;
pub extern fn b2Body_GetAngle(bodyId: b2BodyId) f32;
pub extern fn b2Body_GetTransform(bodyId: b2BodyId) b2Transform;
pub extern fn b2Body_SetTransform(bodyId: b2BodyId, position: b2Vec2, angle: f32) void;
pub extern fn b2Body_GetLocalPoint(bodyId: b2BodyId, worldPoint: b2Vec2) b2Vec2;
pub extern fn b2Body_GetWorldPoint(bodyId: b2BodyId, localPoint: b2Vec2) b2Vec2;
pub extern fn b2Body_GetLocalVector(bodyId: b2BodyId, worldVector: b2Vec2) b2Vec2;
pub extern fn b2Body_GetWorldVector(bodyId: b2BodyId, localVector: b2Vec2) b2Vec2;
pub extern fn b2Body_GetLinearVelocity(bodyId: b2BodyId) b2Vec2;
pub extern fn b2Body_GetAngularVelocity(bodyId: b2BodyId) f32;
pub extern fn b2Body_SetLinearVelocity(bodyId: b2BodyId, linearVelocity: b2Vec2) void;
pub extern fn b2Body_SetAngularVelocity(bodyId: b2BodyId, angularVelocity: f32) void;
pub extern fn b2Body_ApplyForce(bodyId: b2BodyId, force: b2Vec2, point: b2Vec2, wake: bool) void;
pub extern fn b2Body_ApplyForceToCenter(bodyId: b2BodyId, force: b2Vec2, wake: bool) void;
pub extern fn b2Body_ApplyTorque(bodyId: b2BodyId, torque: f32, wake: bool) void;
pub extern fn b2Body_ApplyLinearImpulse(bodyId: b2BodyId, impulse: b2Vec2, point: b2Vec2, wake: bool) void;
pub extern fn b2Body_ApplyLinearImpulseToCenter(bodyId: b2BodyId, impulse: b2Vec2, wake: bool) void;
pub extern fn b2Body_ApplyAngularImpulse(bodyId: b2BodyId, impulse: f32, wake: bool) void;
pub extern fn b2Body_GetMass(bodyId: b2BodyId) f32;
pub extern fn b2Body_GetInertiaTensor(bodyId: b2BodyId) f32;
pub extern fn b2Body_GetLocalCenterOfMass(bodyId: b2BodyId) b2Vec2;
pub extern fn b2Body_GetWorldCenterOfMass(bodyId: b2BodyId) b2Vec2;
pub extern fn b2Body_SetMassData(bodyId: b2BodyId, massData: b2MassData) void;
pub extern fn b2Body_GetMassData(bodyId: b2BodyId) b2MassData;
pub extern fn b2Body_ResetMassData(bodyId: b2BodyId) void;
pub extern fn b2Body_SetLinearDamping(bodyId: b2BodyId, linearDamping: f32) void;
pub extern fn b2Body_GetLinearDamping(bodyId: b2BodyId) f32;
pub extern fn b2Body_SetAngularDamping(bodyId: b2BodyId, angularDamping: f32) void;
pub extern fn b2Body_GetAngularDamping(bodyId: b2BodyId) f32;
pub extern fn b2Body_SetGravityScale(bodyId: b2BodyId, gravityScale: f32) void;
pub extern fn b2Body_GetGravityScale(bodyId: b2BodyId) f32;
pub extern fn b2Body_IsAwake(bodyId: b2BodyId) bool;
pub extern fn b2Body_Wake(bodyId: b2BodyId) void;
pub extern fn b2Body_EnableSleep(bodyId: b2BodyId, enableSleep: bool) void;
pub extern fn b2Body_IsSleepEnabled(bodyId: b2BodyId) bool;
pub extern fn b2Body_IsEnabled(bodyId: b2BodyId) bool;
pub extern fn b2Body_Disable(bodyId: b2BodyId) void;
pub extern fn b2Body_Enable(bodyId: b2BodyId) void;
pub extern fn b2Body_SetFixedRotation(bodyId: b2BodyId, flag: bool) void;
pub extern fn b2Body_IsFixedRotation(bodyId: b2BodyId) bool;
pub extern fn b2Body_SetBullet(bodyId: b2BodyId, flag: bool) void;
pub extern fn b2Body_IsBullet(bodyId: b2BodyId) bool;
pub extern fn b2Body_GetFirstShape(bodyId: b2BodyId) b2ShapeId;
pub extern fn b2Body_GetNextShape(shapeId: b2ShapeId) b2ShapeId;
pub extern fn b2Body_GetContactCapacity(bodyId: b2BodyId) i32;
pub extern fn b2Body_GetContactData(bodyId: b2BodyId, contactData: [*c]b2ContactData, capacity: i32) i32;
pub extern fn b2Body_ComputeAABB(bodyId: b2BodyId) b2AABB;
pub extern fn b2CreateCircleShape(bodyId: b2BodyId, def: [*c]const b2ShapeDef, circle: [*c]const b2Circle) b2ShapeId;
pub extern fn b2CreateSegmentShape(bodyId: b2BodyId, def: [*c]const b2ShapeDef, segment: [*c]const b2Segment) b2ShapeId;
pub extern fn b2CreateCapsuleShape(bodyId: b2BodyId, def: [*c]const b2ShapeDef, capsule: [*c]const b2Capsule) b2ShapeId;
pub extern fn b2CreatePolygonShape(bodyId: b2BodyId, def: [*c]const b2ShapeDef, polygon: [*c]const b2Polygon) b2ShapeId;
pub extern fn b2DestroyShape(shapeId: b2ShapeId) void;
pub extern fn b2Shape_IsValid(id: b2ShapeId) bool;
pub extern fn b2Shape_GetType(shapeId: b2ShapeId) b2ShapeType;
pub extern fn b2Shape_GetBody(shapeId: b2ShapeId) b2BodyId;
pub extern fn b2Shape_IsSensor(shapeId: b2ShapeId) bool;
pub extern fn b2Shape_SetUserData(shapeId: b2ShapeId, userData: ?*anyopaque) void;
pub extern fn b2Shape_GetUserData(shapeId: b2ShapeId) ?*anyopaque;
pub extern fn b2Shape_SetDensity(shapeId: b2ShapeId, density: f32) void;
pub extern fn b2Shape_GetDensity(shapeId: b2ShapeId) f32;
pub extern fn b2Shape_SetFriction(shapeId: b2ShapeId, friction: f32) void;
pub extern fn b2Shape_GetFriction(shapeId: b2ShapeId) f32;
pub extern fn b2Shape_SetRestitution(shapeId: b2ShapeId, restitution: f32) void;
pub extern fn b2Shape_GetRestitution(shapeId: b2ShapeId) f32;
pub extern fn b2Shape_GetFilter(shapeId: b2ShapeId) b2Filter;
pub extern fn b2Shape_SetFilter(shapeId: b2ShapeId, filter: b2Filter) void;
pub extern fn b2Shape_EnableSensorEvents(shapeId: b2ShapeId, flag: bool) void;
pub extern fn b2Shape_AreSensorEventsEnabled(shapeId: b2ShapeId) bool;
pub extern fn b2Shape_EnableContactEvents(shapeId: b2ShapeId, flag: bool) void;
pub extern fn b2Shape_AreContactEventsEnabled(shapeId: b2ShapeId) bool;
pub extern fn b2Shape_EnablePreSolveEvents(shapeId: b2ShapeId, flag: bool) void;
pub extern fn b2Shape_ArePreSolveEventsEnabled(shapeId: b2ShapeId) bool;
pub extern fn b2Shape_TestPoint(shapeId: b2ShapeId, point: b2Vec2) bool;
pub extern fn b2Shape_RayCast(shapeId: b2ShapeId, origin: b2Vec2, translation: b2Vec2) b2CastOutput;
pub extern fn b2Shape_GetCircle(shapeId: b2ShapeId) b2Circle;
pub extern fn b2Shape_GetSegment(shapeId: b2ShapeId) b2Segment;
pub extern fn b2Shape_GetSmoothSegment(shapeId: b2ShapeId) b2SmoothSegment;
pub extern fn b2Shape_GetCapsule(shapeId: b2ShapeId) b2Capsule;
pub extern fn b2Shape_GetPolygon(shapeId: b2ShapeId) b2Polygon;
pub extern fn b2Shape_SetCircle(shapeId: b2ShapeId, circle: [*c]const b2Circle) void;
pub extern fn b2Shape_SetCapsule(shapeId: b2ShapeId, capsule: [*c]const b2Capsule) void;
pub extern fn b2Shape_SetSegment(shapeId: b2ShapeId, segment: [*c]const b2Segment) void;
pub extern fn b2Shape_SetPolygon(shapeId: b2ShapeId, polygon: [*c]const b2Polygon) void;
pub extern fn b2Shape_GetParentChain(shapeId: b2ShapeId) b2ChainId;
pub extern fn b2Shape_GetContactCapacity(shapeId: b2ShapeId) i32;
pub extern fn b2Shape_GetContactData(shapeId: b2ShapeId, contactData: [*c]b2ContactData, capacity: i32) i32;
pub extern fn b2Shape_GetAABB(shapeId: b2ShapeId) b2AABB;
pub extern fn b2CreateChain(bodyId: b2BodyId, def: [*c]const b2ChainDef) b2ChainId;
pub extern fn b2DestroyChain(chainId: b2ChainId) void;
pub extern fn b2Chain_SetFriction(chainId: b2ChainId, friction: f32) void;
pub extern fn b2Chain_SetRestitution(chainId: b2ChainId, restitution: f32) void;
pub extern fn b2Chain_IsValid(id: b2ChainId) bool;
pub extern fn b2CreateDistanceJoint(worldId: b2WorldId, def: [*c]const b2DistanceJointDef) b2JointId;
pub extern fn b2CreateMotorJoint(worldId: b2WorldId, def: [*c]const b2MotorJointDef) b2JointId;
pub extern fn b2CreateMouseJoint(worldId: b2WorldId, def: [*c]const b2MouseJointDef) b2JointId;
pub extern fn b2CreatePrismaticJoint(worldId: b2WorldId, def: [*c]const b2PrismaticJointDef) b2JointId;
pub extern fn b2CreateRevoluteJoint(worldId: b2WorldId, def: [*c]const b2RevoluteJointDef) b2JointId;
pub extern fn b2CreateWeldJoint(worldId: b2WorldId, def: [*c]const b2WeldJointDef) b2JointId;
pub extern fn b2CreateWheelJoint(worldId: b2WorldId, def: [*c]const b2WheelJointDef) b2JointId;
pub extern fn b2DestroyJoint(jointId: b2JointId) void;
pub extern fn b2Joint_IsValid(id: b2JointId) bool;
pub extern fn b2Joint_GetType(jointId: b2JointId) b2JointType;
pub extern fn b2Joint_GetBodyA(jointId: b2JointId) b2BodyId;
pub extern fn b2Joint_GetBodyB(jointId: b2JointId) b2BodyId;
pub extern fn b2Joint_GetLocalAnchorA(jointId: b2JointId) b2Vec2;
pub extern fn b2Joint_GetLocalAnchorB(jointId: b2JointId) b2Vec2;
pub extern fn b2Joint_SetCollideConnected(jointId: b2JointId, shouldCollide: bool) void;
pub extern fn b2Joint_GetCollideConnected(jointId: b2JointId) bool;
pub extern fn b2Joint_SetUserData(jointId: b2JointId, userData: ?*anyopaque) void;
pub extern fn b2Joint_GetUserData(jointId: b2JointId) ?*anyopaque;
pub extern fn b2Joint_WakeBodies(jointId: b2JointId) void;
pub extern fn b2DistanceJoint_GetConstraintForce(jointId: b2JointId, timeStep: f32) f32;
pub extern fn b2DistanceJoint_SetLength(jointId: b2JointId, length: f32) void;
pub extern fn b2DistanceJoint_GetLength(jointId: b2JointId) f32;
pub extern fn b2DistanceJoint_SetLengthRange(jointId: b2JointId, minLength: f32, maxLength: f32) void;
pub extern fn b2DistanceJoint_GetMinLength(jointId: b2JointId) f32;
pub extern fn b2DistanceJoint_GetMaxLength(jointId: b2JointId) f32;
pub extern fn b2DistanceJoint_GetCurrentLength(jointId: b2JointId) f32;
pub extern fn b2DistanceJoint_SetTuning(jointId: b2JointId, hertz: f32, dampingRatio: f32) void;
pub extern fn b2DistanceJoint_GetHertz(jointId: b2JointId) f32;
pub extern fn b2DistanceJoint_GetDampingRatio(jointId: b2JointId) f32;
pub extern fn b2MotorJoint_SetLinearOffset(jointId: b2JointId, linearOffset: b2Vec2) void;
pub extern fn b2MotorJoint_GetLinearOffset(jointId: b2JointId) b2Vec2;
pub extern fn b2MotorJoint_SetAngularOffset(jointId: b2JointId, angularOffset: f32) void;
pub extern fn b2MotorJoint_GetAngularOffset(jointId: b2JointId) f32;
pub extern fn b2MotorJoint_SetMaxForce(jointId: b2JointId, maxForce: f32) void;
pub extern fn b2MotorJoint_GetMaxForce(jointId: b2JointId) f32;
pub extern fn b2MotorJoint_SetMaxTorque(jointId: b2JointId, maxTorque: f32) void;
pub extern fn b2MotorJoint_GetMaxTorque(jointId: b2JointId) f32;
pub extern fn b2MotorJoint_SetCorrectionFactor(jointId: b2JointId, correctionFactor: f32) void;
pub extern fn b2MotorJoint_GetCorrectionFactor(jointId: b2JointId) f32;
pub extern fn b2MotorJoint_GetConstraintForce(jointId: b2JointId) b2Vec2;
pub extern fn b2MotorJoint_GetConstraintTorque(jointId: b2JointId) f32;
pub extern fn b2MouseJoint_SetTarget(jointId: b2JointId, target: b2Vec2) void;
pub extern fn b2MouseJoint_GetTarget(jointId: b2JointId) b2Vec2;
pub extern fn b2MouseJoint_SetTuning(jointId: b2JointId, hertz: f32, dampingRatio: f32) void;
pub extern fn b2MouseJoint_GetHertz(jointId: b2JointId) f32;
pub extern fn b2MouseJoint_GetDampingRatio(jointId: b2JointId) f32;
pub extern fn b2PrismaticJoint_EnableLimit(jointId: b2JointId, enableLimit: bool) void;
pub extern fn b2PrismaticJoint_IsLimitEnabled(jointId: b2JointId) bool;
pub extern fn b2PrismaticJoint_GetLowerLimit(jointId: b2JointId) f32;
pub extern fn b2PrismaticJoint_GetUpperLimit(jointId: b2JointId) f32;
pub extern fn b2PrismaticJoint_SetLimits(jointId: b2JointId, lower: f32, upper: f32) void;
pub extern fn b2PrismaticJoint_EnableMotor(jointId: b2JointId, enableMotor: bool) void;
pub extern fn b2PrismaticJoint_IsMotorEnabled(jointId: b2JointId) bool;
pub extern fn b2PrismaticJoint_SetMotorSpeed(jointId: b2JointId, motorSpeed: f32) void;
pub extern fn b2PrismaticJoint_GetMotorSpeed(jointId: b2JointId) f32;
pub extern fn b2PrismaticJoint_GetMotorForce(jointId: b2JointId) f32;
pub extern fn b2PrismaticJoint_SetMaxMotorForce(jointId: b2JointId, force: f32) void;
pub extern fn b2PrismaticJoint_GetMaxMotorForce(jointId: b2JointId) f32;
pub extern fn b2PrismaticJoint_GetConstraintForce(jointId: b2JointId) b2Vec2;
pub extern fn b2PrismaticJoint_GetConstraintTorque(jointId: b2JointId) f32;
pub extern fn b2RevoluteJoint_EnableLimit(jointId: b2JointId, enableLimit: bool) void;
pub extern fn b2RevoluteJoint_IsLimitEnabled(jointId: b2JointId) bool;
pub extern fn b2RevoluteJoint_GetLowerLimit(jointId: b2JointId) f32;
pub extern fn b2RevoluteJoint_GetUpperLimit(jointId: b2JointId) f32;
pub extern fn b2RevoluteJoint_SetLimits(jointId: b2JointId, lower: f32, upper: f32) void;
pub extern fn b2RevoluteJoint_EnableMotor(jointId: b2JointId, enableMotor: bool) void;
pub extern fn b2RevoluteJoint_IsMotorEnabled(jointId: b2JointId) bool;
pub extern fn b2RevoluteJoint_SetMotorSpeed(jointId: b2JointId, motorSpeed: f32) void;
pub extern fn b2RevoluteJoint_GetMotorSpeed(jointId: b2JointId) f32;
pub extern fn b2RevoluteJoint_GetMotorTorque(jointId: b2JointId) f32;
pub extern fn b2RevoluteJoint_SetMaxMotorTorque(jointId: b2JointId, torque: f32) void;
pub extern fn b2RevoluteJoint_GetMaxMotorTorque(jointId: b2JointId) f32;
pub extern fn b2RevoluteJoint_GetConstraintForce(jointId: b2JointId) b2Vec2;
pub extern fn b2RevoluteJoint_GetConstraintTorque(jointId: b2JointId) f32;
pub extern fn b2WheelJoint_SetSpringHertz(jointId: b2JointId, hertz: f32) void;
pub extern fn b2WheelJoint_GetSpringHertz(jointId: b2JointId) f32;
pub extern fn b2WheelJoint_SetSpringDampingRatio(jointId: b2JointId, dampingRatio: f32) void;
pub extern fn b2WheelJoint_GetSpringDampingRatio(jointId: b2JointId) f32;
pub extern fn b2WheelJoint_EnableLimit(jointId: b2JointId, enableLimit: bool) void;
pub extern fn b2WheelJoint_IsLimitEnabled(jointId: b2JointId) bool;
pub extern fn b2WheelJoint_GetLowerLimit(jointId: b2JointId) f32;
pub extern fn b2WheelJoint_GetUpperLimit(jointId: b2JointId) f32;
pub extern fn b2WheelJoint_SetLimits(jointId: b2JointId, lower: f32, upper: f32) void;
pub extern fn b2WheelJoint_EnableMotor(jointId: b2JointId, enableMotor: bool) void;
pub extern fn b2WheelJoint_IsMotorEnabled(jointId: b2JointId) bool;
pub extern fn b2WheelJoint_SetMotorSpeed(jointId: b2JointId, motorSpeed: f32) void;
pub extern fn b2WheelJoint_GetMotorSpeed(jointId: b2JointId) f32;
pub extern fn b2WheelJoint_GetMotorTorque(jointId: b2JointId) f32;
pub extern fn b2WheelJoint_SetMaxMotorTorque(jointId: b2JointId, torque: f32) void;
pub extern fn b2WheelJoint_GetMaxMotorTorque(jointId: b2JointId) f32;
pub extern fn b2WheelJoint_GetConstraintForce(jointId: b2JointId) b2Vec2;
pub extern fn b2WheelJoint_GetConstraintTorque(jointId: b2JointId) f32;
pub extern fn b2WeldJoint_SetLinearHertz(jointId: b2JointId, hertz: f32) void;
pub extern fn b2WeldJoint_GetLinearHertz(jointId: b2JointId) f32;
pub extern fn b2WeldJoint_SetLinearDampingRatio(jointId: b2JointId, dampingRatio: f32) void;
pub extern fn b2WeldJoint_GetLinearDampingRatio(jointId: b2JointId) f32;
pub extern fn b2WeldJoint_SetAngularHertz(jointId: b2JointId, hertz: f32) void;
pub extern fn b2WeldJoint_GetAngularHertz(jointId: b2JointId) f32;
pub extern fn b2WeldJoint_SetAngularDampingRatio(jointId: b2JointId, dampingRatio: f32) void;
pub extern fn b2WeldJoint_GetAngularDampingRatio(jointId: b2JointId) f32;
pub const b2_colorAliceBlue: c_int = 15792383;
pub const b2_colorAntiqueWhite: c_int = 16444375;
pub const b2_colorAntiqueWhite1: c_int = 16773083;
pub const b2_colorAntiqueWhite2: c_int = 15654860;
pub const b2_colorAntiqueWhite3: c_int = 13484208;
pub const b2_colorAntiqueWhite4: c_int = 9143160;
pub const b2_colorAqua: c_int = 65535;
pub const b2_colorAquamarine: c_int = 8388564;
pub const b2_colorAquamarine1: c_int = 8388564;
pub const b2_colorAquamarine2: c_int = 7794374;
pub const b2_colorAquamarine3: c_int = 6737322;
pub const b2_colorAquamarine4: c_int = 4557684;
pub const b2_colorAzure: c_int = 15794175;
pub const b2_colorAzure1: c_int = 15794175;
pub const b2_colorAzure2: c_int = 14741230;
pub const b2_colorAzure3: c_int = 12701133;
pub const b2_colorAzure4: c_int = 8620939;
pub const b2_colorBeige: c_int = 16119260;
pub const b2_colorBisque: c_int = 16770244;
pub const b2_colorBisque1: c_int = 16770244;
pub const b2_colorBisque2: c_int = 15652279;
pub const b2_colorBisque3: c_int = 13481886;
pub const b2_colorBisque4: c_int = 9141611;
pub const b2_colorBlack: c_int = 0;
pub const b2_colorBlanchedAlmond: c_int = 16772045;
pub const b2_colorBlue: c_int = 255;
pub const b2_colorBlue1: c_int = 255;
pub const b2_colorBlue2: c_int = 238;
pub const b2_colorBlue3: c_int = 205;
pub const b2_colorBlue4: c_int = 139;
pub const b2_colorBlueViolet: c_int = 9055202;
pub const b2_colorBrown: c_int = 10824234;
pub const b2_colorBrown1: c_int = 16728128;
pub const b2_colorBrown2: c_int = 15612731;
pub const b2_colorBrown3: c_int = 13447987;
pub const b2_colorBrown4: c_int = 9118499;
pub const b2_colorBurlywood: c_int = 14596231;
pub const b2_colorBurlywood1: c_int = 16765851;
pub const b2_colorBurlywood2: c_int = 15648145;
pub const b2_colorBurlywood3: c_int = 13478525;
pub const b2_colorBurlywood4: c_int = 9139029;
pub const b2_colorCadetBlue: c_int = 6266528;
pub const b2_colorCadetBlue1: c_int = 10024447;
pub const b2_colorCadetBlue2: c_int = 9364974;
pub const b2_colorCadetBlue3: c_int = 8046029;
pub const b2_colorCadetBlue4: c_int = 5473931;
pub const b2_colorChartreuse: c_int = 8388352;
pub const b2_colorChartreuse1: c_int = 8388352;
pub const b2_colorChartreuse2: c_int = 7794176;
pub const b2_colorChartreuse3: c_int = 6737152;
pub const b2_colorChartreuse4: c_int = 4557568;
pub const b2_colorChocolate: c_int = 13789470;
pub const b2_colorChocolate1: c_int = 16744228;
pub const b2_colorChocolate2: c_int = 15627809;
pub const b2_colorChocolate3: c_int = 13461021;
pub const b2_colorChocolate4: c_int = 9127187;
pub const b2_colorCoral: c_int = 16744272;
pub const b2_colorCoral1: c_int = 16740950;
pub const b2_colorCoral2: c_int = 15624784;
pub const b2_colorCoral3: c_int = 13458245;
pub const b2_colorCoral4: c_int = 9125423;
pub const b2_colorCornflowerBlue: c_int = 6591981;
pub const b2_colorCornsilk: c_int = 16775388;
pub const b2_colorCornsilk1: c_int = 16775388;
pub const b2_colorCornsilk2: c_int = 15657165;
pub const b2_colorCornsilk3: c_int = 13486257;
pub const b2_colorCornsilk4: c_int = 9144440;
pub const b2_colorCrimson: c_int = 14423100;
pub const b2_colorCyan: c_int = 65535;
pub const b2_colorCyan1: c_int = 65535;
pub const b2_colorCyan2: c_int = 61166;
pub const b2_colorCyan3: c_int = 52685;
pub const b2_colorCyan4: c_int = 35723;
pub const b2_colorDarkBlue: c_int = 139;
pub const b2_colorDarkCyan: c_int = 35723;
pub const b2_colorDarkGoldenrod: c_int = 12092939;
pub const b2_colorDarkGoldenrod1: c_int = 16759055;
pub const b2_colorDarkGoldenrod2: c_int = 15641870;
pub const b2_colorDarkGoldenrod3: c_int = 13473036;
pub const b2_colorDarkGoldenrod4: c_int = 9135368;
pub const b2_colorDarkGray: c_int = 11119017;
pub const b2_colorDarkGreen: c_int = 25600;
pub const b2_colorDarkKhaki: c_int = 12433259;
pub const b2_colorDarkMagenta: c_int = 9109643;
pub const b2_colorDarkOliveGreen: c_int = 5597999;
pub const b2_colorDarkOliveGreen1: c_int = 13303664;
pub const b2_colorDarkOliveGreen2: c_int = 12381800;
pub const b2_colorDarkOliveGreen3: c_int = 10669402;
pub const b2_colorDarkOliveGreen4: c_int = 7244605;
pub const b2_colorDarkOrange: c_int = 16747520;
pub const b2_colorDarkOrange1: c_int = 16744192;
pub const b2_colorDarkOrange2: c_int = 15627776;
pub const b2_colorDarkOrange3: c_int = 13460992;
pub const b2_colorDarkOrange4: c_int = 9127168;
pub const b2_colorDarkOrchid: c_int = 10040012;
pub const b2_colorDarkOrchid1: c_int = 12533503;
pub const b2_colorDarkOrchid2: c_int = 11680494;
pub const b2_colorDarkOrchid3: c_int = 10105549;
pub const b2_colorDarkOrchid4: c_int = 6824587;
pub const b2_colorDarkRed: c_int = 9109504;
pub const b2_colorDarkSalmon: c_int = 15308410;
pub const b2_colorDarkSeaGreen: c_int = 9419919;
pub const b2_colorDarkSeaGreen1: c_int = 12713921;
pub const b2_colorDarkSeaGreen2: c_int = 11857588;
pub const b2_colorDarkSeaGreen3: c_int = 10210715;
pub const b2_colorDarkSeaGreen4: c_int = 6916969;
pub const b2_colorDarkSlateBlue: c_int = 4734347;
pub const b2_colorDarkSlateGray: c_int = 3100495;
pub const b2_colorDarkSlateGray1: c_int = 9961471;
pub const b2_colorDarkSlateGray2: c_int = 9301742;
pub const b2_colorDarkSlateGray3: c_int = 7982541;
pub const b2_colorDarkSlateGray4: c_int = 5409675;
pub const b2_colorDarkTurquoise: c_int = 52945;
pub const b2_colorDarkViolet: c_int = 9699539;
pub const b2_colorDeepPink: c_int = 16716947;
pub const b2_colorDeepPink1: c_int = 16716947;
pub const b2_colorDeepPink2: c_int = 15602313;
pub const b2_colorDeepPink3: c_int = 13439094;
pub const b2_colorDeepPink4: c_int = 9112144;
pub const b2_colorDeepSkyBlue: c_int = 49151;
pub const b2_colorDeepSkyBlue1: c_int = 49151;
pub const b2_colorDeepSkyBlue2: c_int = 45806;
pub const b2_colorDeepSkyBlue3: c_int = 39629;
pub const b2_colorDeepSkyBlue4: c_int = 26763;
pub const b2_colorDimGray: c_int = 6908265;
pub const b2_colorDodgerBlue: c_int = 2003199;
pub const b2_colorDodgerBlue1: c_int = 2003199;
pub const b2_colorDodgerBlue2: c_int = 1869550;
pub const b2_colorDodgerBlue3: c_int = 1602765;
pub const b2_colorDodgerBlue4: c_int = 1068683;
pub const b2_colorFirebrick: c_int = 11674146;
pub const b2_colorFirebrick1: c_int = 16724016;
pub const b2_colorFirebrick2: c_int = 15608876;
pub const b2_colorFirebrick3: c_int = 13444646;
pub const b2_colorFirebrick4: c_int = 9116186;
pub const b2_colorFloralWhite: c_int = 16775920;
pub const b2_colorForestGreen: c_int = 2263842;
pub const b2_colorFuchsia: c_int = 16711935;
pub const b2_colorGainsboro: c_int = 14474460;
pub const b2_colorGhostWhite: c_int = 16316671;
pub const b2_colorGold: c_int = 16766720;
pub const b2_colorGold1: c_int = 16766720;
pub const b2_colorGold2: c_int = 15649024;
pub const b2_colorGold3: c_int = 13479168;
pub const b2_colorGold4: c_int = 9139456;
pub const b2_colorGoldenrod: c_int = 14329120;
pub const b2_colorGoldenrod1: c_int = 16761125;
pub const b2_colorGoldenrod2: c_int = 15643682;
pub const b2_colorGoldenrod3: c_int = 13474589;
pub const b2_colorGoldenrod4: c_int = 9136404;
pub const b2_colorGray: c_int = 12500670;
pub const b2_colorGray0: c_int = 0;
pub const b2_colorGray1: c_int = 197379;
pub const b2_colorGray10: c_int = 1710618;
pub const b2_colorGray100: c_int = 16777215;
pub const b2_colorGray11: c_int = 1842204;
pub const b2_colorGray12: c_int = 2039583;
pub const b2_colorGray13: c_int = 2171169;
pub const b2_colorGray14: c_int = 2368548;
pub const b2_colorGray15: c_int = 2500134;
pub const b2_colorGray16: c_int = 2697513;
pub const b2_colorGray17: c_int = 2829099;
pub const b2_colorGray18: c_int = 3026478;
pub const b2_colorGray19: c_int = 3158064;
pub const b2_colorGray2: c_int = 328965;
pub const b2_colorGray20: c_int = 3355443;
pub const b2_colorGray21: c_int = 3552822;
pub const b2_colorGray22: c_int = 3684408;
pub const b2_colorGray23: c_int = 3881787;
pub const b2_colorGray24: c_int = 4013373;
pub const b2_colorGray25: c_int = 4210752;
pub const b2_colorGray26: c_int = 4342338;
pub const b2_colorGray27: c_int = 4539717;
pub const b2_colorGray28: c_int = 4671303;
pub const b2_colorGray29: c_int = 4868682;
pub const b2_colorGray3: c_int = 526344;
pub const b2_colorGray30: c_int = 5066061;
pub const b2_colorGray31: c_int = 5197647;
pub const b2_colorGray32: c_int = 5395026;
pub const b2_colorGray33: c_int = 5526612;
pub const b2_colorGray34: c_int = 5723991;
pub const b2_colorGray35: c_int = 5855577;
pub const b2_colorGray36: c_int = 6052956;
pub const b2_colorGray37: c_int = 6184542;
pub const b2_colorGray38: c_int = 6381921;
pub const b2_colorGray39: c_int = 6513507;
pub const b2_colorGray4: c_int = 657930;
pub const b2_colorGray40: c_int = 6710886;
pub const b2_colorGray41: c_int = 6908265;
pub const b2_colorGray42: c_int = 7039851;
pub const b2_colorGray43: c_int = 7237230;
pub const b2_colorGray44: c_int = 7368816;
pub const b2_colorGray45: c_int = 7566195;
pub const b2_colorGray46: c_int = 7697781;
pub const b2_colorGray47: c_int = 7895160;
pub const b2_colorGray48: c_int = 8026746;
pub const b2_colorGray49: c_int = 8224125;
pub const b2_colorGray5: c_int = 855309;
pub const b2_colorGray50: c_int = 8355711;
pub const b2_colorGray51: c_int = 8553090;
pub const b2_colorGray52: c_int = 8750469;
pub const b2_colorGray53: c_int = 8882055;
pub const b2_colorGray54: c_int = 9079434;
pub const b2_colorGray55: c_int = 9211020;
pub const b2_colorGray56: c_int = 9408399;
pub const b2_colorGray57: c_int = 9539985;
pub const b2_colorGray58: c_int = 9737364;
pub const b2_colorGray59: c_int = 9868950;
pub const b2_colorGray6: c_int = 986895;
pub const b2_colorGray60: c_int = 10066329;
pub const b2_colorGray61: c_int = 10263708;
pub const b2_colorGray62: c_int = 10395294;
pub const b2_colorGray63: c_int = 10592673;
pub const b2_colorGray64: c_int = 10724259;
pub const b2_colorGray65: c_int = 10921638;
pub const b2_colorGray66: c_int = 11053224;
pub const b2_colorGray67: c_int = 11250603;
pub const b2_colorGray68: c_int = 11382189;
pub const b2_colorGray69: c_int = 11579568;
pub const b2_colorGray7: c_int = 1184274;
pub const b2_colorGray70: c_int = 11776947;
pub const b2_colorGray71: c_int = 11908533;
pub const b2_colorGray72: c_int = 12105912;
pub const b2_colorGray73: c_int = 12237498;
pub const b2_colorGray74: c_int = 12434877;
pub const b2_colorGray75: c_int = 12566463;
pub const b2_colorGray76: c_int = 12763842;
pub const b2_colorGray77: c_int = 12895428;
pub const b2_colorGray78: c_int = 13092807;
pub const b2_colorGray79: c_int = 13224393;
pub const b2_colorGray8: c_int = 1315860;
pub const b2_colorGray80: c_int = 13421772;
pub const b2_colorGray81: c_int = 13619151;
pub const b2_colorGray82: c_int = 13750737;
pub const b2_colorGray83: c_int = 13948116;
pub const b2_colorGray84: c_int = 14079702;
pub const b2_colorGray85: c_int = 14277081;
pub const b2_colorGray86: c_int = 14408667;
pub const b2_colorGray87: c_int = 14606046;
pub const b2_colorGray88: c_int = 14737632;
pub const b2_colorGray89: c_int = 14935011;
pub const b2_colorGray9: c_int = 1513239;
pub const b2_colorGray90: c_int = 15066597;
pub const b2_colorGray91: c_int = 15263976;
pub const b2_colorGray92: c_int = 15461355;
pub const b2_colorGray93: c_int = 15592941;
pub const b2_colorGray94: c_int = 15790320;
pub const b2_colorGray95: c_int = 15921906;
pub const b2_colorGray96: c_int = 16119285;
pub const b2_colorGray97: c_int = 16250871;
pub const b2_colorGray98: c_int = 16448250;
pub const b2_colorGray99: c_int = 16579836;
pub const b2_colorGreen: c_int = 65280;
pub const b2_colorGreen1: c_int = 65280;
pub const b2_colorGreen2: c_int = 60928;
pub const b2_colorGreen3: c_int = 52480;
pub const b2_colorGreen4: c_int = 35584;
pub const b2_colorGreenYellow: c_int = 11403055;
pub const b2_colorHoneydew: c_int = 15794160;
pub const b2_colorHoneydew1: c_int = 15794160;
pub const b2_colorHoneydew2: c_int = 14741216;
pub const b2_colorHoneydew3: c_int = 12701121;
pub const b2_colorHoneydew4: c_int = 8620931;
pub const b2_colorHotPink: c_int = 16738740;
pub const b2_colorHotPink1: c_int = 16740020;
pub const b2_colorHotPink2: c_int = 15624871;
pub const b2_colorHotPink3: c_int = 13459600;
pub const b2_colorHotPink4: c_int = 9124450;
pub const b2_colorIndianRed: c_int = 13458524;
pub const b2_colorIndianRed1: c_int = 16738922;
pub const b2_colorIndianRed2: c_int = 15623011;
pub const b2_colorIndianRed3: c_int = 13456725;
pub const b2_colorIndianRed4: c_int = 9124410;
pub const b2_colorIndigo: c_int = 4915330;
pub const b2_colorIvory: c_int = 16777200;
pub const b2_colorIvory1: c_int = 16777200;
pub const b2_colorIvory2: c_int = 15658720;
pub const b2_colorIvory3: c_int = 13487553;
pub const b2_colorIvory4: c_int = 9145219;
pub const b2_colorKhaki: c_int = 15787660;
pub const b2_colorKhaki1: c_int = 16774799;
pub const b2_colorKhaki2: c_int = 15656581;
pub const b2_colorKhaki3: c_int = 13485683;
pub const b2_colorKhaki4: c_int = 9143886;
pub const b2_colorLavender: c_int = 15132410;
pub const b2_colorLavenderBlush: c_int = 16773365;
pub const b2_colorLavenderBlush1: c_int = 16773365;
pub const b2_colorLavenderBlush2: c_int = 15655141;
pub const b2_colorLavenderBlush3: c_int = 13484485;
pub const b2_colorLavenderBlush4: c_int = 9143174;
pub const b2_colorLawnGreen: c_int = 8190976;
pub const b2_colorLemonChiffon: c_int = 16775885;
pub const b2_colorLemonChiffon1: c_int = 16775885;
pub const b2_colorLemonChiffon2: c_int = 15657407;
pub const b2_colorLemonChiffon3: c_int = 13486501;
pub const b2_colorLemonChiffon4: c_int = 9144688;
pub const b2_colorLightBlue: c_int = 11393254;
pub const b2_colorLightBlue1: c_int = 12578815;
pub const b2_colorLightBlue2: c_int = 11722734;
pub const b2_colorLightBlue3: c_int = 10141901;
pub const b2_colorLightBlue4: c_int = 6849419;
pub const b2_colorLightCoral: c_int = 15761536;
pub const b2_colorLightCyan: c_int = 14745599;
pub const b2_colorLightCyan1: c_int = 14745599;
pub const b2_colorLightCyan2: c_int = 13758190;
pub const b2_colorLightCyan3: c_int = 11849165;
pub const b2_colorLightCyan4: c_int = 8031115;
pub const b2_colorLightGoldenrod: c_int = 15654274;
pub const b2_colorLightGoldenrod1: c_int = 16772235;
pub const b2_colorLightGoldenrod2: c_int = 15654018;
pub const b2_colorLightGoldenrod3: c_int = 13483632;
pub const b2_colorLightGoldenrod4: c_int = 9142604;
pub const b2_colorLightGoldenrodYellow: c_int = 16448210;
pub const b2_colorLightGray: c_int = 13882323;
pub const b2_colorLightGreen: c_int = 9498256;
pub const b2_colorLightPink: c_int = 16758465;
pub const b2_colorLightPink1: c_int = 16756409;
pub const b2_colorLightPink2: c_int = 15639213;
pub const b2_colorLightPink3: c_int = 13470869;
pub const b2_colorLightPink4: c_int = 9133925;
pub const b2_colorLightSalmon: c_int = 16752762;
pub const b2_colorLightSalmon1: c_int = 16752762;
pub const b2_colorLightSalmon2: c_int = 15635826;
pub const b2_colorLightSalmon3: c_int = 13468002;
pub const b2_colorLightSalmon4: c_int = 9131842;
pub const b2_colorLightSeaGreen: c_int = 2142890;
pub const b2_colorLightSkyBlue: c_int = 8900346;
pub const b2_colorLightSkyBlue1: c_int = 11592447;
pub const b2_colorLightSkyBlue2: c_int = 10802158;
pub const b2_colorLightSkyBlue3: c_int = 9287373;
pub const b2_colorLightSkyBlue4: c_int = 6323083;
pub const b2_colorLightSlateBlue: c_int = 8679679;
pub const b2_colorLightSlateGray: c_int = 7833753;
pub const b2_colorLightSteelBlue: c_int = 11584734;
pub const b2_colorLightSteelBlue1: c_int = 13296127;
pub const b2_colorLightSteelBlue2: c_int = 12374766;
pub const b2_colorLightSteelBlue3: c_int = 10663373;
pub const b2_colorLightSteelBlue4: c_int = 7240587;
pub const b2_colorLightYellow: c_int = 16777184;
pub const b2_colorLightYellow1: c_int = 16777184;
pub const b2_colorLightYellow2: c_int = 15658705;
pub const b2_colorLightYellow3: c_int = 13487540;
pub const b2_colorLightYellow4: c_int = 9145210;
pub const b2_colorLime: c_int = 65280;
pub const b2_colorLimeGreen: c_int = 3329330;
pub const b2_colorLinen: c_int = 16445670;
pub const b2_colorMagenta: c_int = 16711935;
pub const b2_colorMagenta1: c_int = 16711935;
pub const b2_colorMagenta2: c_int = 15597806;
pub const b2_colorMagenta3: c_int = 13435085;
pub const b2_colorMagenta4: c_int = 9109643;
pub const b2_colorMaroon: c_int = 11546720;
pub const b2_colorMaroon1: c_int = 16725171;
pub const b2_colorMaroon2: c_int = 15610023;
pub const b2_colorMaroon3: c_int = 13445520;
pub const b2_colorMaroon4: c_int = 9116770;
pub const b2_colorMediumAquamarine: c_int = 6737322;
pub const b2_colorMediumBlue: c_int = 205;
pub const b2_colorMediumOrchid: c_int = 12211667;
pub const b2_colorMediumOrchid1: c_int = 14706431;
pub const b2_colorMediumOrchid2: c_int = 13721582;
pub const b2_colorMediumOrchid3: c_int = 11817677;
pub const b2_colorMediumOrchid4: c_int = 8009611;
pub const b2_colorMediumPurple: c_int = 9662683;
pub const b2_colorMediumPurple1: c_int = 11240191;
pub const b2_colorMediumPurple2: c_int = 10451438;
pub const b2_colorMediumPurple3: c_int = 9005261;
pub const b2_colorMediumPurple4: c_int = 6113163;
pub const b2_colorMediumSeaGreen: c_int = 3978097;
pub const b2_colorMediumSlateBlue: c_int = 8087790;
pub const b2_colorMediumSpringGreen: c_int = 64154;
pub const b2_colorMediumTurquoise: c_int = 4772300;
pub const b2_colorMediumVioletRed: c_int = 13047173;
pub const b2_colorMidnightBlue: c_int = 1644912;
pub const b2_colorMintCream: c_int = 16121850;
pub const b2_colorMistyRose: c_int = 16770273;
pub const b2_colorMistyRose1: c_int = 16770273;
pub const b2_colorMistyRose2: c_int = 15652306;
pub const b2_colorMistyRose3: c_int = 13481909;
pub const b2_colorMistyRose4: c_int = 9141627;
pub const b2_colorMoccasin: c_int = 16770229;
pub const b2_colorNavajoWhite: c_int = 16768685;
pub const b2_colorNavajoWhite1: c_int = 16768685;
pub const b2_colorNavajoWhite2: c_int = 15650721;
pub const b2_colorNavajoWhite3: c_int = 13480843;
pub const b2_colorNavajoWhite4: c_int = 9140574;
pub const b2_colorNavy: c_int = 128;
pub const b2_colorNavyBlue: c_int = 128;
pub const b2_colorOldLace: c_int = 16643558;
pub const b2_colorOlive: c_int = 8421376;
pub const b2_colorOliveDrab: c_int = 7048739;
pub const b2_colorOliveDrab1: c_int = 12648254;
pub const b2_colorOliveDrab2: c_int = 11791930;
pub const b2_colorOliveDrab3: c_int = 10145074;
pub const b2_colorOliveDrab4: c_int = 6916898;
pub const b2_colorOrange: c_int = 16753920;
pub const b2_colorOrange1: c_int = 16753920;
pub const b2_colorOrange2: c_int = 15636992;
pub const b2_colorOrange3: c_int = 13468928;
pub const b2_colorOrange4: c_int = 9132544;
pub const b2_colorOrangeRed: c_int = 16729344;
pub const b2_colorOrangeRed1: c_int = 16729344;
pub const b2_colorOrangeRed2: c_int = 15613952;
pub const b2_colorOrangeRed3: c_int = 13448960;
pub const b2_colorOrangeRed4: c_int = 9118976;
pub const b2_colorOrchid: c_int = 14315734;
pub const b2_colorOrchid1: c_int = 16745466;
pub const b2_colorOrchid2: c_int = 15629033;
pub const b2_colorOrchid3: c_int = 13461961;
pub const b2_colorOrchid4: c_int = 9127817;
pub const b2_colorPaleGoldenrod: c_int = 15657130;
pub const b2_colorPaleGreen: c_int = 10025880;
pub const b2_colorPaleGreen1: c_int = 10157978;
pub const b2_colorPaleGreen2: c_int = 9498256;
pub const b2_colorPaleGreen3: c_int = 8179068;
pub const b2_colorPaleGreen4: c_int = 5540692;
pub const b2_colorPaleTurquoise: c_int = 11529966;
pub const b2_colorPaleTurquoise1: c_int = 12320767;
pub const b2_colorPaleTurquoise2: c_int = 11464430;
pub const b2_colorPaleTurquoise3: c_int = 9883085;
pub const b2_colorPaleTurquoise4: c_int = 6720395;
pub const b2_colorPaleVioletRed: c_int = 14381203;
pub const b2_colorPaleVioletRed1: c_int = 16745131;
pub const b2_colorPaleVioletRed2: c_int = 15628703;
pub const b2_colorPaleVioletRed3: c_int = 13461641;
pub const b2_colorPaleVioletRed4: c_int = 9127773;
pub const b2_colorPapayaWhip: c_int = 16773077;
pub const b2_colorPeachPuff: c_int = 16767673;
pub const b2_colorPeachPuff1: c_int = 16767673;
pub const b2_colorPeachPuff2: c_int = 15649709;
pub const b2_colorPeachPuff3: c_int = 13479829;
pub const b2_colorPeachPuff4: c_int = 9140069;
pub const b2_colorPeru: c_int = 13468991;
pub const b2_colorPink: c_int = 16761035;
pub const b2_colorPink1: c_int = 16758213;
pub const b2_colorPink2: c_int = 15641016;
pub const b2_colorPink3: c_int = 13472158;
pub const b2_colorPink4: c_int = 9134956;
pub const b2_colorPlum: c_int = 14524637;
pub const b2_colorPlum1: c_int = 16759807;
pub const b2_colorPlum2: c_int = 15642350;
pub const b2_colorPlum3: c_int = 13473485;
pub const b2_colorPlum4: c_int = 9135755;
pub const b2_colorPowderBlue: c_int = 11591910;
pub const b2_colorPurple: c_int = 10494192;
pub const b2_colorPurple1: c_int = 10170623;
pub const b2_colorPurple2: c_int = 9514222;
pub const b2_colorPurple3: c_int = 8201933;
pub const b2_colorPurple4: c_int = 5577355;
pub const b2_colorRebeccaPurple: c_int = 6697881;
pub const b2_colorRed: c_int = 16711680;
pub const b2_colorRed1: c_int = 16711680;
pub const b2_colorRed2: c_int = 15597568;
pub const b2_colorRed3: c_int = 13434880;
pub const b2_colorRed4: c_int = 9109504;
pub const b2_colorRosyBrown: c_int = 12357519;
pub const b2_colorRosyBrown1: c_int = 16761281;
pub const b2_colorRosyBrown2: c_int = 15643828;
pub const b2_colorRosyBrown3: c_int = 13474715;
pub const b2_colorRosyBrown4: c_int = 9136489;
pub const b2_colorRoyalBlue: c_int = 4286945;
pub const b2_colorRoyalBlue1: c_int = 4749055;
pub const b2_colorRoyalBlue2: c_int = 4419310;
pub const b2_colorRoyalBlue3: c_int = 3825613;
pub const b2_colorRoyalBlue4: c_int = 2572427;
pub const b2_colorSaddleBrown: c_int = 9127187;
pub const b2_colorSalmon: c_int = 16416882;
pub const b2_colorSalmon1: c_int = 16747625;
pub const b2_colorSalmon2: c_int = 15630946;
pub const b2_colorSalmon3: c_int = 13463636;
pub const b2_colorSalmon4: c_int = 9129017;
pub const b2_colorSandyBrown: c_int = 16032864;
pub const b2_colorSeaGreen: c_int = 3050327;
pub const b2_colorSeaGreen1: c_int = 5570463;
pub const b2_colorSeaGreen2: c_int = 5172884;
pub const b2_colorSeaGreen3: c_int = 4443520;
pub const b2_colorSeaGreen4: c_int = 3050327;
pub const b2_colorSeashell: c_int = 16774638;
pub const b2_colorSeashell1: c_int = 16774638;
pub const b2_colorSeashell2: c_int = 15656414;
pub const b2_colorSeashell3: c_int = 13485503;
pub const b2_colorSeashell4: c_int = 9143938;
pub const b2_colorSienna: c_int = 10506797;
pub const b2_colorSienna1: c_int = 16745031;
pub const b2_colorSienna2: c_int = 15628610;
pub const b2_colorSienna3: c_int = 13461561;
pub const b2_colorSienna4: c_int = 9127718;
pub const b2_colorSilver: c_int = 12632256;
pub const b2_colorSkyBlue: c_int = 8900331;
pub const b2_colorSkyBlue1: c_int = 8900351;
pub const b2_colorSkyBlue2: c_int = 8306926;
pub const b2_colorSkyBlue3: c_int = 7120589;
pub const b2_colorSkyBlue4: c_int = 4878475;
pub const b2_colorSlateBlue: c_int = 6970061;
pub const b2_colorSlateBlue1: c_int = 8613887;
pub const b2_colorSlateBlue2: c_int = 8021998;
pub const b2_colorSlateBlue3: c_int = 6904269;
pub const b2_colorSlateBlue4: c_int = 4668555;
pub const b2_colorSlateGray: c_int = 7372944;
pub const b2_colorSlateGray1: c_int = 13034239;
pub const b2_colorSlateGray2: c_int = 12178414;
pub const b2_colorSlateGray3: c_int = 10467021;
pub const b2_colorSlateGray4: c_int = 7109515;
pub const b2_colorSnow: c_int = 16775930;
pub const b2_colorSnow1: c_int = 16775930;
pub const b2_colorSnow2: c_int = 15657449;
pub const b2_colorSnow3: c_int = 13486537;
pub const b2_colorSnow4: c_int = 9144713;
pub const b2_colorSpringGreen: c_int = 65407;
pub const b2_colorSpringGreen1: c_int = 65407;
pub const b2_colorSpringGreen2: c_int = 61046;
pub const b2_colorSpringGreen3: c_int = 52582;
pub const b2_colorSpringGreen4: c_int = 35653;
pub const b2_colorSteelBlue: c_int = 4620980;
pub const b2_colorSteelBlue1: c_int = 6535423;
pub const b2_colorSteelBlue2: c_int = 6073582;
pub const b2_colorSteelBlue3: c_int = 5215437;
pub const b2_colorSteelBlue4: c_int = 3564683;
pub const b2_colorTan: c_int = 13808780;
pub const b2_colorTan1: c_int = 16753999;
pub const b2_colorTan2: c_int = 15637065;
pub const b2_colorTan3: c_int = 13468991;
pub const b2_colorTan4: c_int = 9132587;
pub const b2_colorTeal: c_int = 32896;
pub const b2_colorThistle: c_int = 14204888;
pub const b2_colorThistle1: c_int = 16769535;
pub const b2_colorThistle2: c_int = 15651566;
pub const b2_colorThistle3: c_int = 13481421;
pub const b2_colorThistle4: c_int = 9141131;
pub const b2_colorTomato: c_int = 16737095;
pub const b2_colorTomato1: c_int = 16737095;
pub const b2_colorTomato2: c_int = 15621186;
pub const b2_colorTomato3: c_int = 13455161;
pub const b2_colorTomato4: c_int = 9123366;
pub const b2_colorTurquoise: c_int = 4251856;
pub const b2_colorTurquoise1: c_int = 62975;
pub const b2_colorTurquoise2: c_int = 58862;
pub const b2_colorTurquoise3: c_int = 50637;
pub const b2_colorTurquoise4: c_int = 34443;
pub const b2_colorViolet: c_int = 15631086;
pub const b2_colorVioletRed: c_int = 13639824;
pub const b2_colorVioletRed1: c_int = 16727702;
pub const b2_colorVioletRed2: c_int = 15612556;
pub const b2_colorVioletRed3: c_int = 13447800;
pub const b2_colorVioletRed4: c_int = 9118290;
pub const b2_colorWebGray: c_int = 8421504;
pub const b2_colorWebGreen: c_int = 32768;
pub const b2_colorWebMaroon: c_int = 8388608;
pub const b2_colorWebPurple: c_int = 8388736;
pub const b2_colorWheat: c_int = 16113331;
pub const b2_colorWheat1: c_int = 16771002;
pub const b2_colorWheat2: c_int = 15653038;
pub const b2_colorWheat3: c_int = 13482646;
pub const b2_colorWheat4: c_int = 9141862;
pub const b2_colorWhite: c_int = 16777215;
pub const b2_colorWhiteSmoke: c_int = 16119285;
pub const b2_colorX11Gray: c_int = 12500670;
pub const b2_colorX11Green: c_int = 65280;
pub const b2_colorX11Maroon: c_int = 11546720;
pub const b2_colorX11Purple: c_int = 10494192;
pub const b2_colorYellow: c_int = 16776960;
pub const b2_colorYellow1: c_int = 16776960;
pub const b2_colorYellow2: c_int = 15658496;
pub const b2_colorYellow3: c_int = 13487360;
pub const b2_colorYellow4: c_int = 9145088;
pub const b2_colorYellowGreen: c_int = 10145074;
pub const enum_b2HexColor = c_uint;
pub const b2HexColor = enum_b2HexColor;
pub fn b2MakeColor(arg_hexCode: enum_b2HexColor) callconv(.C) b2Color {
    var hexCode = arg_hexCode;
    _ = &hexCode;
    var color: b2Color = undefined;
    _ = &color;
    color.r = @as(f32, @floatFromInt((hexCode >> @intCast(16)) & @as(c_uint, @bitCast(@as(c_int, 255))))) / 255.0;
    color.g = @as(f32, @floatFromInt((hexCode >> @intCast(8)) & @as(c_uint, @bitCast(@as(c_int, 255))))) / 255.0;
    color.b = @as(f32, @floatFromInt(hexCode & @as(c_uint, @bitCast(@as(c_int, 255))))) / 255.0;
    color.a = 1.0;
    return color;
}
pub fn b2MakeColorAlpha(arg_hexCode: enum_b2HexColor, arg_alpha: f32) callconv(.C) b2Color {
    var hexCode = arg_hexCode;
    _ = &hexCode;
    var alpha = arg_alpha;
    _ = &alpha;
    var color: b2Color = undefined;
    _ = &color;
    color.r = @as(f32, @floatFromInt((hexCode >> @intCast(16)) & @as(c_uint, @bitCast(@as(c_int, 255))))) / 255.0;
    color.g = @as(f32, @floatFromInt((hexCode >> @intCast(8)) & @as(c_uint, @bitCast(@as(c_int, 255))))) / 255.0;
    color.b = @as(f32, @floatFromInt(hexCode & @as(c_uint, @bitCast(@as(c_int, 255))))) / 255.0;
    color.a = alpha;
    return color;
}
pub const struct_b2SegmentDistanceResult = extern struct {
    closest1: b2Vec2 = @import("std").mem.zeroes(b2Vec2),
    closest2: b2Vec2 = @import("std").mem.zeroes(b2Vec2),
    fraction1: f32 = @import("std").mem.zeroes(f32),
    fraction2: f32 = @import("std").mem.zeroes(f32),
    distanceSquared: f32 = @import("std").mem.zeroes(f32),
};
pub const b2SegmentDistanceResult = struct_b2SegmentDistanceResult;
pub extern fn b2SegmentDistance(p1: b2Vec2, q1: b2Vec2, p2: b2Vec2, q2: b2Vec2) b2SegmentDistanceResult;
pub const struct_b2DistanceProxy = extern struct {
    vertices: [8]b2Vec2 = @import("std").mem.zeroes([8]b2Vec2),
    count: i32 = @import("std").mem.zeroes(i32),
    radius: f32 = @import("std").mem.zeroes(f32),
};
pub const b2DistanceProxy = struct_b2DistanceProxy;
pub const b2_emptyDistanceCache: b2DistanceCache = b2DistanceCache{
    .metric = @as(f32, @floatFromInt(@as(c_int, 0))),
    .count = @import("std").mem.zeroes(u16),
    .indexA = @import("std").mem.zeroes([3]u8),
    .indexB = @import("std").mem.zeroes([3]u8),
};
pub const struct_b2DistanceInput = extern struct {
    proxyA: b2DistanceProxy = @import("std").mem.zeroes(b2DistanceProxy),
    proxyB: b2DistanceProxy = @import("std").mem.zeroes(b2DistanceProxy),
    transformA: b2Transform = @import("std").mem.zeroes(b2Transform),
    transformB: b2Transform = @import("std").mem.zeroes(b2Transform),
    useRadii: bool = @import("std").mem.zeroes(bool),
};
pub const b2DistanceInput = struct_b2DistanceInput;
pub const struct_b2DistanceOutput = extern struct {
    pointA: b2Vec2 = @import("std").mem.zeroes(b2Vec2),
    pointB: b2Vec2 = @import("std").mem.zeroes(b2Vec2),
    distance: f32 = @import("std").mem.zeroes(f32),
    iterations: i32 = @import("std").mem.zeroes(i32),
};
pub const b2DistanceOutput = struct_b2DistanceOutput;
pub extern fn b2ShapeDistance(cache: [*c]b2DistanceCache, input: [*c]const b2DistanceInput) b2DistanceOutput;
pub const struct_b2ShapeCastPairInput = extern struct {
    proxyA: b2DistanceProxy = @import("std").mem.zeroes(b2DistanceProxy),
    proxyB: b2DistanceProxy = @import("std").mem.zeroes(b2DistanceProxy),
    transformA: b2Transform = @import("std").mem.zeroes(b2Transform),
    transformB: b2Transform = @import("std").mem.zeroes(b2Transform),
    translationB: b2Vec2 = @import("std").mem.zeroes(b2Vec2),
    maxFraction: f32 = @import("std").mem.zeroes(f32),
};
pub const b2ShapeCastPairInput = struct_b2ShapeCastPairInput;
pub extern fn b2ShapeCast(input: [*c]const b2ShapeCastPairInput) b2CastOutput;
pub extern fn b2MakeProxy(vertices: [*c]const b2Vec2, count: i32, radius: f32) b2DistanceProxy;
pub const struct_b2Sweep = extern struct {
    localCenter: b2Vec2 = @import("std").mem.zeroes(b2Vec2),
    c1: b2Vec2 = @import("std").mem.zeroes(b2Vec2),
    c2: b2Vec2 = @import("std").mem.zeroes(b2Vec2),
    q1: b2Rot = @import("std").mem.zeroes(b2Rot),
    q2: b2Rot = @import("std").mem.zeroes(b2Rot),
};
pub const b2Sweep = struct_b2Sweep;
pub extern fn b2GetSweepTransform(sweep: [*c]const b2Sweep, time: f32) b2Transform;
pub const struct_b2TOIInput = extern struct {
    proxyA: b2DistanceProxy = @import("std").mem.zeroes(b2DistanceProxy),
    proxyB: b2DistanceProxy = @import("std").mem.zeroes(b2DistanceProxy),
    sweepA: b2Sweep = @import("std").mem.zeroes(b2Sweep),
    sweepB: b2Sweep = @import("std").mem.zeroes(b2Sweep),
    tMax: f32 = @import("std").mem.zeroes(f32),
};
pub const b2TOIInput = struct_b2TOIInput;
pub const b2_toiStateUnknown: c_int = 0;
pub const b2_toiStateFailed: c_int = 1;
pub const b2_toiStateOverlapped: c_int = 2;
pub const b2_toiStateHit: c_int = 3;
pub const b2_toiStateSeparated: c_int = 4;
pub const enum_b2TOIState = c_uint;
pub const b2TOIState = enum_b2TOIState;
pub const struct_b2TOIOutput = extern struct {
    state: b2TOIState = @import("std").mem.zeroes(b2TOIState),
    t: f32 = @import("std").mem.zeroes(f32),
};
pub const b2TOIOutput = struct_b2TOIOutput;
pub extern fn b2TimeOfImpact(input: [*c]const b2TOIInput) b2TOIOutput;
const union_unnamed_1 = extern union {
    parent: i32,
    next: i32,
};
pub const struct_b2TreeNode = extern struct {
    aabb: b2AABB = @import("std").mem.zeroes(b2AABB),
    categoryBits: u32 = @import("std").mem.zeroes(u32),
    unnamed_0: union_unnamed_1 = @import("std").mem.zeroes(union_unnamed_1),
    child1: i32 = @import("std").mem.zeroes(i32),
    child2: i32 = @import("std").mem.zeroes(i32),
    userData: i32 = @import("std").mem.zeroes(i32),
    height: i16 = @import("std").mem.zeroes(i16),
    enlarged: bool = @import("std").mem.zeroes(bool),
    pad: [9]u8 = @import("std").mem.zeroes([9]u8),
};
pub const b2TreeNode = struct_b2TreeNode;
pub const struct_b2DynamicTree = extern struct {
    nodes: [*c]b2TreeNode = @import("std").mem.zeroes([*c]b2TreeNode),
    root: i32 = @import("std").mem.zeroes(i32),
    nodeCount: i32 = @import("std").mem.zeroes(i32),
    nodeCapacity: i32 = @import("std").mem.zeroes(i32),
    freeList: i32 = @import("std").mem.zeroes(i32),
    proxyCount: i32 = @import("std").mem.zeroes(i32),
    leafIndices: [*c]i32 = @import("std").mem.zeroes([*c]i32),
    leafBoxes: [*c]b2AABB = @import("std").mem.zeroes([*c]b2AABB),
    leafCenters: [*c]b2Vec2 = @import("std").mem.zeroes([*c]b2Vec2),
    binIndices: [*c]i32 = @import("std").mem.zeroes([*c]i32),
    rebuildCapacity: i32 = @import("std").mem.zeroes(i32),
};
pub const b2DynamicTree = struct_b2DynamicTree;
pub extern fn b2DynamicTree_Create() b2DynamicTree;
pub extern fn b2DynamicTree_Destroy(tree: [*c]b2DynamicTree) void;
pub extern fn b2DynamicTree_CreateProxy(tree: [*c]b2DynamicTree, aabb: b2AABB, categoryBits: u32, userData: i32) i32;
pub extern fn b2DynamicTree_DestroyProxy(tree: [*c]b2DynamicTree, proxyId: i32) void;
pub extern fn b2DynamicTree_Clone(outTree: [*c]b2DynamicTree, inTree: [*c]const b2DynamicTree) void;
pub extern fn b2DynamicTree_MoveProxy(tree: [*c]b2DynamicTree, proxyId: i32, aabb: b2AABB) void;
pub extern fn b2DynamicTree_EnlargeProxy(tree: [*c]b2DynamicTree, proxyId: i32, aabb: b2AABB) void;
pub const b2TreeQueryCallbackFcn = fn (i32, i32, ?*anyopaque) callconv(.C) bool;
pub extern fn b2DynamicTree_QueryFiltered(tree: [*c]const b2DynamicTree, aabb: b2AABB, maskBits: u32, callback: ?*const b2TreeQueryCallbackFcn, context: ?*anyopaque) void;
pub extern fn b2DynamicTree_Query(tree: [*c]const b2DynamicTree, aabb: b2AABB, callback: ?*const b2TreeQueryCallbackFcn, context: ?*anyopaque) void;
pub const b2TreeRayCastCallbackFcn = fn ([*c]const b2RayCastInput, i32, i32, ?*anyopaque) callconv(.C) f32;
pub extern fn b2DynamicTree_RayCast(tree: [*c]const b2DynamicTree, input: [*c]const b2RayCastInput, maskBits: u32, callback: ?*const b2TreeRayCastCallbackFcn, context: ?*anyopaque) void;
pub const b2TreeShapeCastCallbackFcn = fn ([*c]const b2ShapeCastInput, i32, i32, ?*anyopaque) callconv(.C) f32;
pub extern fn b2DynamicTree_ShapeCast(tree: [*c]const b2DynamicTree, input: [*c]const b2ShapeCastInput, maskBits: u32, callback: ?*const b2TreeShapeCastCallbackFcn, context: ?*anyopaque) void;
pub extern fn b2DynamicTree_Validate(tree: [*c]const b2DynamicTree) void;
pub extern fn b2DynamicTree_GetHeight(tree: [*c]const b2DynamicTree) i32;
pub extern fn b2DynamicTree_GetMaxBalance(tree: [*c]const b2DynamicTree) i32;
pub extern fn b2DynamicTree_GetAreaRatio(tree: [*c]const b2DynamicTree) f32;
pub extern fn b2DynamicTree_RebuildBottomUp(tree: [*c]b2DynamicTree) void;
pub extern fn b2DynamicTree_GetProxyCount(tree: [*c]const b2DynamicTree) i32;
pub extern fn b2DynamicTree_Rebuild(tree: [*c]b2DynamicTree, fullBuild: bool) i32;
pub extern fn b2DynamicTree_ShiftOrigin(tree: [*c]b2DynamicTree, newOrigin: b2Vec2) void;
pub fn b2DynamicTree_GetUserData(arg_tree: [*c]const b2DynamicTree, arg_proxyId: i32) callconv(.C) i32 {
    var tree = arg_tree;
    _ = &tree;
    var proxyId = arg_proxyId;
    _ = &proxyId;
    return (blk: {
        const tmp = proxyId;
        if (tmp >= 0) break :blk tree.*.nodes + @as(usize, @intCast(tmp)) else break :blk tree.*.nodes - ~@as(usize, @bitCast(@as(isize, @intCast(tmp)) +% -1));
    }).*.userData;
}
pub fn b2DynamicTree_GetAABB(arg_tree: [*c]const b2DynamicTree, arg_proxyId: i32) callconv(.C) b2AABB {
    var tree = arg_tree;
    _ = &tree;
    var proxyId = arg_proxyId;
    _ = &proxyId;
    return (blk: {
        const tmp = proxyId;
        if (tmp >= 0) break :blk tree.*.nodes + @as(usize, @intCast(tmp)) else break :blk tree.*.nodes - ~@as(usize, @bitCast(@as(isize, @intCast(tmp)) +% -1));
    }).*.aabb;
}
pub extern fn b2ComputeHull(points: [*c]const b2Vec2, count: i32) b2Hull;
pub extern fn b2ValidateHull(hull: [*c]const b2Hull) bool;
pub const _Float32 = f32;
pub const _Float64 = f64;
pub const _Float32x = f64;
pub const _Float64x = c_longdouble;
pub const float_t = f32;
pub const double_t = f64;
pub extern fn __fpclassify(__value: f64) c_int;
pub extern fn __signbit(__value: f64) c_int;
pub extern fn __isinf(__value: f64) c_int;
pub extern fn __finite(__value: f64) c_int;
pub extern fn __isnan(__value: f64) c_int;
pub extern fn __iseqsig(__x: f64, __y: f64) c_int;
pub extern fn __issignaling(__value: f64) c_int;
pub extern fn acos(__x: f64) f64;
pub extern fn __acos(__x: f64) f64;
pub extern fn asin(__x: f64) f64;
pub extern fn __asin(__x: f64) f64;
pub extern fn atan(__x: f64) f64;
pub extern fn __atan(__x: f64) f64;
pub extern fn atan2(__y: f64, __x: f64) f64;
pub extern fn __atan2(__y: f64, __x: f64) f64;
pub extern fn cos(__x: f64) f64;
pub extern fn __cos(__x: f64) f64;
pub extern fn sin(__x: f64) f64;
pub extern fn __sin(__x: f64) f64;
pub extern fn tan(__x: f64) f64;
pub extern fn __tan(__x: f64) f64;
pub extern fn cosh(__x: f64) f64;
pub extern fn __cosh(__x: f64) f64;
pub extern fn sinh(__x: f64) f64;
pub extern fn __sinh(__x: f64) f64;
pub extern fn tanh(__x: f64) f64;
pub extern fn __tanh(__x: f64) f64;
pub extern fn acosh(__x: f64) f64;
pub extern fn __acosh(__x: f64) f64;
pub extern fn asinh(__x: f64) f64;
pub extern fn __asinh(__x: f64) f64;
pub extern fn atanh(__x: f64) f64;
pub extern fn __atanh(__x: f64) f64;
pub extern fn exp(__x: f64) f64;
pub extern fn __exp(__x: f64) f64;
pub extern fn frexp(__x: f64, __exponent: [*c]c_int) f64;
pub extern fn __frexp(__x: f64, __exponent: [*c]c_int) f64;
pub extern fn ldexp(__x: f64, __exponent: c_int) f64;
pub extern fn __ldexp(__x: f64, __exponent: c_int) f64;
pub extern fn log(__x: f64) f64;
pub extern fn __log(__x: f64) f64;
pub extern fn log10(__x: f64) f64;
pub extern fn __log10(__x: f64) f64;
pub extern fn modf(__x: f64, __iptr: [*c]f64) f64;
pub extern fn __modf(__x: f64, __iptr: [*c]f64) f64;
pub extern fn expm1(__x: f64) f64;
pub extern fn __expm1(__x: f64) f64;
pub extern fn log1p(__x: f64) f64;
pub extern fn __log1p(__x: f64) f64;
pub extern fn logb(__x: f64) f64;
pub extern fn __logb(__x: f64) f64;
pub extern fn exp2(__x: f64) f64;
pub extern fn __exp2(__x: f64) f64;
pub extern fn log2(__x: f64) f64;
pub extern fn __log2(__x: f64) f64;
pub extern fn pow(__x: f64, __y: f64) f64;
pub extern fn __pow(__x: f64, __y: f64) f64;
pub extern fn sqrt(__x: f64) f64;
pub extern fn __sqrt(__x: f64) f64;
pub extern fn hypot(__x: f64, __y: f64) f64;
pub extern fn __hypot(__x: f64, __y: f64) f64;
pub extern fn cbrt(__x: f64) f64;
pub extern fn __cbrt(__x: f64) f64;
pub extern fn ceil(__x: f64) f64;
pub extern fn __ceil(__x: f64) f64;
pub extern fn fabs(__x: f64) f64;
pub extern fn __fabs(__x: f64) f64;
pub extern fn floor(__x: f64) f64;
pub extern fn __floor(__x: f64) f64;
pub extern fn fmod(__x: f64, __y: f64) f64;
pub extern fn __fmod(__x: f64, __y: f64) f64;
pub extern fn isinf(__value: f64) c_int;
pub extern fn finite(__value: f64) c_int;
pub extern fn drem(__x: f64, __y: f64) f64;
pub extern fn __drem(__x: f64, __y: f64) f64;
pub extern fn significand(__x: f64) f64;
pub extern fn __significand(__x: f64) f64;
pub extern fn copysign(__x: f64, __y: f64) f64;
pub extern fn __copysign(__x: f64, __y: f64) f64;
pub extern fn nan(__tagb: [*c]const u8) f64;
pub extern fn __nan(__tagb: [*c]const u8) f64;
pub extern fn isnan(__value: f64) c_int;
pub extern fn j0(f64) f64;
pub extern fn __j0(f64) f64;
pub extern fn j1(f64) f64;
pub extern fn __j1(f64) f64;
pub extern fn jn(c_int, f64) f64;
pub extern fn __jn(c_int, f64) f64;
pub extern fn y0(f64) f64;
pub extern fn __y0(f64) f64;
pub extern fn y1(f64) f64;
pub extern fn __y1(f64) f64;
pub extern fn yn(c_int, f64) f64;
pub extern fn __yn(c_int, f64) f64;
pub extern fn erf(f64) f64;
pub extern fn __erf(f64) f64;
pub extern fn erfc(f64) f64;
pub extern fn __erfc(f64) f64;
pub extern fn lgamma(f64) f64;
pub extern fn __lgamma(f64) f64;
pub extern fn tgamma(f64) f64;
pub extern fn __tgamma(f64) f64;
pub extern fn gamma(f64) f64;
pub extern fn __gamma(f64) f64;
pub extern fn lgamma_r(f64, __signgamp: [*c]c_int) f64;
pub extern fn __lgamma_r(f64, __signgamp: [*c]c_int) f64;
pub extern fn rint(__x: f64) f64;
pub extern fn __rint(__x: f64) f64;
pub extern fn nextafter(__x: f64, __y: f64) f64;
pub extern fn __nextafter(__x: f64, __y: f64) f64;
pub extern fn nexttoward(__x: f64, __y: c_longdouble) f64;
pub extern fn __nexttoward(__x: f64, __y: c_longdouble) f64;
pub extern fn remainder(__x: f64, __y: f64) f64;
pub extern fn __remainder(__x: f64, __y: f64) f64;
pub extern fn scalbn(__x: f64, __n: c_int) f64;
pub extern fn __scalbn(__x: f64, __n: c_int) f64;
pub extern fn ilogb(__x: f64) c_int;
pub extern fn __ilogb(__x: f64) c_int;
pub extern fn scalbln(__x: f64, __n: c_long) f64;
pub extern fn __scalbln(__x: f64, __n: c_long) f64;
pub extern fn nearbyint(__x: f64) f64;
pub extern fn __nearbyint(__x: f64) f64;
pub extern fn round(__x: f64) f64;
pub extern fn __round(__x: f64) f64;
pub extern fn trunc(__x: f64) f64;
pub extern fn __trunc(__x: f64) f64;
pub extern fn remquo(__x: f64, __y: f64, __quo: [*c]c_int) f64;
pub extern fn __remquo(__x: f64, __y: f64, __quo: [*c]c_int) f64;
pub extern fn lrint(__x: f64) c_long;
pub extern fn __lrint(__x: f64) c_long;
pub extern fn llrint(__x: f64) c_longlong;
pub extern fn __llrint(__x: f64) c_longlong;
pub extern fn lround(__x: f64) c_long;
pub extern fn __lround(__x: f64) c_long;
pub extern fn llround(__x: f64) c_longlong;
pub extern fn __llround(__x: f64) c_longlong;
pub extern fn fdim(__x: f64, __y: f64) f64;
pub extern fn __fdim(__x: f64, __y: f64) f64;
pub extern fn fmax(__x: f64, __y: f64) f64;
pub extern fn __fmax(__x: f64, __y: f64) f64;
pub extern fn fmin(__x: f64, __y: f64) f64;
pub extern fn __fmin(__x: f64, __y: f64) f64;
pub extern fn fma(__x: f64, __y: f64, __z: f64) f64;
pub extern fn __fma(__x: f64, __y: f64, __z: f64) f64;
pub extern fn scalb(__x: f64, __n: f64) f64;
pub extern fn __scalb(__x: f64, __n: f64) f64;
pub extern fn __fpclassifyf(__value: f32) c_int;
pub extern fn __signbitf(__value: f32) c_int;
pub extern fn __isinff(__value: f32) c_int;
pub extern fn __finitef(__value: f32) c_int;
pub extern fn __isnanf(__value: f32) c_int;
pub extern fn __iseqsigf(__x: f32, __y: f32) c_int;
pub extern fn __issignalingf(__value: f32) c_int;
pub extern fn acosf(__x: f32) f32;
pub extern fn __acosf(__x: f32) f32;
pub extern fn asinf(__x: f32) f32;
pub extern fn __asinf(__x: f32) f32;
pub extern fn atanf(__x: f32) f32;
pub extern fn __atanf(__x: f32) f32;
pub extern fn atan2f(__y: f32, __x: f32) f32;
pub extern fn __atan2f(__y: f32, __x: f32) f32;
pub extern fn cosf(__x: f32) f32;
pub extern fn __cosf(__x: f32) f32;
pub extern fn sinf(__x: f32) f32;
pub extern fn __sinf(__x: f32) f32;
pub extern fn tanf(__x: f32) f32;
pub extern fn __tanf(__x: f32) f32;
pub extern fn coshf(__x: f32) f32;
pub extern fn __coshf(__x: f32) f32;
pub extern fn sinhf(__x: f32) f32;
pub extern fn __sinhf(__x: f32) f32;
pub extern fn tanhf(__x: f32) f32;
pub extern fn __tanhf(__x: f32) f32;
pub extern fn acoshf(__x: f32) f32;
pub extern fn __acoshf(__x: f32) f32;
pub extern fn asinhf(__x: f32) f32;
pub extern fn __asinhf(__x: f32) f32;
pub extern fn atanhf(__x: f32) f32;
pub extern fn __atanhf(__x: f32) f32;
pub extern fn expf(__x: f32) f32;
pub extern fn __expf(__x: f32) f32;
pub extern fn frexpf(__x: f32, __exponent: [*c]c_int) f32;
pub extern fn __frexpf(__x: f32, __exponent: [*c]c_int) f32;
pub extern fn ldexpf(__x: f32, __exponent: c_int) f32;
pub extern fn __ldexpf(__x: f32, __exponent: c_int) f32;
pub extern fn logf(__x: f32) f32;
pub extern fn __logf(__x: f32) f32;
pub extern fn log10f(__x: f32) f32;
pub extern fn __log10f(__x: f32) f32;
pub extern fn modff(__x: f32, __iptr: [*c]f32) f32;
pub extern fn __modff(__x: f32, __iptr: [*c]f32) f32;
pub extern fn expm1f(__x: f32) f32;
pub extern fn __expm1f(__x: f32) f32;
pub extern fn log1pf(__x: f32) f32;
pub extern fn __log1pf(__x: f32) f32;
pub extern fn logbf(__x: f32) f32;
pub extern fn __logbf(__x: f32) f32;
pub extern fn exp2f(__x: f32) f32;
pub extern fn __exp2f(__x: f32) f32;
pub extern fn log2f(__x: f32) f32;
pub extern fn __log2f(__x: f32) f32;
pub extern fn powf(__x: f32, __y: f32) f32;
pub extern fn __powf(__x: f32, __y: f32) f32;
pub extern fn sqrtf(__x: f32) f32;
pub extern fn __sqrtf(__x: f32) f32;
pub extern fn hypotf(__x: f32, __y: f32) f32;
pub extern fn __hypotf(__x: f32, __y: f32) f32;
pub extern fn cbrtf(__x: f32) f32;
pub extern fn __cbrtf(__x: f32) f32;
pub extern fn ceilf(__x: f32) f32;
pub extern fn __ceilf(__x: f32) f32;
pub extern fn fabsf(__x: f32) f32;
pub extern fn __fabsf(__x: f32) f32;
pub extern fn floorf(__x: f32) f32;
pub extern fn __floorf(__x: f32) f32;
pub extern fn fmodf(__x: f32, __y: f32) f32;
pub extern fn __fmodf(__x: f32, __y: f32) f32;
pub extern fn isinff(__value: f32) c_int;
pub extern fn finitef(__value: f32) c_int;
pub extern fn dremf(__x: f32, __y: f32) f32;
pub extern fn __dremf(__x: f32, __y: f32) f32;
pub extern fn significandf(__x: f32) f32;
pub extern fn __significandf(__x: f32) f32;
pub extern fn copysignf(__x: f32, __y: f32) f32;
pub extern fn __copysignf(__x: f32, __y: f32) f32;
pub extern fn nanf(__tagb: [*c]const u8) f32;
pub extern fn __nanf(__tagb: [*c]const u8) f32;
pub extern fn isnanf(__value: f32) c_int;
pub extern fn j0f(f32) f32;
pub extern fn __j0f(f32) f32;
pub extern fn j1f(f32) f32;
pub extern fn __j1f(f32) f32;
pub extern fn jnf(c_int, f32) f32;
pub extern fn __jnf(c_int, f32) f32;
pub extern fn y0f(f32) f32;
pub extern fn __y0f(f32) f32;
pub extern fn y1f(f32) f32;
pub extern fn __y1f(f32) f32;
pub extern fn ynf(c_int, f32) f32;
pub extern fn __ynf(c_int, f32) f32;
pub extern fn erff(f32) f32;
pub extern fn __erff(f32) f32;
pub extern fn erfcf(f32) f32;
pub extern fn __erfcf(f32) f32;
pub extern fn lgammaf(f32) f32;
pub extern fn __lgammaf(f32) f32;
pub extern fn tgammaf(f32) f32;
pub extern fn __tgammaf(f32) f32;
pub extern fn gammaf(f32) f32;
pub extern fn __gammaf(f32) f32;
pub extern fn lgammaf_r(f32, __signgamp: [*c]c_int) f32;
pub extern fn __lgammaf_r(f32, __signgamp: [*c]c_int) f32;
pub extern fn rintf(__x: f32) f32;
pub extern fn __rintf(__x: f32) f32;
pub extern fn nextafterf(__x: f32, __y: f32) f32;
pub extern fn __nextafterf(__x: f32, __y: f32) f32;
pub extern fn nexttowardf(__x: f32, __y: c_longdouble) f32;
pub extern fn __nexttowardf(__x: f32, __y: c_longdouble) f32;
pub extern fn remainderf(__x: f32, __y: f32) f32;
pub extern fn __remainderf(__x: f32, __y: f32) f32;
pub extern fn scalbnf(__x: f32, __n: c_int) f32;
pub extern fn __scalbnf(__x: f32, __n: c_int) f32;
pub extern fn ilogbf(__x: f32) c_int;
pub extern fn __ilogbf(__x: f32) c_int;
pub extern fn scalblnf(__x: f32, __n: c_long) f32;
pub extern fn __scalblnf(__x: f32, __n: c_long) f32;
pub extern fn nearbyintf(__x: f32) f32;
pub extern fn __nearbyintf(__x: f32) f32;
pub extern fn roundf(__x: f32) f32;
pub extern fn __roundf(__x: f32) f32;
pub extern fn truncf(__x: f32) f32;
pub extern fn __truncf(__x: f32) f32;
pub extern fn remquof(__x: f32, __y: f32, __quo: [*c]c_int) f32;
pub extern fn __remquof(__x: f32, __y: f32, __quo: [*c]c_int) f32;
pub extern fn lrintf(__x: f32) c_long;
pub extern fn __lrintf(__x: f32) c_long;
pub extern fn llrintf(__x: f32) c_longlong;
pub extern fn __llrintf(__x: f32) c_longlong;
pub extern fn lroundf(__x: f32) c_long;
pub extern fn __lroundf(__x: f32) c_long;
pub extern fn llroundf(__x: f32) c_longlong;
pub extern fn __llroundf(__x: f32) c_longlong;
pub extern fn fdimf(__x: f32, __y: f32) f32;
pub extern fn __fdimf(__x: f32, __y: f32) f32;
pub extern fn fmaxf(__x: f32, __y: f32) f32;
pub extern fn __fmaxf(__x: f32, __y: f32) f32;
pub extern fn fminf(__x: f32, __y: f32) f32;
pub extern fn __fminf(__x: f32, __y: f32) f32;
pub extern fn fmaf(__x: f32, __y: f32, __z: f32) f32;
pub extern fn __fmaf(__x: f32, __y: f32, __z: f32) f32;
pub extern fn scalbf(__x: f32, __n: f32) f32;
pub extern fn __scalbf(__x: f32, __n: f32) f32;
pub extern fn __fpclassifyl(__value: c_longdouble) c_int;
pub extern fn __signbitl(__value: c_longdouble) c_int;
pub extern fn __isinfl(__value: c_longdouble) c_int;
pub extern fn __finitel(__value: c_longdouble) c_int;
pub extern fn __isnanl(__value: c_longdouble) c_int;
pub extern fn __iseqsigl(__x: c_longdouble, __y: c_longdouble) c_int;
pub extern fn __issignalingl(__value: c_longdouble) c_int;
pub extern fn acosl(__x: c_longdouble) c_longdouble;
pub extern fn __acosl(__x: c_longdouble) c_longdouble;
pub extern fn asinl(__x: c_longdouble) c_longdouble;
pub extern fn __asinl(__x: c_longdouble) c_longdouble;
pub extern fn atanl(__x: c_longdouble) c_longdouble;
pub extern fn __atanl(__x: c_longdouble) c_longdouble;
pub extern fn atan2l(__y: c_longdouble, __x: c_longdouble) c_longdouble;
pub extern fn __atan2l(__y: c_longdouble, __x: c_longdouble) c_longdouble;
pub extern fn cosl(__x: c_longdouble) c_longdouble;
pub extern fn __cosl(__x: c_longdouble) c_longdouble;
pub extern fn sinl(__x: c_longdouble) c_longdouble;
pub extern fn __sinl(__x: c_longdouble) c_longdouble;
pub extern fn tanl(__x: c_longdouble) c_longdouble;
pub extern fn __tanl(__x: c_longdouble) c_longdouble;
pub extern fn coshl(__x: c_longdouble) c_longdouble;
pub extern fn __coshl(__x: c_longdouble) c_longdouble;
pub extern fn sinhl(__x: c_longdouble) c_longdouble;
pub extern fn __sinhl(__x: c_longdouble) c_longdouble;
pub extern fn tanhl(__x: c_longdouble) c_longdouble;
pub extern fn __tanhl(__x: c_longdouble) c_longdouble;
pub extern fn acoshl(__x: c_longdouble) c_longdouble;
pub extern fn __acoshl(__x: c_longdouble) c_longdouble;
pub extern fn asinhl(__x: c_longdouble) c_longdouble;
pub extern fn __asinhl(__x: c_longdouble) c_longdouble;
pub extern fn atanhl(__x: c_longdouble) c_longdouble;
pub extern fn __atanhl(__x: c_longdouble) c_longdouble;
pub extern fn expl(__x: c_longdouble) c_longdouble;
pub extern fn __expl(__x: c_longdouble) c_longdouble;
pub extern fn frexpl(__x: c_longdouble, __exponent: [*c]c_int) c_longdouble;
pub extern fn __frexpl(__x: c_longdouble, __exponent: [*c]c_int) c_longdouble;
pub extern fn ldexpl(__x: c_longdouble, __exponent: c_int) c_longdouble;
pub extern fn __ldexpl(__x: c_longdouble, __exponent: c_int) c_longdouble;
pub extern fn logl(__x: c_longdouble) c_longdouble;
pub extern fn __logl(__x: c_longdouble) c_longdouble;
pub extern fn log10l(__x: c_longdouble) c_longdouble;
pub extern fn __log10l(__x: c_longdouble) c_longdouble;
pub extern fn modfl(__x: c_longdouble, __iptr: [*c]c_longdouble) c_longdouble;
pub extern fn __modfl(__x: c_longdouble, __iptr: [*c]c_longdouble) c_longdouble;
pub extern fn expm1l(__x: c_longdouble) c_longdouble;
pub extern fn __expm1l(__x: c_longdouble) c_longdouble;
pub extern fn log1pl(__x: c_longdouble) c_longdouble;
pub extern fn __log1pl(__x: c_longdouble) c_longdouble;
pub extern fn logbl(__x: c_longdouble) c_longdouble;
pub extern fn __logbl(__x: c_longdouble) c_longdouble;
pub extern fn exp2l(__x: c_longdouble) c_longdouble;
pub extern fn __exp2l(__x: c_longdouble) c_longdouble;
pub extern fn log2l(__x: c_longdouble) c_longdouble;
pub extern fn __log2l(__x: c_longdouble) c_longdouble;
pub extern fn powl(__x: c_longdouble, __y: c_longdouble) c_longdouble;
pub extern fn __powl(__x: c_longdouble, __y: c_longdouble) c_longdouble;
pub extern fn sqrtl(__x: c_longdouble) c_longdouble;
pub extern fn __sqrtl(__x: c_longdouble) c_longdouble;
pub extern fn hypotl(__x: c_longdouble, __y: c_longdouble) c_longdouble;
pub extern fn __hypotl(__x: c_longdouble, __y: c_longdouble) c_longdouble;
pub extern fn cbrtl(__x: c_longdouble) c_longdouble;
pub extern fn __cbrtl(__x: c_longdouble) c_longdouble;
pub extern fn ceill(__x: c_longdouble) c_longdouble;
pub extern fn __ceill(__x: c_longdouble) c_longdouble;
pub extern fn fabsl(__x: c_longdouble) c_longdouble;
pub extern fn __fabsl(__x: c_longdouble) c_longdouble;
pub extern fn floorl(__x: c_longdouble) c_longdouble;
pub extern fn __floorl(__x: c_longdouble) c_longdouble;
pub extern fn fmodl(__x: c_longdouble, __y: c_longdouble) c_longdouble;
pub extern fn __fmodl(__x: c_longdouble, __y: c_longdouble) c_longdouble;
pub extern fn isinfl(__value: c_longdouble) c_int;
pub extern fn finitel(__value: c_longdouble) c_int;
pub extern fn dreml(__x: c_longdouble, __y: c_longdouble) c_longdouble;
pub extern fn __dreml(__x: c_longdouble, __y: c_longdouble) c_longdouble;
pub extern fn significandl(__x: c_longdouble) c_longdouble;
pub extern fn __significandl(__x: c_longdouble) c_longdouble;
pub extern fn copysignl(__x: c_longdouble, __y: c_longdouble) c_longdouble;
pub extern fn __copysignl(__x: c_longdouble, __y: c_longdouble) c_longdouble;
pub extern fn nanl(__tagb: [*c]const u8) c_longdouble;
pub extern fn __nanl(__tagb: [*c]const u8) c_longdouble;
pub extern fn isnanl(__value: c_longdouble) c_int;
pub extern fn j0l(c_longdouble) c_longdouble;
pub extern fn __j0l(c_longdouble) c_longdouble;
pub extern fn j1l(c_longdouble) c_longdouble;
pub extern fn __j1l(c_longdouble) c_longdouble;
pub extern fn jnl(c_int, c_longdouble) c_longdouble;
pub extern fn __jnl(c_int, c_longdouble) c_longdouble;
pub extern fn y0l(c_longdouble) c_longdouble;
pub extern fn __y0l(c_longdouble) c_longdouble;
pub extern fn y1l(c_longdouble) c_longdouble;
pub extern fn __y1l(c_longdouble) c_longdouble;
pub extern fn ynl(c_int, c_longdouble) c_longdouble;
pub extern fn __ynl(c_int, c_longdouble) c_longdouble;
pub extern fn erfl(c_longdouble) c_longdouble;
pub extern fn __erfl(c_longdouble) c_longdouble;
pub extern fn erfcl(c_longdouble) c_longdouble;
pub extern fn __erfcl(c_longdouble) c_longdouble;
pub extern fn lgammal(c_longdouble) c_longdouble;
pub extern fn __lgammal(c_longdouble) c_longdouble;
pub extern fn tgammal(c_longdouble) c_longdouble;
pub extern fn __tgammal(c_longdouble) c_longdouble;
pub extern fn gammal(c_longdouble) c_longdouble;
pub extern fn __gammal(c_longdouble) c_longdouble;
pub extern fn lgammal_r(c_longdouble, __signgamp: [*c]c_int) c_longdouble;
pub extern fn __lgammal_r(c_longdouble, __signgamp: [*c]c_int) c_longdouble;
pub extern fn rintl(__x: c_longdouble) c_longdouble;
pub extern fn __rintl(__x: c_longdouble) c_longdouble;
pub extern fn nextafterl(__x: c_longdouble, __y: c_longdouble) c_longdouble;
pub extern fn __nextafterl(__x: c_longdouble, __y: c_longdouble) c_longdouble;
pub extern fn nexttowardl(__x: c_longdouble, __y: c_longdouble) c_longdouble;
pub extern fn __nexttowardl(__x: c_longdouble, __y: c_longdouble) c_longdouble;
pub extern fn remainderl(__x: c_longdouble, __y: c_longdouble) c_longdouble;
pub extern fn __remainderl(__x: c_longdouble, __y: c_longdouble) c_longdouble;
pub extern fn scalbnl(__x: c_longdouble, __n: c_int) c_longdouble;
pub extern fn __scalbnl(__x: c_longdouble, __n: c_int) c_longdouble;
pub extern fn ilogbl(__x: c_longdouble) c_int;
pub extern fn __ilogbl(__x: c_longdouble) c_int;
pub extern fn scalblnl(__x: c_longdouble, __n: c_long) c_longdouble;
pub extern fn __scalblnl(__x: c_longdouble, __n: c_long) c_longdouble;
pub extern fn nearbyintl(__x: c_longdouble) c_longdouble;
pub extern fn __nearbyintl(__x: c_longdouble) c_longdouble;
pub extern fn roundl(__x: c_longdouble) c_longdouble;
pub extern fn __roundl(__x: c_longdouble) c_longdouble;
pub extern fn truncl(__x: c_longdouble) c_longdouble;
pub extern fn __truncl(__x: c_longdouble) c_longdouble;
pub extern fn remquol(__x: c_longdouble, __y: c_longdouble, __quo: [*c]c_int) c_longdouble;
pub extern fn __remquol(__x: c_longdouble, __y: c_longdouble, __quo: [*c]c_int) c_longdouble;
pub extern fn lrintl(__x: c_longdouble) c_long;
pub extern fn __lrintl(__x: c_longdouble) c_long;
pub extern fn llrintl(__x: c_longdouble) c_longlong;
pub extern fn __llrintl(__x: c_longdouble) c_longlong;
pub extern fn lroundl(__x: c_longdouble) c_long;
pub extern fn __lroundl(__x: c_longdouble) c_long;
pub extern fn llroundl(__x: c_longdouble) c_longlong;
pub extern fn __llroundl(__x: c_longdouble) c_longlong;
pub extern fn fdiml(__x: c_longdouble, __y: c_longdouble) c_longdouble;
pub extern fn __fdiml(__x: c_longdouble, __y: c_longdouble) c_longdouble;
pub extern fn fmaxl(__x: c_longdouble, __y: c_longdouble) c_longdouble;
pub extern fn __fmaxl(__x: c_longdouble, __y: c_longdouble) c_longdouble;
pub extern fn fminl(__x: c_longdouble, __y: c_longdouble) c_longdouble;
pub extern fn __fminl(__x: c_longdouble, __y: c_longdouble) c_longdouble;
pub extern fn fmal(__x: c_longdouble, __y: c_longdouble, __z: c_longdouble) c_longdouble;
pub extern fn __fmal(__x: c_longdouble, __y: c_longdouble, __z: c_longdouble) c_longdouble;
pub extern fn scalbl(__x: c_longdouble, __n: c_longdouble) c_longdouble;
pub extern fn __scalbl(__x: c_longdouble, __n: c_longdouble) c_longdouble;
pub extern var signgam: c_int;
pub const FP_NAN: c_int = 0;
pub const FP_INFINITE: c_int = 1;
pub const FP_ZERO: c_int = 2;
pub const FP_SUBNORMAL: c_int = 3;
pub const FP_NORMAL: c_int = 4;
const enum_unnamed_2 = c_uint;
pub const b2Vec2_zero: b2Vec2 = b2Vec2{
    .x = 0.0,
    .y = 0.0,
};
pub const b2Rot_identity: b2Rot = b2Rot{
    .s = 0.0,
    .c = 1.0,
};
pub const b2Transform_identity: b2Transform = b2Transform{
    .p = b2Vec2{
        .x = 0.0,
        .y = 0.0,
    },
    .q = b2Rot{
        .s = 0.0,
        .c = 1.0,
    },
};
pub const b2Mat22_zero: b2Mat22 = b2Mat22{
    .cx = b2Vec2{
        .x = 0.0,
        .y = 0.0,
    },
    .cy = b2Vec2{
        .x = 0.0,
        .y = 0.0,
    },
};
pub fn b2Dot(arg_a: b2Vec2, arg_b: b2Vec2) callconv(.C) f32 {
    var a = arg_a;
    _ = &a;
    var b = arg_b;
    _ = &b;
    return (a.x * b.x) + (a.y * b.y);
}
pub fn b2Cross(arg_a: b2Vec2, arg_b: b2Vec2) callconv(.C) f32 {
    var a = arg_a;
    _ = &a;
    var b = arg_b;
    _ = &b;
    return (a.x * b.y) - (a.y * b.x);
}
pub fn b2CrossVS(arg_v: b2Vec2, arg_s: f32) callconv(.C) b2Vec2 {
    var v = arg_v;
    _ = &v;
    var s = arg_s;
    _ = &s;
    return b2Vec2{
        .x = s * v.y,
        .y = -s * v.x,
    };
}
pub fn b2CrossSV(arg_s: f32, arg_v: b2Vec2) callconv(.C) b2Vec2 {
    var s = arg_s;
    _ = &s;
    var v = arg_v;
    _ = &v;
    return b2Vec2{
        .x = -s * v.y,
        .y = s * v.x,
    };
}
pub fn b2LeftPerp(arg_v: b2Vec2) callconv(.C) b2Vec2 {
    var v = arg_v;
    _ = &v;
    return b2Vec2{
        .x = -v.y,
        .y = v.x,
    };
}
pub fn b2RightPerp(arg_v: b2Vec2) callconv(.C) b2Vec2 {
    var v = arg_v;
    _ = &v;
    return b2Vec2{
        .x = v.y,
        .y = -v.x,
    };
}
pub fn b2Add(arg_a: b2Vec2, arg_b: b2Vec2) callconv(.C) b2Vec2 {
    var a = arg_a;
    _ = &a;
    var b = arg_b;
    _ = &b;
    return b2Vec2{
        .x = a.x + b.x,
        .y = a.y + b.y,
    };
}
pub fn b2Sub(arg_a: b2Vec2, arg_b: b2Vec2) callconv(.C) b2Vec2 {
    var a = arg_a;
    _ = &a;
    var b = arg_b;
    _ = &b;
    return b2Vec2{
        .x = a.x - b.x,
        .y = a.y - b.y,
    };
}
pub fn b2Neg(arg_a: b2Vec2) callconv(.C) b2Vec2 {
    var a = arg_a;
    _ = &a;
    return b2Vec2{
        .x = -a.x,
        .y = -a.y,
    };
}
pub fn b2Lerp(arg_a: b2Vec2, arg_b: b2Vec2, arg_t: f32) callconv(.C) b2Vec2 {
    var a = arg_a;
    _ = &a;
    var b = arg_b;
    _ = &b;
    var t = arg_t;
    _ = &t;
    return b2Vec2{
        .x = ((1.0 - t) * a.x) + (t * b.x),
        .y = ((1.0 - t) * a.y) + (t * b.y),
    };
}
pub fn b2Mul(arg_a: b2Vec2, arg_b: b2Vec2) callconv(.C) b2Vec2 {
    var a = arg_a;
    _ = &a;
    var b = arg_b;
    _ = &b;
    return b2Vec2{
        .x = a.x * b.x,
        .y = a.y * b.y,
    };
}
pub fn b2MulSV(arg_s: f32, arg_v: b2Vec2) callconv(.C) b2Vec2 {
    var s = arg_s;
    _ = &s;
    var v = arg_v;
    _ = &v;
    return b2Vec2{
        .x = s * v.x,
        .y = s * v.y,
    };
}
pub fn b2MulAdd(arg_a: b2Vec2, arg_s: f32, arg_b: b2Vec2) callconv(.C) b2Vec2 {
    var a = arg_a;
    _ = &a;
    var s = arg_s;
    _ = &s;
    var b = arg_b;
    _ = &b;
    return b2Vec2{
        .x = a.x + (s * b.x),
        .y = a.y + (s * b.y),
    };
}
pub fn b2MulSub(arg_a: b2Vec2, arg_s: f32, arg_b: b2Vec2) callconv(.C) b2Vec2 {
    var a = arg_a;
    _ = &a;
    var s = arg_s;
    _ = &s;
    var b = arg_b;
    _ = &b;
    return b2Vec2{
        .x = a.x - (s * b.x),
        .y = a.y - (s * b.y),
    };
}
pub fn b2Abs(arg_a: b2Vec2) callconv(.C) b2Vec2 {
    var a = arg_a;
    _ = &a;
    var b: b2Vec2 = undefined;
    _ = &b;
    b.x = if (a.x > 0.0) a.x else -a.x;
    b.y = if (a.y > 0.0) a.y else -a.y;
    return b;
}
pub fn b2Min(arg_a: b2Vec2, arg_b: b2Vec2) callconv(.C) b2Vec2 {
    var a = arg_a;
    _ = &a;
    var b = arg_b;
    _ = &b;
    var c: b2Vec2 = undefined;
    _ = &c;
    c.x = if (a.x < b.x) a.x else b.x;
    c.y = if (a.y < b.y) a.y else b.y;
    return c;
}
pub fn b2Max(arg_a: b2Vec2, arg_b: b2Vec2) callconv(.C) b2Vec2 {
    var a = arg_a;
    _ = &a;
    var b = arg_b;
    _ = &b;
    var c: b2Vec2 = undefined;
    _ = &c;
    c.x = if (a.x > b.x) a.x else b.x;
    c.y = if (a.y > b.y) a.y else b.y;
    return c;
}
pub fn b2Clamp(arg_v: b2Vec2, arg_a: b2Vec2, arg_b: b2Vec2) callconv(.C) b2Vec2 {
    var v = arg_v;
    _ = &v;
    var a = arg_a;
    _ = &a;
    var b = arg_b;
    _ = &b;
    var c: b2Vec2 = undefined;
    _ = &c;
    c.x = if ((if (v.x > a.x) v.x else a.x) < b.x) if (v.x > a.x) v.x else a.x else b.x;
    c.y = if ((if (v.y > a.y) v.y else a.y) < b.y) if (v.y > a.y) v.y else a.y else b.y;
    return c;
}
pub fn b2Length(arg_v: b2Vec2) callconv(.C) f32 {
    var v = arg_v;
    _ = &v;
    return sqrtf((v.x * v.x) + (v.y * v.y));
}
pub fn b2LengthSquared(arg_v: b2Vec2) callconv(.C) f32 {
    var v = arg_v;
    _ = &v;
    return (v.x * v.x) + (v.y * v.y);
}
pub fn b2Distance(arg_a: b2Vec2, arg_b: b2Vec2) callconv(.C) f32 {
    var a = arg_a;
    _ = &a;
    var b = arg_b;
    _ = &b;
    var dx: f32 = b.x - a.x;
    _ = &dx;
    var dy: f32 = b.y - a.y;
    _ = &dy;
    return sqrtf((dx * dx) + (dy * dy));
}
pub fn b2DistanceSquared(arg_a: b2Vec2, arg_b: b2Vec2) callconv(.C) f32 {
    var a = arg_a;
    _ = &a;
    var b = arg_b;
    _ = &b;
    var c: b2Vec2 = b2Vec2{
        .x = b.x - a.x,
        .y = b.y - a.y,
    };
    _ = &c;
    return (c.x * c.x) + (c.y * c.y);
}
pub fn b2MakeRot(arg_angle: f32) callconv(.C) b2Rot {
    var angle = arg_angle;
    _ = &angle;
    var q: b2Rot = b2Rot{
        .s = sinf(angle),
        .c = cosf(angle),
    };
    _ = &q;
    return q;
}
pub fn b2NormalizeRot(arg_q: b2Rot) callconv(.C) b2Rot {
    var q = arg_q;
    _ = &q;
    var mag: f32 = sqrtf((q.s * q.s) + (q.c * q.c));
    _ = &mag;
    var invMag: f32 = if (@as(f64, @floatCast(mag)) > 0.0) 1.0 / mag else 0.0;
    _ = &invMag;
    var qn: b2Rot = b2Rot{
        .s = q.s * invMag,
        .c = q.c * invMag,
    };
    _ = &qn;
    return qn;
}
pub fn b2IsNormalized(arg_q: b2Rot) callconv(.C) bool {
    var q = arg_q;
    _ = &q;
    var qq: f32 = (q.s * q.s) + (q.c * q.c);
    _ = &qq;
    return ((1.0 - 0.0006000000284984708) < qq) and (qq < (1.0 + 0.0006000000284984708));
}
pub fn b2NLerp(arg_q1: b2Rot, arg_q2: b2Rot, arg_t: f32) callconv(.C) b2Rot {
    var q1 = arg_q1;
    _ = &q1;
    var q2 = arg_q2;
    _ = &q2;
    var t = arg_t;
    _ = &t;
    var omt: f32 = 1.0 - t;
    _ = &omt;
    var q: b2Rot = b2Rot{
        .s = (omt * q1.s) + (t * q2.s),
        .c = (omt * q1.c) + (t * q2.c),
    };
    _ = &q;
    return b2NormalizeRot(q);
}
pub fn b2IntegrateRotation(arg_q1: b2Rot, arg_deltaAngle: f32) callconv(.C) b2Rot {
    var q1 = arg_q1;
    _ = &q1;
    var deltaAngle = arg_deltaAngle;
    _ = &deltaAngle;
    var q2: b2Rot = b2Rot{
        .s = q1.s + (deltaAngle * q1.c),
        .c = q1.c - (deltaAngle * q1.s),
    };
    _ = &q2;
    var mag: f32 = sqrtf((q2.s * q2.s) + (q2.c * q2.c));
    _ = &mag;
    var invMag: f32 = if (@as(f64, @floatCast(mag)) > 0.0) 1.0 / mag else 0.0;
    _ = &invMag;
    var qn: b2Rot = b2Rot{
        .s = q2.s * invMag,
        .c = q2.c * invMag,
    };
    _ = &qn;
    return qn;
}
pub fn b2ComputeAngularVelocity(arg_q1: b2Rot, arg_q2: b2Rot, arg_inv_h: f32) callconv(.C) f32 {
    var q1 = arg_q1;
    _ = &q1;
    var q2 = arg_q2;
    _ = &q2;
    var inv_h = arg_inv_h;
    _ = &inv_h;
    var omega: f32 = inv_h * ((q2.s * q1.c) - (q2.c * q1.s));
    _ = &omega;
    return omega;
}
pub fn b2Rot_GetAngle(arg_q: b2Rot) callconv(.C) f32 {
    var q = arg_q;
    _ = &q;
    return atan2f(q.s, q.c);
}
pub fn b2Rot_GetXAxis(arg_q: b2Rot) callconv(.C) b2Vec2 {
    var q = arg_q;
    _ = &q;
    var v: b2Vec2 = b2Vec2{
        .x = q.c,
        .y = q.s,
    };
    _ = &v;
    return v;
}
pub fn b2Rot_GetYAxis(arg_q: b2Rot) callconv(.C) b2Vec2 {
    var q = arg_q;
    _ = &q;
    var v: b2Vec2 = b2Vec2{
        .x = -q.s,
        .y = q.c,
    };
    _ = &v;
    return v;
}
pub fn b2MulRot(arg_q: b2Rot, arg_r: b2Rot) callconv(.C) b2Rot {
    var q = arg_q;
    _ = &q;
    var r = arg_r;
    _ = &r;
    var qr: b2Rot = undefined;
    _ = &qr;
    qr.s = (q.s * r.c) + (q.c * r.s);
    qr.c = (q.c * r.c) - (q.s * r.s);
    return qr;
}
pub fn b2InvMulRot(arg_q: b2Rot, arg_r: b2Rot) callconv(.C) b2Rot {
    var q = arg_q;
    _ = &q;
    var r = arg_r;
    _ = &r;
    var qr: b2Rot = undefined;
    _ = &qr;
    qr.s = (q.c * r.s) - (q.s * r.c);
    qr.c = (q.c * r.c) + (q.s * r.s);
    return qr;
}
pub fn b2RelativeAngle(arg_b: b2Rot, arg_a: b2Rot) callconv(.C) f32 {
    var b = arg_b;
    _ = &b;
    var a = arg_a;
    _ = &a;
    var s: f32 = (b.s * a.c) - (b.c * a.s);
    _ = &s;
    var c: f32 = (b.c * a.c) + (b.s * a.s);
    _ = &c;
    return atan2f(s, c);
}
pub fn b2RotateVector(arg_q: b2Rot, arg_v: b2Vec2) callconv(.C) b2Vec2 {
    var q = arg_q;
    _ = &q;
    var v = arg_v;
    _ = &v;
    return b2Vec2{
        .x = (q.c * v.x) - (q.s * v.y),
        .y = (q.s * v.x) + (q.c * v.y),
    };
}
pub fn b2InvRotateVector(arg_q: b2Rot, arg_v: b2Vec2) callconv(.C) b2Vec2 {
    var q = arg_q;
    _ = &q;
    var v = arg_v;
    _ = &v;
    return b2Vec2{
        .x = (q.c * v.x) + (q.s * v.y),
        .y = (-q.s * v.x) + (q.c * v.y),
    };
}
pub fn b2TransformPoint(arg_xf: b2Transform, p: b2Vec2) callconv(.C) b2Vec2 {
    var xf = arg_xf;
    _ = &xf;
    _ = &p;
    var x: f32 = ((xf.q.c * p.x) - (xf.q.s * p.y)) + xf.p.x;
    _ = &x;
    var y: f32 = ((xf.q.s * p.x) + (xf.q.c * p.y)) + xf.p.y;
    _ = &y;
    return b2Vec2{
        .x = x,
        .y = y,
    };
}
pub fn b2InvTransformPoint(arg_xf: b2Transform, p: b2Vec2) callconv(.C) b2Vec2 {
    var xf = arg_xf;
    _ = &xf;
    _ = &p;
    var vx: f32 = p.x - xf.p.x;
    _ = &vx;
    var vy: f32 = p.y - xf.p.y;
    _ = &vy;
    return b2Vec2{
        .x = (xf.q.c * vx) + (xf.q.s * vy),
        .y = (-xf.q.s * vx) + (xf.q.c * vy),
    };
}
pub fn b2MulTransforms(arg_A: b2Transform, arg_B: b2Transform) callconv(.C) b2Transform {
    var A = arg_A;
    _ = &A;
    var B = arg_B;
    _ = &B;
    var C: b2Transform = undefined;
    _ = &C;
    C.q = b2MulRot(A.q, B.q);
    C.p = b2Add(b2RotateVector(A.q, B.p), A.p);
    return C;
}
pub fn b2InvMulTransforms(arg_A: b2Transform, arg_B: b2Transform) callconv(.C) b2Transform {
    var A = arg_A;
    _ = &A;
    var B = arg_B;
    _ = &B;
    var C: b2Transform = undefined;
    _ = &C;
    C.q = b2InvMulRot(A.q, B.q);
    C.p = b2InvRotateVector(A.q, b2Sub(B.p, A.p));
    return C;
}
pub fn b2MulMV(arg_A: b2Mat22, arg_v: b2Vec2) callconv(.C) b2Vec2 {
    var A = arg_A;
    _ = &A;
    var v = arg_v;
    _ = &v;
    var u: b2Vec2 = b2Vec2{
        .x = (A.cx.x * v.x) + (A.cy.x * v.y),
        .y = (A.cx.y * v.x) + (A.cy.y * v.y),
    };
    _ = &u;
    return u;
}
pub fn b2GetInverse22(arg_A: b2Mat22) callconv(.C) b2Mat22 {
    var A = arg_A;
    _ = &A;
    var a: f32 = A.cx.x;
    _ = &a;
    var b: f32 = A.cy.x;
    _ = &b;
    var c: f32 = A.cx.y;
    _ = &c;
    var d: f32 = A.cy.y;
    _ = &d;
    var det: f32 = (a * d) - (b * c);
    _ = &det;
    if (det != 0.0) {
        det = 1.0 / det;
    }
    var B: b2Mat22 = b2Mat22{
        .cx = b2Vec2{
            .x = det * d,
            .y = -det * c,
        },
        .cy = b2Vec2{
            .x = -det * b,
            .y = det * a,
        },
    };
    _ = &B;
    return B;
}
pub fn b2Solve22(arg_A: b2Mat22, arg_b: b2Vec2) callconv(.C) b2Vec2 {
    var A = arg_A;
    _ = &A;
    var b = arg_b;
    _ = &b;
    var a11: f32 = A.cx.x;
    _ = &a11;
    var a12: f32 = A.cy.x;
    _ = &a12;
    var a21: f32 = A.cx.y;
    _ = &a21;
    var a22: f32 = A.cy.y;
    _ = &a22;
    var det: f32 = (a11 * a22) - (a12 * a21);
    _ = &det;
    if (det != 0.0) {
        det = 1.0 / det;
    }
    var x: b2Vec2 = b2Vec2{
        .x = det * ((a22 * b.x) - (a12 * b.y)),
        .y = det * ((a11 * b.y) - (a21 * b.x)),
    };
    _ = &x;
    return x;
}
pub fn b2AABB_Contains(arg_a: b2AABB, arg_b: b2AABB) callconv(.C) bool {
    var a = arg_a;
    _ = &a;
    var b = arg_b;
    _ = &b;
    var s: bool = @as(c_int, 1) != 0;
    _ = &s;
    s = (@as(c_int, @intFromBool(s)) != 0) and (a.lowerBound.x <= b.lowerBound.x);
    s = (@as(c_int, @intFromBool(s)) != 0) and (a.lowerBound.y <= b.lowerBound.y);
    s = (@as(c_int, @intFromBool(s)) != 0) and (b.upperBound.x <= a.upperBound.x);
    s = (@as(c_int, @intFromBool(s)) != 0) and (b.upperBound.y <= a.upperBound.y);
    return s;
}
pub fn b2AABB_Center(arg_a: b2AABB) callconv(.C) b2Vec2 {
    var a = arg_a;
    _ = &a;
    var b: b2Vec2 = b2Vec2{
        .x = 0.5 * (a.lowerBound.x + a.upperBound.x),
        .y = 0.5 * (a.lowerBound.y + a.upperBound.y),
    };
    _ = &b;
    return b;
}
pub fn b2AABB_Extents(arg_a: b2AABB) callconv(.C) b2Vec2 {
    var a = arg_a;
    _ = &a;
    var b: b2Vec2 = b2Vec2{
        .x = 0.5 * (a.upperBound.x - a.lowerBound.x),
        .y = 0.5 * (a.upperBound.y - a.lowerBound.y),
    };
    _ = &b;
    return b;
}
pub fn b2AABB_Union(arg_a: b2AABB, arg_b: b2AABB) callconv(.C) b2AABB {
    var a = arg_a;
    _ = &a;
    var b = arg_b;
    _ = &b;
    var c: b2AABB = undefined;
    _ = &c;
    c.lowerBound.x = if (a.lowerBound.x < b.lowerBound.x) a.lowerBound.x else b.lowerBound.x;
    c.lowerBound.y = if (a.lowerBound.y < b.lowerBound.y) a.lowerBound.y else b.lowerBound.y;
    c.upperBound.x = if (a.upperBound.x > b.upperBound.x) a.upperBound.x else b.upperBound.x;
    c.upperBound.y = if (a.upperBound.y > b.upperBound.y) a.upperBound.y else b.upperBound.y;
    return c;
}
pub extern fn b2IsValid(a: f32) bool;
pub extern fn b2Vec2_IsValid(v: b2Vec2) bool;
pub extern fn b2Rot_IsValid(q: b2Rot) bool;
pub extern fn b2AABB_IsValid(aabb: b2AABB) bool;
pub extern fn b2Normalize(v: b2Vec2) b2Vec2;
pub extern fn b2NormalizeChecked(v: b2Vec2) b2Vec2;
pub extern fn b2GetLengthAndNormalize(length: [*c]f32, v: b2Vec2) b2Vec2;
pub const struct_b2Timer = extern struct {
    start_sec: c_ulonglong = @import("std").mem.zeroes(c_ulonglong),
    start_usec: c_ulonglong = @import("std").mem.zeroes(c_ulonglong),
};
pub const b2Timer = struct_b2Timer;
pub extern fn b2CreateTimer() b2Timer;
pub extern fn b2GetTicks(timer: [*c]b2Timer) i64;
pub extern fn b2GetMilliseconds(timer: [*c]const b2Timer) f32;
pub extern fn b2GetMillisecondsAndReset(timer: [*c]b2Timer) f32;
pub extern fn b2SleepMilliseconds(milliseconds: f32) void;
pub const __INTMAX_C_SUFFIX__ = @compileError("unable to translate macro: undefined identifier `L`"); // (no file):90:9
pub const __UINTMAX_C_SUFFIX__ = @compileError("unable to translate macro: undefined identifier `UL`"); // (no file):96:9
pub const __INT64_C_SUFFIX__ = @compileError("unable to translate macro: undefined identifier `L`"); // (no file):193:9
pub const __UINT32_C_SUFFIX__ = @compileError("unable to translate macro: undefined identifier `U`"); // (no file):215:9
pub const __UINT64_C_SUFFIX__ = @compileError("unable to translate macro: undefined identifier `UL`"); // (no file):223:9
pub const __seg_gs = @compileError("unable to translate macro: undefined identifier `address_space`"); // (no file):353:9
pub const __seg_fs = @compileError("unable to translate macro: undefined identifier `address_space`"); // (no file):354:9
pub const _LIBCPP_ABI_NAMESPACE = @compileError("unable to translate macro: undefined identifier `__1`"); // (no file):431:9
pub const __GLIBC_USE = @compileError("unable to translate macro: undefined identifier `__GLIBC_USE_`"); // /nix/store/s3pvsv4as7mc8i2nwnk2hnsyi2qdj4bq-glibc-2.39-31-dev/include/features.h:188:9
pub const __glibc_has_attribute = @compileError("unable to translate macro: undefined identifier `__has_attribute`"); // /nix/store/s3pvsv4as7mc8i2nwnk2hnsyi2qdj4bq-glibc-2.39-31-dev/include/sys/cdefs.h:45:10
pub const __glibc_has_extension = @compileError("unable to translate macro: undefined identifier `__has_extension`"); // /nix/store/s3pvsv4as7mc8i2nwnk2hnsyi2qdj4bq-glibc-2.39-31-dev/include/sys/cdefs.h:55:10
pub const __THROW = @compileError("unable to translate macro: undefined identifier `__nothrow__`"); // /nix/store/s3pvsv4as7mc8i2nwnk2hnsyi2qdj4bq-glibc-2.39-31-dev/include/sys/cdefs.h:79:11
pub const __THROWNL = @compileError("unable to translate macro: undefined identifier `__nothrow__`"); // /nix/store/s3pvsv4as7mc8i2nwnk2hnsyi2qdj4bq-glibc-2.39-31-dev/include/sys/cdefs.h:80:11
pub const __NTH = @compileError("unable to translate macro: undefined identifier `__nothrow__`"); // /nix/store/s3pvsv4as7mc8i2nwnk2hnsyi2qdj4bq-glibc-2.39-31-dev/include/sys/cdefs.h:81:11
pub const __NTHNL = @compileError("unable to translate macro: undefined identifier `__nothrow__`"); // /nix/store/s3pvsv4as7mc8i2nwnk2hnsyi2qdj4bq-glibc-2.39-31-dev/include/sys/cdefs.h:82:11
pub const __COLD = @compileError("unable to translate macro: undefined identifier `__cold__`"); // /nix/store/s3pvsv4as7mc8i2nwnk2hnsyi2qdj4bq-glibc-2.39-31-dev/include/sys/cdefs.h:102:11
pub const __CONCAT = @compileError("unable to translate C expr: unexpected token '##'"); // /nix/store/s3pvsv4as7mc8i2nwnk2hnsyi2qdj4bq-glibc-2.39-31-dev/include/sys/cdefs.h:131:9
pub const __STRING = @compileError("unable to translate C expr: unexpected token '#'"); // /nix/store/s3pvsv4as7mc8i2nwnk2hnsyi2qdj4bq-glibc-2.39-31-dev/include/sys/cdefs.h:132:9
pub const __warnattr = @compileError("unable to translate C expr: unexpected token ''"); // /nix/store/s3pvsv4as7mc8i2nwnk2hnsyi2qdj4bq-glibc-2.39-31-dev/include/sys/cdefs.h:216:10
pub const __errordecl = @compileError("unable to translate C expr: unexpected token 'extern'"); // /nix/store/s3pvsv4as7mc8i2nwnk2hnsyi2qdj4bq-glibc-2.39-31-dev/include/sys/cdefs.h:217:10
pub const __flexarr = @compileError("unable to translate C expr: unexpected token '['"); // /nix/store/s3pvsv4as7mc8i2nwnk2hnsyi2qdj4bq-glibc-2.39-31-dev/include/sys/cdefs.h:225:10
pub const __REDIRECT = @compileError("unable to translate C expr: unexpected token '__asm__'"); // /nix/store/s3pvsv4as7mc8i2nwnk2hnsyi2qdj4bq-glibc-2.39-31-dev/include/sys/cdefs.h:256:10
pub const __REDIRECT_NTH = @compileError("unable to translate C expr: unexpected token '__asm__'"); // /nix/store/s3pvsv4as7mc8i2nwnk2hnsyi2qdj4bq-glibc-2.39-31-dev/include/sys/cdefs.h:263:11
pub const __REDIRECT_NTHNL = @compileError("unable to translate C expr: unexpected token '__asm__'"); // /nix/store/s3pvsv4as7mc8i2nwnk2hnsyi2qdj4bq-glibc-2.39-31-dev/include/sys/cdefs.h:265:11
pub const __ASMNAME = @compileError("unable to translate C expr: unexpected token ','"); // /nix/store/s3pvsv4as7mc8i2nwnk2hnsyi2qdj4bq-glibc-2.39-31-dev/include/sys/cdefs.h:268:10
pub const __attribute_malloc__ = @compileError("unable to translate macro: undefined identifier `__malloc__`"); // /nix/store/s3pvsv4as7mc8i2nwnk2hnsyi2qdj4bq-glibc-2.39-31-dev/include/sys/cdefs.h:298:10
pub const __attribute_alloc_size__ = @compileError("unable to translate C expr: unexpected token ''"); // /nix/store/s3pvsv4as7mc8i2nwnk2hnsyi2qdj4bq-glibc-2.39-31-dev/include/sys/cdefs.h:309:10
pub const __attribute_alloc_align__ = @compileError("unable to translate macro: undefined identifier `__alloc_align__`"); // /nix/store/s3pvsv4as7mc8i2nwnk2hnsyi2qdj4bq-glibc-2.39-31-dev/include/sys/cdefs.h:315:10
pub const __attribute_pure__ = @compileError("unable to translate macro: undefined identifier `__pure__`"); // /nix/store/s3pvsv4as7mc8i2nwnk2hnsyi2qdj4bq-glibc-2.39-31-dev/include/sys/cdefs.h:325:10
pub const __attribute_const__ = @compileError("unable to translate C expr: unexpected token '__attribute__'"); // /nix/store/s3pvsv4as7mc8i2nwnk2hnsyi2qdj4bq-glibc-2.39-31-dev/include/sys/cdefs.h:332:10
pub const __attribute_maybe_unused__ = @compileError("unable to translate macro: undefined identifier `__unused__`"); // /nix/store/s3pvsv4as7mc8i2nwnk2hnsyi2qdj4bq-glibc-2.39-31-dev/include/sys/cdefs.h:338:10
pub const __attribute_used__ = @compileError("unable to translate macro: undefined identifier `__used__`"); // /nix/store/s3pvsv4as7mc8i2nwnk2hnsyi2qdj4bq-glibc-2.39-31-dev/include/sys/cdefs.h:347:10
pub const __attribute_noinline__ = @compileError("unable to translate macro: undefined identifier `__noinline__`"); // /nix/store/s3pvsv4as7mc8i2nwnk2hnsyi2qdj4bq-glibc-2.39-31-dev/include/sys/cdefs.h:348:10
pub const __attribute_deprecated__ = @compileError("unable to translate macro: undefined identifier `__deprecated__`"); // /nix/store/s3pvsv4as7mc8i2nwnk2hnsyi2qdj4bq-glibc-2.39-31-dev/include/sys/cdefs.h:356:10
pub const __attribute_deprecated_msg__ = @compileError("unable to translate macro: undefined identifier `__deprecated__`"); // /nix/store/s3pvsv4as7mc8i2nwnk2hnsyi2qdj4bq-glibc-2.39-31-dev/include/sys/cdefs.h:366:10
pub const __attribute_format_arg__ = @compileError("unable to translate macro: undefined identifier `__format_arg__`"); // /nix/store/s3pvsv4as7mc8i2nwnk2hnsyi2qdj4bq-glibc-2.39-31-dev/include/sys/cdefs.h:379:10
pub const __attribute_format_strfmon__ = @compileError("unable to translate macro: undefined identifier `__format__`"); // /nix/store/s3pvsv4as7mc8i2nwnk2hnsyi2qdj4bq-glibc-2.39-31-dev/include/sys/cdefs.h:389:10
pub const __attribute_nonnull__ = @compileError("unable to translate macro: undefined identifier `__nonnull__`"); // /nix/store/s3pvsv4as7mc8i2nwnk2hnsyi2qdj4bq-glibc-2.39-31-dev/include/sys/cdefs.h:401:11
pub const __returns_nonnull = @compileError("unable to translate macro: undefined identifier `__returns_nonnull__`"); // /nix/store/s3pvsv4as7mc8i2nwnk2hnsyi2qdj4bq-glibc-2.39-31-dev/include/sys/cdefs.h:414:10
pub const __attribute_warn_unused_result__ = @compileError("unable to translate macro: undefined identifier `__warn_unused_result__`"); // /nix/store/s3pvsv4as7mc8i2nwnk2hnsyi2qdj4bq-glibc-2.39-31-dev/include/sys/cdefs.h:423:10
pub const __always_inline = @compileError("unable to translate macro: undefined identifier `__always_inline__`"); // /nix/store/s3pvsv4as7mc8i2nwnk2hnsyi2qdj4bq-glibc-2.39-31-dev/include/sys/cdefs.h:441:10
pub const __attribute_artificial__ = @compileError("unable to translate macro: undefined identifier `__artificial__`"); // /nix/store/s3pvsv4as7mc8i2nwnk2hnsyi2qdj4bq-glibc-2.39-31-dev/include/sys/cdefs.h:450:10
pub const __extern_inline = @compileError("unable to translate macro: undefined identifier `__gnu_inline__`"); // /nix/store/s3pvsv4as7mc8i2nwnk2hnsyi2qdj4bq-glibc-2.39-31-dev/include/sys/cdefs.h:468:11
pub const __extern_always_inline = @compileError("unable to translate macro: undefined identifier `__gnu_inline__`"); // /nix/store/s3pvsv4as7mc8i2nwnk2hnsyi2qdj4bq-glibc-2.39-31-dev/include/sys/cdefs.h:469:11
pub const __restrict_arr = @compileError("unable to translate C expr: unexpected token '__restrict'"); // /nix/store/s3pvsv4as7mc8i2nwnk2hnsyi2qdj4bq-glibc-2.39-31-dev/include/sys/cdefs.h:512:10
pub const __attribute_copy__ = @compileError("unable to translate C expr: unexpected token ''"); // /nix/store/s3pvsv4as7mc8i2nwnk2hnsyi2qdj4bq-glibc-2.39-31-dev/include/sys/cdefs.h:561:10
pub const __LDBL_REDIR2_DECL = @compileError("unable to translate C expr: unexpected token ''"); // /nix/store/s3pvsv4as7mc8i2nwnk2hnsyi2qdj4bq-glibc-2.39-31-dev/include/sys/cdefs.h:638:10
pub const __LDBL_REDIR_DECL = @compileError("unable to translate C expr: unexpected token ''"); // /nix/store/s3pvsv4as7mc8i2nwnk2hnsyi2qdj4bq-glibc-2.39-31-dev/include/sys/cdefs.h:639:10
pub const __glibc_macro_warning1 = @compileError("unable to translate macro: undefined identifier `_Pragma`"); // /nix/store/s3pvsv4as7mc8i2nwnk2hnsyi2qdj4bq-glibc-2.39-31-dev/include/sys/cdefs.h:653:10
pub const __glibc_macro_warning = @compileError("unable to translate macro: undefined identifier `GCC`"); // /nix/store/s3pvsv4as7mc8i2nwnk2hnsyi2qdj4bq-glibc-2.39-31-dev/include/sys/cdefs.h:654:10
pub const __fortified_attr_access = @compileError("unable to translate C expr: unexpected token ''"); // /nix/store/s3pvsv4as7mc8i2nwnk2hnsyi2qdj4bq-glibc-2.39-31-dev/include/sys/cdefs.h:699:11
pub const __attr_access = @compileError("unable to translate C expr: unexpected token ''"); // /nix/store/s3pvsv4as7mc8i2nwnk2hnsyi2qdj4bq-glibc-2.39-31-dev/include/sys/cdefs.h:700:11
pub const __attr_access_none = @compileError("unable to translate C expr: unexpected token ''"); // /nix/store/s3pvsv4as7mc8i2nwnk2hnsyi2qdj4bq-glibc-2.39-31-dev/include/sys/cdefs.h:701:11
pub const __attr_dealloc = @compileError("unable to translate C expr: unexpected token ''"); // /nix/store/s3pvsv4as7mc8i2nwnk2hnsyi2qdj4bq-glibc-2.39-31-dev/include/sys/cdefs.h:711:10
pub const __attribute_returns_twice__ = @compileError("unable to translate macro: undefined identifier `__returns_twice__`"); // /nix/store/s3pvsv4as7mc8i2nwnk2hnsyi2qdj4bq-glibc-2.39-31-dev/include/sys/cdefs.h:718:10
pub const __STD_TYPE = @compileError("unable to translate C expr: unexpected token 'typedef'"); // /nix/store/s3pvsv4as7mc8i2nwnk2hnsyi2qdj4bq-glibc-2.39-31-dev/include/bits/types.h:137:10
pub const __FSID_T_TYPE = @compileError("unable to translate macro: undefined identifier `__val`"); // /nix/store/s3pvsv4as7mc8i2nwnk2hnsyi2qdj4bq-glibc-2.39-31-dev/include/bits/typesizes.h:73:9
pub const BOX2D_INLINE = @compileError("unable to translate C expr: unexpected token 'inline'"); // /home/antaraz/dev/slingshot/box2c/include/box2d/api.h:37:10
pub const B2_ZERO_INIT = @compileError("unable to translate C expr: unexpected token '{'"); // /home/antaraz/dev/slingshot/box2c/include/box2d/id.h:13:10
pub const offsetof = @compileError("unable to translate C expr: unexpected token 'an identifier'"); // /nix/store/ymq0w17q7vy4xf2phd74pqhsyfdmam3s-zig-0.12.0/lib/zig/include/stddef.h:116:9
pub const B2_ARRAY_COUNT = @compileError("unable to translate C expr: expected ')' instead got '['"); // /home/antaraz/dev/slingshot/box2c/include/box2d/types.h:25:9
pub const FLT_EVAL_METHOD = @compileError("unable to translate macro: undefined identifier `__FLT_EVAL_METHOD__`"); // /nix/store/ymq0w17q7vy4xf2phd74pqhsyfdmam3s-zig-0.12.0/lib/zig/include/float.h:91:9
pub const FLT_ROUNDS = @compileError("unable to translate macro: undefined identifier `__builtin_flt_rounds`"); // /nix/store/ymq0w17q7vy4xf2phd74pqhsyfdmam3s-zig-0.12.0/lib/zig/include/float.h:93:9
pub const __CFLOAT32 = @compileError("unable to translate: TODO _Complex"); // /nix/store/s3pvsv4as7mc8i2nwnk2hnsyi2qdj4bq-glibc-2.39-31-dev/include/bits/floatn-common.h:149:12
pub const __CFLOAT64 = @compileError("unable to translate: TODO _Complex"); // /nix/store/s3pvsv4as7mc8i2nwnk2hnsyi2qdj4bq-glibc-2.39-31-dev/include/bits/floatn-common.h:160:13
pub const __CFLOAT32X = @compileError("unable to translate: TODO _Complex"); // /nix/store/s3pvsv4as7mc8i2nwnk2hnsyi2qdj4bq-glibc-2.39-31-dev/include/bits/floatn-common.h:169:12
pub const __CFLOAT64X = @compileError("unable to translate: TODO _Complex"); // /nix/store/s3pvsv4as7mc8i2nwnk2hnsyi2qdj4bq-glibc-2.39-31-dev/include/bits/floatn-common.h:178:13
pub const __builtin_nansf32 = @compileError("unable to translate macro: undefined identifier `__builtin_nansf`"); // /nix/store/s3pvsv4as7mc8i2nwnk2hnsyi2qdj4bq-glibc-2.39-31-dev/include/bits/floatn-common.h:221:12
pub const __builtin_huge_valf64 = @compileError("unable to translate macro: undefined identifier `__builtin_huge_val`"); // /nix/store/s3pvsv4as7mc8i2nwnk2hnsyi2qdj4bq-glibc-2.39-31-dev/include/bits/floatn-common.h:255:13
pub const __builtin_inff64 = @compileError("unable to translate macro: undefined identifier `__builtin_inf`"); // /nix/store/s3pvsv4as7mc8i2nwnk2hnsyi2qdj4bq-glibc-2.39-31-dev/include/bits/floatn-common.h:256:13
pub const __builtin_nanf64 = @compileError("unable to translate macro: undefined identifier `__builtin_nan`"); // /nix/store/s3pvsv4as7mc8i2nwnk2hnsyi2qdj4bq-glibc-2.39-31-dev/include/bits/floatn-common.h:257:13
pub const __builtin_nansf64 = @compileError("unable to translate macro: undefined identifier `__builtin_nans`"); // /nix/store/s3pvsv4as7mc8i2nwnk2hnsyi2qdj4bq-glibc-2.39-31-dev/include/bits/floatn-common.h:258:13
pub const __builtin_huge_valf32x = @compileError("unable to translate macro: undefined identifier `__builtin_huge_val`"); // /nix/store/s3pvsv4as7mc8i2nwnk2hnsyi2qdj4bq-glibc-2.39-31-dev/include/bits/floatn-common.h:272:12
pub const __builtin_inff32x = @compileError("unable to translate macro: undefined identifier `__builtin_inf`"); // /nix/store/s3pvsv4as7mc8i2nwnk2hnsyi2qdj4bq-glibc-2.39-31-dev/include/bits/floatn-common.h:273:12
pub const __builtin_nanf32x = @compileError("unable to translate macro: undefined identifier `__builtin_nan`"); // /nix/store/s3pvsv4as7mc8i2nwnk2hnsyi2qdj4bq-glibc-2.39-31-dev/include/bits/floatn-common.h:274:12
pub const __builtin_nansf32x = @compileError("unable to translate macro: undefined identifier `__builtin_nans`"); // /nix/store/s3pvsv4as7mc8i2nwnk2hnsyi2qdj4bq-glibc-2.39-31-dev/include/bits/floatn-common.h:275:12
pub const __builtin_huge_valf64x = @compileError("unable to translate macro: undefined identifier `__builtin_huge_vall`"); // /nix/store/s3pvsv4as7mc8i2nwnk2hnsyi2qdj4bq-glibc-2.39-31-dev/include/bits/floatn-common.h:289:13
pub const __builtin_inff64x = @compileError("unable to translate macro: undefined identifier `__builtin_infl`"); // /nix/store/s3pvsv4as7mc8i2nwnk2hnsyi2qdj4bq-glibc-2.39-31-dev/include/bits/floatn-common.h:290:13
pub const __builtin_nanf64x = @compileError("unable to translate macro: undefined identifier `__builtin_nanl`"); // /nix/store/s3pvsv4as7mc8i2nwnk2hnsyi2qdj4bq-glibc-2.39-31-dev/include/bits/floatn-common.h:291:13
pub const __builtin_nansf64x = @compileError("unable to translate macro: undefined identifier `__builtin_nansl`"); // /nix/store/s3pvsv4as7mc8i2nwnk2hnsyi2qdj4bq-glibc-2.39-31-dev/include/bits/floatn-common.h:292:13
pub const HUGE_VAL = @compileError("unable to translate macro: undefined identifier `__builtin_huge_val`"); // /nix/store/s3pvsv4as7mc8i2nwnk2hnsyi2qdj4bq-glibc-2.39-31-dev/include/math.h:48:10
pub const HUGE_VALL = @compileError("unable to translate macro: undefined identifier `__builtin_huge_vall`"); // /nix/store/s3pvsv4as7mc8i2nwnk2hnsyi2qdj4bq-glibc-2.39-31-dev/include/math.h:60:11
pub const __GLIBC_FLT_EVAL_METHOD = @compileError("unable to translate macro: undefined identifier `__FLT_EVAL_METHOD__`"); // /nix/store/s3pvsv4as7mc8i2nwnk2hnsyi2qdj4bq-glibc-2.39-31-dev/include/bits/flt-eval-method.h:27:11
pub const __SIMD_DECL = @compileError("unable to translate macro: undefined identifier `__DECL_SIMD_`"); // /nix/store/s3pvsv4as7mc8i2nwnk2hnsyi2qdj4bq-glibc-2.39-31-dev/include/math.h:276:9
pub const __MATHDECL = @compileError("unable to translate macro: undefined identifier `__`"); // /nix/store/s3pvsv4as7mc8i2nwnk2hnsyi2qdj4bq-glibc-2.39-31-dev/include/math.h:288:9
pub const __MATHDECLX = @compileError("unable to translate macro: undefined identifier `__`"); // /nix/store/s3pvsv4as7mc8i2nwnk2hnsyi2qdj4bq-glibc-2.39-31-dev/include/math.h:293:9
pub const __MATHDECL_1_IMPL = @compileError("unable to translate C expr: unexpected token 'extern'"); // /nix/store/s3pvsv4as7mc8i2nwnk2hnsyi2qdj4bq-glibc-2.39-31-dev/include/math.h:296:9
pub const __MATHREDIR = @compileError("unable to translate C expr: unexpected token 'extern'"); // /nix/store/s3pvsv4as7mc8i2nwnk2hnsyi2qdj4bq-glibc-2.39-31-dev/include/math.h:305:9
pub const __MATHCALL_NARROW_ARGS_1 = @compileError("unable to translate macro: undefined identifier `_Marg_`"); // /nix/store/s3pvsv4as7mc8i2nwnk2hnsyi2qdj4bq-glibc-2.39-31-dev/include/math.h:550:9
pub const __MATHCALL_NARROW_ARGS_2 = @compileError("unable to translate macro: undefined identifier `_Marg_`"); // /nix/store/s3pvsv4as7mc8i2nwnk2hnsyi2qdj4bq-glibc-2.39-31-dev/include/math.h:551:9
pub const __MATHCALL_NARROW_ARGS_3 = @compileError("unable to translate macro: undefined identifier `_Marg_`"); // /nix/store/s3pvsv4as7mc8i2nwnk2hnsyi2qdj4bq-glibc-2.39-31-dev/include/math.h:552:9
pub const __MATHCALL_NARROW_NORMAL = @compileError("unable to translate macro: undefined identifier `_Mret_`"); // /nix/store/s3pvsv4as7mc8i2nwnk2hnsyi2qdj4bq-glibc-2.39-31-dev/include/math.h:553:9
pub const __MATHCALL_NARROW_REDIR = @compileError("unable to translate macro: undefined identifier `_Mret_`"); // /nix/store/s3pvsv4as7mc8i2nwnk2hnsyi2qdj4bq-glibc-2.39-31-dev/include/math.h:555:9
pub const __MATH_TG = @compileError("unable to translate macro: undefined identifier `f`"); // /nix/store/s3pvsv4as7mc8i2nwnk2hnsyi2qdj4bq-glibc-2.39-31-dev/include/math.h:922:10
pub const fpclassify = @compileError("unable to translate macro: undefined identifier `__builtin_fpclassify`"); // /nix/store/s3pvsv4as7mc8i2nwnk2hnsyi2qdj4bq-glibc-2.39-31-dev/include/math.h:967:11
pub const isfinite = @compileError("unable to translate macro: undefined identifier `__builtin_isfinite`"); // /nix/store/s3pvsv4as7mc8i2nwnk2hnsyi2qdj4bq-glibc-2.39-31-dev/include/math.h:994:11
pub const isnormal = @compileError("unable to translate macro: undefined identifier `__builtin_isnormal`"); // /nix/store/s3pvsv4as7mc8i2nwnk2hnsyi2qdj4bq-glibc-2.39-31-dev/include/math.h:1002:11
pub const isgreater = @compileError("unable to translate macro: undefined identifier `__builtin_isgreater`"); // /nix/store/s3pvsv4as7mc8i2nwnk2hnsyi2qdj4bq-glibc-2.39-31-dev/include/math.h:1306:11
pub const isgreaterequal = @compileError("unable to translate macro: undefined identifier `__builtin_isgreaterequal`"); // /nix/store/s3pvsv4as7mc8i2nwnk2hnsyi2qdj4bq-glibc-2.39-31-dev/include/math.h:1307:11
pub const isless = @compileError("unable to translate macro: undefined identifier `__builtin_isless`"); // /nix/store/s3pvsv4as7mc8i2nwnk2hnsyi2qdj4bq-glibc-2.39-31-dev/include/math.h:1308:11
pub const islessequal = @compileError("unable to translate macro: undefined identifier `__builtin_islessequal`"); // /nix/store/s3pvsv4as7mc8i2nwnk2hnsyi2qdj4bq-glibc-2.39-31-dev/include/math.h:1309:11
pub const islessgreater = @compileError("unable to translate macro: undefined identifier `__builtin_islessgreater`"); // /nix/store/s3pvsv4as7mc8i2nwnk2hnsyi2qdj4bq-glibc-2.39-31-dev/include/math.h:1310:11
pub const isunordered = @compileError("unable to translate macro: undefined identifier `__builtin_isunordered`"); // /nix/store/s3pvsv4as7mc8i2nwnk2hnsyi2qdj4bq-glibc-2.39-31-dev/include/math.h:1311:11
pub const b2TracyCZoneC = @compileError("unable to translate C expr: unexpected token ''"); // /home/antaraz/dev/slingshot/box2c/include/box2d/timer.h:41:9
pub const b2TracyCZoneNC = @compileError("unable to translate C expr: unexpected token ''"); // /home/antaraz/dev/slingshot/box2c/include/box2d/timer.h:42:9
pub const b2TracyCZoneEnd = @compileError("unable to translate C expr: unexpected token ''"); // /home/antaraz/dev/slingshot/box2c/include/box2d/timer.h:43:9
pub const __llvm__ = @as(c_int, 1);
pub const __clang__ = @as(c_int, 1);
pub const __clang_major__ = @as(c_int, 17);
pub const __clang_minor__ = @as(c_int, 0);
pub const __clang_patchlevel__ = @as(c_int, 6);
pub const __clang_version__ = "17.0.6 ";
pub const __GNUC__ = @as(c_int, 4);
pub const __GNUC_MINOR__ = @as(c_int, 2);
pub const __GNUC_PATCHLEVEL__ = @as(c_int, 1);
pub const __GXX_ABI_VERSION = @as(c_int, 1002);
pub const __ATOMIC_RELAXED = @as(c_int, 0);
pub const __ATOMIC_CONSUME = @as(c_int, 1);
pub const __ATOMIC_ACQUIRE = @as(c_int, 2);
pub const __ATOMIC_RELEASE = @as(c_int, 3);
pub const __ATOMIC_ACQ_REL = @as(c_int, 4);
pub const __ATOMIC_SEQ_CST = @as(c_int, 5);
pub const __OPENCL_MEMORY_SCOPE_WORK_ITEM = @as(c_int, 0);
pub const __OPENCL_MEMORY_SCOPE_WORK_GROUP = @as(c_int, 1);
pub const __OPENCL_MEMORY_SCOPE_DEVICE = @as(c_int, 2);
pub const __OPENCL_MEMORY_SCOPE_ALL_SVM_DEVICES = @as(c_int, 3);
pub const __OPENCL_MEMORY_SCOPE_SUB_GROUP = @as(c_int, 4);
pub const __FPCLASS_SNAN = @as(c_int, 0x0001);
pub const __FPCLASS_QNAN = @as(c_int, 0x0002);
pub const __FPCLASS_NEGINF = @as(c_int, 0x0004);
pub const __FPCLASS_NEGNORMAL = @as(c_int, 0x0008);
pub const __FPCLASS_NEGSUBNORMAL = @as(c_int, 0x0010);
pub const __FPCLASS_NEGZERO = @as(c_int, 0x0020);
pub const __FPCLASS_POSZERO = @as(c_int, 0x0040);
pub const __FPCLASS_POSSUBNORMAL = @as(c_int, 0x0080);
pub const __FPCLASS_POSNORMAL = @as(c_int, 0x0100);
pub const __FPCLASS_POSINF = @as(c_int, 0x0200);
pub const __PRAGMA_REDEFINE_EXTNAME = @as(c_int, 1);
pub const __VERSION__ = "Clang 17.0.6";
pub const __OBJC_BOOL_IS_BOOL = @as(c_int, 0);
pub const __CONSTANT_CFSTRINGS__ = @as(c_int, 1);
pub const __clang_literal_encoding__ = "UTF-8";
pub const __clang_wide_literal_encoding__ = "UTF-32";
pub const __ORDER_LITTLE_ENDIAN__ = @as(c_int, 1234);
pub const __ORDER_BIG_ENDIAN__ = @as(c_int, 4321);
pub const __ORDER_PDP_ENDIAN__ = @as(c_int, 3412);
pub const __BYTE_ORDER__ = __ORDER_LITTLE_ENDIAN__;
pub const __LITTLE_ENDIAN__ = @as(c_int, 1);
pub const _LP64 = @as(c_int, 1);
pub const __LP64__ = @as(c_int, 1);
pub const __CHAR_BIT__ = @as(c_int, 8);
pub const __BOOL_WIDTH__ = @as(c_int, 8);
pub const __SHRT_WIDTH__ = @as(c_int, 16);
pub const __INT_WIDTH__ = @as(c_int, 32);
pub const __LONG_WIDTH__ = @as(c_int, 64);
pub const __LLONG_WIDTH__ = @as(c_int, 64);
pub const __BITINT_MAXWIDTH__ = @import("std").zig.c_translation.promoteIntLiteral(c_int, 8388608, .decimal);
pub const __SCHAR_MAX__ = @as(c_int, 127);
pub const __SHRT_MAX__ = @as(c_int, 32767);
pub const __INT_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_int, 2147483647, .decimal);
pub const __LONG_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_long, 9223372036854775807, .decimal);
pub const __LONG_LONG_MAX__ = @as(c_longlong, 9223372036854775807);
pub const __WCHAR_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_int, 2147483647, .decimal);
pub const __WCHAR_WIDTH__ = @as(c_int, 32);
pub const __WINT_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_uint, 4294967295, .decimal);
pub const __WINT_WIDTH__ = @as(c_int, 32);
pub const __INTMAX_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_long, 9223372036854775807, .decimal);
pub const __INTMAX_WIDTH__ = @as(c_int, 64);
pub const __SIZE_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_ulong, 18446744073709551615, .decimal);
pub const __SIZE_WIDTH__ = @as(c_int, 64);
pub const __UINTMAX_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_ulong, 18446744073709551615, .decimal);
pub const __UINTMAX_WIDTH__ = @as(c_int, 64);
pub const __PTRDIFF_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_long, 9223372036854775807, .decimal);
pub const __PTRDIFF_WIDTH__ = @as(c_int, 64);
pub const __INTPTR_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_long, 9223372036854775807, .decimal);
pub const __INTPTR_WIDTH__ = @as(c_int, 64);
pub const __UINTPTR_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_ulong, 18446744073709551615, .decimal);
pub const __UINTPTR_WIDTH__ = @as(c_int, 64);
pub const __SIZEOF_DOUBLE__ = @as(c_int, 8);
pub const __SIZEOF_FLOAT__ = @as(c_int, 4);
pub const __SIZEOF_INT__ = @as(c_int, 4);
pub const __SIZEOF_LONG__ = @as(c_int, 8);
pub const __SIZEOF_LONG_DOUBLE__ = @as(c_int, 16);
pub const __SIZEOF_LONG_LONG__ = @as(c_int, 8);
pub const __SIZEOF_POINTER__ = @as(c_int, 8);
pub const __SIZEOF_SHORT__ = @as(c_int, 2);
pub const __SIZEOF_PTRDIFF_T__ = @as(c_int, 8);
pub const __SIZEOF_SIZE_T__ = @as(c_int, 8);
pub const __SIZEOF_WCHAR_T__ = @as(c_int, 4);
pub const __SIZEOF_WINT_T__ = @as(c_int, 4);
pub const __SIZEOF_INT128__ = @as(c_int, 16);
pub const __INTMAX_TYPE__ = c_long;
pub const __INTMAX_FMTd__ = "ld";
pub const __INTMAX_FMTi__ = "li";
pub const __UINTMAX_TYPE__ = c_ulong;
pub const __UINTMAX_FMTo__ = "lo";
pub const __UINTMAX_FMTu__ = "lu";
pub const __UINTMAX_FMTx__ = "lx";
pub const __UINTMAX_FMTX__ = "lX";
pub const __PTRDIFF_TYPE__ = c_long;
pub const __PTRDIFF_FMTd__ = "ld";
pub const __PTRDIFF_FMTi__ = "li";
pub const __INTPTR_TYPE__ = c_long;
pub const __INTPTR_FMTd__ = "ld";
pub const __INTPTR_FMTi__ = "li";
pub const __SIZE_TYPE__ = c_ulong;
pub const __SIZE_FMTo__ = "lo";
pub const __SIZE_FMTu__ = "lu";
pub const __SIZE_FMTx__ = "lx";
pub const __SIZE_FMTX__ = "lX";
pub const __WCHAR_TYPE__ = c_int;
pub const __WINT_TYPE__ = c_uint;
pub const __SIG_ATOMIC_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_int, 2147483647, .decimal);
pub const __SIG_ATOMIC_WIDTH__ = @as(c_int, 32);
pub const __CHAR16_TYPE__ = c_ushort;
pub const __CHAR32_TYPE__ = c_uint;
pub const __UINTPTR_TYPE__ = c_ulong;
pub const __UINTPTR_FMTo__ = "lo";
pub const __UINTPTR_FMTu__ = "lu";
pub const __UINTPTR_FMTx__ = "lx";
pub const __UINTPTR_FMTX__ = "lX";
pub const __FLT16_DENORM_MIN__ = @as(f16, 5.9604644775390625e-8);
pub const __FLT16_HAS_DENORM__ = @as(c_int, 1);
pub const __FLT16_DIG__ = @as(c_int, 3);
pub const __FLT16_DECIMAL_DIG__ = @as(c_int, 5);
pub const __FLT16_EPSILON__ = @as(f16, 9.765625e-4);
pub const __FLT16_HAS_INFINITY__ = @as(c_int, 1);
pub const __FLT16_HAS_QUIET_NAN__ = @as(c_int, 1);
pub const __FLT16_MANT_DIG__ = @as(c_int, 11);
pub const __FLT16_MAX_10_EXP__ = @as(c_int, 4);
pub const __FLT16_MAX_EXP__ = @as(c_int, 16);
pub const __FLT16_MAX__ = @as(f16, 6.5504e+4);
pub const __FLT16_MIN_10_EXP__ = -@as(c_int, 4);
pub const __FLT16_MIN_EXP__ = -@as(c_int, 13);
pub const __FLT16_MIN__ = @as(f16, 6.103515625e-5);
pub const __FLT_DENORM_MIN__ = @as(f32, 1.40129846e-45);
pub const __FLT_HAS_DENORM__ = @as(c_int, 1);
pub const __FLT_DIG__ = @as(c_int, 6);
pub const __FLT_DECIMAL_DIG__ = @as(c_int, 9);
pub const __FLT_EPSILON__ = @as(f32, 1.19209290e-7);
pub const __FLT_HAS_INFINITY__ = @as(c_int, 1);
pub const __FLT_HAS_QUIET_NAN__ = @as(c_int, 1);
pub const __FLT_MANT_DIG__ = @as(c_int, 24);
pub const __FLT_MAX_10_EXP__ = @as(c_int, 38);
pub const __FLT_MAX_EXP__ = @as(c_int, 128);
pub const __FLT_MAX__ = @as(f32, 3.40282347e+38);
pub const __FLT_MIN_10_EXP__ = -@as(c_int, 37);
pub const __FLT_MIN_EXP__ = -@as(c_int, 125);
pub const __FLT_MIN__ = @as(f32, 1.17549435e-38);
pub const __DBL_DENORM_MIN__ = @as(f64, 4.9406564584124654e-324);
pub const __DBL_HAS_DENORM__ = @as(c_int, 1);
pub const __DBL_DIG__ = @as(c_int, 15);
pub const __DBL_DECIMAL_DIG__ = @as(c_int, 17);
pub const __DBL_EPSILON__ = @as(f64, 2.2204460492503131e-16);
pub const __DBL_HAS_INFINITY__ = @as(c_int, 1);
pub const __DBL_HAS_QUIET_NAN__ = @as(c_int, 1);
pub const __DBL_MANT_DIG__ = @as(c_int, 53);
pub const __DBL_MAX_10_EXP__ = @as(c_int, 308);
pub const __DBL_MAX_EXP__ = @as(c_int, 1024);
pub const __DBL_MAX__ = @as(f64, 1.7976931348623157e+308);
pub const __DBL_MIN_10_EXP__ = -@as(c_int, 307);
pub const __DBL_MIN_EXP__ = -@as(c_int, 1021);
pub const __DBL_MIN__ = @as(f64, 2.2250738585072014e-308);
pub const __LDBL_DENORM_MIN__ = @as(c_longdouble, 3.64519953188247460253e-4951);
pub const __LDBL_HAS_DENORM__ = @as(c_int, 1);
pub const __LDBL_DIG__ = @as(c_int, 18);
pub const __LDBL_DECIMAL_DIG__ = @as(c_int, 21);
pub const __LDBL_EPSILON__ = @as(c_longdouble, 1.08420217248550443401e-19);
pub const __LDBL_HAS_INFINITY__ = @as(c_int, 1);
pub const __LDBL_HAS_QUIET_NAN__ = @as(c_int, 1);
pub const __LDBL_MANT_DIG__ = @as(c_int, 64);
pub const __LDBL_MAX_10_EXP__ = @as(c_int, 4932);
pub const __LDBL_MAX_EXP__ = @as(c_int, 16384);
pub const __LDBL_MAX__ = @as(c_longdouble, 1.18973149535723176502e+4932);
pub const __LDBL_MIN_10_EXP__ = -@as(c_int, 4931);
pub const __LDBL_MIN_EXP__ = -@as(c_int, 16381);
pub const __LDBL_MIN__ = @as(c_longdouble, 3.36210314311209350626e-4932);
pub const __POINTER_WIDTH__ = @as(c_int, 64);
pub const __BIGGEST_ALIGNMENT__ = @as(c_int, 16);
pub const __WINT_UNSIGNED__ = @as(c_int, 1);
pub const __INT8_TYPE__ = i8;
pub const __INT8_FMTd__ = "hhd";
pub const __INT8_FMTi__ = "hhi";
pub const __INT8_C_SUFFIX__ = "";
pub const __INT16_TYPE__ = c_short;
pub const __INT16_FMTd__ = "hd";
pub const __INT16_FMTi__ = "hi";
pub const __INT16_C_SUFFIX__ = "";
pub const __INT32_TYPE__ = c_int;
pub const __INT32_FMTd__ = "d";
pub const __INT32_FMTi__ = "i";
pub const __INT32_C_SUFFIX__ = "";
pub const __INT64_TYPE__ = c_long;
pub const __INT64_FMTd__ = "ld";
pub const __INT64_FMTi__ = "li";
pub const __UINT8_TYPE__ = u8;
pub const __UINT8_FMTo__ = "hho";
pub const __UINT8_FMTu__ = "hhu";
pub const __UINT8_FMTx__ = "hhx";
pub const __UINT8_FMTX__ = "hhX";
pub const __UINT8_C_SUFFIX__ = "";
pub const __UINT8_MAX__ = @as(c_int, 255);
pub const __INT8_MAX__ = @as(c_int, 127);
pub const __UINT16_TYPE__ = c_ushort;
pub const __UINT16_FMTo__ = "ho";
pub const __UINT16_FMTu__ = "hu";
pub const __UINT16_FMTx__ = "hx";
pub const __UINT16_FMTX__ = "hX";
pub const __UINT16_C_SUFFIX__ = "";
pub const __UINT16_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_int, 65535, .decimal);
pub const __INT16_MAX__ = @as(c_int, 32767);
pub const __UINT32_TYPE__ = c_uint;
pub const __UINT32_FMTo__ = "o";
pub const __UINT32_FMTu__ = "u";
pub const __UINT32_FMTx__ = "x";
pub const __UINT32_FMTX__ = "X";
pub const __UINT32_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_uint, 4294967295, .decimal);
pub const __INT32_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_int, 2147483647, .decimal);
pub const __UINT64_TYPE__ = c_ulong;
pub const __UINT64_FMTo__ = "lo";
pub const __UINT64_FMTu__ = "lu";
pub const __UINT64_FMTx__ = "lx";
pub const __UINT64_FMTX__ = "lX";
pub const __UINT64_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_ulong, 18446744073709551615, .decimal);
pub const __INT64_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_long, 9223372036854775807, .decimal);
pub const __INT_LEAST8_TYPE__ = i8;
pub const __INT_LEAST8_MAX__ = @as(c_int, 127);
pub const __INT_LEAST8_WIDTH__ = @as(c_int, 8);
pub const __INT_LEAST8_FMTd__ = "hhd";
pub const __INT_LEAST8_FMTi__ = "hhi";
pub const __UINT_LEAST8_TYPE__ = u8;
pub const __UINT_LEAST8_MAX__ = @as(c_int, 255);
pub const __UINT_LEAST8_FMTo__ = "hho";
pub const __UINT_LEAST8_FMTu__ = "hhu";
pub const __UINT_LEAST8_FMTx__ = "hhx";
pub const __UINT_LEAST8_FMTX__ = "hhX";
pub const __INT_LEAST16_TYPE__ = c_short;
pub const __INT_LEAST16_MAX__ = @as(c_int, 32767);
pub const __INT_LEAST16_WIDTH__ = @as(c_int, 16);
pub const __INT_LEAST16_FMTd__ = "hd";
pub const __INT_LEAST16_FMTi__ = "hi";
pub const __UINT_LEAST16_TYPE__ = c_ushort;
pub const __UINT_LEAST16_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_int, 65535, .decimal);
pub const __UINT_LEAST16_FMTo__ = "ho";
pub const __UINT_LEAST16_FMTu__ = "hu";
pub const __UINT_LEAST16_FMTx__ = "hx";
pub const __UINT_LEAST16_FMTX__ = "hX";
pub const __INT_LEAST32_TYPE__ = c_int;
pub const __INT_LEAST32_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_int, 2147483647, .decimal);
pub const __INT_LEAST32_WIDTH__ = @as(c_int, 32);
pub const __INT_LEAST32_FMTd__ = "d";
pub const __INT_LEAST32_FMTi__ = "i";
pub const __UINT_LEAST32_TYPE__ = c_uint;
pub const __UINT_LEAST32_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_uint, 4294967295, .decimal);
pub const __UINT_LEAST32_FMTo__ = "o";
pub const __UINT_LEAST32_FMTu__ = "u";
pub const __UINT_LEAST32_FMTx__ = "x";
pub const __UINT_LEAST32_FMTX__ = "X";
pub const __INT_LEAST64_TYPE__ = c_long;
pub const __INT_LEAST64_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_long, 9223372036854775807, .decimal);
pub const __INT_LEAST64_WIDTH__ = @as(c_int, 64);
pub const __INT_LEAST64_FMTd__ = "ld";
pub const __INT_LEAST64_FMTi__ = "li";
pub const __UINT_LEAST64_TYPE__ = c_ulong;
pub const __UINT_LEAST64_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_ulong, 18446744073709551615, .decimal);
pub const __UINT_LEAST64_FMTo__ = "lo";
pub const __UINT_LEAST64_FMTu__ = "lu";
pub const __UINT_LEAST64_FMTx__ = "lx";
pub const __UINT_LEAST64_FMTX__ = "lX";
pub const __INT_FAST8_TYPE__ = i8;
pub const __INT_FAST8_MAX__ = @as(c_int, 127);
pub const __INT_FAST8_WIDTH__ = @as(c_int, 8);
pub const __INT_FAST8_FMTd__ = "hhd";
pub const __INT_FAST8_FMTi__ = "hhi";
pub const __UINT_FAST8_TYPE__ = u8;
pub const __UINT_FAST8_MAX__ = @as(c_int, 255);
pub const __UINT_FAST8_FMTo__ = "hho";
pub const __UINT_FAST8_FMTu__ = "hhu";
pub const __UINT_FAST8_FMTx__ = "hhx";
pub const __UINT_FAST8_FMTX__ = "hhX";
pub const __INT_FAST16_TYPE__ = c_short;
pub const __INT_FAST16_MAX__ = @as(c_int, 32767);
pub const __INT_FAST16_WIDTH__ = @as(c_int, 16);
pub const __INT_FAST16_FMTd__ = "hd";
pub const __INT_FAST16_FMTi__ = "hi";
pub const __UINT_FAST16_TYPE__ = c_ushort;
pub const __UINT_FAST16_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_int, 65535, .decimal);
pub const __UINT_FAST16_FMTo__ = "ho";
pub const __UINT_FAST16_FMTu__ = "hu";
pub const __UINT_FAST16_FMTx__ = "hx";
pub const __UINT_FAST16_FMTX__ = "hX";
pub const __INT_FAST32_TYPE__ = c_int;
pub const __INT_FAST32_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_int, 2147483647, .decimal);
pub const __INT_FAST32_WIDTH__ = @as(c_int, 32);
pub const __INT_FAST32_FMTd__ = "d";
pub const __INT_FAST32_FMTi__ = "i";
pub const __UINT_FAST32_TYPE__ = c_uint;
pub const __UINT_FAST32_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_uint, 4294967295, .decimal);
pub const __UINT_FAST32_FMTo__ = "o";
pub const __UINT_FAST32_FMTu__ = "u";
pub const __UINT_FAST32_FMTx__ = "x";
pub const __UINT_FAST32_FMTX__ = "X";
pub const __INT_FAST64_TYPE__ = c_long;
pub const __INT_FAST64_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_long, 9223372036854775807, .decimal);
pub const __INT_FAST64_WIDTH__ = @as(c_int, 64);
pub const __INT_FAST64_FMTd__ = "ld";
pub const __INT_FAST64_FMTi__ = "li";
pub const __UINT_FAST64_TYPE__ = c_ulong;
pub const __UINT_FAST64_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_ulong, 18446744073709551615, .decimal);
pub const __UINT_FAST64_FMTo__ = "lo";
pub const __UINT_FAST64_FMTu__ = "lu";
pub const __UINT_FAST64_FMTx__ = "lx";
pub const __UINT_FAST64_FMTX__ = "lX";
pub const __USER_LABEL_PREFIX__ = "";
pub const __FINITE_MATH_ONLY__ = @as(c_int, 0);
pub const __GNUC_STDC_INLINE__ = @as(c_int, 1);
pub const __GCC_ATOMIC_TEST_AND_SET_TRUEVAL = @as(c_int, 1);
pub const __CLANG_ATOMIC_BOOL_LOCK_FREE = @as(c_int, 2);
pub const __CLANG_ATOMIC_CHAR_LOCK_FREE = @as(c_int, 2);
pub const __CLANG_ATOMIC_CHAR16_T_LOCK_FREE = @as(c_int, 2);
pub const __CLANG_ATOMIC_CHAR32_T_LOCK_FREE = @as(c_int, 2);
pub const __CLANG_ATOMIC_WCHAR_T_LOCK_FREE = @as(c_int, 2);
pub const __CLANG_ATOMIC_SHORT_LOCK_FREE = @as(c_int, 2);
pub const __CLANG_ATOMIC_INT_LOCK_FREE = @as(c_int, 2);
pub const __CLANG_ATOMIC_LONG_LOCK_FREE = @as(c_int, 2);
pub const __CLANG_ATOMIC_LLONG_LOCK_FREE = @as(c_int, 2);
pub const __CLANG_ATOMIC_POINTER_LOCK_FREE = @as(c_int, 2);
pub const __GCC_ATOMIC_BOOL_LOCK_FREE = @as(c_int, 2);
pub const __GCC_ATOMIC_CHAR_LOCK_FREE = @as(c_int, 2);
pub const __GCC_ATOMIC_CHAR16_T_LOCK_FREE = @as(c_int, 2);
pub const __GCC_ATOMIC_CHAR32_T_LOCK_FREE = @as(c_int, 2);
pub const __GCC_ATOMIC_WCHAR_T_LOCK_FREE = @as(c_int, 2);
pub const __GCC_ATOMIC_SHORT_LOCK_FREE = @as(c_int, 2);
pub const __GCC_ATOMIC_INT_LOCK_FREE = @as(c_int, 2);
pub const __GCC_ATOMIC_LONG_LOCK_FREE = @as(c_int, 2);
pub const __GCC_ATOMIC_LLONG_LOCK_FREE = @as(c_int, 2);
pub const __GCC_ATOMIC_POINTER_LOCK_FREE = @as(c_int, 2);
pub const __NO_INLINE__ = @as(c_int, 1);
pub const __PIC__ = @as(c_int, 2);
pub const __pic__ = @as(c_int, 2);
pub const __FLT_RADIX__ = @as(c_int, 2);
pub const __DECIMAL_DIG__ = __LDBL_DECIMAL_DIG__;
pub const __SSP_STRONG__ = @as(c_int, 2);
pub const __ELF__ = @as(c_int, 1);
pub const __GCC_ASM_FLAG_OUTPUTS__ = @as(c_int, 1);
pub const __code_model_small__ = @as(c_int, 1);
pub const __amd64__ = @as(c_int, 1);
pub const __amd64 = @as(c_int, 1);
pub const __x86_64 = @as(c_int, 1);
pub const __x86_64__ = @as(c_int, 1);
pub const __SEG_GS = @as(c_int, 1);
pub const __SEG_FS = @as(c_int, 1);
pub const __znver3 = @as(c_int, 1);
pub const __znver3__ = @as(c_int, 1);
pub const __tune_znver3__ = @as(c_int, 1);
pub const __REGISTER_PREFIX__ = "";
pub const __NO_MATH_INLINES = @as(c_int, 1);
pub const __AES__ = @as(c_int, 1);
pub const __VAES__ = @as(c_int, 1);
pub const __PCLMUL__ = @as(c_int, 1);
pub const __VPCLMULQDQ__ = @as(c_int, 1);
pub const __LAHF_SAHF__ = @as(c_int, 1);
pub const __LZCNT__ = @as(c_int, 1);
pub const __RDRND__ = @as(c_int, 1);
pub const __FSGSBASE__ = @as(c_int, 1);
pub const __BMI__ = @as(c_int, 1);
pub const __BMI2__ = @as(c_int, 1);
pub const __POPCNT__ = @as(c_int, 1);
pub const __PRFCHW__ = @as(c_int, 1);
pub const __RDSEED__ = @as(c_int, 1);
pub const __ADX__ = @as(c_int, 1);
pub const __MWAITX__ = @as(c_int, 1);
pub const __MOVBE__ = @as(c_int, 1);
pub const __SSE4A__ = @as(c_int, 1);
pub const __FMA__ = @as(c_int, 1);
pub const __F16C__ = @as(c_int, 1);
pub const __SHA__ = @as(c_int, 1);
pub const __FXSR__ = @as(c_int, 1);
pub const __XSAVE__ = @as(c_int, 1);
pub const __XSAVEOPT__ = @as(c_int, 1);
pub const __XSAVEC__ = @as(c_int, 1);
pub const __XSAVES__ = @as(c_int, 1);
pub const __PKU__ = @as(c_int, 1);
pub const __CLFLUSHOPT__ = @as(c_int, 1);
pub const __CLWB__ = @as(c_int, 1);
pub const __WBNOINVD__ = @as(c_int, 1);
pub const __SHSTK__ = @as(c_int, 1);
pub const __CLZERO__ = @as(c_int, 1);
pub const __RDPID__ = @as(c_int, 1);
pub const __RDPRU__ = @as(c_int, 1);
pub const __INVPCID__ = @as(c_int, 1);
pub const __CRC32__ = @as(c_int, 1);
pub const __AVX2__ = @as(c_int, 1);
pub const __AVX__ = @as(c_int, 1);
pub const __SSE4_2__ = @as(c_int, 1);
pub const __SSE4_1__ = @as(c_int, 1);
pub const __SSSE3__ = @as(c_int, 1);
pub const __SSE3__ = @as(c_int, 1);
pub const __SSE2__ = @as(c_int, 1);
pub const __SSE2_MATH__ = @as(c_int, 1);
pub const __SSE__ = @as(c_int, 1);
pub const __SSE_MATH__ = @as(c_int, 1);
pub const __MMX__ = @as(c_int, 1);
pub const __GCC_HAVE_SYNC_COMPARE_AND_SWAP_1 = @as(c_int, 1);
pub const __GCC_HAVE_SYNC_COMPARE_AND_SWAP_2 = @as(c_int, 1);
pub const __GCC_HAVE_SYNC_COMPARE_AND_SWAP_4 = @as(c_int, 1);
pub const __GCC_HAVE_SYNC_COMPARE_AND_SWAP_8 = @as(c_int, 1);
pub const __GCC_HAVE_SYNC_COMPARE_AND_SWAP_16 = @as(c_int, 1);
pub const __SIZEOF_FLOAT128__ = @as(c_int, 16);
pub const unix = @as(c_int, 1);
pub const __unix = @as(c_int, 1);
pub const __unix__ = @as(c_int, 1);
pub const linux = @as(c_int, 1);
pub const __linux = @as(c_int, 1);
pub const __linux__ = @as(c_int, 1);
pub const __gnu_linux__ = @as(c_int, 1);
pub const __FLOAT128__ = @as(c_int, 1);
pub const __STDC__ = @as(c_int, 1);
pub const __STDC_HOSTED__ = @as(c_int, 1);
pub const __STDC_VERSION__ = @as(c_long, 201710);
pub const __STDC_UTF_16__ = @as(c_int, 1);
pub const __STDC_UTF_32__ = @as(c_int, 1);
pub const _LIBCPP_DISABLE_VISIBILITY_ANNOTATIONS = @as(c_int, 1);
pub const _LIBCXXABI_DISABLE_VISIBILITY_ANNOTATIONS = @as(c_int, 1);
pub const _LIBCPP_HAS_NO_VENDOR_AVAILABILITY_ANNOTATIONS = @as(c_int, 1);
pub const _LIBCPP_PSTL_CPU_BACKEND_SERIAL = @as(c_int, 1);
pub const _LIBCPP_ABI_VERSION = @as(c_int, 1);
pub const __GLIBC_MINOR__ = @as(c_int, 39);
pub const _DEBUG = @as(c_int, 1);
pub const CIMGUI_DEFINE_ENUMS_AND_STRUCTS = @as(c_int, 1);
pub const __GCC_HAVE_DWARF2_CFI_ASM = @as(c_int, 1);
pub const _LIBCPP_STDINT_H = "";
pub const _LIBCPP___CONFIG = "";
pub const _LIBCPP_COMPILER_CLANG_BASED = "";
pub const _LIBCPP_CLANG_VER = (__clang_major__ * @as(c_int, 100)) + __clang_minor__;
pub const __CLANG_STDINT_H = "";
pub const _STDINT_H = @as(c_int, 1);
pub const __GLIBC_INTERNAL_STARTING_HEADER_IMPLEMENTATION = "";
pub const _FEATURES_H = @as(c_int, 1);
pub const __KERNEL_STRICT_NAMES = "";
pub inline fn __GNUC_PREREQ(maj: anytype, min: anytype) @TypeOf(((__GNUC__ << @as(c_int, 16)) + __GNUC_MINOR__) >= ((maj << @as(c_int, 16)) + min)) {
    _ = &maj;
    _ = &min;
    return ((__GNUC__ << @as(c_int, 16)) + __GNUC_MINOR__) >= ((maj << @as(c_int, 16)) + min);
}
pub inline fn __glibc_clang_prereq(maj: anytype, min: anytype) @TypeOf(((__clang_major__ << @as(c_int, 16)) + __clang_minor__) >= ((maj << @as(c_int, 16)) + min)) {
    _ = &maj;
    _ = &min;
    return ((__clang_major__ << @as(c_int, 16)) + __clang_minor__) >= ((maj << @as(c_int, 16)) + min);
}
pub const _DEFAULT_SOURCE = @as(c_int, 1);
pub const __GLIBC_USE_ISOC2X = @as(c_int, 0);
pub const __USE_ISOC11 = @as(c_int, 1);
pub const __USE_ISOC99 = @as(c_int, 1);
pub const __USE_ISOC95 = @as(c_int, 1);
pub const __USE_POSIX_IMPLICITLY = @as(c_int, 1);
pub const _POSIX_SOURCE = @as(c_int, 1);
pub const _POSIX_C_SOURCE = @as(c_long, 200809);
pub const __USE_POSIX = @as(c_int, 1);
pub const __USE_POSIX2 = @as(c_int, 1);
pub const __USE_POSIX199309 = @as(c_int, 1);
pub const __USE_POSIX199506 = @as(c_int, 1);
pub const __USE_XOPEN2K = @as(c_int, 1);
pub const __USE_XOPEN2K8 = @as(c_int, 1);
pub const _ATFILE_SOURCE = @as(c_int, 1);
pub const __WORDSIZE = @as(c_int, 64);
pub const __WORDSIZE_TIME64_COMPAT32 = @as(c_int, 1);
pub const __SYSCALL_WORDSIZE = @as(c_int, 64);
pub const __TIMESIZE = __WORDSIZE;
pub const __USE_MISC = @as(c_int, 1);
pub const __USE_ATFILE = @as(c_int, 1);
pub const __USE_FORTIFY_LEVEL = @as(c_int, 0);
pub const __GLIBC_USE_DEPRECATED_GETS = @as(c_int, 0);
pub const __GLIBC_USE_DEPRECATED_SCANF = @as(c_int, 0);
pub const __GLIBC_USE_C2X_STRTOL = @as(c_int, 0);
pub const _STDC_PREDEF_H = @as(c_int, 1);
pub const __STDC_IEC_559__ = @as(c_int, 1);
pub const __STDC_IEC_60559_BFP__ = @as(c_long, 201404);
pub const __STDC_IEC_559_COMPLEX__ = @as(c_int, 1);
pub const __STDC_IEC_60559_COMPLEX__ = @as(c_long, 201404);
pub const __STDC_ISO_10646__ = @as(c_long, 201706);
pub const __GNU_LIBRARY__ = @as(c_int, 6);
pub const __GLIBC__ = @as(c_int, 2);
pub inline fn __GLIBC_PREREQ(maj: anytype, min: anytype) @TypeOf(((__GLIBC__ << @as(c_int, 16)) + __GLIBC_MINOR__) >= ((maj << @as(c_int, 16)) + min)) {
    _ = &maj;
    _ = &min;
    return ((__GLIBC__ << @as(c_int, 16)) + __GLIBC_MINOR__) >= ((maj << @as(c_int, 16)) + min);
}
pub const _SYS_CDEFS_H = @as(c_int, 1);
pub inline fn __glibc_has_builtin(name: anytype) @TypeOf(__has_builtin(name)) {
    _ = &name;
    return __has_builtin(name);
}
pub const __LEAF = "";
pub const __LEAF_ATTR = "";
pub inline fn __P(args: anytype) @TypeOf(args) {
    _ = &args;
    return args;
}
pub inline fn __PMT(args: anytype) @TypeOf(args) {
    _ = &args;
    return args;
}
pub const __ptr_t = ?*anyopaque;
pub const __BEGIN_DECLS = "";
pub const __END_DECLS = "";
pub inline fn __bos(ptr: anytype) @TypeOf(__builtin_object_size(ptr, __USE_FORTIFY_LEVEL > @as(c_int, 1))) {
    _ = &ptr;
    return __builtin_object_size(ptr, __USE_FORTIFY_LEVEL > @as(c_int, 1));
}
pub inline fn __bos0(ptr: anytype) @TypeOf(__builtin_object_size(ptr, @as(c_int, 0))) {
    _ = &ptr;
    return __builtin_object_size(ptr, @as(c_int, 0));
}
pub inline fn __glibc_objsize0(__o: anytype) @TypeOf(__bos0(__o)) {
    _ = &__o;
    return __bos0(__o);
}
pub inline fn __glibc_objsize(__o: anytype) @TypeOf(__bos(__o)) {
    _ = &__o;
    return __bos(__o);
}
pub const __glibc_c99_flexarr_available = @as(c_int, 1);
pub inline fn __ASMNAME2(prefix: anytype, cname: anytype) @TypeOf(__STRING(prefix) ++ cname) {
    _ = &prefix;
    _ = &cname;
    return __STRING(prefix) ++ cname;
}
pub const __REDIRECT_FORTIFY = __REDIRECT;
pub const __REDIRECT_FORTIFY_NTH = __REDIRECT_NTH;
pub inline fn __nonnull(params: anytype) @TypeOf(__attribute_nonnull__(params)) {
    _ = &params;
    return __attribute_nonnull__(params);
}
pub const __wur = "";
pub const __fortify_function = __extern_always_inline ++ __attribute_artificial__;
pub inline fn __glibc_unlikely(cond: anytype) @TypeOf(__builtin_expect(cond, @as(c_int, 0))) {
    _ = &cond;
    return __builtin_expect(cond, @as(c_int, 0));
}
pub inline fn __glibc_likely(cond: anytype) @TypeOf(__builtin_expect(cond, @as(c_int, 1))) {
    _ = &cond;
    return __builtin_expect(cond, @as(c_int, 1));
}
pub const __attribute_nonstring__ = "";
pub const __LDOUBLE_REDIRECTS_TO_FLOAT128_ABI = @as(c_int, 0);
pub inline fn __LDBL_REDIR1(name: anytype, proto: anytype, alias: anytype) @TypeOf(name ++ proto) {
    _ = &name;
    _ = &proto;
    _ = &alias;
    return name ++ proto;
}
pub inline fn __LDBL_REDIR(name: anytype, proto: anytype) @TypeOf(name ++ proto) {
    _ = &name;
    _ = &proto;
    return name ++ proto;
}
pub inline fn __LDBL_REDIR1_NTH(name: anytype, proto: anytype, alias: anytype) @TypeOf(name ++ proto ++ __THROW) {
    _ = &name;
    _ = &proto;
    _ = &alias;
    return name ++ proto ++ __THROW;
}
pub inline fn __LDBL_REDIR_NTH(name: anytype, proto: anytype) @TypeOf(name ++ proto ++ __THROW) {
    _ = &name;
    _ = &proto;
    return name ++ proto ++ __THROW;
}
pub inline fn __REDIRECT_LDBL(name: anytype, proto: anytype, alias: anytype) @TypeOf(__REDIRECT(name, proto, alias)) {
    _ = &name;
    _ = &proto;
    _ = &alias;
    return __REDIRECT(name, proto, alias);
}
pub inline fn __REDIRECT_NTH_LDBL(name: anytype, proto: anytype, alias: anytype) @TypeOf(__REDIRECT_NTH(name, proto, alias)) {
    _ = &name;
    _ = &proto;
    _ = &alias;
    return __REDIRECT_NTH(name, proto, alias);
}
pub const __HAVE_GENERIC_SELECTION = @as(c_int, 1);
pub const __attr_dealloc_free = "";
pub const __stub___compat_bdflush = "";
pub const __stub_chflags = "";
pub const __stub_fchflags = "";
pub const __stub_gtty = "";
pub const __stub_revoke = "";
pub const __stub_setlogin = "";
pub const __stub_sigreturn = "";
pub const __stub_stty = "";
pub const __GLIBC_USE_LIB_EXT2 = @as(c_int, 0);
pub const __GLIBC_USE_IEC_60559_BFP_EXT = @as(c_int, 0);
pub const __GLIBC_USE_IEC_60559_BFP_EXT_C2X = @as(c_int, 0);
pub const __GLIBC_USE_IEC_60559_EXT = @as(c_int, 0);
pub const __GLIBC_USE_IEC_60559_FUNCS_EXT = @as(c_int, 0);
pub const __GLIBC_USE_IEC_60559_FUNCS_EXT_C2X = @as(c_int, 0);
pub const __GLIBC_USE_IEC_60559_TYPES_EXT = @as(c_int, 0);
pub const _BITS_TYPES_H = @as(c_int, 1);
pub const __S16_TYPE = c_short;
pub const __U16_TYPE = c_ushort;
pub const __S32_TYPE = c_int;
pub const __U32_TYPE = c_uint;
pub const __SLONGWORD_TYPE = c_long;
pub const __ULONGWORD_TYPE = c_ulong;
pub const __SQUAD_TYPE = c_long;
pub const __UQUAD_TYPE = c_ulong;
pub const __SWORD_TYPE = c_long;
pub const __UWORD_TYPE = c_ulong;
pub const __SLONG32_TYPE = c_int;
pub const __ULONG32_TYPE = c_uint;
pub const __S64_TYPE = c_long;
pub const __U64_TYPE = c_ulong;
pub const _BITS_TYPESIZES_H = @as(c_int, 1);
pub const __SYSCALL_SLONG_TYPE = __SLONGWORD_TYPE;
pub const __SYSCALL_ULONG_TYPE = __ULONGWORD_TYPE;
pub const __DEV_T_TYPE = __UQUAD_TYPE;
pub const __UID_T_TYPE = __U32_TYPE;
pub const __GID_T_TYPE = __U32_TYPE;
pub const __INO_T_TYPE = __SYSCALL_ULONG_TYPE;
pub const __INO64_T_TYPE = __UQUAD_TYPE;
pub const __MODE_T_TYPE = __U32_TYPE;
pub const __NLINK_T_TYPE = __SYSCALL_ULONG_TYPE;
pub const __FSWORD_T_TYPE = __SYSCALL_SLONG_TYPE;
pub const __OFF_T_TYPE = __SYSCALL_SLONG_TYPE;
pub const __OFF64_T_TYPE = __SQUAD_TYPE;
pub const __PID_T_TYPE = __S32_TYPE;
pub const __RLIM_T_TYPE = __SYSCALL_ULONG_TYPE;
pub const __RLIM64_T_TYPE = __UQUAD_TYPE;
pub const __BLKCNT_T_TYPE = __SYSCALL_SLONG_TYPE;
pub const __BLKCNT64_T_TYPE = __SQUAD_TYPE;
pub const __FSBLKCNT_T_TYPE = __SYSCALL_ULONG_TYPE;
pub const __FSBLKCNT64_T_TYPE = __UQUAD_TYPE;
pub const __FSFILCNT_T_TYPE = __SYSCALL_ULONG_TYPE;
pub const __FSFILCNT64_T_TYPE = __UQUAD_TYPE;
pub const __ID_T_TYPE = __U32_TYPE;
pub const __CLOCK_T_TYPE = __SYSCALL_SLONG_TYPE;
pub const __TIME_T_TYPE = __SYSCALL_SLONG_TYPE;
pub const __USECONDS_T_TYPE = __U32_TYPE;
pub const __SUSECONDS_T_TYPE = __SYSCALL_SLONG_TYPE;
pub const __SUSECONDS64_T_TYPE = __SQUAD_TYPE;
pub const __DADDR_T_TYPE = __S32_TYPE;
pub const __KEY_T_TYPE = __S32_TYPE;
pub const __CLOCKID_T_TYPE = __S32_TYPE;
pub const __TIMER_T_TYPE = ?*anyopaque;
pub const __BLKSIZE_T_TYPE = __SYSCALL_SLONG_TYPE;
pub const __SSIZE_T_TYPE = __SWORD_TYPE;
pub const __CPU_MASK_TYPE = __SYSCALL_ULONG_TYPE;
pub const __OFF_T_MATCHES_OFF64_T = @as(c_int, 1);
pub const __INO_T_MATCHES_INO64_T = @as(c_int, 1);
pub const __RLIM_T_MATCHES_RLIM64_T = @as(c_int, 1);
pub const __STATFS_MATCHES_STATFS64 = @as(c_int, 1);
pub const __KERNEL_OLD_TIMEVAL_MATCHES_TIMEVAL64 = @as(c_int, 1);
pub const __FD_SETSIZE = @as(c_int, 1024);
pub const _BITS_TIME64_H = @as(c_int, 1);
pub const __TIME64_T_TYPE = __TIME_T_TYPE;
pub const _BITS_WCHAR_H = @as(c_int, 1);
pub const __WCHAR_MAX = __WCHAR_MAX__;
pub const __WCHAR_MIN = -__WCHAR_MAX - @as(c_int, 1);
pub const _BITS_STDINT_INTN_H = @as(c_int, 1);
pub const _BITS_STDINT_UINTN_H = @as(c_int, 1);
pub const _BITS_STDINT_LEAST_H = @as(c_int, 1);
pub const __intptr_t_defined = "";
pub const __INT64_C = @import("std").zig.c_translation.Macros.L_SUFFIX;
pub const __UINT64_C = @import("std").zig.c_translation.Macros.UL_SUFFIX;
pub const INT8_MIN = -@as(c_int, 128);
pub const INT16_MIN = -@as(c_int, 32767) - @as(c_int, 1);
pub const INT32_MIN = -@import("std").zig.c_translation.promoteIntLiteral(c_int, 2147483647, .decimal) - @as(c_int, 1);
pub const INT64_MIN = -__INT64_C(@import("std").zig.c_translation.promoteIntLiteral(c_int, 9223372036854775807, .decimal)) - @as(c_int, 1);
pub const INT8_MAX = @as(c_int, 127);
pub const INT16_MAX = @as(c_int, 32767);
pub const INT32_MAX = @import("std").zig.c_translation.promoteIntLiteral(c_int, 2147483647, .decimal);
pub const INT64_MAX = __INT64_C(@import("std").zig.c_translation.promoteIntLiteral(c_int, 9223372036854775807, .decimal));
pub const UINT8_MAX = @as(c_int, 255);
pub const UINT16_MAX = @import("std").zig.c_translation.promoteIntLiteral(c_int, 65535, .decimal);
pub const UINT32_MAX = @import("std").zig.c_translation.promoteIntLiteral(c_uint, 4294967295, .decimal);
pub const UINT64_MAX = __UINT64_C(@import("std").zig.c_translation.promoteIntLiteral(c_int, 18446744073709551615, .decimal));
pub const INT_LEAST8_MIN = -@as(c_int, 128);
pub const INT_LEAST16_MIN = -@as(c_int, 32767) - @as(c_int, 1);
pub const INT_LEAST32_MIN = -@import("std").zig.c_translation.promoteIntLiteral(c_int, 2147483647, .decimal) - @as(c_int, 1);
pub const INT_LEAST64_MIN = -__INT64_C(@import("std").zig.c_translation.promoteIntLiteral(c_int, 9223372036854775807, .decimal)) - @as(c_int, 1);
pub const INT_LEAST8_MAX = @as(c_int, 127);
pub const INT_LEAST16_MAX = @as(c_int, 32767);
pub const INT_LEAST32_MAX = @import("std").zig.c_translation.promoteIntLiteral(c_int, 2147483647, .decimal);
pub const INT_LEAST64_MAX = __INT64_C(@import("std").zig.c_translation.promoteIntLiteral(c_int, 9223372036854775807, .decimal));
pub const UINT_LEAST8_MAX = @as(c_int, 255);
pub const UINT_LEAST16_MAX = @import("std").zig.c_translation.promoteIntLiteral(c_int, 65535, .decimal);
pub const UINT_LEAST32_MAX = @import("std").zig.c_translation.promoteIntLiteral(c_uint, 4294967295, .decimal);
pub const UINT_LEAST64_MAX = __UINT64_C(@import("std").zig.c_translation.promoteIntLiteral(c_int, 18446744073709551615, .decimal));
pub const INT_FAST8_MIN = -@as(c_int, 128);
pub const INT_FAST16_MIN = -@import("std").zig.c_translation.promoteIntLiteral(c_long, 9223372036854775807, .decimal) - @as(c_int, 1);
pub const INT_FAST32_MIN = -@import("std").zig.c_translation.promoteIntLiteral(c_long, 9223372036854775807, .decimal) - @as(c_int, 1);
pub const INT_FAST64_MIN = -__INT64_C(@import("std").zig.c_translation.promoteIntLiteral(c_int, 9223372036854775807, .decimal)) - @as(c_int, 1);
pub const INT_FAST8_MAX = @as(c_int, 127);
pub const INT_FAST16_MAX = @import("std").zig.c_translation.promoteIntLiteral(c_long, 9223372036854775807, .decimal);
pub const INT_FAST32_MAX = @import("std").zig.c_translation.promoteIntLiteral(c_long, 9223372036854775807, .decimal);
pub const INT_FAST64_MAX = __INT64_C(@import("std").zig.c_translation.promoteIntLiteral(c_int, 9223372036854775807, .decimal));
pub const UINT_FAST8_MAX = @as(c_int, 255);
pub const UINT_FAST16_MAX = @import("std").zig.c_translation.promoteIntLiteral(c_ulong, 18446744073709551615, .decimal);
pub const UINT_FAST32_MAX = @import("std").zig.c_translation.promoteIntLiteral(c_ulong, 18446744073709551615, .decimal);
pub const UINT_FAST64_MAX = __UINT64_C(@import("std").zig.c_translation.promoteIntLiteral(c_int, 18446744073709551615, .decimal));
pub const INTPTR_MIN = -@import("std").zig.c_translation.promoteIntLiteral(c_long, 9223372036854775807, .decimal) - @as(c_int, 1);
pub const INTPTR_MAX = @import("std").zig.c_translation.promoteIntLiteral(c_long, 9223372036854775807, .decimal);
pub const UINTPTR_MAX = @import("std").zig.c_translation.promoteIntLiteral(c_ulong, 18446744073709551615, .decimal);
pub const INTMAX_MIN = -__INT64_C(@import("std").zig.c_translation.promoteIntLiteral(c_int, 9223372036854775807, .decimal)) - @as(c_int, 1);
pub const INTMAX_MAX = __INT64_C(@import("std").zig.c_translation.promoteIntLiteral(c_int, 9223372036854775807, .decimal));
pub const UINTMAX_MAX = __UINT64_C(@import("std").zig.c_translation.promoteIntLiteral(c_int, 18446744073709551615, .decimal));
pub const PTRDIFF_MIN = -@import("std").zig.c_translation.promoteIntLiteral(c_long, 9223372036854775807, .decimal) - @as(c_int, 1);
pub const PTRDIFF_MAX = @import("std").zig.c_translation.promoteIntLiteral(c_long, 9223372036854775807, .decimal);
pub const SIG_ATOMIC_MIN = -@import("std").zig.c_translation.promoteIntLiteral(c_int, 2147483647, .decimal) - @as(c_int, 1);
pub const SIG_ATOMIC_MAX = @import("std").zig.c_translation.promoteIntLiteral(c_int, 2147483647, .decimal);
pub const SIZE_MAX = @import("std").zig.c_translation.promoteIntLiteral(c_ulong, 18446744073709551615, .decimal);
pub const WCHAR_MIN = __WCHAR_MIN;
pub const WCHAR_MAX = __WCHAR_MAX;
pub const WINT_MIN = @as(c_uint, 0);
pub const WINT_MAX = @import("std").zig.c_translation.promoteIntLiteral(c_uint, 4294967295, .decimal);
pub inline fn INT8_C(c: anytype) @TypeOf(c) {
    _ = &c;
    return c;
}
pub inline fn INT16_C(c: anytype) @TypeOf(c) {
    _ = &c;
    return c;
}
pub inline fn INT32_C(c: anytype) @TypeOf(c) {
    _ = &c;
    return c;
}
pub const INT64_C = @import("std").zig.c_translation.Macros.L_SUFFIX;
pub inline fn UINT8_C(c: anytype) @TypeOf(c) {
    _ = &c;
    return c;
}
pub inline fn UINT16_C(c: anytype) @TypeOf(c) {
    _ = &c;
    return c;
}
pub const UINT32_C = @import("std").zig.c_translation.Macros.U_SUFFIX;
pub const UINT64_C = @import("std").zig.c_translation.Macros.UL_SUFFIX;
pub const INTMAX_C = @import("std").zig.c_translation.Macros.L_SUFFIX;
pub const UINTMAX_C = @import("std").zig.c_translation.Macros.UL_SUFFIX;
pub const BOX2D_EXPORT = "";
pub const B2_API = "";
pub const B2_INLINE = BOX2D_INLINE;
pub inline fn B2_LITERAL(T: anytype) @TypeOf(T) {
    _ = &T;
    return T;
}
pub inline fn B2_IS_NULL(id: anytype) @TypeOf(id.index == @as(c_int, 0)) {
    _ = &id;
    return id.index == @as(c_int, 0);
}
pub inline fn B2_IS_NON_NULL(id: anytype) @TypeOf(id.index != @as(c_int, 0)) {
    _ = &id;
    return id.index != @as(c_int, 0);
}
pub inline fn B2_ID_EQUALS(id1: anytype, id2: anytype) @TypeOf(((id1.index == id2.index) and (id1.world == id2.world)) and (id1.revision == id2.revision)) {
    _ = &id1;
    _ = &id2;
    return ((id1.index == id2.index) and (id1.world == id2.world)) and (id1.revision == id2.revision);
}
pub const _LIBCPP_STDBOOL_H = "";
pub const __STDBOOL_H = "";
pub const __bool_true_false_are_defined = @as(c_int, 1);
pub const @"bool" = bool;
pub const @"true" = @as(c_int, 1);
pub const @"false" = @as(c_int, 0);
pub const b2_lengthUnitsPerMeter = @as(f32, 1.0);
pub const b2_pi = @as(f32, 3.14159265359);
pub const b2_linearSlop = @as(f32, 0.005) * b2_lengthUnitsPerMeter;
pub const b2_angularSlop = @import("std").zig.c_translation.MacroArithmetic.div(@as(f32, 2.0), @as(f32, 180.0)) * b2_pi;
pub const b2_maxPolygonVertices = @as(c_int, 8);
pub const b2_maxWorlds = @as(c_int, 128);
pub const b2_maxTranslation = @as(f32, 4.0) * b2_lengthUnitsPerMeter;
pub const b2_maxRotation = @as(f32, 0.25) * b2_pi;
pub const b2_speculativeDistance = @as(f32, 4.0) * b2_linearSlop;
pub const b2_aabbMargin = @as(f32, 0.1) * b2_lengthUnitsPerMeter;
pub const b2_timeToSleep = @as(f32, 0.5);
pub const b2_linearSleepTolerance = @as(f32, 0.01) * b2_lengthUnitsPerMeter;
pub const b2_angularSleepTolerance = @import("std").zig.c_translation.MacroArithmetic.div(@as(f32, 2.0), @as(f32, 180.0)) * b2_pi;
pub const b2_huge = @as(f32, 100000.0) * b2_lengthUnitsPerMeter;
pub const b2_maxWorkers = @as(c_int, 64);
pub const b2_graphColorCount = @as(c_int, 12);
pub const _LIBCPP_STDDEF_H = "";
pub const __STDDEF_H = "";
pub const __need_ptrdiff_t = "";
pub const __need_size_t = "";
pub const __need_wchar_t = "";
pub const __need_NULL = "";
pub const __need_STDDEF_H_misc = "";
pub const _PTRDIFF_T = "";
pub const _SIZE_T = "";
pub const _WCHAR_T = "";
pub const NULL = @import("std").zig.c_translation.cast(?*anyopaque, @as(c_int, 0));
pub const __CLANG_MAX_ALIGN_T_DEFINED = "";
pub const B2_MAYBE_UNUSED = @import("std").zig.c_translation.Macros.DISCARD;
pub const b2_defaultCategoryBits = @as(c_int, 0x00000001);
pub const b2_defaultMaskBits = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0xFFFFFFFF, .hex);
pub const _LIBCPP_FLOAT_H = "";
pub const __CLANG_FLOAT_H = "";
pub const FLT_RADIX = __FLT_RADIX__;
pub const FLT_MANT_DIG = __FLT_MANT_DIG__;
pub const DBL_MANT_DIG = __DBL_MANT_DIG__;
pub const LDBL_MANT_DIG = __LDBL_MANT_DIG__;
pub const DECIMAL_DIG = __DECIMAL_DIG__;
pub const FLT_DIG = __FLT_DIG__;
pub const DBL_DIG = __DBL_DIG__;
pub const LDBL_DIG = __LDBL_DIG__;
pub const FLT_MIN_EXP = __FLT_MIN_EXP__;
pub const DBL_MIN_EXP = __DBL_MIN_EXP__;
pub const LDBL_MIN_EXP = __LDBL_MIN_EXP__;
pub const FLT_MIN_10_EXP = __FLT_MIN_10_EXP__;
pub const DBL_MIN_10_EXP = __DBL_MIN_10_EXP__;
pub const LDBL_MIN_10_EXP = __LDBL_MIN_10_EXP__;
pub const FLT_MAX_EXP = __FLT_MAX_EXP__;
pub const DBL_MAX_EXP = __DBL_MAX_EXP__;
pub const LDBL_MAX_EXP = __LDBL_MAX_EXP__;
pub const FLT_MAX_10_EXP = __FLT_MAX_10_EXP__;
pub const DBL_MAX_10_EXP = __DBL_MAX_10_EXP__;
pub const LDBL_MAX_10_EXP = __LDBL_MAX_10_EXP__;
pub const FLT_MAX = __FLT_MAX__;
pub const DBL_MAX = __DBL_MAX__;
pub const LDBL_MAX = __LDBL_MAX__;
pub const FLT_EPSILON = __FLT_EPSILON__;
pub const DBL_EPSILON = __DBL_EPSILON__;
pub const LDBL_EPSILON = __LDBL_EPSILON__;
pub const FLT_MIN = __FLT_MIN__;
pub const DBL_MIN = __DBL_MIN__;
pub const LDBL_MIN = __LDBL_MIN__;
pub const FLT_TRUE_MIN = __FLT_DENORM_MIN__;
pub const DBL_TRUE_MIN = __DBL_DENORM_MIN__;
pub const LDBL_TRUE_MIN = __LDBL_DENORM_MIN__;
pub const FLT_DECIMAL_DIG = __FLT_DECIMAL_DIG__;
pub const DBL_DECIMAL_DIG = __DBL_DECIMAL_DIG__;
pub const LDBL_DECIMAL_DIG = __LDBL_DECIMAL_DIG__;
pub const FLT_HAS_SUBNORM = __FLT_HAS_DENORM__;
pub const DBL_HAS_SUBNORM = __DBL_HAS_DENORM__;
pub const LDBL_HAS_SUBNORM = __LDBL_HAS_DENORM__;
pub const _LIBCPP_MATH_H = "";
pub const _MATH_H = @as(c_int, 1);
pub const _BITS_LIBM_SIMD_DECL_STUBS_H = @as(c_int, 1);
pub const __DECL_SIMD_cos = "";
pub const __DECL_SIMD_cosf = "";
pub const __DECL_SIMD_cosl = "";
pub const __DECL_SIMD_cosf16 = "";
pub const __DECL_SIMD_cosf32 = "";
pub const __DECL_SIMD_cosf64 = "";
pub const __DECL_SIMD_cosf128 = "";
pub const __DECL_SIMD_cosf32x = "";
pub const __DECL_SIMD_cosf64x = "";
pub const __DECL_SIMD_cosf128x = "";
pub const __DECL_SIMD_sin = "";
pub const __DECL_SIMD_sinf = "";
pub const __DECL_SIMD_sinl = "";
pub const __DECL_SIMD_sinf16 = "";
pub const __DECL_SIMD_sinf32 = "";
pub const __DECL_SIMD_sinf64 = "";
pub const __DECL_SIMD_sinf128 = "";
pub const __DECL_SIMD_sinf32x = "";
pub const __DECL_SIMD_sinf64x = "";
pub const __DECL_SIMD_sinf128x = "";
pub const __DECL_SIMD_sincos = "";
pub const __DECL_SIMD_sincosf = "";
pub const __DECL_SIMD_sincosl = "";
pub const __DECL_SIMD_sincosf16 = "";
pub const __DECL_SIMD_sincosf32 = "";
pub const __DECL_SIMD_sincosf64 = "";
pub const __DECL_SIMD_sincosf128 = "";
pub const __DECL_SIMD_sincosf32x = "";
pub const __DECL_SIMD_sincosf64x = "";
pub const __DECL_SIMD_sincosf128x = "";
pub const __DECL_SIMD_log = "";
pub const __DECL_SIMD_logf = "";
pub const __DECL_SIMD_logl = "";
pub const __DECL_SIMD_logf16 = "";
pub const __DECL_SIMD_logf32 = "";
pub const __DECL_SIMD_logf64 = "";
pub const __DECL_SIMD_logf128 = "";
pub const __DECL_SIMD_logf32x = "";
pub const __DECL_SIMD_logf64x = "";
pub const __DECL_SIMD_logf128x = "";
pub const __DECL_SIMD_exp = "";
pub const __DECL_SIMD_expf = "";
pub const __DECL_SIMD_expl = "";
pub const __DECL_SIMD_expf16 = "";
pub const __DECL_SIMD_expf32 = "";
pub const __DECL_SIMD_expf64 = "";
pub const __DECL_SIMD_expf128 = "";
pub const __DECL_SIMD_expf32x = "";
pub const __DECL_SIMD_expf64x = "";
pub const __DECL_SIMD_expf128x = "";
pub const __DECL_SIMD_pow = "";
pub const __DECL_SIMD_powf = "";
pub const __DECL_SIMD_powl = "";
pub const __DECL_SIMD_powf16 = "";
pub const __DECL_SIMD_powf32 = "";
pub const __DECL_SIMD_powf64 = "";
pub const __DECL_SIMD_powf128 = "";
pub const __DECL_SIMD_powf32x = "";
pub const __DECL_SIMD_powf64x = "";
pub const __DECL_SIMD_powf128x = "";
pub const __DECL_SIMD_acos = "";
pub const __DECL_SIMD_acosf = "";
pub const __DECL_SIMD_acosl = "";
pub const __DECL_SIMD_acosf16 = "";
pub const __DECL_SIMD_acosf32 = "";
pub const __DECL_SIMD_acosf64 = "";
pub const __DECL_SIMD_acosf128 = "";
pub const __DECL_SIMD_acosf32x = "";
pub const __DECL_SIMD_acosf64x = "";
pub const __DECL_SIMD_acosf128x = "";
pub const __DECL_SIMD_atan = "";
pub const __DECL_SIMD_atanf = "";
pub const __DECL_SIMD_atanl = "";
pub const __DECL_SIMD_atanf16 = "";
pub const __DECL_SIMD_atanf32 = "";
pub const __DECL_SIMD_atanf64 = "";
pub const __DECL_SIMD_atanf128 = "";
pub const __DECL_SIMD_atanf32x = "";
pub const __DECL_SIMD_atanf64x = "";
pub const __DECL_SIMD_atanf128x = "";
pub const __DECL_SIMD_asin = "";
pub const __DECL_SIMD_asinf = "";
pub const __DECL_SIMD_asinl = "";
pub const __DECL_SIMD_asinf16 = "";
pub const __DECL_SIMD_asinf32 = "";
pub const __DECL_SIMD_asinf64 = "";
pub const __DECL_SIMD_asinf128 = "";
pub const __DECL_SIMD_asinf32x = "";
pub const __DECL_SIMD_asinf64x = "";
pub const __DECL_SIMD_asinf128x = "";
pub const __DECL_SIMD_hypot = "";
pub const __DECL_SIMD_hypotf = "";
pub const __DECL_SIMD_hypotl = "";
pub const __DECL_SIMD_hypotf16 = "";
pub const __DECL_SIMD_hypotf32 = "";
pub const __DECL_SIMD_hypotf64 = "";
pub const __DECL_SIMD_hypotf128 = "";
pub const __DECL_SIMD_hypotf32x = "";
pub const __DECL_SIMD_hypotf64x = "";
pub const __DECL_SIMD_hypotf128x = "";
pub const __DECL_SIMD_exp2 = "";
pub const __DECL_SIMD_exp2f = "";
pub const __DECL_SIMD_exp2l = "";
pub const __DECL_SIMD_exp2f16 = "";
pub const __DECL_SIMD_exp2f32 = "";
pub const __DECL_SIMD_exp2f64 = "";
pub const __DECL_SIMD_exp2f128 = "";
pub const __DECL_SIMD_exp2f32x = "";
pub const __DECL_SIMD_exp2f64x = "";
pub const __DECL_SIMD_exp2f128x = "";
pub const __DECL_SIMD_exp10 = "";
pub const __DECL_SIMD_exp10f = "";
pub const __DECL_SIMD_exp10l = "";
pub const __DECL_SIMD_exp10f16 = "";
pub const __DECL_SIMD_exp10f32 = "";
pub const __DECL_SIMD_exp10f64 = "";
pub const __DECL_SIMD_exp10f128 = "";
pub const __DECL_SIMD_exp10f32x = "";
pub const __DECL_SIMD_exp10f64x = "";
pub const __DECL_SIMD_exp10f128x = "";
pub const __DECL_SIMD_cosh = "";
pub const __DECL_SIMD_coshf = "";
pub const __DECL_SIMD_coshl = "";
pub const __DECL_SIMD_coshf16 = "";
pub const __DECL_SIMD_coshf32 = "";
pub const __DECL_SIMD_coshf64 = "";
pub const __DECL_SIMD_coshf128 = "";
pub const __DECL_SIMD_coshf32x = "";
pub const __DECL_SIMD_coshf64x = "";
pub const __DECL_SIMD_coshf128x = "";
pub const __DECL_SIMD_expm1 = "";
pub const __DECL_SIMD_expm1f = "";
pub const __DECL_SIMD_expm1l = "";
pub const __DECL_SIMD_expm1f16 = "";
pub const __DECL_SIMD_expm1f32 = "";
pub const __DECL_SIMD_expm1f64 = "";
pub const __DECL_SIMD_expm1f128 = "";
pub const __DECL_SIMD_expm1f32x = "";
pub const __DECL_SIMD_expm1f64x = "";
pub const __DECL_SIMD_expm1f128x = "";
pub const __DECL_SIMD_sinh = "";
pub const __DECL_SIMD_sinhf = "";
pub const __DECL_SIMD_sinhl = "";
pub const __DECL_SIMD_sinhf16 = "";
pub const __DECL_SIMD_sinhf32 = "";
pub const __DECL_SIMD_sinhf64 = "";
pub const __DECL_SIMD_sinhf128 = "";
pub const __DECL_SIMD_sinhf32x = "";
pub const __DECL_SIMD_sinhf64x = "";
pub const __DECL_SIMD_sinhf128x = "";
pub const __DECL_SIMD_cbrt = "";
pub const __DECL_SIMD_cbrtf = "";
pub const __DECL_SIMD_cbrtl = "";
pub const __DECL_SIMD_cbrtf16 = "";
pub const __DECL_SIMD_cbrtf32 = "";
pub const __DECL_SIMD_cbrtf64 = "";
pub const __DECL_SIMD_cbrtf128 = "";
pub const __DECL_SIMD_cbrtf32x = "";
pub const __DECL_SIMD_cbrtf64x = "";
pub const __DECL_SIMD_cbrtf128x = "";
pub const __DECL_SIMD_atan2 = "";
pub const __DECL_SIMD_atan2f = "";
pub const __DECL_SIMD_atan2l = "";
pub const __DECL_SIMD_atan2f16 = "";
pub const __DECL_SIMD_atan2f32 = "";
pub const __DECL_SIMD_atan2f64 = "";
pub const __DECL_SIMD_atan2f128 = "";
pub const __DECL_SIMD_atan2f32x = "";
pub const __DECL_SIMD_atan2f64x = "";
pub const __DECL_SIMD_atan2f128x = "";
pub const __DECL_SIMD_log10 = "";
pub const __DECL_SIMD_log10f = "";
pub const __DECL_SIMD_log10l = "";
pub const __DECL_SIMD_log10f16 = "";
pub const __DECL_SIMD_log10f32 = "";
pub const __DECL_SIMD_log10f64 = "";
pub const __DECL_SIMD_log10f128 = "";
pub const __DECL_SIMD_log10f32x = "";
pub const __DECL_SIMD_log10f64x = "";
pub const __DECL_SIMD_log10f128x = "";
pub const __DECL_SIMD_log2 = "";
pub const __DECL_SIMD_log2f = "";
pub const __DECL_SIMD_log2l = "";
pub const __DECL_SIMD_log2f16 = "";
pub const __DECL_SIMD_log2f32 = "";
pub const __DECL_SIMD_log2f64 = "";
pub const __DECL_SIMD_log2f128 = "";
pub const __DECL_SIMD_log2f32x = "";
pub const __DECL_SIMD_log2f64x = "";
pub const __DECL_SIMD_log2f128x = "";
pub const __DECL_SIMD_log1p = "";
pub const __DECL_SIMD_log1pf = "";
pub const __DECL_SIMD_log1pl = "";
pub const __DECL_SIMD_log1pf16 = "";
pub const __DECL_SIMD_log1pf32 = "";
pub const __DECL_SIMD_log1pf64 = "";
pub const __DECL_SIMD_log1pf128 = "";
pub const __DECL_SIMD_log1pf32x = "";
pub const __DECL_SIMD_log1pf64x = "";
pub const __DECL_SIMD_log1pf128x = "";
pub const __DECL_SIMD_atanh = "";
pub const __DECL_SIMD_atanhf = "";
pub const __DECL_SIMD_atanhl = "";
pub const __DECL_SIMD_atanhf16 = "";
pub const __DECL_SIMD_atanhf32 = "";
pub const __DECL_SIMD_atanhf64 = "";
pub const __DECL_SIMD_atanhf128 = "";
pub const __DECL_SIMD_atanhf32x = "";
pub const __DECL_SIMD_atanhf64x = "";
pub const __DECL_SIMD_atanhf128x = "";
pub const __DECL_SIMD_acosh = "";
pub const __DECL_SIMD_acoshf = "";
pub const __DECL_SIMD_acoshl = "";
pub const __DECL_SIMD_acoshf16 = "";
pub const __DECL_SIMD_acoshf32 = "";
pub const __DECL_SIMD_acoshf64 = "";
pub const __DECL_SIMD_acoshf128 = "";
pub const __DECL_SIMD_acoshf32x = "";
pub const __DECL_SIMD_acoshf64x = "";
pub const __DECL_SIMD_acoshf128x = "";
pub const __DECL_SIMD_erf = "";
pub const __DECL_SIMD_erff = "";
pub const __DECL_SIMD_erfl = "";
pub const __DECL_SIMD_erff16 = "";
pub const __DECL_SIMD_erff32 = "";
pub const __DECL_SIMD_erff64 = "";
pub const __DECL_SIMD_erff128 = "";
pub const __DECL_SIMD_erff32x = "";
pub const __DECL_SIMD_erff64x = "";
pub const __DECL_SIMD_erff128x = "";
pub const __DECL_SIMD_tanh = "";
pub const __DECL_SIMD_tanhf = "";
pub const __DECL_SIMD_tanhl = "";
pub const __DECL_SIMD_tanhf16 = "";
pub const __DECL_SIMD_tanhf32 = "";
pub const __DECL_SIMD_tanhf64 = "";
pub const __DECL_SIMD_tanhf128 = "";
pub const __DECL_SIMD_tanhf32x = "";
pub const __DECL_SIMD_tanhf64x = "";
pub const __DECL_SIMD_tanhf128x = "";
pub const __DECL_SIMD_asinh = "";
pub const __DECL_SIMD_asinhf = "";
pub const __DECL_SIMD_asinhl = "";
pub const __DECL_SIMD_asinhf16 = "";
pub const __DECL_SIMD_asinhf32 = "";
pub const __DECL_SIMD_asinhf64 = "";
pub const __DECL_SIMD_asinhf128 = "";
pub const __DECL_SIMD_asinhf32x = "";
pub const __DECL_SIMD_asinhf64x = "";
pub const __DECL_SIMD_asinhf128x = "";
pub const __DECL_SIMD_erfc = "";
pub const __DECL_SIMD_erfcf = "";
pub const __DECL_SIMD_erfcl = "";
pub const __DECL_SIMD_erfcf16 = "";
pub const __DECL_SIMD_erfcf32 = "";
pub const __DECL_SIMD_erfcf64 = "";
pub const __DECL_SIMD_erfcf128 = "";
pub const __DECL_SIMD_erfcf32x = "";
pub const __DECL_SIMD_erfcf64x = "";
pub const __DECL_SIMD_erfcf128x = "";
pub const __DECL_SIMD_tan = "";
pub const __DECL_SIMD_tanf = "";
pub const __DECL_SIMD_tanl = "";
pub const __DECL_SIMD_tanf16 = "";
pub const __DECL_SIMD_tanf32 = "";
pub const __DECL_SIMD_tanf64 = "";
pub const __DECL_SIMD_tanf128 = "";
pub const __DECL_SIMD_tanf32x = "";
pub const __DECL_SIMD_tanf64x = "";
pub const __DECL_SIMD_tanf128x = "";
pub const _BITS_FLOATN_H = "";
pub const __HAVE_FLOAT128 = @as(c_int, 0);
pub const __HAVE_DISTINCT_FLOAT128 = @as(c_int, 0);
pub const __HAVE_FLOAT64X = @as(c_int, 1);
pub const __HAVE_FLOAT64X_LONG_DOUBLE = @as(c_int, 1);
pub const _BITS_FLOATN_COMMON_H = "";
pub const __HAVE_FLOAT16 = @as(c_int, 0);
pub const __HAVE_FLOAT32 = @as(c_int, 1);
pub const __HAVE_FLOAT64 = @as(c_int, 1);
pub const __HAVE_FLOAT32X = @as(c_int, 1);
pub const __HAVE_FLOAT128X = @as(c_int, 0);
pub const __HAVE_DISTINCT_FLOAT16 = __HAVE_FLOAT16;
pub const __HAVE_DISTINCT_FLOAT32 = @as(c_int, 0);
pub const __HAVE_DISTINCT_FLOAT64 = @as(c_int, 0);
pub const __HAVE_DISTINCT_FLOAT32X = @as(c_int, 0);
pub const __HAVE_DISTINCT_FLOAT64X = @as(c_int, 0);
pub const __HAVE_DISTINCT_FLOAT128X = __HAVE_FLOAT128X;
pub const __HAVE_FLOAT128_UNLIKE_LDBL = (__HAVE_DISTINCT_FLOAT128 != 0) and (__LDBL_MANT_DIG__ != @as(c_int, 113));
pub const __HAVE_FLOATN_NOT_TYPEDEF = @as(c_int, 0);
pub const __f32 = @import("std").zig.c_translation.Macros.F_SUFFIX;
pub inline fn __f64(x: anytype) @TypeOf(x) {
    _ = &x;
    return x;
}
pub inline fn __f32x(x: anytype) @TypeOf(x) {
    _ = &x;
    return x;
}
pub const __f64x = @import("std").zig.c_translation.Macros.L_SUFFIX;
pub inline fn __builtin_huge_valf32() @TypeOf(__builtin_huge_valf()) {
    return __builtin_huge_valf();
}
pub inline fn __builtin_inff32() @TypeOf(__builtin_inff()) {
    return __builtin_inff();
}
pub inline fn __builtin_nanf32(x: anytype) @TypeOf(__builtin_nanf(x)) {
    _ = &x;
    return __builtin_nanf(x);
}
pub const HUGE_VALF = __builtin_huge_valf();
pub const INFINITY = __builtin_inff();
pub const NAN = __builtin_nanf("");
pub const __FP_LOGB0_IS_MIN = @as(c_int, 1);
pub const __FP_LOGBNAN_IS_MIN = @as(c_int, 1);
pub const FP_ILOGB0 = -@import("std").zig.c_translation.promoteIntLiteral(c_int, 2147483647, .decimal) - @as(c_int, 1);
pub const FP_ILOGBNAN = -@import("std").zig.c_translation.promoteIntLiteral(c_int, 2147483647, .decimal) - @as(c_int, 1);
pub inline fn __MATHCALL_VEC(function: anytype, suffix: anytype, args: anytype) @TypeOf(__SIMD_DECL(__MATH_PRECNAME(function, suffix)) ++ __MATHCALL(function, suffix, args)) {
    _ = &function;
    _ = &suffix;
    _ = &args;
    return __SIMD_DECL(__MATH_PRECNAME(function, suffix)) ++ __MATHCALL(function, suffix, args);
}
pub inline fn __MATHDECL_VEC(@"type": anytype, function: anytype, suffix: anytype, args: anytype) @TypeOf(__SIMD_DECL(__MATH_PRECNAME(function, suffix)) ++ __MATHDECL(@"type", function, suffix, args)) {
    _ = &@"type";
    _ = &function;
    _ = &suffix;
    _ = &args;
    return __SIMD_DECL(__MATH_PRECNAME(function, suffix)) ++ __MATHDECL(@"type", function, suffix, args);
}
pub inline fn __MATHCALL(function: anytype, suffix: anytype, args: anytype) @TypeOf(__MATHDECL(_Mdouble_, function, suffix, args)) {
    _ = &function;
    _ = &suffix;
    _ = &args;
    return __MATHDECL(_Mdouble_, function, suffix, args);
}
pub inline fn __MATHCALLX(function: anytype, suffix: anytype, args: anytype, attrib: anytype) @TypeOf(__MATHDECLX(_Mdouble_, function, suffix, args, attrib)) {
    _ = &function;
    _ = &suffix;
    _ = &args;
    _ = &attrib;
    return __MATHDECLX(_Mdouble_, function, suffix, args, attrib);
}
pub inline fn __MATHDECL_1(@"type": anytype, function: anytype, suffix: anytype, args: anytype) @TypeOf(__MATHDECL_1_IMPL(@"type", function, suffix, args)) {
    _ = &@"type";
    _ = &function;
    _ = &suffix;
    _ = &args;
    return __MATHDECL_1_IMPL(@"type", function, suffix, args);
}
pub inline fn __MATHDECL_ALIAS(@"type": anytype, function: anytype, suffix: anytype, args: anytype, alias: anytype) @TypeOf(__MATHDECL_1(@"type", function, suffix, args)) {
    _ = &@"type";
    _ = &function;
    _ = &suffix;
    _ = &args;
    _ = &alias;
    return __MATHDECL_1(@"type", function, suffix, args);
}
pub const _Mdouble_ = f64;
pub inline fn __MATH_PRECNAME(name: anytype, r: anytype) @TypeOf(__CONCAT(name, r)) {
    _ = &name;
    _ = &r;
    return __CONCAT(name, r);
}
pub const __MATH_DECLARING_DOUBLE = @as(c_int, 1);
pub const __MATH_DECLARING_FLOATN = @as(c_int, 0);
pub const __MATH_DECLARE_LDOUBLE = @as(c_int, 1);
pub inline fn __MATHCALL_NARROW(func: anytype, redir: anytype, nargs: anytype) @TypeOf(__MATHCALL_NARROW_NORMAL(func, nargs)) {
    _ = &func;
    _ = &redir;
    _ = &nargs;
    return __MATHCALL_NARROW_NORMAL(func, nargs);
}
pub inline fn signbit(x: anytype) @TypeOf(__builtin_signbit(x)) {
    _ = &x;
    return __builtin_signbit(x);
}
pub const MATH_ERRNO = @as(c_int, 1);
pub const MATH_ERREXCEPT = @as(c_int, 2);
pub const math_errhandling = MATH_ERRNO | MATH_ERREXCEPT;
pub const M_E = @as(f64, 2.7182818284590452354);
pub const M_LOG2E = @as(f64, 1.4426950408889634074);
pub const M_LOG10E = @as(f64, 0.43429448190325182765);
pub const M_LN2 = @as(f64, 0.69314718055994530942);
pub const M_LN10 = @as(f64, 2.30258509299404568402);
pub const M_PI = @as(f64, 3.14159265358979323846);
pub const M_PI_2 = @as(f64, 1.57079632679489661923);
pub const M_PI_4 = @as(f64, 0.78539816339744830962);
pub const M_1_PI = @as(f64, 0.31830988618379067154);
pub const M_2_PI = @as(f64, 0.63661977236758134308);
pub const M_2_SQRTPI = @as(f64, 1.12837916709551257390);
pub const M_SQRT2 = @as(f64, 1.41421356237309504880);
pub const M_SQRT1_2 = @as(f64, 0.70710678118654752440);
pub inline fn B2_MIN(A: anytype, B: anytype) @TypeOf(if (A < B) A else B) {
    _ = &A;
    _ = &B;
    return if (A < B) A else B;
}
pub inline fn B2_MAX(A: anytype, B: anytype) @TypeOf(if (A > B) A else B) {
    _ = &A;
    _ = &B;
    return if (A > B) A else B;
}
pub inline fn B2_ABS(A: anytype) @TypeOf(if (A > @as(f32, 0.0)) A else -A) {
    _ = &A;
    return if (A > @as(f32, 0.0)) A else -A;
}
pub inline fn B2_CLAMP(A: anytype, B: anytype, C: anytype) @TypeOf(B2_MIN(B2_MAX(A, B), C)) {
    _ = &A;
    _ = &B;
    _ = &C;
    return B2_MIN(B2_MAX(A, B), C);
}

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
pub const __builtin_va_list = ?*anyopaque;
pub const va_list = __builtin_va_list;
pub const struct_Vector2 = extern struct {
    x: f32 = @import("std").mem.zeroes(f32),
    y: f32 = @import("std").mem.zeroes(f32),
};
pub const Vector2 = struct_Vector2;
pub const struct_Vector3 = extern struct {
    x: f32 = @import("std").mem.zeroes(f32),
    y: f32 = @import("std").mem.zeroes(f32),
    z: f32 = @import("std").mem.zeroes(f32),
};
pub const Vector3 = struct_Vector3;
pub const struct_Vector4 = extern struct {
    x: f32 = @import("std").mem.zeroes(f32),
    y: f32 = @import("std").mem.zeroes(f32),
    z: f32 = @import("std").mem.zeroes(f32),
    w: f32 = @import("std").mem.zeroes(f32),
};
pub const Vector4 = struct_Vector4;
pub const Quaternion = Vector4;
pub const struct_Matrix = extern struct {
    m0: f32 = @import("std").mem.zeroes(f32),
    m4: f32 = @import("std").mem.zeroes(f32),
    m8: f32 = @import("std").mem.zeroes(f32),
    m12: f32 = @import("std").mem.zeroes(f32),
    m1: f32 = @import("std").mem.zeroes(f32),
    m5: f32 = @import("std").mem.zeroes(f32),
    m9: f32 = @import("std").mem.zeroes(f32),
    m13: f32 = @import("std").mem.zeroes(f32),
    m2: f32 = @import("std").mem.zeroes(f32),
    m6: f32 = @import("std").mem.zeroes(f32),
    m10: f32 = @import("std").mem.zeroes(f32),
    m14: f32 = @import("std").mem.zeroes(f32),
    m3: f32 = @import("std").mem.zeroes(f32),
    m7: f32 = @import("std").mem.zeroes(f32),
    m11: f32 = @import("std").mem.zeroes(f32),
    m15: f32 = @import("std").mem.zeroes(f32),
};
pub const Matrix = struct_Matrix;
pub const struct_Color = extern struct {
    r: u8 = @import("std").mem.zeroes(u8),
    g: u8 = @import("std").mem.zeroes(u8),
    b: u8 = @import("std").mem.zeroes(u8),
    a: u8 = @import("std").mem.zeroes(u8),
};
pub const Color = struct_Color;
pub const struct_Rectangle = extern struct {
    x: f32 = @import("std").mem.zeroes(f32),
    y: f32 = @import("std").mem.zeroes(f32),
    width: f32 = @import("std").mem.zeroes(f32),
    height: f32 = @import("std").mem.zeroes(f32),
};
pub const Rectangle = struct_Rectangle;
pub const struct_Image = extern struct {
    data: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    width: c_int = @import("std").mem.zeroes(c_int),
    height: c_int = @import("std").mem.zeroes(c_int),
    mipmaps: c_int = @import("std").mem.zeroes(c_int),
    format: c_int = @import("std").mem.zeroes(c_int),
};
pub const Image = struct_Image;
pub const struct_Texture = extern struct {
    id: c_uint = @import("std").mem.zeroes(c_uint),
    width: c_int = @import("std").mem.zeroes(c_int),
    height: c_int = @import("std").mem.zeroes(c_int),
    mipmaps: c_int = @import("std").mem.zeroes(c_int),
    format: c_int = @import("std").mem.zeroes(c_int),
};
pub const Texture = struct_Texture;
pub const Texture2D = Texture;
pub const TextureCubemap = Texture;
pub const struct_RenderTexture = extern struct {
    id: c_uint = @import("std").mem.zeroes(c_uint),
    texture: Texture = @import("std").mem.zeroes(Texture),
    depth: Texture = @import("std").mem.zeroes(Texture),
};
pub const RenderTexture = struct_RenderTexture;
pub const RenderTexture2D = RenderTexture;
pub const struct_NPatchInfo = extern struct {
    source: Rectangle = @import("std").mem.zeroes(Rectangle),
    left: c_int = @import("std").mem.zeroes(c_int),
    top: c_int = @import("std").mem.zeroes(c_int),
    right: c_int = @import("std").mem.zeroes(c_int),
    bottom: c_int = @import("std").mem.zeroes(c_int),
    layout: c_int = @import("std").mem.zeroes(c_int),
};
pub const NPatchInfo = struct_NPatchInfo;
pub const struct_GlyphInfo = extern struct {
    value: c_int = @import("std").mem.zeroes(c_int),
    offsetX: c_int = @import("std").mem.zeroes(c_int),
    offsetY: c_int = @import("std").mem.zeroes(c_int),
    advanceX: c_int = @import("std").mem.zeroes(c_int),
    image: Image = @import("std").mem.zeroes(Image),
};
pub const GlyphInfo = struct_GlyphInfo;
pub const struct_Font = extern struct {
    baseSize: c_int = @import("std").mem.zeroes(c_int),
    glyphCount: c_int = @import("std").mem.zeroes(c_int),
    glyphPadding: c_int = @import("std").mem.zeroes(c_int),
    texture: Texture2D = @import("std").mem.zeroes(Texture2D),
    recs: [*c]Rectangle = @import("std").mem.zeroes([*c]Rectangle),
    glyphs: [*c]GlyphInfo = @import("std").mem.zeroes([*c]GlyphInfo),
};
pub const Font = struct_Font;
pub const struct_Camera3D = extern struct {
    position: Vector3 = @import("std").mem.zeroes(Vector3),
    target: Vector3 = @import("std").mem.zeroes(Vector3),
    up: Vector3 = @import("std").mem.zeroes(Vector3),
    fovy: f32 = @import("std").mem.zeroes(f32),
    projection: c_int = @import("std").mem.zeroes(c_int),
};
pub const Camera3D = struct_Camera3D;
pub const Camera = Camera3D;
pub const struct_Camera2D = extern struct {
    offset: Vector2 = @import("std").mem.zeroes(Vector2),
    target: Vector2 = @import("std").mem.zeroes(Vector2),
    rotation: f32 = @import("std").mem.zeroes(f32),
    zoom: f32 = @import("std").mem.zeroes(f32),
};
pub const Camera2D = struct_Camera2D;
pub const struct_Mesh = extern struct {
    vertexCount: c_int = @import("std").mem.zeroes(c_int),
    triangleCount: c_int = @import("std").mem.zeroes(c_int),
    vertices: [*c]f32 = @import("std").mem.zeroes([*c]f32),
    texcoords: [*c]f32 = @import("std").mem.zeroes([*c]f32),
    texcoords2: [*c]f32 = @import("std").mem.zeroes([*c]f32),
    normals: [*c]f32 = @import("std").mem.zeroes([*c]f32),
    tangents: [*c]f32 = @import("std").mem.zeroes([*c]f32),
    colors: [*c]u8 = @import("std").mem.zeroes([*c]u8),
    indices: [*c]c_ushort = @import("std").mem.zeroes([*c]c_ushort),
    animVertices: [*c]f32 = @import("std").mem.zeroes([*c]f32),
    animNormals: [*c]f32 = @import("std").mem.zeroes([*c]f32),
    boneIds: [*c]u8 = @import("std").mem.zeroes([*c]u8),
    boneWeights: [*c]f32 = @import("std").mem.zeroes([*c]f32),
    vaoId: c_uint = @import("std").mem.zeroes(c_uint),
    vboId: [*c]c_uint = @import("std").mem.zeroes([*c]c_uint),
};
pub const Mesh = struct_Mesh;
pub const struct_Shader = extern struct {
    id: c_uint = @import("std").mem.zeroes(c_uint),
    locs: [*c]c_int = @import("std").mem.zeroes([*c]c_int),
};
pub const Shader = struct_Shader;
pub const struct_MaterialMap = extern struct {
    texture: Texture2D = @import("std").mem.zeroes(Texture2D),
    color: Color = @import("std").mem.zeroes(Color),
    value: f32 = @import("std").mem.zeroes(f32),
};
pub const MaterialMap = struct_MaterialMap;
pub const struct_Material = extern struct {
    shader: Shader = @import("std").mem.zeroes(Shader),
    maps: [*c]MaterialMap = @import("std").mem.zeroes([*c]MaterialMap),
    params: [4]f32 = @import("std").mem.zeroes([4]f32),
};
pub const Material = struct_Material;
pub const struct_Transform = extern struct {
    translation: Vector3 = @import("std").mem.zeroes(Vector3),
    rotation: Quaternion = @import("std").mem.zeroes(Quaternion),
    scale: Vector3 = @import("std").mem.zeroes(Vector3),
};
pub const Transform = struct_Transform;
pub const struct_BoneInfo = extern struct {
    name: [32]u8 = @import("std").mem.zeroes([32]u8),
    parent: c_int = @import("std").mem.zeroes(c_int),
};
pub const BoneInfo = struct_BoneInfo;
pub const struct_Model = extern struct {
    transform: Matrix = @import("std").mem.zeroes(Matrix),
    meshCount: c_int = @import("std").mem.zeroes(c_int),
    materialCount: c_int = @import("std").mem.zeroes(c_int),
    meshes: [*c]Mesh = @import("std").mem.zeroes([*c]Mesh),
    materials: [*c]Material = @import("std").mem.zeroes([*c]Material),
    meshMaterial: [*c]c_int = @import("std").mem.zeroes([*c]c_int),
    boneCount: c_int = @import("std").mem.zeroes(c_int),
    bones: [*c]BoneInfo = @import("std").mem.zeroes([*c]BoneInfo),
    bindPose: [*c]Transform = @import("std").mem.zeroes([*c]Transform),
};
pub const Model = struct_Model;
pub const struct_ModelAnimation = extern struct {
    boneCount: c_int = @import("std").mem.zeroes(c_int),
    frameCount: c_int = @import("std").mem.zeroes(c_int),
    bones: [*c]BoneInfo = @import("std").mem.zeroes([*c]BoneInfo),
    framePoses: [*c][*c]Transform = @import("std").mem.zeroes([*c][*c]Transform),
    name: [32]u8 = @import("std").mem.zeroes([32]u8),
};
pub const ModelAnimation = struct_ModelAnimation;
pub const struct_Ray = extern struct {
    position: Vector3 = @import("std").mem.zeroes(Vector3),
    direction: Vector3 = @import("std").mem.zeroes(Vector3),
};
pub const Ray = struct_Ray;
pub const struct_RayCollision = extern struct {
    hit: bool = @import("std").mem.zeroes(bool),
    distance: f32 = @import("std").mem.zeroes(f32),
    point: Vector3 = @import("std").mem.zeroes(Vector3),
    normal: Vector3 = @import("std").mem.zeroes(Vector3),
};
pub const RayCollision = struct_RayCollision;
pub const struct_BoundingBox = extern struct {
    min: Vector3 = @import("std").mem.zeroes(Vector3),
    max: Vector3 = @import("std").mem.zeroes(Vector3),
};
pub const BoundingBox = struct_BoundingBox;
pub const struct_Wave = extern struct {
    frameCount: c_uint = @import("std").mem.zeroes(c_uint),
    sampleRate: c_uint = @import("std").mem.zeroes(c_uint),
    sampleSize: c_uint = @import("std").mem.zeroes(c_uint),
    channels: c_uint = @import("std").mem.zeroes(c_uint),
    data: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
};
pub const Wave = struct_Wave;
pub const struct_rAudioBuffer = opaque {};
pub const rAudioBuffer = struct_rAudioBuffer;
pub const struct_rAudioProcessor = opaque {};
pub const rAudioProcessor = struct_rAudioProcessor;
pub const struct_AudioStream = extern struct {
    buffer: ?*rAudioBuffer = @import("std").mem.zeroes(?*rAudioBuffer),
    processor: ?*rAudioProcessor = @import("std").mem.zeroes(?*rAudioProcessor),
    sampleRate: c_uint = @import("std").mem.zeroes(c_uint),
    sampleSize: c_uint = @import("std").mem.zeroes(c_uint),
    channels: c_uint = @import("std").mem.zeroes(c_uint),
};
pub const AudioStream = struct_AudioStream;
pub const struct_Sound = extern struct {
    stream: AudioStream = @import("std").mem.zeroes(AudioStream),
    frameCount: c_uint = @import("std").mem.zeroes(c_uint),
};
pub const Sound = struct_Sound;
pub const struct_Music = extern struct {
    stream: AudioStream = @import("std").mem.zeroes(AudioStream),
    frameCount: c_uint = @import("std").mem.zeroes(c_uint),
    looping: bool = @import("std").mem.zeroes(bool),
    ctxType: c_int = @import("std").mem.zeroes(c_int),
    ctxData: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
};
pub const Music = struct_Music;
pub const struct_VrDeviceInfo = extern struct {
    hResolution: c_int = @import("std").mem.zeroes(c_int),
    vResolution: c_int = @import("std").mem.zeroes(c_int),
    hScreenSize: f32 = @import("std").mem.zeroes(f32),
    vScreenSize: f32 = @import("std").mem.zeroes(f32),
    eyeToScreenDistance: f32 = @import("std").mem.zeroes(f32),
    lensSeparationDistance: f32 = @import("std").mem.zeroes(f32),
    interpupillaryDistance: f32 = @import("std").mem.zeroes(f32),
    lensDistortionValues: [4]f32 = @import("std").mem.zeroes([4]f32),
    chromaAbCorrection: [4]f32 = @import("std").mem.zeroes([4]f32),
};
pub const VrDeviceInfo = struct_VrDeviceInfo;
pub const struct_VrStereoConfig = extern struct {
    projection: [2]Matrix = @import("std").mem.zeroes([2]Matrix),
    viewOffset: [2]Matrix = @import("std").mem.zeroes([2]Matrix),
    leftLensCenter: [2]f32 = @import("std").mem.zeroes([2]f32),
    rightLensCenter: [2]f32 = @import("std").mem.zeroes([2]f32),
    leftScreenCenter: [2]f32 = @import("std").mem.zeroes([2]f32),
    rightScreenCenter: [2]f32 = @import("std").mem.zeroes([2]f32),
    scale: [2]f32 = @import("std").mem.zeroes([2]f32),
    scaleIn: [2]f32 = @import("std").mem.zeroes([2]f32),
};
pub const VrStereoConfig = struct_VrStereoConfig;
pub const struct_FilePathList = extern struct {
    capacity: c_uint = @import("std").mem.zeroes(c_uint),
    count: c_uint = @import("std").mem.zeroes(c_uint),
    paths: [*c][*c]u8 = @import("std").mem.zeroes([*c][*c]u8),
};
pub const FilePathList = struct_FilePathList;
pub const struct_AutomationEvent = extern struct {
    frame: c_uint = @import("std").mem.zeroes(c_uint),
    type: c_uint = @import("std").mem.zeroes(c_uint),
    params: [4]c_int = @import("std").mem.zeroes([4]c_int),
};
pub const AutomationEvent = struct_AutomationEvent;
pub const struct_AutomationEventList = extern struct {
    capacity: c_uint = @import("std").mem.zeroes(c_uint),
    count: c_uint = @import("std").mem.zeroes(c_uint),
    events: [*c]AutomationEvent = @import("std").mem.zeroes([*c]AutomationEvent),
};
pub const AutomationEventList = struct_AutomationEventList;
pub const FLAG_VSYNC_HINT: c_int = 64;
pub const FLAG_FULLSCREEN_MODE: c_int = 2;
pub const FLAG_WINDOW_RESIZABLE: c_int = 4;
pub const FLAG_WINDOW_UNDECORATED: c_int = 8;
pub const FLAG_WINDOW_HIDDEN: c_int = 128;
pub const FLAG_WINDOW_MINIMIZED: c_int = 512;
pub const FLAG_WINDOW_MAXIMIZED: c_int = 1024;
pub const FLAG_WINDOW_UNFOCUSED: c_int = 2048;
pub const FLAG_WINDOW_TOPMOST: c_int = 4096;
pub const FLAG_WINDOW_ALWAYS_RUN: c_int = 256;
pub const FLAG_WINDOW_TRANSPARENT: c_int = 16;
pub const FLAG_WINDOW_HIGHDPI: c_int = 8192;
pub const FLAG_WINDOW_MOUSE_PASSTHROUGH: c_int = 16384;
pub const FLAG_BORDERLESS_WINDOWED_MODE: c_int = 32768;
pub const FLAG_MSAA_4X_HINT: c_int = 32;
pub const FLAG_INTERLACED_HINT: c_int = 65536;
pub const ConfigFlags = c_uint;
pub const LOG_ALL: c_int = 0;
pub const LOG_TRACE: c_int = 1;
pub const LOG_DEBUG: c_int = 2;
pub const LOG_INFO: c_int = 3;
pub const LOG_WARNING: c_int = 4;
pub const LOG_ERROR: c_int = 5;
pub const LOG_FATAL: c_int = 6;
pub const LOG_NONE: c_int = 7;
pub const TraceLogLevel = c_uint;
pub const KEY_NULL: c_int = 0;
pub const KEY_APOSTROPHE: c_int = 39;
pub const KEY_COMMA: c_int = 44;
pub const KEY_MINUS: c_int = 45;
pub const KEY_PERIOD: c_int = 46;
pub const KEY_SLASH: c_int = 47;
pub const KEY_ZERO: c_int = 48;
pub const KEY_ONE: c_int = 49;
pub const KEY_TWO: c_int = 50;
pub const KEY_THREE: c_int = 51;
pub const KEY_FOUR: c_int = 52;
pub const KEY_FIVE: c_int = 53;
pub const KEY_SIX: c_int = 54;
pub const KEY_SEVEN: c_int = 55;
pub const KEY_EIGHT: c_int = 56;
pub const KEY_NINE: c_int = 57;
pub const KEY_SEMICOLON: c_int = 59;
pub const KEY_EQUAL: c_int = 61;
pub const KEY_A: c_int = 65;
pub const KEY_B: c_int = 66;
pub const KEY_C: c_int = 67;
pub const KEY_D: c_int = 68;
pub const KEY_E: c_int = 69;
pub const KEY_F: c_int = 70;
pub const KEY_G: c_int = 71;
pub const KEY_H: c_int = 72;
pub const KEY_I: c_int = 73;
pub const KEY_J: c_int = 74;
pub const KEY_K: c_int = 75;
pub const KEY_L: c_int = 76;
pub const KEY_M: c_int = 77;
pub const KEY_N: c_int = 78;
pub const KEY_O: c_int = 79;
pub const KEY_P: c_int = 80;
pub const KEY_Q: c_int = 81;
pub const KEY_R: c_int = 82;
pub const KEY_S: c_int = 83;
pub const KEY_T: c_int = 84;
pub const KEY_U: c_int = 85;
pub const KEY_V: c_int = 86;
pub const KEY_W: c_int = 87;
pub const KEY_X: c_int = 88;
pub const KEY_Y: c_int = 89;
pub const KEY_Z: c_int = 90;
pub const KEY_LEFT_BRACKET: c_int = 91;
pub const KEY_BACKSLASH: c_int = 92;
pub const KEY_RIGHT_BRACKET: c_int = 93;
pub const KEY_GRAVE: c_int = 96;
pub const KEY_SPACE: c_int = 32;
pub const KEY_ESCAPE: c_int = 256;
pub const KEY_ENTER: c_int = 257;
pub const KEY_TAB: c_int = 258;
pub const KEY_BACKSPACE: c_int = 259;
pub const KEY_INSERT: c_int = 260;
pub const KEY_DELETE: c_int = 261;
pub const KEY_RIGHT: c_int = 262;
pub const KEY_LEFT: c_int = 263;
pub const KEY_DOWN: c_int = 264;
pub const KEY_UP: c_int = 265;
pub const KEY_PAGE_UP: c_int = 266;
pub const KEY_PAGE_DOWN: c_int = 267;
pub const KEY_HOME: c_int = 268;
pub const KEY_END: c_int = 269;
pub const KEY_CAPS_LOCK: c_int = 280;
pub const KEY_SCROLL_LOCK: c_int = 281;
pub const KEY_NUM_LOCK: c_int = 282;
pub const KEY_PRINT_SCREEN: c_int = 283;
pub const KEY_PAUSE: c_int = 284;
pub const KEY_F1: c_int = 290;
pub const KEY_F2: c_int = 291;
pub const KEY_F3: c_int = 292;
pub const KEY_F4: c_int = 293;
pub const KEY_F5: c_int = 294;
pub const KEY_F6: c_int = 295;
pub const KEY_F7: c_int = 296;
pub const KEY_F8: c_int = 297;
pub const KEY_F9: c_int = 298;
pub const KEY_F10: c_int = 299;
pub const KEY_F11: c_int = 300;
pub const KEY_F12: c_int = 301;
pub const KEY_LEFT_SHIFT: c_int = 340;
pub const KEY_LEFT_CONTROL: c_int = 341;
pub const KEY_LEFT_ALT: c_int = 342;
pub const KEY_LEFT_SUPER: c_int = 343;
pub const KEY_RIGHT_SHIFT: c_int = 344;
pub const KEY_RIGHT_CONTROL: c_int = 345;
pub const KEY_RIGHT_ALT: c_int = 346;
pub const KEY_RIGHT_SUPER: c_int = 347;
pub const KEY_KB_MENU: c_int = 348;
pub const KEY_KP_0: c_int = 320;
pub const KEY_KP_1: c_int = 321;
pub const KEY_KP_2: c_int = 322;
pub const KEY_KP_3: c_int = 323;
pub const KEY_KP_4: c_int = 324;
pub const KEY_KP_5: c_int = 325;
pub const KEY_KP_6: c_int = 326;
pub const KEY_KP_7: c_int = 327;
pub const KEY_KP_8: c_int = 328;
pub const KEY_KP_9: c_int = 329;
pub const KEY_KP_DECIMAL: c_int = 330;
pub const KEY_KP_DIVIDE: c_int = 331;
pub const KEY_KP_MULTIPLY: c_int = 332;
pub const KEY_KP_SUBTRACT: c_int = 333;
pub const KEY_KP_ADD: c_int = 334;
pub const KEY_KP_ENTER: c_int = 335;
pub const KEY_KP_EQUAL: c_int = 336;
pub const KEY_BACK: c_int = 4;
pub const KEY_MENU: c_int = 5;
pub const KEY_VOLUME_UP: c_int = 24;
pub const KEY_VOLUME_DOWN: c_int = 25;
pub const KeyboardKey = c_uint;
pub const MOUSE_BUTTON_LEFT: c_int = 0;
pub const MOUSE_BUTTON_RIGHT: c_int = 1;
pub const MOUSE_BUTTON_MIDDLE: c_int = 2;
pub const MOUSE_BUTTON_SIDE: c_int = 3;
pub const MOUSE_BUTTON_EXTRA: c_int = 4;
pub const MOUSE_BUTTON_FORWARD: c_int = 5;
pub const MOUSE_BUTTON_BACK: c_int = 6;
pub const MouseButton = c_uint;
pub const MOUSE_CURSOR_DEFAULT: c_int = 0;
pub const MOUSE_CURSOR_ARROW: c_int = 1;
pub const MOUSE_CURSOR_IBEAM: c_int = 2;
pub const MOUSE_CURSOR_CROSSHAIR: c_int = 3;
pub const MOUSE_CURSOR_POINTING_HAND: c_int = 4;
pub const MOUSE_CURSOR_RESIZE_EW: c_int = 5;
pub const MOUSE_CURSOR_RESIZE_NS: c_int = 6;
pub const MOUSE_CURSOR_RESIZE_NWSE: c_int = 7;
pub const MOUSE_CURSOR_RESIZE_NESW: c_int = 8;
pub const MOUSE_CURSOR_RESIZE_ALL: c_int = 9;
pub const MOUSE_CURSOR_NOT_ALLOWED: c_int = 10;
pub const MouseCursor = c_uint;
pub const GAMEPAD_BUTTON_UNKNOWN: c_int = 0;
pub const GAMEPAD_BUTTON_LEFT_FACE_UP: c_int = 1;
pub const GAMEPAD_BUTTON_LEFT_FACE_RIGHT: c_int = 2;
pub const GAMEPAD_BUTTON_LEFT_FACE_DOWN: c_int = 3;
pub const GAMEPAD_BUTTON_LEFT_FACE_LEFT: c_int = 4;
pub const GAMEPAD_BUTTON_RIGHT_FACE_UP: c_int = 5;
pub const GAMEPAD_BUTTON_RIGHT_FACE_RIGHT: c_int = 6;
pub const GAMEPAD_BUTTON_RIGHT_FACE_DOWN: c_int = 7;
pub const GAMEPAD_BUTTON_RIGHT_FACE_LEFT: c_int = 8;
pub const GAMEPAD_BUTTON_LEFT_TRIGGER_1: c_int = 9;
pub const GAMEPAD_BUTTON_LEFT_TRIGGER_2: c_int = 10;
pub const GAMEPAD_BUTTON_RIGHT_TRIGGER_1: c_int = 11;
pub const GAMEPAD_BUTTON_RIGHT_TRIGGER_2: c_int = 12;
pub const GAMEPAD_BUTTON_MIDDLE_LEFT: c_int = 13;
pub const GAMEPAD_BUTTON_MIDDLE: c_int = 14;
pub const GAMEPAD_BUTTON_MIDDLE_RIGHT: c_int = 15;
pub const GAMEPAD_BUTTON_LEFT_THUMB: c_int = 16;
pub const GAMEPAD_BUTTON_RIGHT_THUMB: c_int = 17;
pub const GamepadButton = c_uint;
pub const GAMEPAD_AXIS_LEFT_X: c_int = 0;
pub const GAMEPAD_AXIS_LEFT_Y: c_int = 1;
pub const GAMEPAD_AXIS_RIGHT_X: c_int = 2;
pub const GAMEPAD_AXIS_RIGHT_Y: c_int = 3;
pub const GAMEPAD_AXIS_LEFT_TRIGGER: c_int = 4;
pub const GAMEPAD_AXIS_RIGHT_TRIGGER: c_int = 5;
pub const GamepadAxis = c_uint;
pub const MATERIAL_MAP_ALBEDO: c_int = 0;
pub const MATERIAL_MAP_METALNESS: c_int = 1;
pub const MATERIAL_MAP_NORMAL: c_int = 2;
pub const MATERIAL_MAP_ROUGHNESS: c_int = 3;
pub const MATERIAL_MAP_OCCLUSION: c_int = 4;
pub const MATERIAL_MAP_EMISSION: c_int = 5;
pub const MATERIAL_MAP_HEIGHT: c_int = 6;
pub const MATERIAL_MAP_CUBEMAP: c_int = 7;
pub const MATERIAL_MAP_IRRADIANCE: c_int = 8;
pub const MATERIAL_MAP_PREFILTER: c_int = 9;
pub const MATERIAL_MAP_BRDF: c_int = 10;
pub const MaterialMapIndex = c_uint;
pub const SHADER_LOC_VERTEX_POSITION: c_int = 0;
pub const SHADER_LOC_VERTEX_TEXCOORD01: c_int = 1;
pub const SHADER_LOC_VERTEX_TEXCOORD02: c_int = 2;
pub const SHADER_LOC_VERTEX_NORMAL: c_int = 3;
pub const SHADER_LOC_VERTEX_TANGENT: c_int = 4;
pub const SHADER_LOC_VERTEX_COLOR: c_int = 5;
pub const SHADER_LOC_MATRIX_MVP: c_int = 6;
pub const SHADER_LOC_MATRIX_VIEW: c_int = 7;
pub const SHADER_LOC_MATRIX_PROJECTION: c_int = 8;
pub const SHADER_LOC_MATRIX_MODEL: c_int = 9;
pub const SHADER_LOC_MATRIX_NORMAL: c_int = 10;
pub const SHADER_LOC_VECTOR_VIEW: c_int = 11;
pub const SHADER_LOC_COLOR_DIFFUSE: c_int = 12;
pub const SHADER_LOC_COLOR_SPECULAR: c_int = 13;
pub const SHADER_LOC_COLOR_AMBIENT: c_int = 14;
pub const SHADER_LOC_MAP_ALBEDO: c_int = 15;
pub const SHADER_LOC_MAP_METALNESS: c_int = 16;
pub const SHADER_LOC_MAP_NORMAL: c_int = 17;
pub const SHADER_LOC_MAP_ROUGHNESS: c_int = 18;
pub const SHADER_LOC_MAP_OCCLUSION: c_int = 19;
pub const SHADER_LOC_MAP_EMISSION: c_int = 20;
pub const SHADER_LOC_MAP_HEIGHT: c_int = 21;
pub const SHADER_LOC_MAP_CUBEMAP: c_int = 22;
pub const SHADER_LOC_MAP_IRRADIANCE: c_int = 23;
pub const SHADER_LOC_MAP_PREFILTER: c_int = 24;
pub const SHADER_LOC_MAP_BRDF: c_int = 25;
pub const ShaderLocationIndex = c_uint;
pub const SHADER_UNIFORM_FLOAT: c_int = 0;
pub const SHADER_UNIFORM_VEC2: c_int = 1;
pub const SHADER_UNIFORM_VEC3: c_int = 2;
pub const SHADER_UNIFORM_VEC4: c_int = 3;
pub const SHADER_UNIFORM_INT: c_int = 4;
pub const SHADER_UNIFORM_IVEC2: c_int = 5;
pub const SHADER_UNIFORM_IVEC3: c_int = 6;
pub const SHADER_UNIFORM_IVEC4: c_int = 7;
pub const SHADER_UNIFORM_SAMPLER2D: c_int = 8;
pub const ShaderUniformDataType = c_uint;
pub const SHADER_ATTRIB_FLOAT: c_int = 0;
pub const SHADER_ATTRIB_VEC2: c_int = 1;
pub const SHADER_ATTRIB_VEC3: c_int = 2;
pub const SHADER_ATTRIB_VEC4: c_int = 3;
pub const ShaderAttributeDataType = c_uint;
pub const PIXELFORMAT_UNCOMPRESSED_GRAYSCALE: c_int = 1;
pub const PIXELFORMAT_UNCOMPRESSED_GRAY_ALPHA: c_int = 2;
pub const PIXELFORMAT_UNCOMPRESSED_R5G6B5: c_int = 3;
pub const PIXELFORMAT_UNCOMPRESSED_R8G8B8: c_int = 4;
pub const PIXELFORMAT_UNCOMPRESSED_R5G5B5A1: c_int = 5;
pub const PIXELFORMAT_UNCOMPRESSED_R4G4B4A4: c_int = 6;
pub const PIXELFORMAT_UNCOMPRESSED_R8G8B8A8: c_int = 7;
pub const PIXELFORMAT_UNCOMPRESSED_R32: c_int = 8;
pub const PIXELFORMAT_UNCOMPRESSED_R32G32B32: c_int = 9;
pub const PIXELFORMAT_UNCOMPRESSED_R32G32B32A32: c_int = 10;
pub const PIXELFORMAT_UNCOMPRESSED_R16: c_int = 11;
pub const PIXELFORMAT_UNCOMPRESSED_R16G16B16: c_int = 12;
pub const PIXELFORMAT_UNCOMPRESSED_R16G16B16A16: c_int = 13;
pub const PIXELFORMAT_COMPRESSED_DXT1_RGB: c_int = 14;
pub const PIXELFORMAT_COMPRESSED_DXT1_RGBA: c_int = 15;
pub const PIXELFORMAT_COMPRESSED_DXT3_RGBA: c_int = 16;
pub const PIXELFORMAT_COMPRESSED_DXT5_RGBA: c_int = 17;
pub const PIXELFORMAT_COMPRESSED_ETC1_RGB: c_int = 18;
pub const PIXELFORMAT_COMPRESSED_ETC2_RGB: c_int = 19;
pub const PIXELFORMAT_COMPRESSED_ETC2_EAC_RGBA: c_int = 20;
pub const PIXELFORMAT_COMPRESSED_PVRT_RGB: c_int = 21;
pub const PIXELFORMAT_COMPRESSED_PVRT_RGBA: c_int = 22;
pub const PIXELFORMAT_COMPRESSED_ASTC_4x4_RGBA: c_int = 23;
pub const PIXELFORMAT_COMPRESSED_ASTC_8x8_RGBA: c_int = 24;
pub const PixelFormat = c_uint;
pub const TEXTURE_FILTER_POINT: c_int = 0;
pub const TEXTURE_FILTER_BILINEAR: c_int = 1;
pub const TEXTURE_FILTER_TRILINEAR: c_int = 2;
pub const TEXTURE_FILTER_ANISOTROPIC_4X: c_int = 3;
pub const TEXTURE_FILTER_ANISOTROPIC_8X: c_int = 4;
pub const TEXTURE_FILTER_ANISOTROPIC_16X: c_int = 5;
pub const TextureFilter = c_uint;
pub const TEXTURE_WRAP_REPEAT: c_int = 0;
pub const TEXTURE_WRAP_CLAMP: c_int = 1;
pub const TEXTURE_WRAP_MIRROR_REPEAT: c_int = 2;
pub const TEXTURE_WRAP_MIRROR_CLAMP: c_int = 3;
pub const TextureWrap = c_uint;
pub const CUBEMAP_LAYOUT_AUTO_DETECT: c_int = 0;
pub const CUBEMAP_LAYOUT_LINE_VERTICAL: c_int = 1;
pub const CUBEMAP_LAYOUT_LINE_HORIZONTAL: c_int = 2;
pub const CUBEMAP_LAYOUT_CROSS_THREE_BY_FOUR: c_int = 3;
pub const CUBEMAP_LAYOUT_CROSS_FOUR_BY_THREE: c_int = 4;
pub const CUBEMAP_LAYOUT_PANORAMA: c_int = 5;
pub const CubemapLayout = c_uint;
pub const FONT_DEFAULT: c_int = 0;
pub const FONT_BITMAP: c_int = 1;
pub const FONT_SDF: c_int = 2;
pub const FontType = c_uint;
pub const BLEND_ALPHA: c_int = 0;
pub const BLEND_ADDITIVE: c_int = 1;
pub const BLEND_MULTIPLIED: c_int = 2;
pub const BLEND_ADD_COLORS: c_int = 3;
pub const BLEND_SUBTRACT_COLORS: c_int = 4;
pub const BLEND_ALPHA_PREMULTIPLY: c_int = 5;
pub const BLEND_CUSTOM: c_int = 6;
pub const BLEND_CUSTOM_SEPARATE: c_int = 7;
pub const BlendMode = c_uint;
pub const GESTURE_NONE: c_int = 0;
pub const GESTURE_TAP: c_int = 1;
pub const GESTURE_DOUBLETAP: c_int = 2;
pub const GESTURE_HOLD: c_int = 4;
pub const GESTURE_DRAG: c_int = 8;
pub const GESTURE_SWIPE_RIGHT: c_int = 16;
pub const GESTURE_SWIPE_LEFT: c_int = 32;
pub const GESTURE_SWIPE_UP: c_int = 64;
pub const GESTURE_SWIPE_DOWN: c_int = 128;
pub const GESTURE_PINCH_IN: c_int = 256;
pub const GESTURE_PINCH_OUT: c_int = 512;
pub const Gesture = c_uint;
pub const CAMERA_CUSTOM: c_int = 0;
pub const CAMERA_FREE: c_int = 1;
pub const CAMERA_ORBITAL: c_int = 2;
pub const CAMERA_FIRST_PERSON: c_int = 3;
pub const CAMERA_THIRD_PERSON: c_int = 4;
pub const CameraMode = c_uint;
pub const CAMERA_PERSPECTIVE: c_int = 0;
pub const CAMERA_ORTHOGRAPHIC: c_int = 1;
pub const CameraProjection = c_uint;
pub const NPATCH_NINE_PATCH: c_int = 0;
pub const NPATCH_THREE_PATCH_VERTICAL: c_int = 1;
pub const NPATCH_THREE_PATCH_HORIZONTAL: c_int = 2;
pub const NPatchLayout = c_uint;
pub const TraceLogCallback = ?*const fn (c_int, [*c]const u8, va_list) callconv(.C) void;
pub const LoadFileDataCallback = ?*const fn ([*c]const u8, [*c]c_int) callconv(.C) [*c]u8;
pub const SaveFileDataCallback = ?*const fn ([*c]const u8, ?*anyopaque, c_int) callconv(.C) bool;
pub const LoadFileTextCallback = ?*const fn ([*c]const u8) callconv(.C) [*c]u8;
pub const SaveFileTextCallback = ?*const fn ([*c]const u8, [*c]u8) callconv(.C) bool;
pub extern fn InitWindow(width: c_int, height: c_int, title: [*c]const u8) void;
pub extern fn CloseWindow() void;
pub extern fn WindowShouldClose() bool;
pub extern fn IsWindowReady() bool;
pub extern fn IsWindowFullscreen() bool;
pub extern fn IsWindowHidden() bool;
pub extern fn IsWindowMinimized() bool;
pub extern fn IsWindowMaximized() bool;
pub extern fn IsWindowFocused() bool;
pub extern fn IsWindowResized() bool;
pub extern fn IsWindowState(flag: c_uint) bool;
pub extern fn SetWindowState(flags: c_uint) void;
pub extern fn ClearWindowState(flags: c_uint) void;
pub extern fn ToggleFullscreen() void;
pub extern fn ToggleBorderlessWindowed() void;
pub extern fn MaximizeWindow() void;
pub extern fn MinimizeWindow() void;
pub extern fn RestoreWindow() void;
pub extern fn SetWindowIcon(image: Image) void;
pub extern fn SetWindowIcons(images: [*c]Image, count: c_int) void;
pub extern fn SetWindowTitle(title: [*c]const u8) void;
pub extern fn SetWindowPosition(x: c_int, y: c_int) void;
pub extern fn SetWindowMonitor(monitor: c_int) void;
pub extern fn SetWindowMinSize(width: c_int, height: c_int) void;
pub extern fn SetWindowMaxSize(width: c_int, height: c_int) void;
pub extern fn SetWindowSize(width: c_int, height: c_int) void;
pub extern fn SetWindowOpacity(opacity: f32) void;
pub extern fn SetWindowFocused() void;
pub extern fn GetWindowHandle() ?*anyopaque;
pub extern fn GetScreenWidth() c_int;
pub extern fn GetScreenHeight() c_int;
pub extern fn GetRenderWidth() c_int;
pub extern fn GetRenderHeight() c_int;
pub extern fn GetMonitorCount() c_int;
pub extern fn GetCurrentMonitor() c_int;
pub extern fn GetMonitorPosition(monitor: c_int) Vector2;
pub extern fn GetMonitorWidth(monitor: c_int) c_int;
pub extern fn GetMonitorHeight(monitor: c_int) c_int;
pub extern fn GetMonitorPhysicalWidth(monitor: c_int) c_int;
pub extern fn GetMonitorPhysicalHeight(monitor: c_int) c_int;
pub extern fn GetMonitorRefreshRate(monitor: c_int) c_int;
pub extern fn GetWindowPosition() Vector2;
pub extern fn GetWindowScaleDPI() Vector2;
pub extern fn GetMonitorName(monitor: c_int) [*c]const u8;
pub extern fn SetClipboardText(text: [*c]const u8) void;
pub extern fn GetClipboardText() [*c]const u8;
pub extern fn EnableEventWaiting() void;
pub extern fn DisableEventWaiting() void;
pub extern fn ShowCursor() void;
pub extern fn HideCursor() void;
pub extern fn IsCursorHidden() bool;
pub extern fn EnableCursor() void;
pub extern fn DisableCursor() void;
pub extern fn IsCursorOnScreen() bool;
pub extern fn ClearBackground(color: Color) void;
pub extern fn BeginDrawing() void;
pub extern fn EndDrawing() void;
pub extern fn BeginMode2D(camera: Camera2D) void;
pub extern fn EndMode2D() void;
pub extern fn BeginMode3D(camera: Camera3D) void;
pub extern fn EndMode3D() void;
pub extern fn BeginTextureMode(target: RenderTexture2D) void;
pub extern fn EndTextureMode() void;
pub extern fn BeginShaderMode(shader: Shader) void;
pub extern fn EndShaderMode() void;
pub extern fn BeginBlendMode(mode: c_int) void;
pub extern fn EndBlendMode() void;
pub extern fn BeginScissorMode(x: c_int, y: c_int, width: c_int, height: c_int) void;
pub extern fn EndScissorMode() void;
pub extern fn BeginVrStereoMode(config: VrStereoConfig) void;
pub extern fn EndVrStereoMode() void;
pub extern fn LoadVrStereoConfig(device: VrDeviceInfo) VrStereoConfig;
pub extern fn UnloadVrStereoConfig(config: VrStereoConfig) void;
pub extern fn LoadShader(vsFileName: [*c]const u8, fsFileName: [*c]const u8) Shader;
pub extern fn LoadShaderFromMemory(vsCode: [*c]const u8, fsCode: [*c]const u8) Shader;
pub extern fn IsShaderReady(shader: Shader) bool;
pub extern fn GetShaderLocation(shader: Shader, uniformName: [*c]const u8) c_int;
pub extern fn GetShaderLocationAttrib(shader: Shader, attribName: [*c]const u8) c_int;
pub extern fn SetShaderValue(shader: Shader, locIndex: c_int, value: ?*const anyopaque, uniformType: c_int) void;
pub extern fn SetShaderValueV(shader: Shader, locIndex: c_int, value: ?*const anyopaque, uniformType: c_int, count: c_int) void;
pub extern fn SetShaderValueMatrix(shader: Shader, locIndex: c_int, mat: Matrix) void;
pub extern fn SetShaderValueTexture(shader: Shader, locIndex: c_int, texture: Texture2D) void;
pub extern fn UnloadShader(shader: Shader) void;
pub extern fn GetScreenToWorldRay(position: Vector2, camera: Camera) Ray;
pub extern fn GetScreenToWorldRayEx(position: Vector2, camera: Camera, width: c_int, height: c_int) Ray;
pub extern fn GetWorldToScreen(position: Vector3, camera: Camera) Vector2;
pub extern fn GetWorldToScreenEx(position: Vector3, camera: Camera, width: c_int, height: c_int) Vector2;
pub extern fn GetWorldToScreen2D(position: Vector2, camera: Camera2D) Vector2;
pub extern fn GetScreenToWorld2D(position: Vector2, camera: Camera2D) Vector2;
pub extern fn GetCameraMatrix(camera: Camera) Matrix;
pub extern fn GetCameraMatrix2D(camera: Camera2D) Matrix;
pub extern fn SetTargetFPS(fps: c_int) void;
pub extern fn GetFrameTime() f32;
pub extern fn GetTime() f64;
pub extern fn GetFPS() c_int;
pub extern fn SwapScreenBuffer() void;
pub extern fn PollInputEvents() void;
pub extern fn WaitTime(seconds: f64) void;
pub extern fn SetRandomSeed(seed: c_uint) void;
pub extern fn GetRandomValue(min: c_int, max: c_int) c_int;
pub extern fn LoadRandomSequence(count: c_uint, min: c_int, max: c_int) [*c]c_int;
pub extern fn UnloadRandomSequence(sequence: [*c]c_int) void;
pub extern fn TakeScreenshot(fileName: [*c]const u8) void;
pub extern fn SetConfigFlags(flags: c_uint) void;
pub extern fn OpenURL(url: [*c]const u8) void;
pub extern fn TraceLog(logLevel: c_int, text: [*c]const u8, ...) void;
pub extern fn SetTraceLogLevel(logLevel: c_int) void;
pub extern fn MemAlloc(size: c_uint) ?*anyopaque;
pub extern fn MemRealloc(ptr: ?*anyopaque, size: c_uint) ?*anyopaque;
pub extern fn MemFree(ptr: ?*anyopaque) void;
pub extern fn SetTraceLogCallback(callback: TraceLogCallback) void;
pub extern fn SetLoadFileDataCallback(callback: LoadFileDataCallback) void;
pub extern fn SetSaveFileDataCallback(callback: SaveFileDataCallback) void;
pub extern fn SetLoadFileTextCallback(callback: LoadFileTextCallback) void;
pub extern fn SetSaveFileTextCallback(callback: SaveFileTextCallback) void;
pub extern fn LoadFileData(fileName: [*c]const u8, dataSize: [*c]c_int) [*c]u8;
pub extern fn UnloadFileData(data: [*c]u8) void;
pub extern fn SaveFileData(fileName: [*c]const u8, data: ?*anyopaque, dataSize: c_int) bool;
pub extern fn ExportDataAsCode(data: [*c]const u8, dataSize: c_int, fileName: [*c]const u8) bool;
pub extern fn LoadFileText(fileName: [*c]const u8) [*c]u8;
pub extern fn UnloadFileText(text: [*c]u8) void;
pub extern fn SaveFileText(fileName: [*c]const u8, text: [*c]u8) bool;
pub extern fn FileExists(fileName: [*c]const u8) bool;
pub extern fn DirectoryExists(dirPath: [*c]const u8) bool;
pub extern fn IsFileExtension(fileName: [*c]const u8, ext: [*c]const u8) bool;
pub extern fn GetFileLength(fileName: [*c]const u8) c_int;
pub extern fn GetFileExtension(fileName: [*c]const u8) [*c]const u8;
pub extern fn GetFileName(filePath: [*c]const u8) [*c]const u8;
pub extern fn GetFileNameWithoutExt(filePath: [*c]const u8) [*c]const u8;
pub extern fn GetDirectoryPath(filePath: [*c]const u8) [*c]const u8;
pub extern fn GetPrevDirectoryPath(dirPath: [*c]const u8) [*c]const u8;
pub extern fn GetWorkingDirectory() [*c]const u8;
pub extern fn GetApplicationDirectory() [*c]const u8;
pub extern fn ChangeDirectory(dir: [*c]const u8) bool;
pub extern fn IsPathFile(path: [*c]const u8) bool;
pub extern fn LoadDirectoryFiles(dirPath: [*c]const u8) FilePathList;
pub extern fn LoadDirectoryFilesEx(basePath: [*c]const u8, filter: [*c]const u8, scanSubdirs: bool) FilePathList;
pub extern fn UnloadDirectoryFiles(files: FilePathList) void;
pub extern fn IsFileDropped() bool;
pub extern fn LoadDroppedFiles() FilePathList;
pub extern fn UnloadDroppedFiles(files: FilePathList) void;
pub extern fn GetFileModTime(fileName: [*c]const u8) c_long;
pub extern fn CompressData(data: [*c]const u8, dataSize: c_int, compDataSize: [*c]c_int) [*c]u8;
pub extern fn DecompressData(compData: [*c]const u8, compDataSize: c_int, dataSize: [*c]c_int) [*c]u8;
pub extern fn EncodeDataBase64(data: [*c]const u8, dataSize: c_int, outputSize: [*c]c_int) [*c]u8;
pub extern fn DecodeDataBase64(data: [*c]const u8, outputSize: [*c]c_int) [*c]u8;
pub extern fn LoadAutomationEventList(fileName: [*c]const u8) AutomationEventList;
pub extern fn UnloadAutomationEventList(list: AutomationEventList) void;
pub extern fn ExportAutomationEventList(list: AutomationEventList, fileName: [*c]const u8) bool;
pub extern fn SetAutomationEventList(list: [*c]AutomationEventList) void;
pub extern fn SetAutomationEventBaseFrame(frame: c_int) void;
pub extern fn StartAutomationEventRecording() void;
pub extern fn StopAutomationEventRecording() void;
pub extern fn PlayAutomationEvent(event: AutomationEvent) void;
pub extern fn IsKeyPressed(key: c_int) bool;
pub extern fn IsKeyPressedRepeat(key: c_int) bool;
pub extern fn IsKeyDown(key: c_int) bool;
pub extern fn IsKeyReleased(key: c_int) bool;
pub extern fn IsKeyUp(key: c_int) bool;
pub extern fn GetKeyPressed() c_int;
pub extern fn GetCharPressed() c_int;
pub extern fn SetExitKey(key: c_int) void;
pub extern fn IsGamepadAvailable(gamepad: c_int) bool;
pub extern fn GetGamepadName(gamepad: c_int) [*c]const u8;
pub extern fn IsGamepadButtonPressed(gamepad: c_int, button: c_int) bool;
pub extern fn IsGamepadButtonDown(gamepad: c_int, button: c_int) bool;
pub extern fn IsGamepadButtonReleased(gamepad: c_int, button: c_int) bool;
pub extern fn IsGamepadButtonUp(gamepad: c_int, button: c_int) bool;
pub extern fn GetGamepadButtonPressed() c_int;
pub extern fn GetGamepadAxisCount(gamepad: c_int) c_int;
pub extern fn GetGamepadAxisMovement(gamepad: c_int, axis: c_int) f32;
pub extern fn SetGamepadMappings(mappings: [*c]const u8) c_int;
pub extern fn SetGamepadVibration(gamepad: c_int, leftMotor: f32, rightMotor: f32) void;
pub extern fn IsMouseButtonPressed(button: c_int) bool;
pub extern fn IsMouseButtonDown(button: c_int) bool;
pub extern fn IsMouseButtonReleased(button: c_int) bool;
pub extern fn IsMouseButtonUp(button: c_int) bool;
pub extern fn GetMouseX() c_int;
pub extern fn GetMouseY() c_int;
pub extern fn GetMousePosition() Vector2;
pub extern fn GetMouseDelta() Vector2;
pub extern fn SetMousePosition(x: c_int, y: c_int) void;
pub extern fn SetMouseOffset(offsetX: c_int, offsetY: c_int) void;
pub extern fn SetMouseScale(scaleX: f32, scaleY: f32) void;
pub extern fn GetMouseWheelMove() f32;
pub extern fn GetMouseWheelMoveV() Vector2;
pub extern fn SetMouseCursor(cursor: c_int) void;
pub extern fn GetTouchX() c_int;
pub extern fn GetTouchY() c_int;
pub extern fn GetTouchPosition(index: c_int) Vector2;
pub extern fn GetTouchPointId(index: c_int) c_int;
pub extern fn GetTouchPointCount() c_int;
pub extern fn SetGesturesEnabled(flags: c_uint) void;
pub extern fn IsGestureDetected(gesture: c_uint) bool;
pub extern fn GetGestureDetected() c_int;
pub extern fn GetGestureHoldDuration() f32;
pub extern fn GetGestureDragVector() Vector2;
pub extern fn GetGestureDragAngle() f32;
pub extern fn GetGesturePinchVector() Vector2;
pub extern fn GetGesturePinchAngle() f32;
pub extern fn UpdateCamera(camera: [*c]Camera, mode: c_int) void;
pub extern fn UpdateCameraPro(camera: [*c]Camera, movement: Vector3, rotation: Vector3, zoom: f32) void;
pub extern fn SetShapesTexture(texture: Texture2D, source: Rectangle) void;
pub extern fn GetShapesTexture() Texture2D;
pub extern fn GetShapesTextureRectangle() Rectangle;
pub extern fn DrawPixel(posX: c_int, posY: c_int, color: Color) void;
pub extern fn DrawPixelV(position: Vector2, color: Color) void;
pub extern fn DrawLine(startPosX: c_int, startPosY: c_int, endPosX: c_int, endPosY: c_int, color: Color) void;
pub extern fn DrawLineV(startPos: Vector2, endPos: Vector2, color: Color) void;
pub extern fn DrawLineEx(startPos: Vector2, endPos: Vector2, thick: f32, color: Color) void;
pub extern fn DrawLineStrip(points: [*c]Vector2, pointCount: c_int, color: Color) void;
pub extern fn DrawLineBezier(startPos: Vector2, endPos: Vector2, thick: f32, color: Color) void;
pub extern fn DrawCircle(centerX: c_int, centerY: c_int, radius: f32, color: Color) void;
pub extern fn DrawCircleSector(center: Vector2, radius: f32, startAngle: f32, endAngle: f32, segments: c_int, color: Color) void;
pub extern fn DrawCircleSectorLines(center: Vector2, radius: f32, startAngle: f32, endAngle: f32, segments: c_int, color: Color) void;
pub extern fn DrawCircleGradient(centerX: c_int, centerY: c_int, radius: f32, color1: Color, color2: Color) void;
pub extern fn DrawCircleV(center: Vector2, radius: f32, color: Color) void;
pub extern fn DrawCircleLines(centerX: c_int, centerY: c_int, radius: f32, color: Color) void;
pub extern fn DrawCircleLinesV(center: Vector2, radius: f32, color: Color) void;
pub extern fn DrawEllipse(centerX: c_int, centerY: c_int, radiusH: f32, radiusV: f32, color: Color) void;
pub extern fn DrawEllipseLines(centerX: c_int, centerY: c_int, radiusH: f32, radiusV: f32, color: Color) void;
pub extern fn DrawRing(center: Vector2, innerRadius: f32, outerRadius: f32, startAngle: f32, endAngle: f32, segments: c_int, color: Color) void;
pub extern fn DrawRingLines(center: Vector2, innerRadius: f32, outerRadius: f32, startAngle: f32, endAngle: f32, segments: c_int, color: Color) void;
pub extern fn DrawRectangle(posX: c_int, posY: c_int, width: c_int, height: c_int, color: Color) void;
pub extern fn DrawRectangleV(position: Vector2, size: Vector2, color: Color) void;
pub extern fn DrawRectangleRec(rec: Rectangle, color: Color) void;
pub extern fn DrawRectanglePro(rec: Rectangle, origin: Vector2, rotation: f32, color: Color) void;
pub extern fn DrawRectangleGradientV(posX: c_int, posY: c_int, width: c_int, height: c_int, color1: Color, color2: Color) void;
pub extern fn DrawRectangleGradientH(posX: c_int, posY: c_int, width: c_int, height: c_int, color1: Color, color2: Color) void;
pub extern fn DrawRectangleGradientEx(rec: Rectangle, col1: Color, col2: Color, col3: Color, col4: Color) void;
pub extern fn DrawRectangleLines(posX: c_int, posY: c_int, width: c_int, height: c_int, color: Color) void;
pub extern fn DrawRectangleLinesEx(rec: Rectangle, lineThick: f32, color: Color) void;
pub extern fn DrawRectangleRounded(rec: Rectangle, roundness: f32, segments: c_int, color: Color) void;
pub extern fn DrawRectangleRoundedLines(rec: Rectangle, roundness: f32, segments: c_int, lineThick: f32, color: Color) void;
pub extern fn DrawTriangle(v1: Vector2, v2: Vector2, v3: Vector2, color: Color) void;
pub extern fn DrawTriangleLines(v1: Vector2, v2: Vector2, v3: Vector2, color: Color) void;
pub extern fn DrawTriangleFan(points: [*c]Vector2, pointCount: c_int, color: Color) void;
pub extern fn DrawTriangleStrip(points: [*c]Vector2, pointCount: c_int, color: Color) void;
pub extern fn DrawPoly(center: Vector2, sides: c_int, radius: f32, rotation: f32, color: Color) void;
pub extern fn DrawPolyLines(center: Vector2, sides: c_int, radius: f32, rotation: f32, color: Color) void;
pub extern fn DrawPolyLinesEx(center: Vector2, sides: c_int, radius: f32, rotation: f32, lineThick: f32, color: Color) void;
pub extern fn DrawSplineLinear(points: [*c]Vector2, pointCount: c_int, thick: f32, color: Color) void;
pub extern fn DrawSplineBasis(points: [*c]Vector2, pointCount: c_int, thick: f32, color: Color) void;
pub extern fn DrawSplineCatmullRom(points: [*c]Vector2, pointCount: c_int, thick: f32, color: Color) void;
pub extern fn DrawSplineBezierQuadratic(points: [*c]Vector2, pointCount: c_int, thick: f32, color: Color) void;
pub extern fn DrawSplineBezierCubic(points: [*c]Vector2, pointCount: c_int, thick: f32, color: Color) void;
pub extern fn DrawSplineSegmentLinear(p1: Vector2, p2: Vector2, thick: f32, color: Color) void;
pub extern fn DrawSplineSegmentBasis(p1: Vector2, p2: Vector2, p3: Vector2, p4: Vector2, thick: f32, color: Color) void;
pub extern fn DrawSplineSegmentCatmullRom(p1: Vector2, p2: Vector2, p3: Vector2, p4: Vector2, thick: f32, color: Color) void;
pub extern fn DrawSplineSegmentBezierQuadratic(p1: Vector2, c2: Vector2, p3: Vector2, thick: f32, color: Color) void;
pub extern fn DrawSplineSegmentBezierCubic(p1: Vector2, c2: Vector2, c3: Vector2, p4: Vector2, thick: f32, color: Color) void;
pub extern fn GetSplinePointLinear(startPos: Vector2, endPos: Vector2, t: f32) Vector2;
pub extern fn GetSplinePointBasis(p1: Vector2, p2: Vector2, p3: Vector2, p4: Vector2, t: f32) Vector2;
pub extern fn GetSplinePointCatmullRom(p1: Vector2, p2: Vector2, p3: Vector2, p4: Vector2, t: f32) Vector2;
pub extern fn GetSplinePointBezierQuad(p1: Vector2, c2: Vector2, p3: Vector2, t: f32) Vector2;
pub extern fn GetSplinePointBezierCubic(p1: Vector2, c2: Vector2, c3: Vector2, p4: Vector2, t: f32) Vector2;
pub extern fn CheckCollisionRecs(rec1: Rectangle, rec2: Rectangle) bool;
pub extern fn CheckCollisionCircles(center1: Vector2, radius1: f32, center2: Vector2, radius2: f32) bool;
pub extern fn CheckCollisionCircleRec(center: Vector2, radius: f32, rec: Rectangle) bool;
pub extern fn CheckCollisionPointRec(point: Vector2, rec: Rectangle) bool;
pub extern fn CheckCollisionPointCircle(point: Vector2, center: Vector2, radius: f32) bool;
pub extern fn CheckCollisionPointTriangle(point: Vector2, p1: Vector2, p2: Vector2, p3: Vector2) bool;
pub extern fn CheckCollisionPointPoly(point: Vector2, points: [*c]Vector2, pointCount: c_int) bool;
pub extern fn CheckCollisionLines(startPos1: Vector2, endPos1: Vector2, startPos2: Vector2, endPos2: Vector2, collisionPoint: [*c]Vector2) bool;
pub extern fn CheckCollisionPointLine(point: Vector2, p1: Vector2, p2: Vector2, threshold: c_int) bool;
pub extern fn GetCollisionRec(rec1: Rectangle, rec2: Rectangle) Rectangle;
pub extern fn LoadImage(fileName: [*c]const u8) Image;
pub extern fn LoadImageRaw(fileName: [*c]const u8, width: c_int, height: c_int, format: c_int, headerSize: c_int) Image;
pub extern fn LoadImageSvg(fileNameOrString: [*c]const u8, width: c_int, height: c_int) Image;
pub extern fn LoadImageAnim(fileName: [*c]const u8, frames: [*c]c_int) Image;
pub extern fn LoadImageAnimFromMemory(fileType: [*c]const u8, fileData: [*c]const u8, dataSize: c_int, frames: [*c]c_int) Image;
pub extern fn LoadImageFromMemory(fileType: [*c]const u8, fileData: [*c]const u8, dataSize: c_int) Image;
pub extern fn LoadImageFromTexture(texture: Texture2D) Image;
pub extern fn LoadImageFromScreen() Image;
pub extern fn IsImageReady(image: Image) bool;
pub extern fn UnloadImage(image: Image) void;
pub extern fn ExportImage(image: Image, fileName: [*c]const u8) bool;
pub extern fn ExportImageToMemory(image: Image, fileType: [*c]const u8, fileSize: [*c]c_int) [*c]u8;
pub extern fn ExportImageAsCode(image: Image, fileName: [*c]const u8) bool;
pub extern fn GenImageColor(width: c_int, height: c_int, color: Color) Image;
pub extern fn GenImageGradientLinear(width: c_int, height: c_int, direction: c_int, start: Color, end: Color) Image;
pub extern fn GenImageGradientRadial(width: c_int, height: c_int, density: f32, inner: Color, outer: Color) Image;
pub extern fn GenImageGradientSquare(width: c_int, height: c_int, density: f32, inner: Color, outer: Color) Image;
pub extern fn GenImageChecked(width: c_int, height: c_int, checksX: c_int, checksY: c_int, col1: Color, col2: Color) Image;
pub extern fn GenImageWhiteNoise(width: c_int, height: c_int, factor: f32) Image;
pub extern fn GenImagePerlinNoise(width: c_int, height: c_int, offsetX: c_int, offsetY: c_int, scale: f32) Image;
pub extern fn GenImageCellular(width: c_int, height: c_int, tileSize: c_int) Image;
pub extern fn GenImageText(width: c_int, height: c_int, text: [*c]const u8) Image;
pub extern fn ImageCopy(image: Image) Image;
pub extern fn ImageFromImage(image: Image, rec: Rectangle) Image;
pub extern fn ImageText(text: [*c]const u8, fontSize: c_int, color: Color) Image;
pub extern fn ImageTextEx(font: Font, text: [*c]const u8, fontSize: f32, spacing: f32, tint: Color) Image;
pub extern fn ImageFormat(image: [*c]Image, newFormat: c_int) void;
pub extern fn ImageToPOT(image: [*c]Image, fill: Color) void;
pub extern fn ImageCrop(image: [*c]Image, crop: Rectangle) void;
pub extern fn ImageAlphaCrop(image: [*c]Image, threshold: f32) void;
pub extern fn ImageAlphaClear(image: [*c]Image, color: Color, threshold: f32) void;
pub extern fn ImageAlphaMask(image: [*c]Image, alphaMask: Image) void;
pub extern fn ImageAlphaPremultiply(image: [*c]Image) void;
pub extern fn ImageBlurGaussian(image: [*c]Image, blurSize: c_int) void;
pub extern fn ImageKernelConvolution(image: [*c]Image, kernel: [*c]f32, kernelSize: c_int) void;
pub extern fn ImageResize(image: [*c]Image, newWidth: c_int, newHeight: c_int) void;
pub extern fn ImageResizeNN(image: [*c]Image, newWidth: c_int, newHeight: c_int) void;
pub extern fn ImageResizeCanvas(image: [*c]Image, newWidth: c_int, newHeight: c_int, offsetX: c_int, offsetY: c_int, fill: Color) void;
pub extern fn ImageMipmaps(image: [*c]Image) void;
pub extern fn ImageDither(image: [*c]Image, rBpp: c_int, gBpp: c_int, bBpp: c_int, aBpp: c_int) void;
pub extern fn ImageFlipVertical(image: [*c]Image) void;
pub extern fn ImageFlipHorizontal(image: [*c]Image) void;
pub extern fn ImageRotate(image: [*c]Image, degrees: c_int) void;
pub extern fn ImageRotateCW(image: [*c]Image) void;
pub extern fn ImageRotateCCW(image: [*c]Image) void;
pub extern fn ImageColorTint(image: [*c]Image, color: Color) void;
pub extern fn ImageColorInvert(image: [*c]Image) void;
pub extern fn ImageColorGrayscale(image: [*c]Image) void;
pub extern fn ImageColorContrast(image: [*c]Image, contrast: f32) void;
pub extern fn ImageColorBrightness(image: [*c]Image, brightness: c_int) void;
pub extern fn ImageColorReplace(image: [*c]Image, color: Color, replace: Color) void;
pub extern fn LoadImageColors(image: Image) [*c]Color;
pub extern fn LoadImagePalette(image: Image, maxPaletteSize: c_int, colorCount: [*c]c_int) [*c]Color;
pub extern fn UnloadImageColors(colors: [*c]Color) void;
pub extern fn UnloadImagePalette(colors: [*c]Color) void;
pub extern fn GetImageAlphaBorder(image: Image, threshold: f32) Rectangle;
pub extern fn GetImageColor(image: Image, x: c_int, y: c_int) Color;
pub extern fn ImageClearBackground(dst: [*c]Image, color: Color) void;
pub extern fn ImageDrawPixel(dst: [*c]Image, posX: c_int, posY: c_int, color: Color) void;
pub extern fn ImageDrawPixelV(dst: [*c]Image, position: Vector2, color: Color) void;
pub extern fn ImageDrawLine(dst: [*c]Image, startPosX: c_int, startPosY: c_int, endPosX: c_int, endPosY: c_int, color: Color) void;
pub extern fn ImageDrawLineV(dst: [*c]Image, start: Vector2, end: Vector2, color: Color) void;
pub extern fn ImageDrawCircle(dst: [*c]Image, centerX: c_int, centerY: c_int, radius: c_int, color: Color) void;
pub extern fn ImageDrawCircleV(dst: [*c]Image, center: Vector2, radius: c_int, color: Color) void;
pub extern fn ImageDrawCircleLines(dst: [*c]Image, centerX: c_int, centerY: c_int, radius: c_int, color: Color) void;
pub extern fn ImageDrawCircleLinesV(dst: [*c]Image, center: Vector2, radius: c_int, color: Color) void;
pub extern fn ImageDrawRectangle(dst: [*c]Image, posX: c_int, posY: c_int, width: c_int, height: c_int, color: Color) void;
pub extern fn ImageDrawRectangleV(dst: [*c]Image, position: Vector2, size: Vector2, color: Color) void;
pub extern fn ImageDrawRectangleRec(dst: [*c]Image, rec: Rectangle, color: Color) void;
pub extern fn ImageDrawRectangleLines(dst: [*c]Image, rec: Rectangle, thick: c_int, color: Color) void;
pub extern fn ImageDraw(dst: [*c]Image, src: Image, srcRec: Rectangle, dstRec: Rectangle, tint: Color) void;
pub extern fn ImageDrawText(dst: [*c]Image, text: [*c]const u8, posX: c_int, posY: c_int, fontSize: c_int, color: Color) void;
pub extern fn ImageDrawTextEx(dst: [*c]Image, font: Font, text: [*c]const u8, position: Vector2, fontSize: f32, spacing: f32, tint: Color) void;
pub extern fn LoadTexture(fileName: [*c]const u8) Texture2D;
pub extern fn LoadTextureFromImage(image: Image) Texture2D;
pub extern fn LoadTextureCubemap(image: Image, layout: c_int) TextureCubemap;
pub extern fn LoadRenderTexture(width: c_int, height: c_int) RenderTexture2D;
pub extern fn IsTextureReady(texture: Texture2D) bool;
pub extern fn UnloadTexture(texture: Texture2D) void;
pub extern fn IsRenderTextureReady(target: RenderTexture2D) bool;
pub extern fn UnloadRenderTexture(target: RenderTexture2D) void;
pub extern fn UpdateTexture(texture: Texture2D, pixels: ?*const anyopaque) void;
pub extern fn UpdateTextureRec(texture: Texture2D, rec: Rectangle, pixels: ?*const anyopaque) void;
pub extern fn GenTextureMipmaps(texture: [*c]Texture2D) void;
pub extern fn SetTextureFilter(texture: Texture2D, filter: c_int) void;
pub extern fn SetTextureWrap(texture: Texture2D, wrap: c_int) void;
pub extern fn DrawTexture(texture: Texture2D, posX: c_int, posY: c_int, tint: Color) void;
pub extern fn DrawTextureV(texture: Texture2D, position: Vector2, tint: Color) void;
pub extern fn DrawTextureEx(texture: Texture2D, position: Vector2, rotation: f32, scale: f32, tint: Color) void;
pub extern fn DrawTextureRec(texture: Texture2D, source: Rectangle, position: Vector2, tint: Color) void;
pub extern fn DrawTexturePro(texture: Texture2D, source: Rectangle, dest: Rectangle, origin: Vector2, rotation: f32, tint: Color) void;
pub extern fn DrawTextureNPatch(texture: Texture2D, nPatchInfo: NPatchInfo, dest: Rectangle, origin: Vector2, rotation: f32, tint: Color) void;
pub extern fn ColorIsEqual(col1: Color, col2: Color) bool;
pub extern fn Fade(color: Color, alpha: f32) Color;
pub extern fn ColorToInt(color: Color) c_int;
pub extern fn ColorNormalize(color: Color) Vector4;
pub extern fn ColorFromNormalized(normalized: Vector4) Color;
pub extern fn ColorToHSV(color: Color) Vector3;
pub extern fn ColorFromHSV(hue: f32, saturation: f32, value: f32) Color;
pub extern fn ColorTint(color: Color, tint: Color) Color;
pub extern fn ColorBrightness(color: Color, factor: f32) Color;
pub extern fn ColorContrast(color: Color, contrast: f32) Color;
pub extern fn ColorAlpha(color: Color, alpha: f32) Color;
pub extern fn ColorAlphaBlend(dst: Color, src: Color, tint: Color) Color;
pub extern fn GetColor(hexValue: c_uint) Color;
pub extern fn GetPixelColor(srcPtr: ?*anyopaque, format: c_int) Color;
pub extern fn SetPixelColor(dstPtr: ?*anyopaque, color: Color, format: c_int) void;
pub extern fn GetPixelDataSize(width: c_int, height: c_int, format: c_int) c_int;
pub extern fn GetFontDefault() Font;
pub extern fn LoadFont(fileName: [*c]const u8) Font;
pub extern fn LoadFontEx(fileName: [*c]const u8, fontSize: c_int, codepoints: [*c]c_int, codepointCount: c_int) Font;
pub extern fn LoadFontFromImage(image: Image, key: Color, firstChar: c_int) Font;
pub extern fn LoadFontFromMemory(fileType: [*c]const u8, fileData: [*c]const u8, dataSize: c_int, fontSize: c_int, codepoints: [*c]c_int, codepointCount: c_int) Font;
pub extern fn IsFontReady(font: Font) bool;
pub extern fn LoadFontData(fileData: [*c]const u8, dataSize: c_int, fontSize: c_int, codepoints: [*c]c_int, codepointCount: c_int, @"type": c_int) [*c]GlyphInfo;
pub extern fn GenImageFontAtlas(glyphs: [*c]const GlyphInfo, glyphRecs: [*c][*c]Rectangle, glyphCount: c_int, fontSize: c_int, padding: c_int, packMethod: c_int) Image;
pub extern fn UnloadFontData(glyphs: [*c]GlyphInfo, glyphCount: c_int) void;
pub extern fn UnloadFont(font: Font) void;
pub extern fn ExportFontAsCode(font: Font, fileName: [*c]const u8) bool;
pub extern fn DrawFPS(posX: c_int, posY: c_int) void;
pub extern fn DrawText(text: [*c]const u8, posX: c_int, posY: c_int, fontSize: c_int, color: Color) void;
pub extern fn DrawTextEx(font: Font, text: [*c]const u8, position: Vector2, fontSize: f32, spacing: f32, tint: Color) void;
pub extern fn DrawTextPro(font: Font, text: [*c]const u8, position: Vector2, origin: Vector2, rotation: f32, fontSize: f32, spacing: f32, tint: Color) void;
pub extern fn DrawTextCodepoint(font: Font, codepoint: c_int, position: Vector2, fontSize: f32, tint: Color) void;
pub extern fn DrawTextCodepoints(font: Font, codepoints: [*c]const c_int, codepointCount: c_int, position: Vector2, fontSize: f32, spacing: f32, tint: Color) void;
pub extern fn SetTextLineSpacing(spacing: c_int) void;
pub extern fn MeasureText(text: [*c]const u8, fontSize: c_int) c_int;
pub extern fn MeasureTextEx(font: Font, text: [*c]const u8, fontSize: f32, spacing: f32) Vector2;
pub extern fn GetGlyphIndex(font: Font, codepoint: c_int) c_int;
pub extern fn GetGlyphInfo(font: Font, codepoint: c_int) GlyphInfo;
pub extern fn GetGlyphAtlasRec(font: Font, codepoint: c_int) Rectangle;
pub extern fn LoadUTF8(codepoints: [*c]const c_int, length: c_int) [*c]u8;
pub extern fn UnloadUTF8(text: [*c]u8) void;
pub extern fn LoadCodepoints(text: [*c]const u8, count: [*c]c_int) [*c]c_int;
pub extern fn UnloadCodepoints(codepoints: [*c]c_int) void;
pub extern fn GetCodepointCount(text: [*c]const u8) c_int;
pub extern fn GetCodepoint(text: [*c]const u8, codepointSize: [*c]c_int) c_int;
pub extern fn GetCodepointNext(text: [*c]const u8, codepointSize: [*c]c_int) c_int;
pub extern fn GetCodepointPrevious(text: [*c]const u8, codepointSize: [*c]c_int) c_int;
pub extern fn CodepointToUTF8(codepoint: c_int, utf8Size: [*c]c_int) [*c]const u8;
pub extern fn TextCopy(dst: [*c]u8, src: [*c]const u8) c_int;
pub extern fn TextIsEqual(text1: [*c]const u8, text2: [*c]const u8) bool;
pub extern fn TextLength(text: [*c]const u8) c_uint;
pub extern fn TextFormat(text: [*c]const u8, ...) [*c]const u8;
pub extern fn TextSubtext(text: [*c]const u8, position: c_int, length: c_int) [*c]const u8;
pub extern fn TextReplace(text: [*c]const u8, replace: [*c]const u8, by: [*c]const u8) [*c]u8;
pub extern fn TextInsert(text: [*c]const u8, insert: [*c]const u8, position: c_int) [*c]u8;
pub extern fn TextJoin(textList: [*c][*c]const u8, count: c_int, delimiter: [*c]const u8) [*c]const u8;
pub extern fn TextSplit(text: [*c]const u8, delimiter: u8, count: [*c]c_int) [*c][*c]const u8;
pub extern fn TextAppend(text: [*c]u8, append: [*c]const u8, position: [*c]c_int) void;
pub extern fn TextFindIndex(text: [*c]const u8, find: [*c]const u8) c_int;
pub extern fn TextToUpper(text: [*c]const u8) [*c]const u8;
pub extern fn TextToLower(text: [*c]const u8) [*c]const u8;
pub extern fn TextToPascal(text: [*c]const u8) [*c]const u8;
pub extern fn TextToInteger(text: [*c]const u8) c_int;
pub extern fn TextToFloat(text: [*c]const u8) f32;
pub extern fn DrawLine3D(startPos: Vector3, endPos: Vector3, color: Color) void;
pub extern fn DrawPoint3D(position: Vector3, color: Color) void;
pub extern fn DrawCircle3D(center: Vector3, radius: f32, rotationAxis: Vector3, rotationAngle: f32, color: Color) void;
pub extern fn DrawTriangle3D(v1: Vector3, v2: Vector3, v3: Vector3, color: Color) void;
pub extern fn DrawTriangleStrip3D(points: [*c]Vector3, pointCount: c_int, color: Color) void;
pub extern fn DrawCube(position: Vector3, width: f32, height: f32, length: f32, color: Color) void;
pub extern fn DrawCubeV(position: Vector3, size: Vector3, color: Color) void;
pub extern fn DrawCubeWires(position: Vector3, width: f32, height: f32, length: f32, color: Color) void;
pub extern fn DrawCubeWiresV(position: Vector3, size: Vector3, color: Color) void;
pub extern fn DrawSphere(centerPos: Vector3, radius: f32, color: Color) void;
pub extern fn DrawSphereEx(centerPos: Vector3, radius: f32, rings: c_int, slices: c_int, color: Color) void;
pub extern fn DrawSphereWires(centerPos: Vector3, radius: f32, rings: c_int, slices: c_int, color: Color) void;
pub extern fn DrawCylinder(position: Vector3, radiusTop: f32, radiusBottom: f32, height: f32, slices: c_int, color: Color) void;
pub extern fn DrawCylinderEx(startPos: Vector3, endPos: Vector3, startRadius: f32, endRadius: f32, sides: c_int, color: Color) void;
pub extern fn DrawCylinderWires(position: Vector3, radiusTop: f32, radiusBottom: f32, height: f32, slices: c_int, color: Color) void;
pub extern fn DrawCylinderWiresEx(startPos: Vector3, endPos: Vector3, startRadius: f32, endRadius: f32, sides: c_int, color: Color) void;
pub extern fn DrawCapsule(startPos: Vector3, endPos: Vector3, radius: f32, slices: c_int, rings: c_int, color: Color) void;
pub extern fn DrawCapsuleWires(startPos: Vector3, endPos: Vector3, radius: f32, slices: c_int, rings: c_int, color: Color) void;
pub extern fn DrawPlane(centerPos: Vector3, size: Vector2, color: Color) void;
pub extern fn DrawRay(ray: Ray, color: Color) void;
pub extern fn DrawGrid(slices: c_int, spacing: f32) void;
pub extern fn LoadModel(fileName: [*c]const u8) Model;
pub extern fn LoadModelFromMesh(mesh: Mesh) Model;
pub extern fn IsModelReady(model: Model) bool;
pub extern fn UnloadModel(model: Model) void;
pub extern fn GetModelBoundingBox(model: Model) BoundingBox;
pub extern fn DrawModel(model: Model, position: Vector3, scale: f32, tint: Color) void;
pub extern fn DrawModelEx(model: Model, position: Vector3, rotationAxis: Vector3, rotationAngle: f32, scale: Vector3, tint: Color) void;
pub extern fn DrawModelWires(model: Model, position: Vector3, scale: f32, tint: Color) void;
pub extern fn DrawModelWiresEx(model: Model, position: Vector3, rotationAxis: Vector3, rotationAngle: f32, scale: Vector3, tint: Color) void;
pub extern fn DrawBoundingBox(box: BoundingBox, color: Color) void;
pub extern fn DrawBillboard(camera: Camera, texture: Texture2D, position: Vector3, size: f32, tint: Color) void;
pub extern fn DrawBillboardRec(camera: Camera, texture: Texture2D, source: Rectangle, position: Vector3, size: Vector2, tint: Color) void;
pub extern fn DrawBillboardPro(camera: Camera, texture: Texture2D, source: Rectangle, position: Vector3, up: Vector3, size: Vector2, origin: Vector2, rotation: f32, tint: Color) void;
pub extern fn UploadMesh(mesh: [*c]Mesh, dynamic: bool) void;
pub extern fn UpdateMeshBuffer(mesh: Mesh, index: c_int, data: ?*const anyopaque, dataSize: c_int, offset: c_int) void;
pub extern fn UnloadMesh(mesh: Mesh) void;
pub extern fn DrawMesh(mesh: Mesh, material: Material, transform: Matrix) void;
pub extern fn DrawMeshInstanced(mesh: Mesh, material: Material, transforms: [*c]const Matrix, instances: c_int) void;
pub extern fn GetMeshBoundingBox(mesh: Mesh) BoundingBox;
pub extern fn GenMeshTangents(mesh: [*c]Mesh) void;
pub extern fn ExportMesh(mesh: Mesh, fileName: [*c]const u8) bool;
pub extern fn ExportMeshAsCode(mesh: Mesh, fileName: [*c]const u8) bool;
pub extern fn GenMeshPoly(sides: c_int, radius: f32) Mesh;
pub extern fn GenMeshPlane(width: f32, length: f32, resX: c_int, resZ: c_int) Mesh;
pub extern fn GenMeshCube(width: f32, height: f32, length: f32) Mesh;
pub extern fn GenMeshSphere(radius: f32, rings: c_int, slices: c_int) Mesh;
pub extern fn GenMeshHemiSphere(radius: f32, rings: c_int, slices: c_int) Mesh;
pub extern fn GenMeshCylinder(radius: f32, height: f32, slices: c_int) Mesh;
pub extern fn GenMeshCone(radius: f32, height: f32, slices: c_int) Mesh;
pub extern fn GenMeshTorus(radius: f32, size: f32, radSeg: c_int, sides: c_int) Mesh;
pub extern fn GenMeshKnot(radius: f32, size: f32, radSeg: c_int, sides: c_int) Mesh;
pub extern fn GenMeshHeightmap(heightmap: Image, size: Vector3) Mesh;
pub extern fn GenMeshCubicmap(cubicmap: Image, cubeSize: Vector3) Mesh;
pub extern fn LoadMaterials(fileName: [*c]const u8, materialCount: [*c]c_int) [*c]Material;
pub extern fn LoadMaterialDefault() Material;
pub extern fn IsMaterialReady(material: Material) bool;
pub extern fn UnloadMaterial(material: Material) void;
pub extern fn SetMaterialTexture(material: [*c]Material, mapType: c_int, texture: Texture2D) void;
pub extern fn SetModelMeshMaterial(model: [*c]Model, meshId: c_int, materialId: c_int) void;
pub extern fn LoadModelAnimations(fileName: [*c]const u8, animCount: [*c]c_int) [*c]ModelAnimation;
pub extern fn UpdateModelAnimation(model: Model, anim: ModelAnimation, frame: c_int) void;
pub extern fn UnloadModelAnimation(anim: ModelAnimation) void;
pub extern fn UnloadModelAnimations(animations: [*c]ModelAnimation, animCount: c_int) void;
pub extern fn IsModelAnimationValid(model: Model, anim: ModelAnimation) bool;
pub extern fn CheckCollisionSpheres(center1: Vector3, radius1: f32, center2: Vector3, radius2: f32) bool;
pub extern fn CheckCollisionBoxes(box1: BoundingBox, box2: BoundingBox) bool;
pub extern fn CheckCollisionBoxSphere(box: BoundingBox, center: Vector3, radius: f32) bool;
pub extern fn GetRayCollisionSphere(ray: Ray, center: Vector3, radius: f32) RayCollision;
pub extern fn GetRayCollisionBox(ray: Ray, box: BoundingBox) RayCollision;
pub extern fn GetRayCollisionMesh(ray: Ray, mesh: Mesh, transform: Matrix) RayCollision;
pub extern fn GetRayCollisionTriangle(ray: Ray, p1: Vector3, p2: Vector3, p3: Vector3) RayCollision;
pub extern fn GetRayCollisionQuad(ray: Ray, p1: Vector3, p2: Vector3, p3: Vector3, p4: Vector3) RayCollision;
pub const AudioCallback = ?*const fn (?*anyopaque, c_uint) callconv(.C) void;
pub extern fn InitAudioDevice() void;
pub extern fn CloseAudioDevice() void;
pub extern fn IsAudioDeviceReady() bool;
pub extern fn SetMasterVolume(volume: f32) void;
pub extern fn GetMasterVolume() f32;
pub extern fn LoadWave(fileName: [*c]const u8) Wave;
pub extern fn LoadWaveFromMemory(fileType: [*c]const u8, fileData: [*c]const u8, dataSize: c_int) Wave;
pub extern fn IsWaveReady(wave: Wave) bool;
pub extern fn LoadSound(fileName: [*c]const u8) Sound;
pub extern fn LoadSoundFromWave(wave: Wave) Sound;
pub extern fn LoadSoundAlias(source: Sound) Sound;
pub extern fn IsSoundReady(sound: Sound) bool;
pub extern fn UpdateSound(sound: Sound, data: ?*const anyopaque, sampleCount: c_int) void;
pub extern fn UnloadWave(wave: Wave) void;
pub extern fn UnloadSound(sound: Sound) void;
pub extern fn UnloadSoundAlias(alias: Sound) void;
pub extern fn ExportWave(wave: Wave, fileName: [*c]const u8) bool;
pub extern fn ExportWaveAsCode(wave: Wave, fileName: [*c]const u8) bool;
pub extern fn PlaySound(sound: Sound) void;
pub extern fn StopSound(sound: Sound) void;
pub extern fn PauseSound(sound: Sound) void;
pub extern fn ResumeSound(sound: Sound) void;
pub extern fn IsSoundPlaying(sound: Sound) bool;
pub extern fn SetSoundVolume(sound: Sound, volume: f32) void;
pub extern fn SetSoundPitch(sound: Sound, pitch: f32) void;
pub extern fn SetSoundPan(sound: Sound, pan: f32) void;
pub extern fn WaveCopy(wave: Wave) Wave;
pub extern fn WaveCrop(wave: [*c]Wave, initSample: c_int, finalSample: c_int) void;
pub extern fn WaveFormat(wave: [*c]Wave, sampleRate: c_int, sampleSize: c_int, channels: c_int) void;
pub extern fn LoadWaveSamples(wave: Wave) [*c]f32;
pub extern fn UnloadWaveSamples(samples: [*c]f32) void;
pub extern fn LoadMusicStream(fileName: [*c]const u8) Music;
pub extern fn LoadMusicStreamFromMemory(fileType: [*c]const u8, data: [*c]const u8, dataSize: c_int) Music;
pub extern fn IsMusicReady(music: Music) bool;
pub extern fn UnloadMusicStream(music: Music) void;
pub extern fn PlayMusicStream(music: Music) void;
pub extern fn IsMusicStreamPlaying(music: Music) bool;
pub extern fn UpdateMusicStream(music: Music) void;
pub extern fn StopMusicStream(music: Music) void;
pub extern fn PauseMusicStream(music: Music) void;
pub extern fn ResumeMusicStream(music: Music) void;
pub extern fn SeekMusicStream(music: Music, position: f32) void;
pub extern fn SetMusicVolume(music: Music, volume: f32) void;
pub extern fn SetMusicPitch(music: Music, pitch: f32) void;
pub extern fn SetMusicPan(music: Music, pan: f32) void;
pub extern fn GetMusicTimeLength(music: Music) f32;
pub extern fn GetMusicTimePlayed(music: Music) f32;
pub extern fn LoadAudioStream(sampleRate: c_uint, sampleSize: c_uint, channels: c_uint) AudioStream;
pub extern fn IsAudioStreamReady(stream: AudioStream) bool;
pub extern fn UnloadAudioStream(stream: AudioStream) void;
pub extern fn UpdateAudioStream(stream: AudioStream, data: ?*const anyopaque, frameCount: c_int) void;
pub extern fn IsAudioStreamProcessed(stream: AudioStream) bool;
pub extern fn PlayAudioStream(stream: AudioStream) void;
pub extern fn PauseAudioStream(stream: AudioStream) void;
pub extern fn ResumeAudioStream(stream: AudioStream) void;
pub extern fn IsAudioStreamPlaying(stream: AudioStream) bool;
pub extern fn StopAudioStream(stream: AudioStream) void;
pub extern fn SetAudioStreamVolume(stream: AudioStream, volume: f32) void;
pub extern fn SetAudioStreamPitch(stream: AudioStream, pitch: f32) void;
pub extern fn SetAudioStreamPan(stream: AudioStream, pan: f32) void;
pub extern fn SetAudioStreamBufferSizeDefault(size: c_int) void;
pub extern fn SetAudioStreamCallback(stream: AudioStream, callback: AudioCallback) void;
pub extern fn AttachAudioStreamProcessor(stream: AudioStream, processor: AudioCallback) void;
pub extern fn DetachAudioStreamProcessor(stream: AudioStream, processor: AudioCallback) void;
pub extern fn AttachAudioMixedProcessor(processor: AudioCallback) void;
pub extern fn DetachAudioMixedProcessor(processor: AudioCallback) void;
pub extern fn rlImGuiSetup(darkTheme: bool) void;
pub extern fn rlImGuiBegin() void;
pub extern fn rlImGuiEnd() void;
pub extern fn rlImGuiShutdown() void;
pub extern fn rlImGuiBeginInitImGui() void;
pub extern fn rlImGuiEndInitImGui() void;
pub extern fn rlImGuiReloadFonts() void;
pub extern fn rlImGuiBeginDelta(deltaTime: f32) void;
pub extern fn rlImGuiImage(image: [*c]const Texture) void;
pub extern fn rlImGuiImageSize(image: [*c]const Texture, width: c_int, height: c_int) void;
pub extern fn rlImGuiImageSizeV(image: [*c]const Texture, size: Vector2) void;
pub extern fn rlImGuiImageRect(image: [*c]const Texture, destWidth: c_int, destHeight: c_int, sourceRect: Rectangle) void;
pub extern fn rlImGuiImageRenderTexture(image: [*c]const RenderTexture) void;
pub extern fn rlImGuiImageRenderTextureFit(image: [*c]const RenderTexture, center: bool) void;
pub extern fn rlImGuiImageButton(name: [*c]const u8, image: [*c]const Texture) bool;
pub extern fn rlImGuiImageButtonSize(name: [*c]const u8, image: [*c]const Texture, size: struct_ImVec2) bool;
pub const wchar_t = c_int;
pub const ptrdiff_t = c_long;
pub const max_align_t = extern struct {
    __ll: c_longlong = @import("std").mem.zeroes(c_longlong),
    __ld: c_longdouble = @import("std").mem.zeroes(c_longdouble),
};
pub const intmax_t = c_longlong;
pub const uintmax_t = c_ulonglong;
pub const int_fast8_t = i8;
pub const int_fast64_t = i64;
pub const int_least8_t = i8;
pub const int_least16_t = i16;
pub const int_least32_t = i32;
pub const int_least64_t = i64;
pub const uint_fast8_t = u8;
pub const uint_fast64_t = u64;
pub const uint_least8_t = u8;
pub const uint_least16_t = u16;
pub const uint_least32_t = u32;
pub const uint_least64_t = u64;
pub const int_fast16_t = i32;
pub const int_fast32_t = i32;
pub const uint_fast16_t = u32;
pub const uint_fast32_t = u32;
pub const __wasi_size_t = c_ulong;
pub const __wasi_filesize_t = u64;
pub const __wasi_timestamp_t = u64;
pub const __wasi_clockid_t = u32;
pub const __wasi_errno_t = u16;
pub const __wasi_rights_t = u64;
pub const __wasi_fd_t = u32;
pub const struct___wasi_iovec_t = extern struct {
    buf: [*c]u8 = @import("std").mem.zeroes([*c]u8),
    buf_len: __wasi_size_t = @import("std").mem.zeroes(__wasi_size_t),
};
pub const __wasi_iovec_t = struct___wasi_iovec_t;
pub const struct___wasi_ciovec_t = extern struct {
    buf: [*c]const u8 = @import("std").mem.zeroes([*c]const u8),
    buf_len: __wasi_size_t = @import("std").mem.zeroes(__wasi_size_t),
};
pub const __wasi_ciovec_t = struct___wasi_ciovec_t;
pub const __wasi_filedelta_t = i64;
pub const __wasi_whence_t = u8;
pub const __wasi_dircookie_t = u64;
pub const __wasi_dirnamlen_t = u32;
pub const __wasi_inode_t = u64;
pub const __wasi_filetype_t = u8;
pub const struct___wasi_dirent_t = extern struct {
    d_next: __wasi_dircookie_t = @import("std").mem.zeroes(__wasi_dircookie_t),
    d_ino: __wasi_inode_t = @import("std").mem.zeroes(__wasi_inode_t),
    d_namlen: __wasi_dirnamlen_t = @import("std").mem.zeroes(__wasi_dirnamlen_t),
    d_type: __wasi_filetype_t = @import("std").mem.zeroes(__wasi_filetype_t),
};
pub const __wasi_dirent_t = struct___wasi_dirent_t;
pub const __wasi_advice_t = u8;
pub const __wasi_fdflags_t = u16;
pub const struct___wasi_fdstat_t = extern struct {
    fs_filetype: __wasi_filetype_t = @import("std").mem.zeroes(__wasi_filetype_t),
    fs_flags: __wasi_fdflags_t = @import("std").mem.zeroes(__wasi_fdflags_t),
    fs_rights_base: __wasi_rights_t = @import("std").mem.zeroes(__wasi_rights_t),
    fs_rights_inheriting: __wasi_rights_t = @import("std").mem.zeroes(__wasi_rights_t),
};
pub const __wasi_fdstat_t = struct___wasi_fdstat_t;
pub const __wasi_device_t = u64;
pub const __wasi_fstflags_t = u16;
pub const __wasi_lookupflags_t = u32;
pub const __wasi_oflags_t = u16;
pub const __wasi_linkcount_t = u64;
pub const struct___wasi_filestat_t = extern struct {
    dev: __wasi_device_t = @import("std").mem.zeroes(__wasi_device_t),
    ino: __wasi_inode_t = @import("std").mem.zeroes(__wasi_inode_t),
    filetype: __wasi_filetype_t = @import("std").mem.zeroes(__wasi_filetype_t),
    nlink: __wasi_linkcount_t = @import("std").mem.zeroes(__wasi_linkcount_t),
    size: __wasi_filesize_t = @import("std").mem.zeroes(__wasi_filesize_t),
    atim: __wasi_timestamp_t = @import("std").mem.zeroes(__wasi_timestamp_t),
    mtim: __wasi_timestamp_t = @import("std").mem.zeroes(__wasi_timestamp_t),
    ctim: __wasi_timestamp_t = @import("std").mem.zeroes(__wasi_timestamp_t),
};
pub const __wasi_filestat_t = struct___wasi_filestat_t;
pub const __wasi_userdata_t = u64;
pub const __wasi_eventtype_t = u8;
pub const __wasi_eventrwflags_t = u16;
pub const struct___wasi_event_fd_readwrite_t = extern struct {
    nbytes: __wasi_filesize_t = @import("std").mem.zeroes(__wasi_filesize_t),
    flags: __wasi_eventrwflags_t = @import("std").mem.zeroes(__wasi_eventrwflags_t),
};
pub const __wasi_event_fd_readwrite_t = struct___wasi_event_fd_readwrite_t;
pub const union___wasi_event_u_t = extern union {
    fd_readwrite: __wasi_event_fd_readwrite_t,
};
pub const __wasi_event_u_t = union___wasi_event_u_t;
pub const struct___wasi_event_t = extern struct {
    userdata: __wasi_userdata_t = @import("std").mem.zeroes(__wasi_userdata_t),
    @"error": __wasi_errno_t = @import("std").mem.zeroes(__wasi_errno_t),
    type: __wasi_eventtype_t = @import("std").mem.zeroes(__wasi_eventtype_t),
    u: __wasi_event_u_t = @import("std").mem.zeroes(__wasi_event_u_t),
};
pub const __wasi_event_t = struct___wasi_event_t;
pub const __wasi_subclockflags_t = u16;
pub const struct___wasi_subscription_clock_t = extern struct {
    id: __wasi_clockid_t = @import("std").mem.zeroes(__wasi_clockid_t),
    timeout: __wasi_timestamp_t = @import("std").mem.zeroes(__wasi_timestamp_t),
    precision: __wasi_timestamp_t = @import("std").mem.zeroes(__wasi_timestamp_t),
    flags: __wasi_subclockflags_t = @import("std").mem.zeroes(__wasi_subclockflags_t),
};
pub const __wasi_subscription_clock_t = struct___wasi_subscription_clock_t;
pub const struct___wasi_subscription_fd_readwrite_t = extern struct {
    file_descriptor: __wasi_fd_t = @import("std").mem.zeroes(__wasi_fd_t),
};
pub const __wasi_subscription_fd_readwrite_t = struct___wasi_subscription_fd_readwrite_t;
pub const union___wasi_subscription_u_t = extern union {
    clock: __wasi_subscription_clock_t,
    fd_readwrite: __wasi_subscription_fd_readwrite_t,
};
pub const __wasi_subscription_u_t = union___wasi_subscription_u_t;
pub const struct___wasi_subscription_t = extern struct {
    userdata: __wasi_userdata_t = @import("std").mem.zeroes(__wasi_userdata_t),
    type: __wasi_eventtype_t = @import("std").mem.zeroes(__wasi_eventtype_t),
    u: __wasi_subscription_u_t = @import("std").mem.zeroes(__wasi_subscription_u_t),
};
pub const __wasi_subscription_t = struct___wasi_subscription_t;
pub const __wasi_exitcode_t = u32;
pub const __wasi_signal_t = u8;
pub const __wasi_riflags_t = u16;
pub const __wasi_roflags_t = u16;
pub const __wasi_siflags_t = u16;
pub const __wasi_sdflags_t = u8;
pub const __wasi_preopentype_t = u8;
pub const struct___wasi_prestat_dir_t = extern struct {
    pr_name_len: __wasi_size_t = @import("std").mem.zeroes(__wasi_size_t),
};
pub const __wasi_prestat_dir_t = struct___wasi_prestat_dir_t;
pub const union___wasi_prestat_u_t = extern union {
    dir: __wasi_prestat_dir_t,
};
pub const __wasi_prestat_u_t = union___wasi_prestat_u_t;
pub const struct___wasi_prestat_t = extern struct {
    pr_type: __wasi_preopentype_t = @import("std").mem.zeroes(__wasi_preopentype_t),
    u: __wasi_prestat_u_t = @import("std").mem.zeroes(__wasi_prestat_u_t),
};
pub const __wasi_prestat_t = struct___wasi_prestat_t;
pub extern fn __wasi_args_get(argv: [*c][*c]u8, argv_buf: [*c]u8) __wasi_errno_t;
pub extern fn __wasi_args_sizes_get(argc: [*c]__wasi_size_t, argv_buf_size: [*c]__wasi_size_t) __wasi_errno_t;
pub extern fn __wasi_environ_get(environ: [*c][*c]u8, environ_buf: [*c]u8) __wasi_errno_t;
pub extern fn __wasi_environ_sizes_get(argc: [*c]__wasi_size_t, argv_buf_size: [*c]__wasi_size_t) __wasi_errno_t;
pub extern fn __wasi_clock_res_get(id: __wasi_clockid_t, resolution: [*c]__wasi_timestamp_t) __wasi_errno_t;
pub extern fn __wasi_clock_time_get(id: __wasi_clockid_t, precision: __wasi_timestamp_t, time: [*c]__wasi_timestamp_t) __wasi_errno_t;
pub extern fn __wasi_fd_advise(fd: __wasi_fd_t, offset: __wasi_filesize_t, len: __wasi_filesize_t, advice: __wasi_advice_t) __wasi_errno_t;
pub extern fn __wasi_fd_allocate(fd: __wasi_fd_t, offset: __wasi_filesize_t, len: __wasi_filesize_t) __wasi_errno_t;
pub extern fn __wasi_fd_close(fd: __wasi_fd_t) __wasi_errno_t;
pub extern fn __wasi_fd_datasync(fd: __wasi_fd_t) __wasi_errno_t;
pub extern fn __wasi_fd_fdstat_get(fd: __wasi_fd_t, stat: [*c]__wasi_fdstat_t) __wasi_errno_t;
pub extern fn __wasi_fd_fdstat_set_flags(fd: __wasi_fd_t, flags: __wasi_fdflags_t) __wasi_errno_t;
pub extern fn __wasi_fd_fdstat_set_rights(fd: __wasi_fd_t, fs_rights_base: __wasi_rights_t, fs_rights_inheriting: __wasi_rights_t) __wasi_errno_t;
pub extern fn __wasi_fd_filestat_get(fd: __wasi_fd_t, buf: [*c]__wasi_filestat_t) __wasi_errno_t;
pub extern fn __wasi_fd_filestat_set_size(fd: __wasi_fd_t, size: __wasi_filesize_t) __wasi_errno_t;
pub extern fn __wasi_fd_filestat_set_times(fd: __wasi_fd_t, atim: __wasi_timestamp_t, mtim: __wasi_timestamp_t, fst_flags: __wasi_fstflags_t) __wasi_errno_t;
pub extern fn __wasi_fd_pread(fd: __wasi_fd_t, iovs: [*c]const __wasi_iovec_t, iovs_len: usize, offset: __wasi_filesize_t, nread: [*c]__wasi_size_t) __wasi_errno_t;
pub extern fn __wasi_fd_prestat_get(fd: __wasi_fd_t, buf: [*c]__wasi_prestat_t) __wasi_errno_t;
pub extern fn __wasi_fd_prestat_dir_name(fd: __wasi_fd_t, path: [*c]u8, path_len: __wasi_size_t) __wasi_errno_t;
pub extern fn __wasi_fd_pwrite(fd: __wasi_fd_t, iovs: [*c]const __wasi_ciovec_t, iovs_len: usize, offset: __wasi_filesize_t, nwritten: [*c]__wasi_size_t) __wasi_errno_t;
pub extern fn __wasi_fd_read(fd: __wasi_fd_t, iovs: [*c]const __wasi_iovec_t, iovs_len: usize, nread: [*c]__wasi_size_t) __wasi_errno_t;
pub extern fn __wasi_fd_readdir(fd: __wasi_fd_t, buf: [*c]u8, buf_len: __wasi_size_t, cookie: __wasi_dircookie_t, bufused: [*c]__wasi_size_t) __wasi_errno_t;
pub extern fn __wasi_fd_renumber(fd: __wasi_fd_t, to: __wasi_fd_t) __wasi_errno_t;
pub extern fn __wasi_fd_seek(fd: __wasi_fd_t, offset: __wasi_filedelta_t, whence: __wasi_whence_t, newoffset: [*c]__wasi_filesize_t) __wasi_errno_t;
pub extern fn __wasi_fd_sync(fd: __wasi_fd_t) __wasi_errno_t;
pub extern fn __wasi_fd_tell(fd: __wasi_fd_t, offset: [*c]__wasi_filesize_t) __wasi_errno_t;
pub extern fn __wasi_fd_write(fd: __wasi_fd_t, iovs: [*c]const __wasi_ciovec_t, iovs_len: usize, nwritten: [*c]__wasi_size_t) __wasi_errno_t;
pub extern fn __wasi_path_create_directory(fd: __wasi_fd_t, path: [*c]const u8, path_len: usize) __wasi_errno_t;
pub extern fn __wasi_path_filestat_get(fd: __wasi_fd_t, flags: __wasi_lookupflags_t, path: [*c]const u8, path_len: usize, buf: [*c]__wasi_filestat_t) __wasi_errno_t;
pub extern fn __wasi_path_filestat_set_times(fd: __wasi_fd_t, flags: __wasi_lookupflags_t, path: [*c]const u8, path_len: usize, atim: __wasi_timestamp_t, mtim: __wasi_timestamp_t, fst_flags: __wasi_fstflags_t) __wasi_errno_t;
pub extern fn __wasi_path_link(old_fd: __wasi_fd_t, old_flags: __wasi_lookupflags_t, old_path: [*c]const u8, old_path_len: usize, new_fd: __wasi_fd_t, new_path: [*c]const u8, new_path_len: usize) __wasi_errno_t;
pub extern fn __wasi_path_open(fd: __wasi_fd_t, dirflags: __wasi_lookupflags_t, path: [*c]const u8, path_len: usize, oflags: __wasi_oflags_t, fs_rights_base: __wasi_rights_t, fs_rights_inherting: __wasi_rights_t, fdflags: __wasi_fdflags_t, opened_fd: [*c]__wasi_fd_t) __wasi_errno_t;
pub extern fn __wasi_path_readlink(fd: __wasi_fd_t, path: [*c]const u8, path_len: usize, buf: [*c]u8, buf_len: __wasi_size_t, bufused: [*c]__wasi_size_t) __wasi_errno_t;
pub extern fn __wasi_path_remove_directory(fd: __wasi_fd_t, path: [*c]const u8, path_len: usize) __wasi_errno_t;
pub extern fn __wasi_path_rename(fd: __wasi_fd_t, old_path: [*c]const u8, old_path_len: usize, new_fd: __wasi_fd_t, new_path: [*c]const u8, new_path_len: usize) __wasi_errno_t;
pub extern fn __wasi_path_symlink(old_path: [*c]const u8, old_path_len: usize, fd: __wasi_fd_t, new_path: [*c]const u8, new_path_len: usize) __wasi_errno_t;
pub extern fn __wasi_path_unlink_file(fd: __wasi_fd_t, path: [*c]const u8, path_len: usize) __wasi_errno_t;
pub extern fn __wasi_poll_oneoff(in: [*c]const __wasi_subscription_t, out: [*c]__wasi_event_t, nsubscriptions: __wasi_size_t, nevents: [*c]__wasi_size_t) __wasi_errno_t;
pub extern fn __wasi_proc_exit(rval: __wasi_exitcode_t) void;
pub extern fn __wasi_proc_raise(sig: __wasi_signal_t) __wasi_errno_t;
pub extern fn __wasi_sched_yield() __wasi_errno_t;
pub extern fn __wasi_random_get(buf: [*c]u8, buf_len: __wasi_size_t) __wasi_errno_t;
pub extern fn __wasi_sock_recv(fd: __wasi_fd_t, ri_data: [*c]const __wasi_iovec_t, ri_data_len: usize, ri_flags: __wasi_riflags_t, ro_datalen: [*c]__wasi_size_t, ro_flags: [*c]__wasi_roflags_t) __wasi_errno_t;
pub extern fn __wasi_sock_send(fd: __wasi_fd_t, si_data: [*c]const __wasi_ciovec_t, si_data_len: usize, si_flags: __wasi_siflags_t, so_datalen: [*c]__wasi_size_t) __wasi_errno_t;
pub extern fn __wasi_sock_shutdown(fd: __wasi_fd_t, how: __wasi_sdflags_t) __wasi_errno_t;
pub const __isoc_va_list = __builtin_va_list;
pub const off_t = c_longlong;
pub const struct__IO_FILE = opaque {};
pub const FILE = struct__IO_FILE;
pub const union__G_fpos64_t = extern union {
    __opaque: [16]u8,
    __lldata: c_longlong,
    __align: f64,
};
pub const fpos_t = union__G_fpos64_t;
pub extern const stdin: ?*FILE;
pub extern const stdout: ?*FILE;
pub extern const stderr: ?*FILE;
pub extern fn fopen([*c]const u8, [*c]const u8) ?*FILE;
pub extern fn freopen(noalias [*c]const u8, noalias [*c]const u8, noalias ?*FILE) ?*FILE;
pub extern fn fclose(?*FILE) c_int;
pub extern fn remove([*c]const u8) c_int;
pub extern fn rename([*c]const u8, [*c]const u8) c_int;
pub extern fn feof(?*FILE) c_int;
pub extern fn ferror(?*FILE) c_int;
pub extern fn fflush(?*FILE) c_int;
pub extern fn clearerr(?*FILE) void;
pub extern fn fseek(?*FILE, c_long, c_int) c_int;
pub extern fn ftell(?*FILE) c_long;
pub extern fn rewind(?*FILE) void;
pub extern fn fgetpos(noalias ?*FILE, noalias [*c]fpos_t) c_int;
pub extern fn fsetpos(?*FILE, [*c]const fpos_t) c_int;
pub extern fn fread(?*anyopaque, c_ulong, c_ulong, ?*FILE) c_ulong;
pub extern fn fwrite(?*const anyopaque, c_ulong, c_ulong, ?*FILE) c_ulong;
pub extern fn fgetc(?*FILE) c_int;
pub extern fn getc(?*FILE) c_int;
pub extern fn getchar() c_int;
pub extern fn ungetc(c_int, ?*FILE) c_int;
pub extern fn fputc(c_int, ?*FILE) c_int;
pub extern fn putc(c_int, ?*FILE) c_int;
pub extern fn putchar(c_int) c_int;
pub extern fn fgets(noalias [*c]u8, c_int, noalias ?*FILE) [*c]u8;
pub extern fn fputs(noalias [*c]const u8, noalias ?*FILE) c_int;
pub extern fn puts([*c]const u8) c_int;
pub extern fn printf([*c]const u8, ...) c_int;
pub extern fn fprintf(?*FILE, [*c]const u8, ...) c_int;
pub extern fn sprintf([*c]u8, [*c]const u8, ...) c_int;
pub extern fn snprintf([*c]u8, c_ulong, [*c]const u8, ...) c_int;
pub extern fn vprintf([*c]const u8, __builtin_va_list) c_int;
pub extern fn vfprintf(?*FILE, [*c]const u8, __builtin_va_list) c_int;
pub extern fn vsprintf([*c]u8, [*c]const u8, __builtin_va_list) c_int;
pub extern fn vsnprintf([*c]u8, c_ulong, [*c]const u8, __builtin_va_list) c_int;
pub extern fn scanf(noalias [*c]const u8, ...) c_int;
pub extern fn fscanf(noalias ?*FILE, noalias [*c]const u8, ...) c_int;
pub extern fn sscanf(noalias [*c]const u8, noalias [*c]const u8, ...) c_int;
pub extern fn vscanf(noalias [*c]const u8, __builtin_va_list) c_int;
pub extern fn vfscanf(noalias ?*FILE, noalias [*c]const u8, __builtin_va_list) c_int;
pub extern fn vsscanf(noalias [*c]const u8, noalias [*c]const u8, __builtin_va_list) c_int;
pub extern fn perror([*c]const u8) void;
pub extern fn setvbuf(noalias ?*FILE, noalias [*c]u8, c_int, usize) c_int;
pub extern fn setbuf(noalias ?*FILE, noalias [*c]u8) void;
pub extern fn tmpnam([*c]u8) [*c]u8;
pub extern fn tmpfile() ?*FILE;
pub extern fn fmemopen(noalias ?*anyopaque, usize, noalias [*c]const u8) ?*FILE;
pub extern fn open_memstream([*c][*c]u8, [*c]usize) ?*FILE;
pub extern fn fdopen(c_int, [*c]const u8) ?*FILE;
pub extern fn popen([*c]const u8, [*c]const u8) ?*FILE;
pub extern fn pclose(?*FILE) c_int;
pub extern fn fileno(?*FILE) c_int;
pub extern fn fseeko(?*FILE, off_t, c_int) c_int;
pub extern fn ftello(?*FILE) off_t;
pub extern fn dprintf(c_int, noalias [*c]const u8, ...) c_int;
pub extern fn vdprintf(c_int, noalias [*c]const u8, __isoc_va_list) c_int;
pub extern fn flockfile(?*FILE) void;
pub extern fn ftrylockfile(?*FILE) c_int;
pub extern fn funlockfile(?*FILE) void;
pub extern fn getc_unlocked(?*FILE) c_int;
pub extern fn getchar_unlocked() c_int;
pub extern fn putc_unlocked(c_int, ?*FILE) c_int;
pub extern fn putchar_unlocked(c_int) c_int;
pub extern fn getdelim(noalias [*c][*c]u8, noalias [*c]usize, c_int, noalias ?*FILE) isize;
pub extern fn getline(noalias [*c][*c]u8, noalias [*c]usize, noalias ?*FILE) isize;
pub extern fn renameat(c_int, [*c]const u8, c_int, [*c]const u8) c_int;
pub extern fn ctermid([*c]u8) [*c]u8;
pub extern fn tempnam([*c]const u8, [*c]const u8) [*c]u8;
pub extern fn cuserid([*c]u8) [*c]u8;
pub extern fn setlinebuf(?*FILE) void;
pub extern fn setbuffer(?*FILE, [*c]u8, usize) void;
pub extern fn fgetc_unlocked(?*FILE) c_int;
pub extern fn fputc_unlocked(c_int, ?*FILE) c_int;
pub extern fn fflush_unlocked(?*FILE) c_int;
pub extern fn fread_unlocked(?*anyopaque, usize, usize, ?*FILE) usize;
pub extern fn fwrite_unlocked(?*const anyopaque, usize, usize, ?*FILE) usize;
pub extern fn clearerr_unlocked(?*FILE) void;
pub extern fn feof_unlocked(?*FILE) c_int;
pub extern fn ferror_unlocked(?*FILE) c_int;
pub extern fn fileno_unlocked(?*FILE) c_int;
pub extern fn getw(?*FILE) c_int;
pub extern fn putw(c_int, ?*FILE) c_int;
pub extern fn fgetln(?*FILE, [*c]usize) [*c]u8;
pub extern fn asprintf([*c][*c]u8, [*c]const u8, ...) c_int;
pub extern fn vasprintf([*c][*c]u8, [*c]const u8, __isoc_va_list) c_int;
pub const struct_ImVec4 = extern struct {
    x: f32 = @import("std").mem.zeroes(f32),
    y: f32 = @import("std").mem.zeroes(f32),
    z: f32 = @import("std").mem.zeroes(f32),
    w: f32 = @import("std").mem.zeroes(f32),
};
pub const ImVec4 = struct_ImVec4;
pub const ImTextureID = ?*anyopaque;
pub const ImDrawIdx = c_ushort;
pub const struct_ImVector_ImDrawIdx = extern struct {
    Size: c_int = @import("std").mem.zeroes(c_int),
    Capacity: c_int = @import("std").mem.zeroes(c_int),
    Data: [*c]ImDrawIdx = @import("std").mem.zeroes([*c]ImDrawIdx),
};
pub const ImVector_ImDrawIdx = struct_ImVector_ImDrawIdx;
pub const struct_ImVec2 = extern struct {
    x: f32 = @import("std").mem.zeroes(f32),
    y: f32 = @import("std").mem.zeroes(f32),
};
pub const ImVec2 = struct_ImVec2;
pub const ImU32 = c_uint;
pub const struct_ImDrawVert = extern struct {
    pos: ImVec2 = @import("std").mem.zeroes(ImVec2),
    uv: ImVec2 = @import("std").mem.zeroes(ImVec2),
    col: ImU32 = @import("std").mem.zeroes(ImU32),
};
pub const ImDrawVert = struct_ImDrawVert;
pub const struct_ImVector_ImDrawVert = extern struct {
    Size: c_int = @import("std").mem.zeroes(c_int),
    Capacity: c_int = @import("std").mem.zeroes(c_int),
    Data: [*c]ImDrawVert = @import("std").mem.zeroes([*c]ImDrawVert),
};
pub const ImVector_ImDrawVert = struct_ImVector_ImDrawVert;
pub const ImDrawListFlags = c_int;
pub const struct_ImVector_float = extern struct {
    Size: c_int = @import("std").mem.zeroes(c_int),
    Capacity: c_int = @import("std").mem.zeroes(c_int),
    Data: [*c]f32 = @import("std").mem.zeroes([*c]f32),
};
pub const ImVector_float = struct_ImVector_float;
pub const ImWchar16 = c_ushort;
pub const ImWchar = ImWchar16;
pub const struct_ImVector_ImWchar = extern struct {
    Size: c_int = @import("std").mem.zeroes(c_int),
    Capacity: c_int = @import("std").mem.zeroes(c_int),
    Data: [*c]ImWchar = @import("std").mem.zeroes([*c]ImWchar),
};
pub const ImVector_ImWchar = struct_ImVector_ImWchar; // /home/antaraz/dev/slingshot/cimgui/cimgui.h:1302:18: warning: struct demoted to opaque type - has bitfield
pub const struct_ImFontGlyph = opaque {};
pub const ImFontGlyph = struct_ImFontGlyph;
pub const struct_ImVector_ImFontGlyph = extern struct {
    Size: c_int = @import("std").mem.zeroes(c_int),
    Capacity: c_int = @import("std").mem.zeroes(c_int),
    Data: ?*ImFontGlyph = @import("std").mem.zeroes(?*ImFontGlyph),
};
pub const ImVector_ImFontGlyph = struct_ImVector_ImFontGlyph;
pub const ImFontAtlasFlags = c_int;
pub const struct_ImVector_ImFontPtr = extern struct {
    Size: c_int = @import("std").mem.zeroes(c_int),
    Capacity: c_int = @import("std").mem.zeroes(c_int),
    Data: [*c][*c]ImFont = @import("std").mem.zeroes([*c][*c]ImFont),
};
pub const ImVector_ImFontPtr = struct_ImVector_ImFontPtr;
pub const struct_ImFontAtlasCustomRect = extern struct {
    Width: c_ushort = @import("std").mem.zeroes(c_ushort),
    Height: c_ushort = @import("std").mem.zeroes(c_ushort),
    X: c_ushort = @import("std").mem.zeroes(c_ushort),
    Y: c_ushort = @import("std").mem.zeroes(c_ushort),
    GlyphID: c_uint = @import("std").mem.zeroes(c_uint),
    GlyphAdvanceX: f32 = @import("std").mem.zeroes(f32),
    GlyphOffset: ImVec2 = @import("std").mem.zeroes(ImVec2),
    Font: [*c]ImFont = @import("std").mem.zeroes([*c]ImFont),
};
pub const ImFontAtlasCustomRect = struct_ImFontAtlasCustomRect;
pub const struct_ImVector_ImFontAtlasCustomRect = extern struct {
    Size: c_int = @import("std").mem.zeroes(c_int),
    Capacity: c_int = @import("std").mem.zeroes(c_int),
    Data: [*c]ImFontAtlasCustomRect = @import("std").mem.zeroes([*c]ImFontAtlasCustomRect),
};
pub const ImVector_ImFontAtlasCustomRect = struct_ImVector_ImFontAtlasCustomRect;
pub const struct_ImFontConfig = extern struct {
    FontData: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    FontDataSize: c_int = @import("std").mem.zeroes(c_int),
    FontDataOwnedByAtlas: bool = @import("std").mem.zeroes(bool),
    FontNo: c_int = @import("std").mem.zeroes(c_int),
    SizePixels: f32 = @import("std").mem.zeroes(f32),
    OversampleH: c_int = @import("std").mem.zeroes(c_int),
    OversampleV: c_int = @import("std").mem.zeroes(c_int),
    PixelSnapH: bool = @import("std").mem.zeroes(bool),
    GlyphExtraSpacing: ImVec2 = @import("std").mem.zeroes(ImVec2),
    GlyphOffset: ImVec2 = @import("std").mem.zeroes(ImVec2),
    GlyphRanges: [*c]const ImWchar = @import("std").mem.zeroes([*c]const ImWchar),
    GlyphMinAdvanceX: f32 = @import("std").mem.zeroes(f32),
    GlyphMaxAdvanceX: f32 = @import("std").mem.zeroes(f32),
    MergeMode: bool = @import("std").mem.zeroes(bool),
    FontBuilderFlags: c_uint = @import("std").mem.zeroes(c_uint),
    RasterizerMultiply: f32 = @import("std").mem.zeroes(f32),
    RasterizerDensity: f32 = @import("std").mem.zeroes(f32),
    EllipsisChar: ImWchar = @import("std").mem.zeroes(ImWchar),
    Name: [40]u8 = @import("std").mem.zeroes([40]u8),
    DstFont: [*c]ImFont = @import("std").mem.zeroes([*c]ImFont),
};
pub const ImFontConfig = struct_ImFontConfig;
pub const struct_ImVector_ImFontConfig = extern struct {
    Size: c_int = @import("std").mem.zeroes(c_int),
    Capacity: c_int = @import("std").mem.zeroes(c_int),
    Data: [*c]ImFontConfig = @import("std").mem.zeroes([*c]ImFontConfig),
};
pub const ImVector_ImFontConfig = struct_ImVector_ImFontConfig;
pub const struct_ImFontBuilderIO = extern struct {
    FontBuilder_Build: ?*const fn ([*c]ImFontAtlas) callconv(.C) bool = @import("std").mem.zeroes(?*const fn ([*c]ImFontAtlas) callconv(.C) bool),
};
pub const ImFontBuilderIO = struct_ImFontBuilderIO;
pub const struct_ImFontAtlas = extern struct {
    Flags: ImFontAtlasFlags = @import("std").mem.zeroes(ImFontAtlasFlags),
    TexID: ImTextureID = @import("std").mem.zeroes(ImTextureID),
    TexDesiredWidth: c_int = @import("std").mem.zeroes(c_int),
    TexGlyphPadding: c_int = @import("std").mem.zeroes(c_int),
    Locked: bool = @import("std").mem.zeroes(bool),
    UserData: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    TexReady: bool = @import("std").mem.zeroes(bool),
    TexPixelsUseColors: bool = @import("std").mem.zeroes(bool),
    TexPixelsAlpha8: [*c]u8 = @import("std").mem.zeroes([*c]u8),
    TexPixelsRGBA32: [*c]c_uint = @import("std").mem.zeroes([*c]c_uint),
    TexWidth: c_int = @import("std").mem.zeroes(c_int),
    TexHeight: c_int = @import("std").mem.zeroes(c_int),
    TexUvScale: ImVec2 = @import("std").mem.zeroes(ImVec2),
    TexUvWhitePixel: ImVec2 = @import("std").mem.zeroes(ImVec2),
    Fonts: ImVector_ImFontPtr = @import("std").mem.zeroes(ImVector_ImFontPtr),
    CustomRects: ImVector_ImFontAtlasCustomRect = @import("std").mem.zeroes(ImVector_ImFontAtlasCustomRect),
    ConfigData: ImVector_ImFontConfig = @import("std").mem.zeroes(ImVector_ImFontConfig),
    TexUvLines: [64]ImVec4 = @import("std").mem.zeroes([64]ImVec4),
    FontBuilderIO: [*c]const ImFontBuilderIO = @import("std").mem.zeroes([*c]const ImFontBuilderIO),
    FontBuilderFlags: c_uint = @import("std").mem.zeroes(c_uint),
    PackIdMouseCursors: c_int = @import("std").mem.zeroes(c_int),
    PackIdLines: c_int = @import("std").mem.zeroes(c_int),
};
pub const ImFontAtlas = struct_ImFontAtlas;
pub const ImU8 = u8;
pub const struct_ImFont = extern struct {
    IndexAdvanceX: ImVector_float = @import("std").mem.zeroes(ImVector_float),
    FallbackAdvanceX: f32 = @import("std").mem.zeroes(f32),
    FontSize: f32 = @import("std").mem.zeroes(f32),
    IndexLookup: ImVector_ImWchar = @import("std").mem.zeroes(ImVector_ImWchar),
    Glyphs: ImVector_ImFontGlyph = @import("std").mem.zeroes(ImVector_ImFontGlyph),
    FallbackGlyph: ?*const ImFontGlyph = @import("std").mem.zeroes(?*const ImFontGlyph),
    ContainerAtlas: [*c]ImFontAtlas = @import("std").mem.zeroes([*c]ImFontAtlas),
    ConfigData: [*c]const ImFontConfig = @import("std").mem.zeroes([*c]const ImFontConfig),
    ConfigDataCount: c_short = @import("std").mem.zeroes(c_short),
    FallbackChar: ImWchar = @import("std").mem.zeroes(ImWchar),
    EllipsisChar: ImWchar = @import("std").mem.zeroes(ImWchar),
    EllipsisCharCount: c_short = @import("std").mem.zeroes(c_short),
    EllipsisWidth: f32 = @import("std").mem.zeroes(f32),
    EllipsisCharStep: f32 = @import("std").mem.zeroes(f32),
    DirtyLookupTables: bool = @import("std").mem.zeroes(bool),
    Scale: f32 = @import("std").mem.zeroes(f32),
    Ascent: f32 = @import("std").mem.zeroes(f32),
    Descent: f32 = @import("std").mem.zeroes(f32),
    MetricsTotalSurface: c_int = @import("std").mem.zeroes(c_int),
    Used4kPagesMap: [2]ImU8 = @import("std").mem.zeroes([2]ImU8),
};
pub const ImFont = struct_ImFont;
pub const struct_ImVector_ImVec2 = extern struct {
    Size: c_int = @import("std").mem.zeroes(c_int),
    Capacity: c_int = @import("std").mem.zeroes(c_int),
    Data: [*c]ImVec2 = @import("std").mem.zeroes([*c]ImVec2),
};
pub const ImVector_ImVec2 = struct_ImVector_ImVec2;
pub const struct_ImDrawListSharedData = extern struct {
    TexUvWhitePixel: ImVec2 = @import("std").mem.zeroes(ImVec2),
    Font: [*c]ImFont = @import("std").mem.zeroes([*c]ImFont),
    FontSize: f32 = @import("std").mem.zeroes(f32),
    CurveTessellationTol: f32 = @import("std").mem.zeroes(f32),
    CircleSegmentMaxError: f32 = @import("std").mem.zeroes(f32),
    ClipRectFullscreen: ImVec4 = @import("std").mem.zeroes(ImVec4),
    InitialFlags: ImDrawListFlags = @import("std").mem.zeroes(ImDrawListFlags),
    TempBuffer: ImVector_ImVec2 = @import("std").mem.zeroes(ImVector_ImVec2),
    ArcFastVtx: [48]ImVec2 = @import("std").mem.zeroes([48]ImVec2),
    ArcFastRadiusCutoff: f32 = @import("std").mem.zeroes(f32),
    CircleSegmentCounts: [64]ImU8 = @import("std").mem.zeroes([64]ImU8),
    TexUvLines: [*c]const ImVec4 = @import("std").mem.zeroes([*c]const ImVec4),
};
pub const ImDrawListSharedData = struct_ImDrawListSharedData;
pub const struct_ImDrawCmdHeader = extern struct {
    ClipRect: ImVec4 = @import("std").mem.zeroes(ImVec4),
    TextureId: ImTextureID = @import("std").mem.zeroes(ImTextureID),
    VtxOffset: c_uint = @import("std").mem.zeroes(c_uint),
};
pub const ImDrawCmdHeader = struct_ImDrawCmdHeader;
pub const ImDrawChannel = struct_ImDrawChannel;
pub const struct_ImVector_ImDrawChannel = extern struct {
    Size: c_int = @import("std").mem.zeroes(c_int),
    Capacity: c_int = @import("std").mem.zeroes(c_int),
    Data: [*c]ImDrawChannel = @import("std").mem.zeroes([*c]ImDrawChannel),
};
pub const ImVector_ImDrawChannel = struct_ImVector_ImDrawChannel;
pub const struct_ImDrawListSplitter = extern struct {
    _Current: c_int = @import("std").mem.zeroes(c_int),
    _Count: c_int = @import("std").mem.zeroes(c_int),
    _Channels: ImVector_ImDrawChannel = @import("std").mem.zeroes(ImVector_ImDrawChannel),
};
pub const ImDrawListSplitter = struct_ImDrawListSplitter;
pub const struct_ImVector_ImVec4 = extern struct {
    Size: c_int = @import("std").mem.zeroes(c_int),
    Capacity: c_int = @import("std").mem.zeroes(c_int),
    Data: [*c]ImVec4 = @import("std").mem.zeroes([*c]ImVec4),
};
pub const ImVector_ImVec4 = struct_ImVector_ImVec4;
pub const struct_ImVector_ImTextureID = extern struct {
    Size: c_int = @import("std").mem.zeroes(c_int),
    Capacity: c_int = @import("std").mem.zeroes(c_int),
    Data: [*c]ImTextureID = @import("std").mem.zeroes([*c]ImTextureID),
};
pub const ImVector_ImTextureID = struct_ImVector_ImTextureID;
pub const struct_ImDrawList = extern struct {
    CmdBuffer: ImVector_ImDrawCmd = @import("std").mem.zeroes(ImVector_ImDrawCmd),
    IdxBuffer: ImVector_ImDrawIdx = @import("std").mem.zeroes(ImVector_ImDrawIdx),
    VtxBuffer: ImVector_ImDrawVert = @import("std").mem.zeroes(ImVector_ImDrawVert),
    Flags: ImDrawListFlags = @import("std").mem.zeroes(ImDrawListFlags),
    _VtxCurrentIdx: c_uint = @import("std").mem.zeroes(c_uint),
    _Data: [*c]ImDrawListSharedData = @import("std").mem.zeroes([*c]ImDrawListSharedData),
    _VtxWritePtr: [*c]ImDrawVert = @import("std").mem.zeroes([*c]ImDrawVert),
    _IdxWritePtr: [*c]ImDrawIdx = @import("std").mem.zeroes([*c]ImDrawIdx),
    _Path: ImVector_ImVec2 = @import("std").mem.zeroes(ImVector_ImVec2),
    _CmdHeader: ImDrawCmdHeader = @import("std").mem.zeroes(ImDrawCmdHeader),
    _Splitter: ImDrawListSplitter = @import("std").mem.zeroes(ImDrawListSplitter),
    _ClipRectStack: ImVector_ImVec4 = @import("std").mem.zeroes(ImVector_ImVec4),
    _TextureIdStack: ImVector_ImTextureID = @import("std").mem.zeroes(ImVector_ImTextureID),
    _FringeScale: f32 = @import("std").mem.zeroes(f32),
    _OwnerName: [*c]const u8 = @import("std").mem.zeroes([*c]const u8),
};
pub const ImDrawList = struct_ImDrawList;
pub const ImDrawCallback = ?*const fn ([*c]const ImDrawList, [*c]const ImDrawCmd) callconv(.C) void;
pub const struct_ImDrawCmd = extern struct {
    ClipRect: ImVec4 = @import("std").mem.zeroes(ImVec4),
    TextureId: ImTextureID = @import("std").mem.zeroes(ImTextureID),
    VtxOffset: c_uint = @import("std").mem.zeroes(c_uint),
    IdxOffset: c_uint = @import("std").mem.zeroes(c_uint),
    ElemCount: c_uint = @import("std").mem.zeroes(c_uint),
    UserCallback: ImDrawCallback = @import("std").mem.zeroes(ImDrawCallback),
    UserCallbackData: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
};
pub const ImDrawCmd = struct_ImDrawCmd;
pub const struct_ImVector_ImDrawCmd = extern struct {
    Size: c_int = @import("std").mem.zeroes(c_int),
    Capacity: c_int = @import("std").mem.zeroes(c_int),
    Data: [*c]ImDrawCmd = @import("std").mem.zeroes([*c]ImDrawCmd),
};
pub const ImVector_ImDrawCmd = struct_ImVector_ImDrawCmd;
pub const struct_ImDrawChannel = extern struct {
    _CmdBuffer: ImVector_ImDrawCmd = @import("std").mem.zeroes(ImVector_ImDrawCmd),
    _IdxBuffer: ImVector_ImDrawIdx = @import("std").mem.zeroes(ImVector_ImDrawIdx),
};
pub const struct_ImVector_ImDrawListPtr = extern struct {
    Size: c_int = @import("std").mem.zeroes(c_int),
    Capacity: c_int = @import("std").mem.zeroes(c_int),
    Data: [*c][*c]ImDrawList = @import("std").mem.zeroes([*c][*c]ImDrawList),
};
pub const ImVector_ImDrawListPtr = struct_ImVector_ImDrawListPtr;
pub const ImGuiID = c_uint;
pub const ImGuiViewportFlags = c_int;
pub const ImDrawData = struct_ImDrawData;
pub const struct_ImGuiViewport = extern struct {
    ID: ImGuiID = @import("std").mem.zeroes(ImGuiID),
    Flags: ImGuiViewportFlags = @import("std").mem.zeroes(ImGuiViewportFlags),
    Pos: ImVec2 = @import("std").mem.zeroes(ImVec2),
    Size: ImVec2 = @import("std").mem.zeroes(ImVec2),
    WorkPos: ImVec2 = @import("std").mem.zeroes(ImVec2),
    WorkSize: ImVec2 = @import("std").mem.zeroes(ImVec2),
    DpiScale: f32 = @import("std").mem.zeroes(f32),
    ParentViewportId: ImGuiID = @import("std").mem.zeroes(ImGuiID),
    DrawData: [*c]ImDrawData = @import("std").mem.zeroes([*c]ImDrawData),
    RendererUserData: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    PlatformUserData: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    PlatformHandle: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    PlatformHandleRaw: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    PlatformWindowCreated: bool = @import("std").mem.zeroes(bool),
    PlatformRequestMove: bool = @import("std").mem.zeroes(bool),
    PlatformRequestResize: bool = @import("std").mem.zeroes(bool),
    PlatformRequestClose: bool = @import("std").mem.zeroes(bool),
};
pub const ImGuiViewport = struct_ImGuiViewport;
pub const struct_ImDrawData = extern struct {
    Valid: bool = @import("std").mem.zeroes(bool),
    CmdListsCount: c_int = @import("std").mem.zeroes(c_int),
    TotalIdxCount: c_int = @import("std").mem.zeroes(c_int),
    TotalVtxCount: c_int = @import("std").mem.zeroes(c_int),
    CmdLists: ImVector_ImDrawListPtr = @import("std").mem.zeroes(ImVector_ImDrawListPtr),
    DisplayPos: ImVec2 = @import("std").mem.zeroes(ImVec2),
    DisplaySize: ImVec2 = @import("std").mem.zeroes(ImVec2),
    FramebufferScale: ImVec2 = @import("std").mem.zeroes(ImVec2),
    OwnerViewport: [*c]ImGuiViewport = @import("std").mem.zeroes([*c]ImGuiViewport),
};
pub const struct_ImVector_ImU32 = extern struct {
    Size: c_int = @import("std").mem.zeroes(c_int),
    Capacity: c_int = @import("std").mem.zeroes(c_int),
    Data: [*c]ImU32 = @import("std").mem.zeroes([*c]ImU32),
};
pub const ImVector_ImU32 = struct_ImVector_ImU32;
pub const struct_ImFontGlyphRangesBuilder = extern struct {
    UsedChars: ImVector_ImU32 = @import("std").mem.zeroes(ImVector_ImU32),
};
pub const ImFontGlyphRangesBuilder = struct_ImFontGlyphRangesBuilder;
pub const struct_ImColor = extern struct {
    Value: ImVec4 = @import("std").mem.zeroes(ImVec4),
};
pub const ImColor = struct_ImColor;
pub const ImGuiConfigFlags = c_int;
pub const ImGuiBackendFlags = c_int;
pub const struct_ImGuiPlatformImeData = extern struct {
    WantVisible: bool = @import("std").mem.zeroes(bool),
    InputPos: ImVec2 = @import("std").mem.zeroes(ImVec2),
    InputLineHeight: f32 = @import("std").mem.zeroes(f32),
};
pub const ImGuiPlatformImeData = struct_ImGuiPlatformImeData;
pub const ImGuiContext = struct_ImGuiContext;
pub const ImGuiKeyChord = c_int;
pub const struct_ImGuiKeyData = extern struct {
    Down: bool = @import("std").mem.zeroes(bool),
    DownDuration: f32 = @import("std").mem.zeroes(f32),
    DownDurationPrev: f32 = @import("std").mem.zeroes(f32),
    AnalogValue: f32 = @import("std").mem.zeroes(f32),
};
pub const ImGuiKeyData = struct_ImGuiKeyData;
pub const ImU16 = c_ushort;
pub const ImS8 = i8;
pub const struct_ImGuiIO = extern struct {
    ConfigFlags: ImGuiConfigFlags = @import("std").mem.zeroes(ImGuiConfigFlags),
    BackendFlags: ImGuiBackendFlags = @import("std").mem.zeroes(ImGuiBackendFlags),
    DisplaySize: ImVec2 = @import("std").mem.zeroes(ImVec2),
    DeltaTime: f32 = @import("std").mem.zeroes(f32),
    IniSavingRate: f32 = @import("std").mem.zeroes(f32),
    IniFilename: [*c]const u8 = @import("std").mem.zeroes([*c]const u8),
    LogFilename: [*c]const u8 = @import("std").mem.zeroes([*c]const u8),
    UserData: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    Fonts: [*c]ImFontAtlas = @import("std").mem.zeroes([*c]ImFontAtlas),
    FontGlobalScale: f32 = @import("std").mem.zeroes(f32),
    FontAllowUserScaling: bool = @import("std").mem.zeroes(bool),
    FontDefault: [*c]ImFont = @import("std").mem.zeroes([*c]ImFont),
    DisplayFramebufferScale: ImVec2 = @import("std").mem.zeroes(ImVec2),
    ConfigDockingNoSplit: bool = @import("std").mem.zeroes(bool),
    ConfigDockingWithShift: bool = @import("std").mem.zeroes(bool),
    ConfigDockingAlwaysTabBar: bool = @import("std").mem.zeroes(bool),
    ConfigDockingTransparentPayload: bool = @import("std").mem.zeroes(bool),
    ConfigViewportsNoAutoMerge: bool = @import("std").mem.zeroes(bool),
    ConfigViewportsNoTaskBarIcon: bool = @import("std").mem.zeroes(bool),
    ConfigViewportsNoDecoration: bool = @import("std").mem.zeroes(bool),
    ConfigViewportsNoDefaultParent: bool = @import("std").mem.zeroes(bool),
    MouseDrawCursor: bool = @import("std").mem.zeroes(bool),
    ConfigMacOSXBehaviors: bool = @import("std").mem.zeroes(bool),
    ConfigInputTrickleEventQueue: bool = @import("std").mem.zeroes(bool),
    ConfigInputTextCursorBlink: bool = @import("std").mem.zeroes(bool),
    ConfigInputTextEnterKeepActive: bool = @import("std").mem.zeroes(bool),
    ConfigDragClickToInputText: bool = @import("std").mem.zeroes(bool),
    ConfigWindowsResizeFromEdges: bool = @import("std").mem.zeroes(bool),
    ConfigWindowsMoveFromTitleBarOnly: bool = @import("std").mem.zeroes(bool),
    ConfigMemoryCompactTimer: f32 = @import("std").mem.zeroes(f32),
    MouseDoubleClickTime: f32 = @import("std").mem.zeroes(f32),
    MouseDoubleClickMaxDist: f32 = @import("std").mem.zeroes(f32),
    MouseDragThreshold: f32 = @import("std").mem.zeroes(f32),
    KeyRepeatDelay: f32 = @import("std").mem.zeroes(f32),
    KeyRepeatRate: f32 = @import("std").mem.zeroes(f32),
    ConfigDebugIsDebuggerPresent: bool = @import("std").mem.zeroes(bool),
    ConfigDebugBeginReturnValueOnce: bool = @import("std").mem.zeroes(bool),
    ConfigDebugBeginReturnValueLoop: bool = @import("std").mem.zeroes(bool),
    ConfigDebugIgnoreFocusLoss: bool = @import("std").mem.zeroes(bool),
    ConfigDebugIniSettings: bool = @import("std").mem.zeroes(bool),
    BackendPlatformName: [*c]const u8 = @import("std").mem.zeroes([*c]const u8),
    BackendRendererName: [*c]const u8 = @import("std").mem.zeroes([*c]const u8),
    BackendPlatformUserData: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    BackendRendererUserData: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    BackendLanguageUserData: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    GetClipboardTextFn: ?*const fn (?*anyopaque) callconv(.C) [*c]const u8 = @import("std").mem.zeroes(?*const fn (?*anyopaque) callconv(.C) [*c]const u8),
    SetClipboardTextFn: ?*const fn (?*anyopaque, [*c]const u8) callconv(.C) void = @import("std").mem.zeroes(?*const fn (?*anyopaque, [*c]const u8) callconv(.C) void),
    ClipboardUserData: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    SetPlatformImeDataFn: ?*const fn ([*c]ImGuiViewport, [*c]ImGuiPlatformImeData) callconv(.C) void = @import("std").mem.zeroes(?*const fn ([*c]ImGuiViewport, [*c]ImGuiPlatformImeData) callconv(.C) void),
    PlatformLocaleDecimalPoint: ImWchar = @import("std").mem.zeroes(ImWchar),
    WantCaptureMouse: bool = @import("std").mem.zeroes(bool),
    WantCaptureKeyboard: bool = @import("std").mem.zeroes(bool),
    WantTextInput: bool = @import("std").mem.zeroes(bool),
    WantSetMousePos: bool = @import("std").mem.zeroes(bool),
    WantSaveIniSettings: bool = @import("std").mem.zeroes(bool),
    NavActive: bool = @import("std").mem.zeroes(bool),
    NavVisible: bool = @import("std").mem.zeroes(bool),
    Framerate: f32 = @import("std").mem.zeroes(f32),
    MetricsRenderVertices: c_int = @import("std").mem.zeroes(c_int),
    MetricsRenderIndices: c_int = @import("std").mem.zeroes(c_int),
    MetricsRenderWindows: c_int = @import("std").mem.zeroes(c_int),
    MetricsActiveWindows: c_int = @import("std").mem.zeroes(c_int),
    MouseDelta: ImVec2 = @import("std").mem.zeroes(ImVec2),
    Ctx: ?*ImGuiContext = @import("std").mem.zeroes(?*ImGuiContext),
    MousePos: ImVec2 = @import("std").mem.zeroes(ImVec2),
    MouseDown: [5]bool = @import("std").mem.zeroes([5]bool),
    MouseWheel: f32 = @import("std").mem.zeroes(f32),
    MouseWheelH: f32 = @import("std").mem.zeroes(f32),
    MouseSource: ImGuiMouseSource = @import("std").mem.zeroes(ImGuiMouseSource),
    MouseHoveredViewport: ImGuiID = @import("std").mem.zeroes(ImGuiID),
    KeyCtrl: bool = @import("std").mem.zeroes(bool),
    KeyShift: bool = @import("std").mem.zeroes(bool),
    KeyAlt: bool = @import("std").mem.zeroes(bool),
    KeySuper: bool = @import("std").mem.zeroes(bool),
    KeyMods: ImGuiKeyChord = @import("std").mem.zeroes(ImGuiKeyChord),
    KeysData: [154]ImGuiKeyData = @import("std").mem.zeroes([154]ImGuiKeyData),
    WantCaptureMouseUnlessPopupClose: bool = @import("std").mem.zeroes(bool),
    MousePosPrev: ImVec2 = @import("std").mem.zeroes(ImVec2),
    MouseClickedPos: [5]ImVec2 = @import("std").mem.zeroes([5]ImVec2),
    MouseClickedTime: [5]f64 = @import("std").mem.zeroes([5]f64),
    MouseClicked: [5]bool = @import("std").mem.zeroes([5]bool),
    MouseDoubleClicked: [5]bool = @import("std").mem.zeroes([5]bool),
    MouseClickedCount: [5]ImU16 = @import("std").mem.zeroes([5]ImU16),
    MouseClickedLastCount: [5]ImU16 = @import("std").mem.zeroes([5]ImU16),
    MouseReleased: [5]bool = @import("std").mem.zeroes([5]bool),
    MouseDownOwned: [5]bool = @import("std").mem.zeroes([5]bool),
    MouseDownOwnedUnlessPopupClose: [5]bool = @import("std").mem.zeroes([5]bool),
    MouseWheelRequestAxisSwap: bool = @import("std").mem.zeroes(bool),
    MouseDownDuration: [5]f32 = @import("std").mem.zeroes([5]f32),
    MouseDownDurationPrev: [5]f32 = @import("std").mem.zeroes([5]f32),
    MouseDragMaxDistanceAbs: [5]ImVec2 = @import("std").mem.zeroes([5]ImVec2),
    MouseDragMaxDistanceSqr: [5]f32 = @import("std").mem.zeroes([5]f32),
    PenPressure: f32 = @import("std").mem.zeroes(f32),
    AppFocusLost: bool = @import("std").mem.zeroes(bool),
    AppAcceptingEvents: bool = @import("std").mem.zeroes(bool),
    BackendUsingLegacyKeyArrays: ImS8 = @import("std").mem.zeroes(ImS8),
    BackendUsingLegacyNavInputArray: bool = @import("std").mem.zeroes(bool),
    InputQueueSurrogate: ImWchar16 = @import("std").mem.zeroes(ImWchar16),
    InputQueueCharacters: ImVector_ImWchar = @import("std").mem.zeroes(ImVector_ImWchar),
};
pub const ImGuiIO = struct_ImGuiIO;
pub const ImU64 = c_ulonglong;
pub const struct_ImGuiPlatformMonitor = extern struct {
    MainPos: ImVec2 = @import("std").mem.zeroes(ImVec2),
    MainSize: ImVec2 = @import("std").mem.zeroes(ImVec2),
    WorkPos: ImVec2 = @import("std").mem.zeroes(ImVec2),
    WorkSize: ImVec2 = @import("std").mem.zeroes(ImVec2),
    DpiScale: f32 = @import("std").mem.zeroes(f32),
    PlatformHandle: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
};
pub const ImGuiPlatformMonitor = struct_ImGuiPlatformMonitor;
pub const struct_ImVector_ImGuiPlatformMonitor = extern struct {
    Size: c_int = @import("std").mem.zeroes(c_int),
    Capacity: c_int = @import("std").mem.zeroes(c_int),
    Data: [*c]ImGuiPlatformMonitor = @import("std").mem.zeroes([*c]ImGuiPlatformMonitor),
};
pub const ImVector_ImGuiPlatformMonitor = struct_ImVector_ImGuiPlatformMonitor;
pub const struct_ImVector_ImGuiViewportPtr = extern struct {
    Size: c_int = @import("std").mem.zeroes(c_int),
    Capacity: c_int = @import("std").mem.zeroes(c_int),
    Data: [*c][*c]ImGuiViewport = @import("std").mem.zeroes([*c][*c]ImGuiViewport),
};
pub const ImVector_ImGuiViewportPtr = struct_ImVector_ImGuiViewportPtr;
pub const struct_ImGuiPlatformIO = extern struct {
    Platform_CreateWindow: ?*const fn ([*c]ImGuiViewport) callconv(.C) void = @import("std").mem.zeroes(?*const fn ([*c]ImGuiViewport) callconv(.C) void),
    Platform_DestroyWindow: ?*const fn ([*c]ImGuiViewport) callconv(.C) void = @import("std").mem.zeroes(?*const fn ([*c]ImGuiViewport) callconv(.C) void),
    Platform_ShowWindow: ?*const fn ([*c]ImGuiViewport) callconv(.C) void = @import("std").mem.zeroes(?*const fn ([*c]ImGuiViewport) callconv(.C) void),
    Platform_SetWindowPos: ?*const fn ([*c]ImGuiViewport, ImVec2) callconv(.C) void = @import("std").mem.zeroes(?*const fn ([*c]ImGuiViewport, ImVec2) callconv(.C) void),
    Platform_GetWindowPos: ?*const fn ([*c]ImGuiViewport) callconv(.C) ImVec2 = @import("std").mem.zeroes(?*const fn ([*c]ImGuiViewport) callconv(.C) ImVec2),
    Platform_SetWindowSize: ?*const fn ([*c]ImGuiViewport, ImVec2) callconv(.C) void = @import("std").mem.zeroes(?*const fn ([*c]ImGuiViewport, ImVec2) callconv(.C) void),
    Platform_GetWindowSize: ?*const fn ([*c]ImGuiViewport) callconv(.C) ImVec2 = @import("std").mem.zeroes(?*const fn ([*c]ImGuiViewport) callconv(.C) ImVec2),
    Platform_SetWindowFocus: ?*const fn ([*c]ImGuiViewport) callconv(.C) void = @import("std").mem.zeroes(?*const fn ([*c]ImGuiViewport) callconv(.C) void),
    Platform_GetWindowFocus: ?*const fn ([*c]ImGuiViewport) callconv(.C) bool = @import("std").mem.zeroes(?*const fn ([*c]ImGuiViewport) callconv(.C) bool),
    Platform_GetWindowMinimized: ?*const fn ([*c]ImGuiViewport) callconv(.C) bool = @import("std").mem.zeroes(?*const fn ([*c]ImGuiViewport) callconv(.C) bool),
    Platform_SetWindowTitle: ?*const fn ([*c]ImGuiViewport, [*c]const u8) callconv(.C) void = @import("std").mem.zeroes(?*const fn ([*c]ImGuiViewport, [*c]const u8) callconv(.C) void),
    Platform_SetWindowAlpha: ?*const fn ([*c]ImGuiViewport, f32) callconv(.C) void = @import("std").mem.zeroes(?*const fn ([*c]ImGuiViewport, f32) callconv(.C) void),
    Platform_UpdateWindow: ?*const fn ([*c]ImGuiViewport) callconv(.C) void = @import("std").mem.zeroes(?*const fn ([*c]ImGuiViewport) callconv(.C) void),
    Platform_RenderWindow: ?*const fn ([*c]ImGuiViewport, ?*anyopaque) callconv(.C) void = @import("std").mem.zeroes(?*const fn ([*c]ImGuiViewport, ?*anyopaque) callconv(.C) void),
    Platform_SwapBuffers: ?*const fn ([*c]ImGuiViewport, ?*anyopaque) callconv(.C) void = @import("std").mem.zeroes(?*const fn ([*c]ImGuiViewport, ?*anyopaque) callconv(.C) void),
    Platform_GetWindowDpiScale: ?*const fn ([*c]ImGuiViewport) callconv(.C) f32 = @import("std").mem.zeroes(?*const fn ([*c]ImGuiViewport) callconv(.C) f32),
    Platform_OnChangedViewport: ?*const fn ([*c]ImGuiViewport) callconv(.C) void = @import("std").mem.zeroes(?*const fn ([*c]ImGuiViewport) callconv(.C) void),
    Platform_CreateVkSurface: ?*const fn ([*c]ImGuiViewport, ImU64, ?*const anyopaque, [*c]ImU64) callconv(.C) c_int = @import("std").mem.zeroes(?*const fn ([*c]ImGuiViewport, ImU64, ?*const anyopaque, [*c]ImU64) callconv(.C) c_int),
    Renderer_CreateWindow: ?*const fn ([*c]ImGuiViewport) callconv(.C) void = @import("std").mem.zeroes(?*const fn ([*c]ImGuiViewport) callconv(.C) void),
    Renderer_DestroyWindow: ?*const fn ([*c]ImGuiViewport) callconv(.C) void = @import("std").mem.zeroes(?*const fn ([*c]ImGuiViewport) callconv(.C) void),
    Renderer_SetWindowSize: ?*const fn ([*c]ImGuiViewport, ImVec2) callconv(.C) void = @import("std").mem.zeroes(?*const fn ([*c]ImGuiViewport, ImVec2) callconv(.C) void),
    Renderer_RenderWindow: ?*const fn ([*c]ImGuiViewport, ?*anyopaque) callconv(.C) void = @import("std").mem.zeroes(?*const fn ([*c]ImGuiViewport, ?*anyopaque) callconv(.C) void),
    Renderer_SwapBuffers: ?*const fn ([*c]ImGuiViewport, ?*anyopaque) callconv(.C) void = @import("std").mem.zeroes(?*const fn ([*c]ImGuiViewport, ?*anyopaque) callconv(.C) void),
    Monitors: ImVector_ImGuiPlatformMonitor = @import("std").mem.zeroes(ImVector_ImGuiPlatformMonitor),
    Viewports: ImVector_ImGuiViewportPtr = @import("std").mem.zeroes(ImVector_ImGuiViewportPtr),
};
pub const ImGuiPlatformIO = struct_ImGuiPlatformIO;
pub const ImGuiDir = c_int;
pub const ImGuiHoveredFlags = c_int;
pub const struct_ImGuiStyle = extern struct {
    Alpha: f32 = @import("std").mem.zeroes(f32),
    DisabledAlpha: f32 = @import("std").mem.zeroes(f32),
    WindowPadding: ImVec2 = @import("std").mem.zeroes(ImVec2),
    WindowRounding: f32 = @import("std").mem.zeroes(f32),
    WindowBorderSize: f32 = @import("std").mem.zeroes(f32),
    WindowMinSize: ImVec2 = @import("std").mem.zeroes(ImVec2),
    WindowTitleAlign: ImVec2 = @import("std").mem.zeroes(ImVec2),
    WindowMenuButtonPosition: ImGuiDir = @import("std").mem.zeroes(ImGuiDir),
    ChildRounding: f32 = @import("std").mem.zeroes(f32),
    ChildBorderSize: f32 = @import("std").mem.zeroes(f32),
    PopupRounding: f32 = @import("std").mem.zeroes(f32),
    PopupBorderSize: f32 = @import("std").mem.zeroes(f32),
    FramePadding: ImVec2 = @import("std").mem.zeroes(ImVec2),
    FrameRounding: f32 = @import("std").mem.zeroes(f32),
    FrameBorderSize: f32 = @import("std").mem.zeroes(f32),
    ItemSpacing: ImVec2 = @import("std").mem.zeroes(ImVec2),
    ItemInnerSpacing: ImVec2 = @import("std").mem.zeroes(ImVec2),
    CellPadding: ImVec2 = @import("std").mem.zeroes(ImVec2),
    TouchExtraPadding: ImVec2 = @import("std").mem.zeroes(ImVec2),
    IndentSpacing: f32 = @import("std").mem.zeroes(f32),
    ColumnsMinSpacing: f32 = @import("std").mem.zeroes(f32),
    ScrollbarSize: f32 = @import("std").mem.zeroes(f32),
    ScrollbarRounding: f32 = @import("std").mem.zeroes(f32),
    GrabMinSize: f32 = @import("std").mem.zeroes(f32),
    GrabRounding: f32 = @import("std").mem.zeroes(f32),
    LogSliderDeadzone: f32 = @import("std").mem.zeroes(f32),
    TabRounding: f32 = @import("std").mem.zeroes(f32),
    TabBorderSize: f32 = @import("std").mem.zeroes(f32),
    TabMinWidthForCloseButton: f32 = @import("std").mem.zeroes(f32),
    TabBarBorderSize: f32 = @import("std").mem.zeroes(f32),
    TableAngledHeadersAngle: f32 = @import("std").mem.zeroes(f32),
    TableAngledHeadersTextAlign: ImVec2 = @import("std").mem.zeroes(ImVec2),
    ColorButtonPosition: ImGuiDir = @import("std").mem.zeroes(ImGuiDir),
    ButtonTextAlign: ImVec2 = @import("std").mem.zeroes(ImVec2),
    SelectableTextAlign: ImVec2 = @import("std").mem.zeroes(ImVec2),
    SeparatorTextBorderSize: f32 = @import("std").mem.zeroes(f32),
    SeparatorTextAlign: ImVec2 = @import("std").mem.zeroes(ImVec2),
    SeparatorTextPadding: ImVec2 = @import("std").mem.zeroes(ImVec2),
    DisplayWindowPadding: ImVec2 = @import("std").mem.zeroes(ImVec2),
    DisplaySafeAreaPadding: ImVec2 = @import("std").mem.zeroes(ImVec2),
    DockingSeparatorSize: f32 = @import("std").mem.zeroes(f32),
    MouseCursorScale: f32 = @import("std").mem.zeroes(f32),
    AntiAliasedLines: bool = @import("std").mem.zeroes(bool),
    AntiAliasedLinesUseTex: bool = @import("std").mem.zeroes(bool),
    AntiAliasedFill: bool = @import("std").mem.zeroes(bool),
    CurveTessellationTol: f32 = @import("std").mem.zeroes(f32),
    CircleTessellationMaxError: f32 = @import("std").mem.zeroes(f32),
    Colors: [55]ImVec4 = @import("std").mem.zeroes([55]ImVec4),
    HoverStationaryDelay: f32 = @import("std").mem.zeroes(f32),
    HoverDelayShort: f32 = @import("std").mem.zeroes(f32),
    HoverDelayNormal: f32 = @import("std").mem.zeroes(f32),
    HoverFlagsForTooltipMouse: ImGuiHoveredFlags = @import("std").mem.zeroes(ImGuiHoveredFlags),
    HoverFlagsForTooltipNav: ImGuiHoveredFlags = @import("std").mem.zeroes(ImGuiHoveredFlags),
};
pub const ImGuiStyle = struct_ImGuiStyle;
pub const struct_ImGuiInputEventMousePos = extern struct {
    PosX: f32 = @import("std").mem.zeroes(f32),
    PosY: f32 = @import("std").mem.zeroes(f32),
    MouseSource: ImGuiMouseSource = @import("std").mem.zeroes(ImGuiMouseSource),
};
pub const ImGuiInputEventMousePos = struct_ImGuiInputEventMousePos;
pub const struct_ImGuiInputEventMouseWheel = extern struct {
    WheelX: f32 = @import("std").mem.zeroes(f32),
    WheelY: f32 = @import("std").mem.zeroes(f32),
    MouseSource: ImGuiMouseSource = @import("std").mem.zeroes(ImGuiMouseSource),
};
pub const ImGuiInputEventMouseWheel = struct_ImGuiInputEventMouseWheel;
pub const struct_ImGuiInputEventMouseButton = extern struct {
    Button: c_int = @import("std").mem.zeroes(c_int),
    Down: bool = @import("std").mem.zeroes(bool),
    MouseSource: ImGuiMouseSource = @import("std").mem.zeroes(ImGuiMouseSource),
};
pub const ImGuiInputEventMouseButton = struct_ImGuiInputEventMouseButton;
pub const struct_ImGuiInputEventMouseViewport = extern struct {
    HoveredViewportID: ImGuiID = @import("std").mem.zeroes(ImGuiID),
};
pub const ImGuiInputEventMouseViewport = struct_ImGuiInputEventMouseViewport;
pub const struct_ImGuiInputEventKey = extern struct {
    Key: ImGuiKey = @import("std").mem.zeroes(ImGuiKey),
    Down: bool = @import("std").mem.zeroes(bool),
    AnalogValue: f32 = @import("std").mem.zeroes(f32),
};
pub const ImGuiInputEventKey = struct_ImGuiInputEventKey;
pub const struct_ImGuiInputEventText = extern struct {
    Char: c_uint = @import("std").mem.zeroes(c_uint),
};
pub const ImGuiInputEventText = struct_ImGuiInputEventText;
pub const struct_ImGuiInputEventAppFocused = extern struct {
    Focused: bool = @import("std").mem.zeroes(bool),
};
pub const ImGuiInputEventAppFocused = struct_ImGuiInputEventAppFocused;
const union_unnamed_1 = extern union {
    MousePos: ImGuiInputEventMousePos,
    MouseWheel: ImGuiInputEventMouseWheel,
    MouseButton: ImGuiInputEventMouseButton,
    MouseViewport: ImGuiInputEventMouseViewport,
    Key: ImGuiInputEventKey,
    Text: ImGuiInputEventText,
    AppFocused: ImGuiInputEventAppFocused,
};
pub const struct_ImGuiInputEvent = extern struct {
    Type: ImGuiInputEventType = @import("std").mem.zeroes(ImGuiInputEventType),
    Source: ImGuiInputSource = @import("std").mem.zeroes(ImGuiInputSource),
    EventId: ImU32 = @import("std").mem.zeroes(ImU32),
    unnamed_0: union_unnamed_1 = @import("std").mem.zeroes(union_unnamed_1),
    AddedByTestEngine: bool = @import("std").mem.zeroes(bool),
};
pub const ImGuiInputEvent = struct_ImGuiInputEvent;
pub const struct_ImVector_ImGuiInputEvent = extern struct {
    Size: c_int = @import("std").mem.zeroes(c_int),
    Capacity: c_int = @import("std").mem.zeroes(c_int),
    Data: [*c]ImGuiInputEvent = @import("std").mem.zeroes([*c]ImGuiInputEvent),
};
pub const ImVector_ImGuiInputEvent = struct_ImVector_ImGuiInputEvent;
pub const ImGuiWindowFlags = c_int;
pub const ImGuiChildFlags = c_int;
pub const ImGuiTabItemFlags = c_int;
pub const ImGuiDockNodeFlags = c_int;
pub const struct_ImGuiWindowClass = extern struct {
    ClassId: ImGuiID = @import("std").mem.zeroes(ImGuiID),
    ParentViewportId: ImGuiID = @import("std").mem.zeroes(ImGuiID),
    FocusRouteParentWindowId: ImGuiID = @import("std").mem.zeroes(ImGuiID),
    ViewportFlagsOverrideSet: ImGuiViewportFlags = @import("std").mem.zeroes(ImGuiViewportFlags),
    ViewportFlagsOverrideClear: ImGuiViewportFlags = @import("std").mem.zeroes(ImGuiViewportFlags),
    TabItemFlagsOverrideSet: ImGuiTabItemFlags = @import("std").mem.zeroes(ImGuiTabItemFlags),
    DockNodeFlagsOverrideSet: ImGuiDockNodeFlags = @import("std").mem.zeroes(ImGuiDockNodeFlags),
    DockingAlwaysTabBar: bool = @import("std").mem.zeroes(bool),
    DockingAllowUnclassed: bool = @import("std").mem.zeroes(bool),
};
pub const ImGuiWindowClass = struct_ImGuiWindowClass;
pub const struct_ImDrawDataBuilder = extern struct {
    Layers: [2][*c]ImVector_ImDrawListPtr = @import("std").mem.zeroes([2][*c]ImVector_ImDrawListPtr),
    LayerData1: ImVector_ImDrawListPtr = @import("std").mem.zeroes(ImVector_ImDrawListPtr),
};
pub const ImDrawDataBuilder = struct_ImDrawDataBuilder;
pub const struct_ImGuiViewportP = extern struct {
    _ImGuiViewport: ImGuiViewport = @import("std").mem.zeroes(ImGuiViewport),
    Window: ?*ImGuiWindow = @import("std").mem.zeroes(?*ImGuiWindow),
    Idx: c_int = @import("std").mem.zeroes(c_int),
    LastFrameActive: c_int = @import("std").mem.zeroes(c_int),
    LastFocusedStampCount: c_int = @import("std").mem.zeroes(c_int),
    LastNameHash: ImGuiID = @import("std").mem.zeroes(ImGuiID),
    LastPos: ImVec2 = @import("std").mem.zeroes(ImVec2),
    Alpha: f32 = @import("std").mem.zeroes(f32),
    LastAlpha: f32 = @import("std").mem.zeroes(f32),
    LastFocusedHadNavWindow: bool = @import("std").mem.zeroes(bool),
    PlatformMonitor: c_short = @import("std").mem.zeroes(c_short),
    BgFgDrawListsLastFrame: [2]c_int = @import("std").mem.zeroes([2]c_int),
    BgFgDrawLists: [2][*c]ImDrawList = @import("std").mem.zeroes([2][*c]ImDrawList),
    DrawDataP: ImDrawData = @import("std").mem.zeroes(ImDrawData),
    DrawDataBuilder: ImDrawDataBuilder = @import("std").mem.zeroes(ImDrawDataBuilder),
    LastPlatformPos: ImVec2 = @import("std").mem.zeroes(ImVec2),
    LastPlatformSize: ImVec2 = @import("std").mem.zeroes(ImVec2),
    LastRendererSize: ImVec2 = @import("std").mem.zeroes(ImVec2),
    WorkOffsetMin: ImVec2 = @import("std").mem.zeroes(ImVec2),
    WorkOffsetMax: ImVec2 = @import("std").mem.zeroes(ImVec2),
    BuildWorkOffsetMin: ImVec2 = @import("std").mem.zeroes(ImVec2),
    BuildWorkOffsetMax: ImVec2 = @import("std").mem.zeroes(ImVec2),
};
pub const ImGuiViewportP = struct_ImGuiViewportP; // /home/antaraz/dev/slingshot/cimgui/cimgui.h:2941:15: warning: struct demoted to opaque type - has bitfield
pub const struct_ImGuiWindow = opaque {};
pub const ImGuiWindow = struct_ImGuiWindow;
pub const struct_ImVector_ImGuiWindowPtr = extern struct {
    Size: c_int = @import("std").mem.zeroes(c_int),
    Capacity: c_int = @import("std").mem.zeroes(c_int),
    Data: [*c]?*ImGuiWindow = @import("std").mem.zeroes([*c]?*ImGuiWindow),
};
pub const ImVector_ImGuiWindowPtr = struct_ImVector_ImGuiWindowPtr;
pub const ImGuiItemFlags = c_int;
pub const ImGuiItemStatusFlags = c_int;
pub const struct_ImRect = extern struct {
    Min: ImVec2 = @import("std").mem.zeroes(ImVec2),
    Max: ImVec2 = @import("std").mem.zeroes(ImVec2),
};
pub const ImRect = struct_ImRect;
pub const struct_ImGuiLastItemData = extern struct {
    ID: ImGuiID = @import("std").mem.zeroes(ImGuiID),
    InFlags: ImGuiItemFlags = @import("std").mem.zeroes(ImGuiItemFlags),
    StatusFlags: ImGuiItemStatusFlags = @import("std").mem.zeroes(ImGuiItemStatusFlags),
    Rect: ImRect = @import("std").mem.zeroes(ImRect),
    NavRect: ImRect = @import("std").mem.zeroes(ImRect),
    DisplayRect: ImRect = @import("std").mem.zeroes(ImRect),
    ClipRect: ImRect = @import("std").mem.zeroes(ImRect),
};
pub const ImGuiLastItemData = struct_ImGuiLastItemData;
pub const struct_ImGuiStackSizes = extern struct {
    SizeOfIDStack: c_short = @import("std").mem.zeroes(c_short),
    SizeOfColorStack: c_short = @import("std").mem.zeroes(c_short),
    SizeOfStyleVarStack: c_short = @import("std").mem.zeroes(c_short),
    SizeOfFontStack: c_short = @import("std").mem.zeroes(c_short),
    SizeOfFocusScopeStack: c_short = @import("std").mem.zeroes(c_short),
    SizeOfGroupStack: c_short = @import("std").mem.zeroes(c_short),
    SizeOfItemFlagsStack: c_short = @import("std").mem.zeroes(c_short),
    SizeOfBeginPopupStack: c_short = @import("std").mem.zeroes(c_short),
    SizeOfDisabledStack: c_short = @import("std").mem.zeroes(c_short),
};
pub const ImGuiStackSizes = struct_ImGuiStackSizes;
pub const struct_ImGuiWindowStackData = extern struct {
    Window: ?*ImGuiWindow = @import("std").mem.zeroes(?*ImGuiWindow),
    ParentLastItemDataBackup: ImGuiLastItemData = @import("std").mem.zeroes(ImGuiLastItemData),
    StackSizesOnBegin: ImGuiStackSizes = @import("std").mem.zeroes(ImGuiStackSizes),
};
pub const ImGuiWindowStackData = struct_ImGuiWindowStackData;
pub const struct_ImVector_ImGuiWindowStackData = extern struct {
    Size: c_int = @import("std").mem.zeroes(c_int),
    Capacity: c_int = @import("std").mem.zeroes(c_int),
    Data: [*c]ImGuiWindowStackData = @import("std").mem.zeroes([*c]ImGuiWindowStackData),
};
pub const ImVector_ImGuiWindowStackData = struct_ImVector_ImGuiWindowStackData;
const union_unnamed_2 = extern union {
    val_i: c_int,
    val_f: f32,
    val_p: ?*anyopaque,
};
pub const struct_ImGuiStoragePair = extern struct {
    key: ImGuiID = @import("std").mem.zeroes(ImGuiID),
    unnamed_0: union_unnamed_2 = @import("std").mem.zeroes(union_unnamed_2),
};
pub const ImGuiStoragePair = struct_ImGuiStoragePair;
pub const struct_ImVector_ImGuiStoragePair = extern struct {
    Size: c_int = @import("std").mem.zeroes(c_int),
    Capacity: c_int = @import("std").mem.zeroes(c_int),
    Data: [*c]ImGuiStoragePair = @import("std").mem.zeroes([*c]ImGuiStoragePair),
};
pub const ImVector_ImGuiStoragePair = struct_ImVector_ImGuiStoragePair;
pub const struct_ImGuiStorage = extern struct {
    Data: ImVector_ImGuiStoragePair = @import("std").mem.zeroes(ImVector_ImGuiStoragePair),
};
pub const ImGuiStorage = struct_ImGuiStorage; // /home/antaraz/dev/slingshot/cimgui/cimgui.h:2610:9: warning: struct demoted to opaque type - has bitfield
pub const struct_ImGuiContext = opaque {};
pub const ImGuiInputTextFlags = c_int;
pub const struct_ImGuiInputTextCallbackData = extern struct {
    Ctx: ?*ImGuiContext = @import("std").mem.zeroes(?*ImGuiContext),
    EventFlag: ImGuiInputTextFlags = @import("std").mem.zeroes(ImGuiInputTextFlags),
    Flags: ImGuiInputTextFlags = @import("std").mem.zeroes(ImGuiInputTextFlags),
    UserData: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    EventChar: ImWchar = @import("std").mem.zeroes(ImWchar),
    EventKey: ImGuiKey = @import("std").mem.zeroes(ImGuiKey),
    Buf: [*c]u8 = @import("std").mem.zeroes([*c]u8),
    BufTextLen: c_int = @import("std").mem.zeroes(c_int),
    BufSize: c_int = @import("std").mem.zeroes(c_int),
    BufDirty: bool = @import("std").mem.zeroes(bool),
    CursorPos: c_int = @import("std").mem.zeroes(c_int),
    SelectionStart: c_int = @import("std").mem.zeroes(c_int),
    SelectionEnd: c_int = @import("std").mem.zeroes(c_int),
};
pub const ImGuiInputTextCallbackData = struct_ImGuiInputTextCallbackData;
pub const struct_ImGuiListClipper = extern struct {
    Ctx: ?*ImGuiContext = @import("std").mem.zeroes(?*ImGuiContext),
    DisplayStart: c_int = @import("std").mem.zeroes(c_int),
    DisplayEnd: c_int = @import("std").mem.zeroes(c_int),
    ItemsCount: c_int = @import("std").mem.zeroes(c_int),
    ItemsHeight: f32 = @import("std").mem.zeroes(f32),
    StartPosY: f32 = @import("std").mem.zeroes(f32),
    TempData: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
};
pub const ImGuiListClipper = struct_ImGuiListClipper;
pub const struct_ImGuiOnceUponAFrame = extern struct {
    RefFrame: c_int = @import("std").mem.zeroes(c_int),
};
pub const ImGuiOnceUponAFrame = struct_ImGuiOnceUponAFrame;
pub const struct_ImGuiPayload = extern struct {
    Data: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    DataSize: c_int = @import("std").mem.zeroes(c_int),
    SourceId: ImGuiID = @import("std").mem.zeroes(ImGuiID),
    SourceParentId: ImGuiID = @import("std").mem.zeroes(ImGuiID),
    DataFrameCount: c_int = @import("std").mem.zeroes(c_int),
    DataType: [33]u8 = @import("std").mem.zeroes([33]u8),
    Preview: bool = @import("std").mem.zeroes(bool),
    Delivery: bool = @import("std").mem.zeroes(bool),
};
pub const ImGuiPayload = struct_ImGuiPayload;
pub const struct_ImGuiSizeCallbackData = extern struct {
    UserData: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    Pos: ImVec2 = @import("std").mem.zeroes(ImVec2),
    CurrentSize: ImVec2 = @import("std").mem.zeroes(ImVec2),
    DesiredSize: ImVec2 = @import("std").mem.zeroes(ImVec2),
};
pub const ImGuiSizeCallbackData = struct_ImGuiSizeCallbackData;
pub const ImS16 = c_short; // /home/antaraz/dev/slingshot/cimgui/cimgui.h:904:24: warning: struct demoted to opaque type - has bitfield
pub const struct_ImGuiTableColumnSortSpecs = opaque {};
pub const ImGuiTableColumnSortSpecs = struct_ImGuiTableColumnSortSpecs;
pub const struct_ImGuiTableSortSpecs = extern struct {
    Specs: ?*const ImGuiTableColumnSortSpecs = @import("std").mem.zeroes(?*const ImGuiTableColumnSortSpecs),
    SpecsCount: c_int = @import("std").mem.zeroes(c_int),
    SpecsDirty: bool = @import("std").mem.zeroes(bool),
};
pub const ImGuiTableSortSpecs = struct_ImGuiTableSortSpecs;
pub const struct_ImVector_char = extern struct {
    Size: c_int = @import("std").mem.zeroes(c_int),
    Capacity: c_int = @import("std").mem.zeroes(c_int),
    Data: [*c]u8 = @import("std").mem.zeroes([*c]u8),
};
pub const ImVector_char = struct_ImVector_char;
pub const struct_ImGuiTextBuffer = extern struct {
    Buf: ImVector_char = @import("std").mem.zeroes(ImVector_char),
};
pub const ImGuiTextBuffer = struct_ImGuiTextBuffer;
pub const struct_ImGuiTextRange = extern struct {
    b: [*c]const u8 = @import("std").mem.zeroes([*c]const u8),
    e: [*c]const u8 = @import("std").mem.zeroes([*c]const u8),
};
pub const ImGuiTextRange = struct_ImGuiTextRange;
pub const struct_ImVector_ImGuiTextRange = extern struct {
    Size: c_int = @import("std").mem.zeroes(c_int),
    Capacity: c_int = @import("std").mem.zeroes(c_int),
    Data: [*c]ImGuiTextRange = @import("std").mem.zeroes([*c]ImGuiTextRange),
};
pub const ImVector_ImGuiTextRange = struct_ImVector_ImGuiTextRange;
pub const struct_ImGuiTextFilter = extern struct {
    InputBuf: [256]u8 = @import("std").mem.zeroes([256]u8),
    Filters: ImVector_ImGuiTextRange = @import("std").mem.zeroes(ImVector_ImGuiTextRange),
    CountGrep: c_int = @import("std").mem.zeroes(c_int),
};
pub const ImGuiTextFilter = struct_ImGuiTextFilter;
pub const struct_ImBitVector = extern struct {
    Storage: ImVector_ImU32 = @import("std").mem.zeroes(ImVector_ImU32),
};
pub const ImBitVector = struct_ImBitVector;
pub const ImGuiCol = c_int;
pub const struct_ImGuiColorMod = extern struct {
    Col: ImGuiCol = @import("std").mem.zeroes(ImGuiCol),
    BackupValue: ImVec4 = @import("std").mem.zeroes(ImVec4),
};
pub const ImGuiColorMod = struct_ImGuiColorMod;
pub const ImGuiContextHook = struct_ImGuiContextHook;
pub const ImGuiContextHookCallback = ?*const fn (?*ImGuiContext, [*c]ImGuiContextHook) callconv(.C) void;
pub const struct_ImGuiContextHook = extern struct {
    HookId: ImGuiID = @import("std").mem.zeroes(ImGuiID),
    Type: ImGuiContextHookType = @import("std").mem.zeroes(ImGuiContextHookType),
    Owner: ImGuiID = @import("std").mem.zeroes(ImGuiID),
    Callback: ImGuiContextHookCallback = @import("std").mem.zeroes(ImGuiContextHookCallback),
    UserData: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
};
pub const ImGuiDataType = c_int;
pub const struct_ImGuiDataVarInfo = extern struct {
    Type: ImGuiDataType = @import("std").mem.zeroes(ImGuiDataType),
    Count: ImU32 = @import("std").mem.zeroes(ImU32),
    Offset: ImU32 = @import("std").mem.zeroes(ImU32),
};
pub const ImGuiDataVarInfo = struct_ImGuiDataVarInfo;
pub const struct_ImGuiDataTypeInfo = extern struct {
    Size: usize = @import("std").mem.zeroes(usize),
    Name: [*c]const u8 = @import("std").mem.zeroes([*c]const u8),
    PrintFmt: [*c]const u8 = @import("std").mem.zeroes([*c]const u8),
    ScanFmt: [*c]const u8 = @import("std").mem.zeroes([*c]const u8),
};
pub const ImGuiDataTypeInfo = struct_ImGuiDataTypeInfo;
pub const struct_ImGuiDockRequest = opaque {};
pub const ImGuiDockRequest = struct_ImGuiDockRequest;
pub const struct_ImVector_ImGuiDockRequest = extern struct {
    Size: c_int = @import("std").mem.zeroes(c_int),
    Capacity: c_int = @import("std").mem.zeroes(c_int),
    Data: ?*ImGuiDockRequest = @import("std").mem.zeroes(?*ImGuiDockRequest),
};
pub const ImVector_ImGuiDockRequest = struct_ImVector_ImGuiDockRequest;
pub const struct_ImGuiDockNodeSettings = opaque {};
pub const ImGuiDockNodeSettings = struct_ImGuiDockNodeSettings;
pub const struct_ImVector_ImGuiDockNodeSettings = extern struct {
    Size: c_int = @import("std").mem.zeroes(c_int),
    Capacity: c_int = @import("std").mem.zeroes(c_int),
    Data: ?*ImGuiDockNodeSettings = @import("std").mem.zeroes(?*ImGuiDockNodeSettings),
};
pub const ImVector_ImGuiDockNodeSettings = struct_ImVector_ImGuiDockNodeSettings;
pub const struct_ImGuiDockContext = extern struct {
    Nodes: ImGuiStorage = @import("std").mem.zeroes(ImGuiStorage),
    Requests: ImVector_ImGuiDockRequest = @import("std").mem.zeroes(ImVector_ImGuiDockRequest),
    NodesSettings: ImVector_ImGuiDockNodeSettings = @import("std").mem.zeroes(ImVector_ImGuiDockNodeSettings),
    WantFullRebuild: bool = @import("std").mem.zeroes(bool),
};
pub const ImGuiDockContext = struct_ImGuiDockContext;
pub const ImGuiDockNode = struct_ImGuiDockNode;
pub const ImS32 = c_int;
pub const struct_ImGuiTabItem = extern struct {
    ID: ImGuiID = @import("std").mem.zeroes(ImGuiID),
    Flags: ImGuiTabItemFlags = @import("std").mem.zeroes(ImGuiTabItemFlags),
    Window: ?*ImGuiWindow = @import("std").mem.zeroes(?*ImGuiWindow),
    LastFrameVisible: c_int = @import("std").mem.zeroes(c_int),
    LastFrameSelected: c_int = @import("std").mem.zeroes(c_int),
    Offset: f32 = @import("std").mem.zeroes(f32),
    Width: f32 = @import("std").mem.zeroes(f32),
    ContentWidth: f32 = @import("std").mem.zeroes(f32),
    RequestedWidth: f32 = @import("std").mem.zeroes(f32),
    NameOffset: ImS32 = @import("std").mem.zeroes(ImS32),
    BeginOrder: ImS16 = @import("std").mem.zeroes(ImS16),
    IndexDuringLayout: ImS16 = @import("std").mem.zeroes(ImS16),
    WantClose: bool = @import("std").mem.zeroes(bool),
};
pub const ImGuiTabItem = struct_ImGuiTabItem;
pub const struct_ImVector_ImGuiTabItem = extern struct {
    Size: c_int = @import("std").mem.zeroes(c_int),
    Capacity: c_int = @import("std").mem.zeroes(c_int),
    Data: [*c]ImGuiTabItem = @import("std").mem.zeroes([*c]ImGuiTabItem),
};
pub const ImVector_ImGuiTabItem = struct_ImVector_ImGuiTabItem;
pub const ImGuiTabBarFlags = c_int;
pub const struct_ImGuiTabBar = extern struct {
    Tabs: ImVector_ImGuiTabItem = @import("std").mem.zeroes(ImVector_ImGuiTabItem),
    Flags: ImGuiTabBarFlags = @import("std").mem.zeroes(ImGuiTabBarFlags),
    ID: ImGuiID = @import("std").mem.zeroes(ImGuiID),
    SelectedTabId: ImGuiID = @import("std").mem.zeroes(ImGuiID),
    NextSelectedTabId: ImGuiID = @import("std").mem.zeroes(ImGuiID),
    VisibleTabId: ImGuiID = @import("std").mem.zeroes(ImGuiID),
    CurrFrameVisible: c_int = @import("std").mem.zeroes(c_int),
    PrevFrameVisible: c_int = @import("std").mem.zeroes(c_int),
    BarRect: ImRect = @import("std").mem.zeroes(ImRect),
    CurrTabsContentsHeight: f32 = @import("std").mem.zeroes(f32),
    PrevTabsContentsHeight: f32 = @import("std").mem.zeroes(f32),
    WidthAllTabs: f32 = @import("std").mem.zeroes(f32),
    WidthAllTabsIdeal: f32 = @import("std").mem.zeroes(f32),
    ScrollingAnim: f32 = @import("std").mem.zeroes(f32),
    ScrollingTarget: f32 = @import("std").mem.zeroes(f32),
    ScrollingTargetDistToVisibility: f32 = @import("std").mem.zeroes(f32),
    ScrollingSpeed: f32 = @import("std").mem.zeroes(f32),
    ScrollingRectMinX: f32 = @import("std").mem.zeroes(f32),
    ScrollingRectMaxX: f32 = @import("std").mem.zeroes(f32),
    SeparatorMinX: f32 = @import("std").mem.zeroes(f32),
    SeparatorMaxX: f32 = @import("std").mem.zeroes(f32),
    ReorderRequestTabId: ImGuiID = @import("std").mem.zeroes(ImGuiID),
    ReorderRequestOffset: ImS16 = @import("std").mem.zeroes(ImS16),
    BeginCount: ImS8 = @import("std").mem.zeroes(ImS8),
    WantLayout: bool = @import("std").mem.zeroes(bool),
    VisibleTabWasSubmitted: bool = @import("std").mem.zeroes(bool),
    TabsAddedNew: bool = @import("std").mem.zeroes(bool),
    TabsActiveCount: ImS16 = @import("std").mem.zeroes(ImS16),
    LastTabItemIdx: ImS16 = @import("std").mem.zeroes(ImS16),
    ItemSpacingY: f32 = @import("std").mem.zeroes(f32),
    FramePadding: ImVec2 = @import("std").mem.zeroes(ImVec2),
    BackupCursorPos: ImVec2 = @import("std").mem.zeroes(ImVec2),
    TabsNames: ImGuiTextBuffer = @import("std").mem.zeroes(ImGuiTextBuffer),
};
pub const ImGuiTabBar = struct_ImGuiTabBar; // /home/antaraz/dev/slingshot/cimgui/cimgui.h:2308:24: warning: struct demoted to opaque type - has bitfield
pub const struct_ImGuiDockNode = opaque {};
pub const struct_ImVec1 = extern struct {
    x: f32 = @import("std").mem.zeroes(f32),
};
pub const ImVec1 = struct_ImVec1;
pub const struct_ImGuiGroupData = extern struct {
    WindowID: ImGuiID = @import("std").mem.zeroes(ImGuiID),
    BackupCursorPos: ImVec2 = @import("std").mem.zeroes(ImVec2),
    BackupCursorMaxPos: ImVec2 = @import("std").mem.zeroes(ImVec2),
    BackupCursorPosPrevLine: ImVec2 = @import("std").mem.zeroes(ImVec2),
    BackupIndent: ImVec1 = @import("std").mem.zeroes(ImVec1),
    BackupGroupOffset: ImVec1 = @import("std").mem.zeroes(ImVec1),
    BackupCurrLineSize: ImVec2 = @import("std").mem.zeroes(ImVec2),
    BackupCurrLineTextBaseOffset: f32 = @import("std").mem.zeroes(f32),
    BackupActiveIdIsAlive: ImGuiID = @import("std").mem.zeroes(ImGuiID),
    BackupActiveIdPreviousFrameIsAlive: bool = @import("std").mem.zeroes(bool),
    BackupHoveredIdIsAlive: bool = @import("std").mem.zeroes(bool),
    BackupIsSameLine: bool = @import("std").mem.zeroes(bool),
    EmitItem: bool = @import("std").mem.zeroes(bool),
};
pub const ImGuiGroupData = struct_ImGuiGroupData;
pub const struct_StbUndoRecord = extern struct {
    where: c_int = @import("std").mem.zeroes(c_int),
    insert_length: c_int = @import("std").mem.zeroes(c_int),
    delete_length: c_int = @import("std").mem.zeroes(c_int),
    char_storage: c_int = @import("std").mem.zeroes(c_int),
};
pub const StbUndoRecord = struct_StbUndoRecord;
pub const struct_StbUndoState = extern struct {
    undo_rec: [99]StbUndoRecord = @import("std").mem.zeroes([99]StbUndoRecord),
    undo_char: [999]ImWchar = @import("std").mem.zeroes([999]ImWchar),
    undo_point: c_short = @import("std").mem.zeroes(c_short),
    redo_point: c_short = @import("std").mem.zeroes(c_short),
    undo_char_point: c_int = @import("std").mem.zeroes(c_int),
    redo_char_point: c_int = @import("std").mem.zeroes(c_int),
};
pub const StbUndoState = struct_StbUndoState;
pub const struct_STB_TexteditState = extern struct {
    cursor: c_int = @import("std").mem.zeroes(c_int),
    select_start: c_int = @import("std").mem.zeroes(c_int),
    select_end: c_int = @import("std").mem.zeroes(c_int),
    insert_mode: u8 = @import("std").mem.zeroes(u8),
    row_count_per_page: c_int = @import("std").mem.zeroes(c_int),
    cursor_at_end_of_line: u8 = @import("std").mem.zeroes(u8),
    initialized: u8 = @import("std").mem.zeroes(u8),
    has_preferred_x: u8 = @import("std").mem.zeroes(u8),
    single_line: u8 = @import("std").mem.zeroes(u8),
    padding1: u8 = @import("std").mem.zeroes(u8),
    padding2: u8 = @import("std").mem.zeroes(u8),
    padding3: u8 = @import("std").mem.zeroes(u8),
    preferred_x: f32 = @import("std").mem.zeroes(f32),
    undostate: StbUndoState = @import("std").mem.zeroes(StbUndoState),
};
pub const STB_TexteditState = struct_STB_TexteditState;
pub const struct_ImGuiInputTextState = extern struct {
    Ctx: ?*ImGuiContext = @import("std").mem.zeroes(?*ImGuiContext),
    ID: ImGuiID = @import("std").mem.zeroes(ImGuiID),
    CurLenW: c_int = @import("std").mem.zeroes(c_int),
    CurLenA: c_int = @import("std").mem.zeroes(c_int),
    TextW: ImVector_ImWchar = @import("std").mem.zeroes(ImVector_ImWchar),
    TextA: ImVector_char = @import("std").mem.zeroes(ImVector_char),
    InitialTextA: ImVector_char = @import("std").mem.zeroes(ImVector_char),
    TextAIsValid: bool = @import("std").mem.zeroes(bool),
    BufCapacityA: c_int = @import("std").mem.zeroes(c_int),
    ScrollX: f32 = @import("std").mem.zeroes(f32),
    Stb: STB_TexteditState = @import("std").mem.zeroes(STB_TexteditState),
    CursorAnim: f32 = @import("std").mem.zeroes(f32),
    CursorFollow: bool = @import("std").mem.zeroes(bool),
    SelectedAllMouseLock: bool = @import("std").mem.zeroes(bool),
    Edited: bool = @import("std").mem.zeroes(bool),
    Flags: ImGuiInputTextFlags = @import("std").mem.zeroes(ImGuiInputTextFlags),
    ReloadUserBuf: bool = @import("std").mem.zeroes(bool),
    ReloadSelectionStart: c_int = @import("std").mem.zeroes(c_int),
    ReloadSelectionEnd: c_int = @import("std").mem.zeroes(c_int),
};
pub const ImGuiInputTextState = struct_ImGuiInputTextState;
pub const struct_ImGuiInputTextDeactivateData = opaque {};
pub const ImGuiInputTextDeactivateData = struct_ImGuiInputTextDeactivateData;
pub const struct_ImGuiLocEntry = extern struct {
    Key: ImGuiLocKey = @import("std").mem.zeroes(ImGuiLocKey),
    Text: [*c]const u8 = @import("std").mem.zeroes([*c]const u8),
};
pub const ImGuiLocEntry = struct_ImGuiLocEntry;
pub const struct_ImGuiMenuColumns = extern struct {
    TotalWidth: ImU32 = @import("std").mem.zeroes(ImU32),
    NextTotalWidth: ImU32 = @import("std").mem.zeroes(ImU32),
    Spacing: ImU16 = @import("std").mem.zeroes(ImU16),
    OffsetIcon: ImU16 = @import("std").mem.zeroes(ImU16),
    OffsetLabel: ImU16 = @import("std").mem.zeroes(ImU16),
    OffsetShortcut: ImU16 = @import("std").mem.zeroes(ImU16),
    OffsetMark: ImU16 = @import("std").mem.zeroes(ImU16),
    Widths: [4]ImU16 = @import("std").mem.zeroes([4]ImU16),
};
pub const ImGuiMenuColumns = struct_ImGuiMenuColumns;
pub const ImS64 = c_longlong;
pub const ImGuiSelectionUserData = ImS64;
pub const struct_ImGuiNavItemData = extern struct {
    Window: ?*ImGuiWindow = @import("std").mem.zeroes(?*ImGuiWindow),
    ID: ImGuiID = @import("std").mem.zeroes(ImGuiID),
    FocusScopeId: ImGuiID = @import("std").mem.zeroes(ImGuiID),
    RectRel: ImRect = @import("std").mem.zeroes(ImRect),
    InFlags: ImGuiItemFlags = @import("std").mem.zeroes(ImGuiItemFlags),
    DistBox: f32 = @import("std").mem.zeroes(f32),
    DistCenter: f32 = @import("std").mem.zeroes(f32),
    DistAxial: f32 = @import("std").mem.zeroes(f32),
    SelectionUserData: ImGuiSelectionUserData = @import("std").mem.zeroes(ImGuiSelectionUserData),
};
pub const ImGuiNavItemData = struct_ImGuiNavItemData;
pub const struct_ImGuiNavTreeNodeData = extern struct {
    ID: ImGuiID = @import("std").mem.zeroes(ImGuiID),
    InFlags: ImGuiItemFlags = @import("std").mem.zeroes(ImGuiItemFlags),
    NavRect: ImRect = @import("std").mem.zeroes(ImRect),
};
pub const ImGuiNavTreeNodeData = struct_ImGuiNavTreeNodeData;
pub const struct_ImGuiMetricsConfig = extern struct {
    ShowDebugLog: bool = @import("std").mem.zeroes(bool),
    ShowIDStackTool: bool = @import("std").mem.zeroes(bool),
    ShowWindowsRects: bool = @import("std").mem.zeroes(bool),
    ShowWindowsBeginOrder: bool = @import("std").mem.zeroes(bool),
    ShowTablesRects: bool = @import("std").mem.zeroes(bool),
    ShowDrawCmdMesh: bool = @import("std").mem.zeroes(bool),
    ShowDrawCmdBoundingBoxes: bool = @import("std").mem.zeroes(bool),
    ShowTextEncodingViewer: bool = @import("std").mem.zeroes(bool),
    ShowAtlasTintedWithTextColor: bool = @import("std").mem.zeroes(bool),
    ShowDockingNodes: bool = @import("std").mem.zeroes(bool),
    ShowWindowsRectsType: c_int = @import("std").mem.zeroes(c_int),
    ShowTablesRectsType: c_int = @import("std").mem.zeroes(c_int),
    HighlightMonitorIdx: c_int = @import("std").mem.zeroes(c_int),
    HighlightViewportID: ImGuiID = @import("std").mem.zeroes(ImGuiID),
};
pub const ImGuiMetricsConfig = struct_ImGuiMetricsConfig;
pub const ImGuiNextWindowDataFlags = c_int;
pub const ImGuiCond = c_int;
pub const ImGuiSizeCallback = ?*const fn ([*c]ImGuiSizeCallbackData) callconv(.C) void;
pub const ImGuiWindowRefreshFlags = c_int;
pub const struct_ImGuiNextWindowData = extern struct {
    Flags: ImGuiNextWindowDataFlags = @import("std").mem.zeroes(ImGuiNextWindowDataFlags),
    PosCond: ImGuiCond = @import("std").mem.zeroes(ImGuiCond),
    SizeCond: ImGuiCond = @import("std").mem.zeroes(ImGuiCond),
    CollapsedCond: ImGuiCond = @import("std").mem.zeroes(ImGuiCond),
    DockCond: ImGuiCond = @import("std").mem.zeroes(ImGuiCond),
    PosVal: ImVec2 = @import("std").mem.zeroes(ImVec2),
    PosPivotVal: ImVec2 = @import("std").mem.zeroes(ImVec2),
    SizeVal: ImVec2 = @import("std").mem.zeroes(ImVec2),
    ContentSizeVal: ImVec2 = @import("std").mem.zeroes(ImVec2),
    ScrollVal: ImVec2 = @import("std").mem.zeroes(ImVec2),
    ChildFlags: ImGuiChildFlags = @import("std").mem.zeroes(ImGuiChildFlags),
    PosUndock: bool = @import("std").mem.zeroes(bool),
    CollapsedVal: bool = @import("std").mem.zeroes(bool),
    SizeConstraintRect: ImRect = @import("std").mem.zeroes(ImRect),
    SizeCallback: ImGuiSizeCallback = @import("std").mem.zeroes(ImGuiSizeCallback),
    SizeCallbackUserData: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    BgAlphaVal: f32 = @import("std").mem.zeroes(f32),
    ViewportId: ImGuiID = @import("std").mem.zeroes(ImGuiID),
    DockId: ImGuiID = @import("std").mem.zeroes(ImGuiID),
    WindowClass: ImGuiWindowClass = @import("std").mem.zeroes(ImGuiWindowClass),
    MenuBarOffsetMinVal: ImVec2 = @import("std").mem.zeroes(ImVec2),
    RefreshFlagsVal: ImGuiWindowRefreshFlags = @import("std").mem.zeroes(ImGuiWindowRefreshFlags),
};
pub const ImGuiNextWindowData = struct_ImGuiNextWindowData;
pub const ImGuiNextItemDataFlags = c_int; // /home/antaraz/dev/slingshot/cimgui/cimgui.h:1882:15: warning: struct demoted to opaque type - has bitfield
pub const struct_ImGuiNextItemData = opaque {};
pub const ImGuiNextItemData = struct_ImGuiNextItemData;
pub const ImGuiOldColumnFlags = c_int;
pub const struct_ImGuiOldColumnData = extern struct {
    OffsetNorm: f32 = @import("std").mem.zeroes(f32),
    OffsetNormBeforeResize: f32 = @import("std").mem.zeroes(f32),
    Flags: ImGuiOldColumnFlags = @import("std").mem.zeroes(ImGuiOldColumnFlags),
    ClipRect: ImRect = @import("std").mem.zeroes(ImRect),
};
pub const ImGuiOldColumnData = struct_ImGuiOldColumnData;
pub const struct_ImVector_ImGuiOldColumnData = extern struct {
    Size: c_int = @import("std").mem.zeroes(c_int),
    Capacity: c_int = @import("std").mem.zeroes(c_int),
    Data: [*c]ImGuiOldColumnData = @import("std").mem.zeroes([*c]ImGuiOldColumnData),
};
pub const ImVector_ImGuiOldColumnData = struct_ImVector_ImGuiOldColumnData;
pub const struct_ImGuiOldColumns = extern struct {
    ID: ImGuiID = @import("std").mem.zeroes(ImGuiID),
    Flags: ImGuiOldColumnFlags = @import("std").mem.zeroes(ImGuiOldColumnFlags),
    IsFirstFrame: bool = @import("std").mem.zeroes(bool),
    IsBeingResized: bool = @import("std").mem.zeroes(bool),
    Current: c_int = @import("std").mem.zeroes(c_int),
    Count: c_int = @import("std").mem.zeroes(c_int),
    OffMinX: f32 = @import("std").mem.zeroes(f32),
    OffMaxX: f32 = @import("std").mem.zeroes(f32),
    LineMinY: f32 = @import("std").mem.zeroes(f32),
    LineMaxY: f32 = @import("std").mem.zeroes(f32),
    HostCursorPosY: f32 = @import("std").mem.zeroes(f32),
    HostCursorMaxPosX: f32 = @import("std").mem.zeroes(f32),
    HostInitialClipRect: ImRect = @import("std").mem.zeroes(ImRect),
    HostBackupClipRect: ImRect = @import("std").mem.zeroes(ImRect),
    HostBackupParentWorkRect: ImRect = @import("std").mem.zeroes(ImRect),
    Columns: ImVector_ImGuiOldColumnData = @import("std").mem.zeroes(ImVector_ImGuiOldColumnData),
    Splitter: ImDrawListSplitter = @import("std").mem.zeroes(ImDrawListSplitter),
};
pub const ImGuiOldColumns = struct_ImGuiOldColumns;
pub const struct_ImGuiPopupData = extern struct {
    PopupId: ImGuiID = @import("std").mem.zeroes(ImGuiID),
    Window: ?*ImGuiWindow = @import("std").mem.zeroes(?*ImGuiWindow),
    RestoreNavWindow: ?*ImGuiWindow = @import("std").mem.zeroes(?*ImGuiWindow),
    ParentNavLayer: c_int = @import("std").mem.zeroes(c_int),
    OpenFrameCount: c_int = @import("std").mem.zeroes(c_int),
    OpenParentId: ImGuiID = @import("std").mem.zeroes(ImGuiID),
    OpenPopupPos: ImVec2 = @import("std").mem.zeroes(ImVec2),
    OpenMousePos: ImVec2 = @import("std").mem.zeroes(ImVec2),
};
pub const ImGuiPopupData = struct_ImGuiPopupData;
pub const ImGuiSettingsHandler = struct_ImGuiSettingsHandler;
pub const struct_ImGuiSettingsHandler = extern struct {
    TypeName: [*c]const u8 = @import("std").mem.zeroes([*c]const u8),
    TypeHash: ImGuiID = @import("std").mem.zeroes(ImGuiID),
    ClearAllFn: ?*const fn (?*ImGuiContext, [*c]ImGuiSettingsHandler) callconv(.C) void = @import("std").mem.zeroes(?*const fn (?*ImGuiContext, [*c]ImGuiSettingsHandler) callconv(.C) void),
    ReadInitFn: ?*const fn (?*ImGuiContext, [*c]ImGuiSettingsHandler) callconv(.C) void = @import("std").mem.zeroes(?*const fn (?*ImGuiContext, [*c]ImGuiSettingsHandler) callconv(.C) void),
    ReadOpenFn: ?*const fn (?*ImGuiContext, [*c]ImGuiSettingsHandler, [*c]const u8) callconv(.C) ?*anyopaque = @import("std").mem.zeroes(?*const fn (?*ImGuiContext, [*c]ImGuiSettingsHandler, [*c]const u8) callconv(.C) ?*anyopaque),
    ReadLineFn: ?*const fn (?*ImGuiContext, [*c]ImGuiSettingsHandler, ?*anyopaque, [*c]const u8) callconv(.C) void = @import("std").mem.zeroes(?*const fn (?*ImGuiContext, [*c]ImGuiSettingsHandler, ?*anyopaque, [*c]const u8) callconv(.C) void),
    ApplyAllFn: ?*const fn (?*ImGuiContext, [*c]ImGuiSettingsHandler) callconv(.C) void = @import("std").mem.zeroes(?*const fn (?*ImGuiContext, [*c]ImGuiSettingsHandler) callconv(.C) void),
    WriteAllFn: ?*const fn (?*ImGuiContext, [*c]ImGuiSettingsHandler, [*c]ImGuiTextBuffer) callconv(.C) void = @import("std").mem.zeroes(?*const fn (?*ImGuiContext, [*c]ImGuiSettingsHandler, [*c]ImGuiTextBuffer) callconv(.C) void),
    UserData: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
};
pub const ImGuiStyleVar = c_int;
const union_unnamed_3 = extern union {
    BackupInt: [2]c_int,
    BackupFloat: [2]f32,
};
pub const struct_ImGuiStyleMod = extern struct {
    VarIdx: ImGuiStyleVar = @import("std").mem.zeroes(ImGuiStyleVar),
    unnamed_0: union_unnamed_3 = @import("std").mem.zeroes(union_unnamed_3),
};
pub const ImGuiStyleMod = struct_ImGuiStyleMod;
pub const ImGuiTableFlags = c_int;
pub const ImGuiTableColumnIdx = ImS16;
pub const struct_ImGuiTableHeaderData = extern struct {
    Index: ImGuiTableColumnIdx = @import("std").mem.zeroes(ImGuiTableColumnIdx),
    TextColor: ImU32 = @import("std").mem.zeroes(ImU32),
    BgColor0: ImU32 = @import("std").mem.zeroes(ImU32),
    BgColor1: ImU32 = @import("std").mem.zeroes(ImU32),
};
pub const ImGuiTableHeaderData = struct_ImGuiTableHeaderData;
pub const struct_ImVector_ImGuiTableHeaderData = extern struct {
    Size: c_int = @import("std").mem.zeroes(c_int),
    Capacity: c_int = @import("std").mem.zeroes(c_int),
    Data: [*c]ImGuiTableHeaderData = @import("std").mem.zeroes([*c]ImGuiTableHeaderData),
};
pub const ImVector_ImGuiTableHeaderData = struct_ImVector_ImGuiTableHeaderData;
pub const struct_ImGuiTableTempData = extern struct {
    TableIndex: c_int = @import("std").mem.zeroes(c_int),
    LastTimeActive: f32 = @import("std").mem.zeroes(f32),
    AngledHeadersExtraWidth: f32 = @import("std").mem.zeroes(f32),
    AngledHeadersRequests: ImVector_ImGuiTableHeaderData = @import("std").mem.zeroes(ImVector_ImGuiTableHeaderData),
    UserOuterSize: ImVec2 = @import("std").mem.zeroes(ImVec2),
    DrawSplitter: ImDrawListSplitter = @import("std").mem.zeroes(ImDrawListSplitter),
    HostBackupWorkRect: ImRect = @import("std").mem.zeroes(ImRect),
    HostBackupParentWorkRect: ImRect = @import("std").mem.zeroes(ImRect),
    HostBackupPrevLineSize: ImVec2 = @import("std").mem.zeroes(ImVec2),
    HostBackupCurrLineSize: ImVec2 = @import("std").mem.zeroes(ImVec2),
    HostBackupCursorMaxPos: ImVec2 = @import("std").mem.zeroes(ImVec2),
    HostBackupColumnsOffset: ImVec1 = @import("std").mem.zeroes(ImVec1),
    HostBackupItemWidth: f32 = @import("std").mem.zeroes(f32),
    HostBackupItemWidthStackSize: c_int = @import("std").mem.zeroes(c_int),
};
pub const ImGuiTableTempData = struct_ImGuiTableTempData;
pub const ImGuiTableColumnFlags = c_int;
pub const ImGuiTableDrawChannelIdx = ImU16; // /home/antaraz/dev/slingshot/cimgui/cimgui.h:3103:10: warning: struct demoted to opaque type - has bitfield
pub const struct_ImGuiTableColumn = opaque {};
pub const ImGuiTableColumn = struct_ImGuiTableColumn;
pub const struct_ImSpan_ImGuiTableColumn = extern struct {
    Data: ?*ImGuiTableColumn = @import("std").mem.zeroes(?*ImGuiTableColumn),
    DataEnd: ?*ImGuiTableColumn = @import("std").mem.zeroes(?*ImGuiTableColumn),
};
pub const ImSpan_ImGuiTableColumn = struct_ImSpan_ImGuiTableColumn;
pub const struct_ImSpan_ImGuiTableColumnIdx = extern struct {
    Data: [*c]ImGuiTableColumnIdx = @import("std").mem.zeroes([*c]ImGuiTableColumnIdx),
    DataEnd: [*c]ImGuiTableColumnIdx = @import("std").mem.zeroes([*c]ImGuiTableColumnIdx),
};
pub const ImSpan_ImGuiTableColumnIdx = struct_ImSpan_ImGuiTableColumnIdx;
pub const struct_ImGuiTableCellData = extern struct {
    BgColor: ImU32 = @import("std").mem.zeroes(ImU32),
    Column: ImGuiTableColumnIdx = @import("std").mem.zeroes(ImGuiTableColumnIdx),
};
pub const ImGuiTableCellData = struct_ImGuiTableCellData;
pub const struct_ImSpan_ImGuiTableCellData = extern struct {
    Data: [*c]ImGuiTableCellData = @import("std").mem.zeroes([*c]ImGuiTableCellData),
    DataEnd: [*c]ImGuiTableCellData = @import("std").mem.zeroes([*c]ImGuiTableCellData),
};
pub const ImSpan_ImGuiTableCellData = struct_ImSpan_ImGuiTableCellData;
pub const ImBitArrayPtr = [*c]ImU32; // /home/antaraz/dev/slingshot/cimgui/cimgui.h:3166:24: warning: struct demoted to opaque type - has bitfield
pub const struct_ImGuiTable = opaque {};
pub const ImGuiTable = struct_ImGuiTable;
pub const struct_ImGuiTableInstanceData = extern struct {
    TableInstanceID: ImGuiID = @import("std").mem.zeroes(ImGuiID),
    LastOuterHeight: f32 = @import("std").mem.zeroes(f32),
    LastTopHeadersRowHeight: f32 = @import("std").mem.zeroes(f32),
    LastFrozenHeight: f32 = @import("std").mem.zeroes(f32),
    HoveredRowLast: c_int = @import("std").mem.zeroes(c_int),
    HoveredRowNext: c_int = @import("std").mem.zeroes(c_int),
};
pub const ImGuiTableInstanceData = struct_ImGuiTableInstanceData;
pub const struct_ImGuiTableSettings = extern struct {
    ID: ImGuiID = @import("std").mem.zeroes(ImGuiID),
    SaveFlags: ImGuiTableFlags = @import("std").mem.zeroes(ImGuiTableFlags),
    RefScale: f32 = @import("std").mem.zeroes(f32),
    ColumnsCount: ImGuiTableColumnIdx = @import("std").mem.zeroes(ImGuiTableColumnIdx),
    ColumnsCountMax: ImGuiTableColumnIdx = @import("std").mem.zeroes(ImGuiTableColumnIdx),
    WantApply: bool = @import("std").mem.zeroes(bool),
};
pub const ImGuiTableSettings = struct_ImGuiTableSettings;
pub const struct_ImGuiTableColumnsSettings = opaque {};
pub const ImGuiTableColumnsSettings = struct_ImGuiTableColumnsSettings;
pub const ImGuiTypingSelectFlags = c_int;
pub const struct_ImGuiTypingSelectRequest = extern struct {
    Flags: ImGuiTypingSelectFlags = @import("std").mem.zeroes(ImGuiTypingSelectFlags),
    SearchBufferLen: c_int = @import("std").mem.zeroes(c_int),
    SearchBuffer: [*c]const u8 = @import("std").mem.zeroes([*c]const u8),
    SelectRequest: bool = @import("std").mem.zeroes(bool),
    SingleCharMode: bool = @import("std").mem.zeroes(bool),
    SingleCharSize: ImS8 = @import("std").mem.zeroes(ImS8),
};
pub const ImGuiTypingSelectRequest = struct_ImGuiTypingSelectRequest;
pub const struct_ImGuiTypingSelectState = extern struct {
    Request: ImGuiTypingSelectRequest = @import("std").mem.zeroes(ImGuiTypingSelectRequest),
    SearchBuffer: [64]u8 = @import("std").mem.zeroes([64]u8),
    FocusScope: ImGuiID = @import("std").mem.zeroes(ImGuiID),
    LastRequestFrame: c_int = @import("std").mem.zeroes(c_int),
    LastRequestTime: f32 = @import("std").mem.zeroes(f32),
    SingleCharModeLock: bool = @import("std").mem.zeroes(bool),
};
pub const ImGuiTypingSelectState = struct_ImGuiTypingSelectState;
pub const struct_ImGuiWindowDockStyle = extern struct {
    Colors: [6]ImU32 = @import("std").mem.zeroes([6]ImU32),
};
pub const ImGuiWindowDockStyle = struct_ImGuiWindowDockStyle;
pub const ImGuiLayoutType = c_int;
pub const struct_ImGuiWindowTempData = extern struct {
    CursorPos: ImVec2 = @import("std").mem.zeroes(ImVec2),
    CursorPosPrevLine: ImVec2 = @import("std").mem.zeroes(ImVec2),
    CursorStartPos: ImVec2 = @import("std").mem.zeroes(ImVec2),
    CursorMaxPos: ImVec2 = @import("std").mem.zeroes(ImVec2),
    IdealMaxPos: ImVec2 = @import("std").mem.zeroes(ImVec2),
    CurrLineSize: ImVec2 = @import("std").mem.zeroes(ImVec2),
    PrevLineSize: ImVec2 = @import("std").mem.zeroes(ImVec2),
    CurrLineTextBaseOffset: f32 = @import("std").mem.zeroes(f32),
    PrevLineTextBaseOffset: f32 = @import("std").mem.zeroes(f32),
    IsSameLine: bool = @import("std").mem.zeroes(bool),
    IsSetPos: bool = @import("std").mem.zeroes(bool),
    Indent: ImVec1 = @import("std").mem.zeroes(ImVec1),
    ColumnsOffset: ImVec1 = @import("std").mem.zeroes(ImVec1),
    GroupOffset: ImVec1 = @import("std").mem.zeroes(ImVec1),
    CursorStartPosLossyness: ImVec2 = @import("std").mem.zeroes(ImVec2),
    NavLayerCurrent: ImGuiNavLayer = @import("std").mem.zeroes(ImGuiNavLayer),
    NavLayersActiveMask: c_short = @import("std").mem.zeroes(c_short),
    NavLayersActiveMaskNext: c_short = @import("std").mem.zeroes(c_short),
    NavIsScrollPushableX: bool = @import("std").mem.zeroes(bool),
    NavHideHighlightOneFrame: bool = @import("std").mem.zeroes(bool),
    NavWindowHasScrollY: bool = @import("std").mem.zeroes(bool),
    MenuBarAppending: bool = @import("std").mem.zeroes(bool),
    MenuBarOffset: ImVec2 = @import("std").mem.zeroes(ImVec2),
    MenuColumns: ImGuiMenuColumns = @import("std").mem.zeroes(ImGuiMenuColumns),
    TreeDepth: c_int = @import("std").mem.zeroes(c_int),
    TreeJumpToParentOnPopMask: ImU32 = @import("std").mem.zeroes(ImU32),
    ChildWindows: ImVector_ImGuiWindowPtr = @import("std").mem.zeroes(ImVector_ImGuiWindowPtr),
    StateStorage: [*c]ImGuiStorage = @import("std").mem.zeroes([*c]ImGuiStorage),
    CurrentColumns: [*c]ImGuiOldColumns = @import("std").mem.zeroes([*c]ImGuiOldColumns),
    CurrentTableIdx: c_int = @import("std").mem.zeroes(c_int),
    LayoutType: ImGuiLayoutType = @import("std").mem.zeroes(ImGuiLayoutType),
    ParentLayoutType: ImGuiLayoutType = @import("std").mem.zeroes(ImGuiLayoutType),
    ModalDimBgColor: ImU32 = @import("std").mem.zeroes(ImU32),
    ItemWidth: f32 = @import("std").mem.zeroes(f32),
    TextWrapPos: f32 = @import("std").mem.zeroes(f32),
    ItemWidthStack: ImVector_float = @import("std").mem.zeroes(ImVector_float),
    TextWrapPosStack: ImVector_float = @import("std").mem.zeroes(ImVector_float),
};
pub const ImGuiWindowTempData = struct_ImGuiWindowTempData;
pub const struct_ImVec2ih = extern struct {
    x: c_short = @import("std").mem.zeroes(c_short),
    y: c_short = @import("std").mem.zeroes(c_short),
};
pub const ImVec2ih = struct_ImVec2ih;
pub const struct_ImGuiWindowSettings = extern struct {
    ID: ImGuiID = @import("std").mem.zeroes(ImGuiID),
    Pos: ImVec2ih = @import("std").mem.zeroes(ImVec2ih),
    Size: ImVec2ih = @import("std").mem.zeroes(ImVec2ih),
    ViewportPos: ImVec2ih = @import("std").mem.zeroes(ImVec2ih),
    ViewportId: ImGuiID = @import("std").mem.zeroes(ImGuiID),
    DockId: ImGuiID = @import("std").mem.zeroes(ImGuiID),
    ClassId: ImGuiID = @import("std").mem.zeroes(ImGuiID),
    DockOrder: c_short = @import("std").mem.zeroes(c_short),
    Collapsed: bool = @import("std").mem.zeroes(bool),
    IsChild: bool = @import("std").mem.zeroes(bool),
    WantApply: bool = @import("std").mem.zeroes(bool),
    WantDelete: bool = @import("std").mem.zeroes(bool),
};
pub const ImGuiWindowSettings = struct_ImGuiWindowSettings;
pub const struct_ImVector_const_charPtr = extern struct {
    Size: c_int = @import("std").mem.zeroes(c_int),
    Capacity: c_int = @import("std").mem.zeroes(c_int),
    Data: [*c][*c]const u8 = @import("std").mem.zeroes([*c][*c]const u8),
};
pub const ImVector_const_charPtr = struct_ImVector_const_charPtr;
pub const ImGuiMouseButton = c_int;
pub const ImGuiMouseCursor = c_int;
pub const ImGuiSortDirection = c_int;
pub const ImGuiTableBgTarget = c_int;
pub const ImDrawFlags = c_int;
pub const ImGuiButtonFlags = c_int;
pub const ImGuiColorEditFlags = c_int;
pub const ImGuiComboFlags = c_int;
pub const ImGuiDragDropFlags = c_int;
pub const ImGuiFocusedFlags = c_int;
pub const ImGuiPopupFlags = c_int;
pub const ImGuiSelectableFlags = c_int;
pub const ImGuiSliderFlags = c_int;
pub const ImGuiTableRowFlags = c_int;
pub const ImGuiTreeNodeFlags = c_int;
pub const ImWchar32 = c_uint;
pub const ImGuiInputTextCallback = ?*const fn ([*c]ImGuiInputTextCallbackData) callconv(.C) c_int;
pub const ImGuiMemAllocFunc = ?*const fn (usize, ?*anyopaque) callconv(.C) ?*anyopaque;
pub const ImGuiMemFreeFunc = ?*const fn (?*anyopaque, ?*anyopaque) callconv(.C) void;
pub const ImGuiWindowFlags_None: c_int = 0;
pub const ImGuiWindowFlags_NoTitleBar: c_int = 1;
pub const ImGuiWindowFlags_NoResize: c_int = 2;
pub const ImGuiWindowFlags_NoMove: c_int = 4;
pub const ImGuiWindowFlags_NoScrollbar: c_int = 8;
pub const ImGuiWindowFlags_NoScrollWithMouse: c_int = 16;
pub const ImGuiWindowFlags_NoCollapse: c_int = 32;
pub const ImGuiWindowFlags_AlwaysAutoResize: c_int = 64;
pub const ImGuiWindowFlags_NoBackground: c_int = 128;
pub const ImGuiWindowFlags_NoSavedSettings: c_int = 256;
pub const ImGuiWindowFlags_NoMouseInputs: c_int = 512;
pub const ImGuiWindowFlags_MenuBar: c_int = 1024;
pub const ImGuiWindowFlags_HorizontalScrollbar: c_int = 2048;
pub const ImGuiWindowFlags_NoFocusOnAppearing: c_int = 4096;
pub const ImGuiWindowFlags_NoBringToFrontOnFocus: c_int = 8192;
pub const ImGuiWindowFlags_AlwaysVerticalScrollbar: c_int = 16384;
pub const ImGuiWindowFlags_AlwaysHorizontalScrollbar: c_int = 32768;
pub const ImGuiWindowFlags_NoNavInputs: c_int = 65536;
pub const ImGuiWindowFlags_NoNavFocus: c_int = 131072;
pub const ImGuiWindowFlags_UnsavedDocument: c_int = 262144;
pub const ImGuiWindowFlags_NoDocking: c_int = 524288;
pub const ImGuiWindowFlags_NoNav: c_int = 196608;
pub const ImGuiWindowFlags_NoDecoration: c_int = 43;
pub const ImGuiWindowFlags_NoInputs: c_int = 197120;
pub const ImGuiWindowFlags_NavFlattened: c_int = 8388608;
pub const ImGuiWindowFlags_ChildWindow: c_int = 16777216;
pub const ImGuiWindowFlags_Tooltip: c_int = 33554432;
pub const ImGuiWindowFlags_Popup: c_int = 67108864;
pub const ImGuiWindowFlags_Modal: c_int = 134217728;
pub const ImGuiWindowFlags_ChildMenu: c_int = 268435456;
pub const ImGuiWindowFlags_DockNodeHost: c_int = 536870912;
pub const ImGuiWindowFlags_ = c_uint;
pub const ImGuiChildFlags_None: c_int = 0;
pub const ImGuiChildFlags_Border: c_int = 1;
pub const ImGuiChildFlags_AlwaysUseWindowPadding: c_int = 2;
pub const ImGuiChildFlags_ResizeX: c_int = 4;
pub const ImGuiChildFlags_ResizeY: c_int = 8;
pub const ImGuiChildFlags_AutoResizeX: c_int = 16;
pub const ImGuiChildFlags_AutoResizeY: c_int = 32;
pub const ImGuiChildFlags_AlwaysAutoResize: c_int = 64;
pub const ImGuiChildFlags_FrameStyle: c_int = 128;
pub const ImGuiChildFlags_ = c_uint;
pub const ImGuiInputTextFlags_None: c_int = 0;
pub const ImGuiInputTextFlags_CharsDecimal: c_int = 1;
pub const ImGuiInputTextFlags_CharsHexadecimal: c_int = 2;
pub const ImGuiInputTextFlags_CharsUppercase: c_int = 4;
pub const ImGuiInputTextFlags_CharsNoBlank: c_int = 8;
pub const ImGuiInputTextFlags_AutoSelectAll: c_int = 16;
pub const ImGuiInputTextFlags_EnterReturnsTrue: c_int = 32;
pub const ImGuiInputTextFlags_CallbackCompletion: c_int = 64;
pub const ImGuiInputTextFlags_CallbackHistory: c_int = 128;
pub const ImGuiInputTextFlags_CallbackAlways: c_int = 256;
pub const ImGuiInputTextFlags_CallbackCharFilter: c_int = 512;
pub const ImGuiInputTextFlags_AllowTabInput: c_int = 1024;
pub const ImGuiInputTextFlags_CtrlEnterForNewLine: c_int = 2048;
pub const ImGuiInputTextFlags_NoHorizontalScroll: c_int = 4096;
pub const ImGuiInputTextFlags_AlwaysOverwrite: c_int = 8192;
pub const ImGuiInputTextFlags_ReadOnly: c_int = 16384;
pub const ImGuiInputTextFlags_Password: c_int = 32768;
pub const ImGuiInputTextFlags_NoUndoRedo: c_int = 65536;
pub const ImGuiInputTextFlags_CharsScientific: c_int = 131072;
pub const ImGuiInputTextFlags_CallbackResize: c_int = 262144;
pub const ImGuiInputTextFlags_CallbackEdit: c_int = 524288;
pub const ImGuiInputTextFlags_EscapeClearsAll: c_int = 1048576;
pub const ImGuiInputTextFlags_ = c_uint;
pub const ImGuiTreeNodeFlags_None: c_int = 0;
pub const ImGuiTreeNodeFlags_Selected: c_int = 1;
pub const ImGuiTreeNodeFlags_Framed: c_int = 2;
pub const ImGuiTreeNodeFlags_AllowOverlap: c_int = 4;
pub const ImGuiTreeNodeFlags_NoTreePushOnOpen: c_int = 8;
pub const ImGuiTreeNodeFlags_NoAutoOpenOnLog: c_int = 16;
pub const ImGuiTreeNodeFlags_DefaultOpen: c_int = 32;
pub const ImGuiTreeNodeFlags_OpenOnDoubleClick: c_int = 64;
pub const ImGuiTreeNodeFlags_OpenOnArrow: c_int = 128;
pub const ImGuiTreeNodeFlags_Leaf: c_int = 256;
pub const ImGuiTreeNodeFlags_Bullet: c_int = 512;
pub const ImGuiTreeNodeFlags_FramePadding: c_int = 1024;
pub const ImGuiTreeNodeFlags_SpanAvailWidth: c_int = 2048;
pub const ImGuiTreeNodeFlags_SpanFullWidth: c_int = 4096;
pub const ImGuiTreeNodeFlags_SpanTextWidth: c_int = 8192;
pub const ImGuiTreeNodeFlags_SpanAllColumns: c_int = 16384;
pub const ImGuiTreeNodeFlags_NavLeftJumpsBackHere: c_int = 32768;
pub const ImGuiTreeNodeFlags_CollapsingHeader: c_int = 26;
pub const ImGuiTreeNodeFlags_ = c_uint;
pub const ImGuiPopupFlags_None: c_int = 0;
pub const ImGuiPopupFlags_MouseButtonLeft: c_int = 0;
pub const ImGuiPopupFlags_MouseButtonRight: c_int = 1;
pub const ImGuiPopupFlags_MouseButtonMiddle: c_int = 2;
pub const ImGuiPopupFlags_MouseButtonMask_: c_int = 31;
pub const ImGuiPopupFlags_MouseButtonDefault_: c_int = 1;
pub const ImGuiPopupFlags_NoReopen: c_int = 32;
pub const ImGuiPopupFlags_NoOpenOverExistingPopup: c_int = 128;
pub const ImGuiPopupFlags_NoOpenOverItems: c_int = 256;
pub const ImGuiPopupFlags_AnyPopupId: c_int = 1024;
pub const ImGuiPopupFlags_AnyPopupLevel: c_int = 2048;
pub const ImGuiPopupFlags_AnyPopup: c_int = 3072;
pub const ImGuiPopupFlags_ = c_uint;
pub const ImGuiSelectableFlags_None: c_int = 0;
pub const ImGuiSelectableFlags_DontClosePopups: c_int = 1;
pub const ImGuiSelectableFlags_SpanAllColumns: c_int = 2;
pub const ImGuiSelectableFlags_AllowDoubleClick: c_int = 4;
pub const ImGuiSelectableFlags_Disabled: c_int = 8;
pub const ImGuiSelectableFlags_AllowOverlap: c_int = 16;
pub const ImGuiSelectableFlags_ = c_uint;
pub const ImGuiComboFlags_None: c_int = 0;
pub const ImGuiComboFlags_PopupAlignLeft: c_int = 1;
pub const ImGuiComboFlags_HeightSmall: c_int = 2;
pub const ImGuiComboFlags_HeightRegular: c_int = 4;
pub const ImGuiComboFlags_HeightLarge: c_int = 8;
pub const ImGuiComboFlags_HeightLargest: c_int = 16;
pub const ImGuiComboFlags_NoArrowButton: c_int = 32;
pub const ImGuiComboFlags_NoPreview: c_int = 64;
pub const ImGuiComboFlags_WidthFitPreview: c_int = 128;
pub const ImGuiComboFlags_HeightMask_: c_int = 30;
pub const ImGuiComboFlags_ = c_uint;
pub const ImGuiTabBarFlags_None: c_int = 0;
pub const ImGuiTabBarFlags_Reorderable: c_int = 1;
pub const ImGuiTabBarFlags_AutoSelectNewTabs: c_int = 2;
pub const ImGuiTabBarFlags_TabListPopupButton: c_int = 4;
pub const ImGuiTabBarFlags_NoCloseWithMiddleMouseButton: c_int = 8;
pub const ImGuiTabBarFlags_NoTabListScrollingButtons: c_int = 16;
pub const ImGuiTabBarFlags_NoTooltip: c_int = 32;
pub const ImGuiTabBarFlags_FittingPolicyResizeDown: c_int = 64;
pub const ImGuiTabBarFlags_FittingPolicyScroll: c_int = 128;
pub const ImGuiTabBarFlags_FittingPolicyMask_: c_int = 192;
pub const ImGuiTabBarFlags_FittingPolicyDefault_: c_int = 64;
pub const ImGuiTabBarFlags_ = c_uint;
pub const ImGuiTabItemFlags_None: c_int = 0;
pub const ImGuiTabItemFlags_UnsavedDocument: c_int = 1;
pub const ImGuiTabItemFlags_SetSelected: c_int = 2;
pub const ImGuiTabItemFlags_NoCloseWithMiddleMouseButton: c_int = 4;
pub const ImGuiTabItemFlags_NoPushId: c_int = 8;
pub const ImGuiTabItemFlags_NoTooltip: c_int = 16;
pub const ImGuiTabItemFlags_NoReorder: c_int = 32;
pub const ImGuiTabItemFlags_Leading: c_int = 64;
pub const ImGuiTabItemFlags_Trailing: c_int = 128;
pub const ImGuiTabItemFlags_NoAssumedClosure: c_int = 256;
pub const ImGuiTabItemFlags_ = c_uint;
pub const ImGuiFocusedFlags_None: c_int = 0;
pub const ImGuiFocusedFlags_ChildWindows: c_int = 1;
pub const ImGuiFocusedFlags_RootWindow: c_int = 2;
pub const ImGuiFocusedFlags_AnyWindow: c_int = 4;
pub const ImGuiFocusedFlags_NoPopupHierarchy: c_int = 8;
pub const ImGuiFocusedFlags_DockHierarchy: c_int = 16;
pub const ImGuiFocusedFlags_RootAndChildWindows: c_int = 3;
pub const ImGuiFocusedFlags_ = c_uint;
pub const ImGuiHoveredFlags_None: c_int = 0;
pub const ImGuiHoveredFlags_ChildWindows: c_int = 1;
pub const ImGuiHoveredFlags_RootWindow: c_int = 2;
pub const ImGuiHoveredFlags_AnyWindow: c_int = 4;
pub const ImGuiHoveredFlags_NoPopupHierarchy: c_int = 8;
pub const ImGuiHoveredFlags_DockHierarchy: c_int = 16;
pub const ImGuiHoveredFlags_AllowWhenBlockedByPopup: c_int = 32;
pub const ImGuiHoveredFlags_AllowWhenBlockedByActiveItem: c_int = 128;
pub const ImGuiHoveredFlags_AllowWhenOverlappedByItem: c_int = 256;
pub const ImGuiHoveredFlags_AllowWhenOverlappedByWindow: c_int = 512;
pub const ImGuiHoveredFlags_AllowWhenDisabled: c_int = 1024;
pub const ImGuiHoveredFlags_NoNavOverride: c_int = 2048;
pub const ImGuiHoveredFlags_AllowWhenOverlapped: c_int = 768;
pub const ImGuiHoveredFlags_RectOnly: c_int = 928;
pub const ImGuiHoveredFlags_RootAndChildWindows: c_int = 3;
pub const ImGuiHoveredFlags_ForTooltip: c_int = 4096;
pub const ImGuiHoveredFlags_Stationary: c_int = 8192;
pub const ImGuiHoveredFlags_DelayNone: c_int = 16384;
pub const ImGuiHoveredFlags_DelayShort: c_int = 32768;
pub const ImGuiHoveredFlags_DelayNormal: c_int = 65536;
pub const ImGuiHoveredFlags_NoSharedDelay: c_int = 131072;
pub const ImGuiHoveredFlags_ = c_uint;
pub const ImGuiDockNodeFlags_None: c_int = 0;
pub const ImGuiDockNodeFlags_KeepAliveOnly: c_int = 1;
pub const ImGuiDockNodeFlags_NoDockingOverCentralNode: c_int = 4;
pub const ImGuiDockNodeFlags_PassthruCentralNode: c_int = 8;
pub const ImGuiDockNodeFlags_NoDockingSplit: c_int = 16;
pub const ImGuiDockNodeFlags_NoResize: c_int = 32;
pub const ImGuiDockNodeFlags_AutoHideTabBar: c_int = 64;
pub const ImGuiDockNodeFlags_NoUndocking: c_int = 128;
pub const ImGuiDockNodeFlags_ = c_uint;
pub const ImGuiDragDropFlags_None: c_int = 0;
pub const ImGuiDragDropFlags_SourceNoPreviewTooltip: c_int = 1;
pub const ImGuiDragDropFlags_SourceNoDisableHover: c_int = 2;
pub const ImGuiDragDropFlags_SourceNoHoldToOpenOthers: c_int = 4;
pub const ImGuiDragDropFlags_SourceAllowNullID: c_int = 8;
pub const ImGuiDragDropFlags_SourceExtern: c_int = 16;
pub const ImGuiDragDropFlags_SourceAutoExpirePayload: c_int = 32;
pub const ImGuiDragDropFlags_AcceptBeforeDelivery: c_int = 1024;
pub const ImGuiDragDropFlags_AcceptNoDrawDefaultRect: c_int = 2048;
pub const ImGuiDragDropFlags_AcceptNoPreviewTooltip: c_int = 4096;
pub const ImGuiDragDropFlags_AcceptPeekOnly: c_int = 3072;
pub const ImGuiDragDropFlags_ = c_uint;
pub const ImGuiDataType_S8: c_int = 0;
pub const ImGuiDataType_U8: c_int = 1;
pub const ImGuiDataType_S16: c_int = 2;
pub const ImGuiDataType_U16: c_int = 3;
pub const ImGuiDataType_S32: c_int = 4;
pub const ImGuiDataType_U32: c_int = 5;
pub const ImGuiDataType_S64: c_int = 6;
pub const ImGuiDataType_U64: c_int = 7;
pub const ImGuiDataType_Float: c_int = 8;
pub const ImGuiDataType_Double: c_int = 9;
pub const ImGuiDataType_COUNT: c_int = 10;
pub const ImGuiDataType_ = c_uint;
pub const ImGuiDir_None: c_int = -1;
pub const ImGuiDir_Left: c_int = 0;
pub const ImGuiDir_Right: c_int = 1;
pub const ImGuiDir_Up: c_int = 2;
pub const ImGuiDir_Down: c_int = 3;
pub const ImGuiDir_COUNT: c_int = 4;
pub const ImGuiDir_ = c_int;
pub const ImGuiSortDirection_None: c_int = 0;
pub const ImGuiSortDirection_Ascending: c_int = 1;
pub const ImGuiSortDirection_Descending: c_int = 2;
pub const ImGuiSortDirection_ = c_uint;
pub const ImGuiKey_None: c_int = 0;
pub const ImGuiKey_Tab: c_int = 512;
pub const ImGuiKey_LeftArrow: c_int = 513;
pub const ImGuiKey_RightArrow: c_int = 514;
pub const ImGuiKey_UpArrow: c_int = 515;
pub const ImGuiKey_DownArrow: c_int = 516;
pub const ImGuiKey_PageUp: c_int = 517;
pub const ImGuiKey_PageDown: c_int = 518;
pub const ImGuiKey_Home: c_int = 519;
pub const ImGuiKey_End: c_int = 520;
pub const ImGuiKey_Insert: c_int = 521;
pub const ImGuiKey_Delete: c_int = 522;
pub const ImGuiKey_Backspace: c_int = 523;
pub const ImGuiKey_Space: c_int = 524;
pub const ImGuiKey_Enter: c_int = 525;
pub const ImGuiKey_Escape: c_int = 526;
pub const ImGuiKey_LeftCtrl: c_int = 527;
pub const ImGuiKey_LeftShift: c_int = 528;
pub const ImGuiKey_LeftAlt: c_int = 529;
pub const ImGuiKey_LeftSuper: c_int = 530;
pub const ImGuiKey_RightCtrl: c_int = 531;
pub const ImGuiKey_RightShift: c_int = 532;
pub const ImGuiKey_RightAlt: c_int = 533;
pub const ImGuiKey_RightSuper: c_int = 534;
pub const ImGuiKey_Menu: c_int = 535;
pub const ImGuiKey_0: c_int = 536;
pub const ImGuiKey_1: c_int = 537;
pub const ImGuiKey_2: c_int = 538;
pub const ImGuiKey_3: c_int = 539;
pub const ImGuiKey_4: c_int = 540;
pub const ImGuiKey_5: c_int = 541;
pub const ImGuiKey_6: c_int = 542;
pub const ImGuiKey_7: c_int = 543;
pub const ImGuiKey_8: c_int = 544;
pub const ImGuiKey_9: c_int = 545;
pub const ImGuiKey_A: c_int = 546;
pub const ImGuiKey_B: c_int = 547;
pub const ImGuiKey_C: c_int = 548;
pub const ImGuiKey_D: c_int = 549;
pub const ImGuiKey_E: c_int = 550;
pub const ImGuiKey_F: c_int = 551;
pub const ImGuiKey_G: c_int = 552;
pub const ImGuiKey_H: c_int = 553;
pub const ImGuiKey_I: c_int = 554;
pub const ImGuiKey_J: c_int = 555;
pub const ImGuiKey_K: c_int = 556;
pub const ImGuiKey_L: c_int = 557;
pub const ImGuiKey_M: c_int = 558;
pub const ImGuiKey_N: c_int = 559;
pub const ImGuiKey_O: c_int = 560;
pub const ImGuiKey_P: c_int = 561;
pub const ImGuiKey_Q: c_int = 562;
pub const ImGuiKey_R: c_int = 563;
pub const ImGuiKey_S: c_int = 564;
pub const ImGuiKey_T: c_int = 565;
pub const ImGuiKey_U: c_int = 566;
pub const ImGuiKey_V: c_int = 567;
pub const ImGuiKey_W: c_int = 568;
pub const ImGuiKey_X: c_int = 569;
pub const ImGuiKey_Y: c_int = 570;
pub const ImGuiKey_Z: c_int = 571;
pub const ImGuiKey_F1: c_int = 572;
pub const ImGuiKey_F2: c_int = 573;
pub const ImGuiKey_F3: c_int = 574;
pub const ImGuiKey_F4: c_int = 575;
pub const ImGuiKey_F5: c_int = 576;
pub const ImGuiKey_F6: c_int = 577;
pub const ImGuiKey_F7: c_int = 578;
pub const ImGuiKey_F8: c_int = 579;
pub const ImGuiKey_F9: c_int = 580;
pub const ImGuiKey_F10: c_int = 581;
pub const ImGuiKey_F11: c_int = 582;
pub const ImGuiKey_F12: c_int = 583;
pub const ImGuiKey_F13: c_int = 584;
pub const ImGuiKey_F14: c_int = 585;
pub const ImGuiKey_F15: c_int = 586;
pub const ImGuiKey_F16: c_int = 587;
pub const ImGuiKey_F17: c_int = 588;
pub const ImGuiKey_F18: c_int = 589;
pub const ImGuiKey_F19: c_int = 590;
pub const ImGuiKey_F20: c_int = 591;
pub const ImGuiKey_F21: c_int = 592;
pub const ImGuiKey_F22: c_int = 593;
pub const ImGuiKey_F23: c_int = 594;
pub const ImGuiKey_F24: c_int = 595;
pub const ImGuiKey_Apostrophe: c_int = 596;
pub const ImGuiKey_Comma: c_int = 597;
pub const ImGuiKey_Minus: c_int = 598;
pub const ImGuiKey_Period: c_int = 599;
pub const ImGuiKey_Slash: c_int = 600;
pub const ImGuiKey_Semicolon: c_int = 601;
pub const ImGuiKey_Equal: c_int = 602;
pub const ImGuiKey_LeftBracket: c_int = 603;
pub const ImGuiKey_Backslash: c_int = 604;
pub const ImGuiKey_RightBracket: c_int = 605;
pub const ImGuiKey_GraveAccent: c_int = 606;
pub const ImGuiKey_CapsLock: c_int = 607;
pub const ImGuiKey_ScrollLock: c_int = 608;
pub const ImGuiKey_NumLock: c_int = 609;
pub const ImGuiKey_PrintScreen: c_int = 610;
pub const ImGuiKey_Pause: c_int = 611;
pub const ImGuiKey_Keypad0: c_int = 612;
pub const ImGuiKey_Keypad1: c_int = 613;
pub const ImGuiKey_Keypad2: c_int = 614;
pub const ImGuiKey_Keypad3: c_int = 615;
pub const ImGuiKey_Keypad4: c_int = 616;
pub const ImGuiKey_Keypad5: c_int = 617;
pub const ImGuiKey_Keypad6: c_int = 618;
pub const ImGuiKey_Keypad7: c_int = 619;
pub const ImGuiKey_Keypad8: c_int = 620;
pub const ImGuiKey_Keypad9: c_int = 621;
pub const ImGuiKey_KeypadDecimal: c_int = 622;
pub const ImGuiKey_KeypadDivide: c_int = 623;
pub const ImGuiKey_KeypadMultiply: c_int = 624;
pub const ImGuiKey_KeypadSubtract: c_int = 625;
pub const ImGuiKey_KeypadAdd: c_int = 626;
pub const ImGuiKey_KeypadEnter: c_int = 627;
pub const ImGuiKey_KeypadEqual: c_int = 628;
pub const ImGuiKey_AppBack: c_int = 629;
pub const ImGuiKey_AppForward: c_int = 630;
pub const ImGuiKey_GamepadStart: c_int = 631;
pub const ImGuiKey_GamepadBack: c_int = 632;
pub const ImGuiKey_GamepadFaceLeft: c_int = 633;
pub const ImGuiKey_GamepadFaceRight: c_int = 634;
pub const ImGuiKey_GamepadFaceUp: c_int = 635;
pub const ImGuiKey_GamepadFaceDown: c_int = 636;
pub const ImGuiKey_GamepadDpadLeft: c_int = 637;
pub const ImGuiKey_GamepadDpadRight: c_int = 638;
pub const ImGuiKey_GamepadDpadUp: c_int = 639;
pub const ImGuiKey_GamepadDpadDown: c_int = 640;
pub const ImGuiKey_GamepadL1: c_int = 641;
pub const ImGuiKey_GamepadR1: c_int = 642;
pub const ImGuiKey_GamepadL2: c_int = 643;
pub const ImGuiKey_GamepadR2: c_int = 644;
pub const ImGuiKey_GamepadL3: c_int = 645;
pub const ImGuiKey_GamepadR3: c_int = 646;
pub const ImGuiKey_GamepadLStickLeft: c_int = 647;
pub const ImGuiKey_GamepadLStickRight: c_int = 648;
pub const ImGuiKey_GamepadLStickUp: c_int = 649;
pub const ImGuiKey_GamepadLStickDown: c_int = 650;
pub const ImGuiKey_GamepadRStickLeft: c_int = 651;
pub const ImGuiKey_GamepadRStickRight: c_int = 652;
pub const ImGuiKey_GamepadRStickUp: c_int = 653;
pub const ImGuiKey_GamepadRStickDown: c_int = 654;
pub const ImGuiKey_MouseLeft: c_int = 655;
pub const ImGuiKey_MouseRight: c_int = 656;
pub const ImGuiKey_MouseMiddle: c_int = 657;
pub const ImGuiKey_MouseX1: c_int = 658;
pub const ImGuiKey_MouseX2: c_int = 659;
pub const ImGuiKey_MouseWheelX: c_int = 660;
pub const ImGuiKey_MouseWheelY: c_int = 661;
pub const ImGuiKey_ReservedForModCtrl: c_int = 662;
pub const ImGuiKey_ReservedForModShift: c_int = 663;
pub const ImGuiKey_ReservedForModAlt: c_int = 664;
pub const ImGuiKey_ReservedForModSuper: c_int = 665;
pub const ImGuiKey_COUNT: c_int = 666;
pub const ImGuiMod_None: c_int = 0;
pub const ImGuiMod_Ctrl: c_int = 4096;
pub const ImGuiMod_Shift: c_int = 8192;
pub const ImGuiMod_Alt: c_int = 16384;
pub const ImGuiMod_Super: c_int = 32768;
pub const ImGuiMod_Shortcut: c_int = 2048;
pub const ImGuiMod_Mask_: c_int = 63488;
pub const ImGuiKey_NamedKey_BEGIN: c_int = 512;
pub const ImGuiKey_NamedKey_END: c_int = 666;
pub const ImGuiKey_NamedKey_COUNT: c_int = 154;
pub const ImGuiKey_KeysData_SIZE: c_int = 154;
pub const ImGuiKey_KeysData_OFFSET: c_int = 512;
pub const ImGuiKey = c_uint;
pub const ImGuiConfigFlags_None: c_int = 0;
pub const ImGuiConfigFlags_NavEnableKeyboard: c_int = 1;
pub const ImGuiConfigFlags_NavEnableGamepad: c_int = 2;
pub const ImGuiConfigFlags_NavEnableSetMousePos: c_int = 4;
pub const ImGuiConfigFlags_NavNoCaptureKeyboard: c_int = 8;
pub const ImGuiConfigFlags_NoMouse: c_int = 16;
pub const ImGuiConfigFlags_NoMouseCursorChange: c_int = 32;
pub const ImGuiConfigFlags_DockingEnable: c_int = 64;
pub const ImGuiConfigFlags_ViewportsEnable: c_int = 1024;
pub const ImGuiConfigFlags_DpiEnableScaleViewports: c_int = 16384;
pub const ImGuiConfigFlags_DpiEnableScaleFonts: c_int = 32768;
pub const ImGuiConfigFlags_IsSRGB: c_int = 1048576;
pub const ImGuiConfigFlags_IsTouchScreen: c_int = 2097152;
pub const ImGuiConfigFlags_ = c_uint;
pub const ImGuiBackendFlags_None: c_int = 0;
pub const ImGuiBackendFlags_HasGamepad: c_int = 1;
pub const ImGuiBackendFlags_HasMouseCursors: c_int = 2;
pub const ImGuiBackendFlags_HasSetMousePos: c_int = 4;
pub const ImGuiBackendFlags_RendererHasVtxOffset: c_int = 8;
pub const ImGuiBackendFlags_PlatformHasViewports: c_int = 1024;
pub const ImGuiBackendFlags_HasMouseHoveredViewport: c_int = 2048;
pub const ImGuiBackendFlags_RendererHasViewports: c_int = 4096;
pub const ImGuiBackendFlags_ = c_uint;
pub const ImGuiCol_Text: c_int = 0;
pub const ImGuiCol_TextDisabled: c_int = 1;
pub const ImGuiCol_WindowBg: c_int = 2;
pub const ImGuiCol_ChildBg: c_int = 3;
pub const ImGuiCol_PopupBg: c_int = 4;
pub const ImGuiCol_Border: c_int = 5;
pub const ImGuiCol_BorderShadow: c_int = 6;
pub const ImGuiCol_FrameBg: c_int = 7;
pub const ImGuiCol_FrameBgHovered: c_int = 8;
pub const ImGuiCol_FrameBgActive: c_int = 9;
pub const ImGuiCol_TitleBg: c_int = 10;
pub const ImGuiCol_TitleBgActive: c_int = 11;
pub const ImGuiCol_TitleBgCollapsed: c_int = 12;
pub const ImGuiCol_MenuBarBg: c_int = 13;
pub const ImGuiCol_ScrollbarBg: c_int = 14;
pub const ImGuiCol_ScrollbarGrab: c_int = 15;
pub const ImGuiCol_ScrollbarGrabHovered: c_int = 16;
pub const ImGuiCol_ScrollbarGrabActive: c_int = 17;
pub const ImGuiCol_CheckMark: c_int = 18;
pub const ImGuiCol_SliderGrab: c_int = 19;
pub const ImGuiCol_SliderGrabActive: c_int = 20;
pub const ImGuiCol_Button: c_int = 21;
pub const ImGuiCol_ButtonHovered: c_int = 22;
pub const ImGuiCol_ButtonActive: c_int = 23;
pub const ImGuiCol_Header: c_int = 24;
pub const ImGuiCol_HeaderHovered: c_int = 25;
pub const ImGuiCol_HeaderActive: c_int = 26;
pub const ImGuiCol_Separator: c_int = 27;
pub const ImGuiCol_SeparatorHovered: c_int = 28;
pub const ImGuiCol_SeparatorActive: c_int = 29;
pub const ImGuiCol_ResizeGrip: c_int = 30;
pub const ImGuiCol_ResizeGripHovered: c_int = 31;
pub const ImGuiCol_ResizeGripActive: c_int = 32;
pub const ImGuiCol_Tab: c_int = 33;
pub const ImGuiCol_TabHovered: c_int = 34;
pub const ImGuiCol_TabActive: c_int = 35;
pub const ImGuiCol_TabUnfocused: c_int = 36;
pub const ImGuiCol_TabUnfocusedActive: c_int = 37;
pub const ImGuiCol_DockingPreview: c_int = 38;
pub const ImGuiCol_DockingEmptyBg: c_int = 39;
pub const ImGuiCol_PlotLines: c_int = 40;
pub const ImGuiCol_PlotLinesHovered: c_int = 41;
pub const ImGuiCol_PlotHistogram: c_int = 42;
pub const ImGuiCol_PlotHistogramHovered: c_int = 43;
pub const ImGuiCol_TableHeaderBg: c_int = 44;
pub const ImGuiCol_TableBorderStrong: c_int = 45;
pub const ImGuiCol_TableBorderLight: c_int = 46;
pub const ImGuiCol_TableRowBg: c_int = 47;
pub const ImGuiCol_TableRowBgAlt: c_int = 48;
pub const ImGuiCol_TextSelectedBg: c_int = 49;
pub const ImGuiCol_DragDropTarget: c_int = 50;
pub const ImGuiCol_NavHighlight: c_int = 51;
pub const ImGuiCol_NavWindowingHighlight: c_int = 52;
pub const ImGuiCol_NavWindowingDimBg: c_int = 53;
pub const ImGuiCol_ModalWindowDimBg: c_int = 54;
pub const ImGuiCol_COUNT: c_int = 55;
pub const ImGuiCol_ = c_uint;
pub const ImGuiStyleVar_Alpha: c_int = 0;
pub const ImGuiStyleVar_DisabledAlpha: c_int = 1;
pub const ImGuiStyleVar_WindowPadding: c_int = 2;
pub const ImGuiStyleVar_WindowRounding: c_int = 3;
pub const ImGuiStyleVar_WindowBorderSize: c_int = 4;
pub const ImGuiStyleVar_WindowMinSize: c_int = 5;
pub const ImGuiStyleVar_WindowTitleAlign: c_int = 6;
pub const ImGuiStyleVar_ChildRounding: c_int = 7;
pub const ImGuiStyleVar_ChildBorderSize: c_int = 8;
pub const ImGuiStyleVar_PopupRounding: c_int = 9;
pub const ImGuiStyleVar_PopupBorderSize: c_int = 10;
pub const ImGuiStyleVar_FramePadding: c_int = 11;
pub const ImGuiStyleVar_FrameRounding: c_int = 12;
pub const ImGuiStyleVar_FrameBorderSize: c_int = 13;
pub const ImGuiStyleVar_ItemSpacing: c_int = 14;
pub const ImGuiStyleVar_ItemInnerSpacing: c_int = 15;
pub const ImGuiStyleVar_IndentSpacing: c_int = 16;
pub const ImGuiStyleVar_CellPadding: c_int = 17;
pub const ImGuiStyleVar_ScrollbarSize: c_int = 18;
pub const ImGuiStyleVar_ScrollbarRounding: c_int = 19;
pub const ImGuiStyleVar_GrabMinSize: c_int = 20;
pub const ImGuiStyleVar_GrabRounding: c_int = 21;
pub const ImGuiStyleVar_TabRounding: c_int = 22;
pub const ImGuiStyleVar_TabBorderSize: c_int = 23;
pub const ImGuiStyleVar_TabBarBorderSize: c_int = 24;
pub const ImGuiStyleVar_TableAngledHeadersAngle: c_int = 25;
pub const ImGuiStyleVar_TableAngledHeadersTextAlign: c_int = 26;
pub const ImGuiStyleVar_ButtonTextAlign: c_int = 27;
pub const ImGuiStyleVar_SelectableTextAlign: c_int = 28;
pub const ImGuiStyleVar_SeparatorTextBorderSize: c_int = 29;
pub const ImGuiStyleVar_SeparatorTextAlign: c_int = 30;
pub const ImGuiStyleVar_SeparatorTextPadding: c_int = 31;
pub const ImGuiStyleVar_DockingSeparatorSize: c_int = 32;
pub const ImGuiStyleVar_COUNT: c_int = 33;
pub const ImGuiStyleVar_ = c_uint;
pub const ImGuiButtonFlags_None: c_int = 0;
pub const ImGuiButtonFlags_MouseButtonLeft: c_int = 1;
pub const ImGuiButtonFlags_MouseButtonRight: c_int = 2;
pub const ImGuiButtonFlags_MouseButtonMiddle: c_int = 4;
pub const ImGuiButtonFlags_MouseButtonMask_: c_int = 7;
pub const ImGuiButtonFlags_MouseButtonDefault_: c_int = 1;
pub const ImGuiButtonFlags_ = c_uint;
pub const ImGuiColorEditFlags_None: c_int = 0;
pub const ImGuiColorEditFlags_NoAlpha: c_int = 2;
pub const ImGuiColorEditFlags_NoPicker: c_int = 4;
pub const ImGuiColorEditFlags_NoOptions: c_int = 8;
pub const ImGuiColorEditFlags_NoSmallPreview: c_int = 16;
pub const ImGuiColorEditFlags_NoInputs: c_int = 32;
pub const ImGuiColorEditFlags_NoTooltip: c_int = 64;
pub const ImGuiColorEditFlags_NoLabel: c_int = 128;
pub const ImGuiColorEditFlags_NoSidePreview: c_int = 256;
pub const ImGuiColorEditFlags_NoDragDrop: c_int = 512;
pub const ImGuiColorEditFlags_NoBorder: c_int = 1024;
pub const ImGuiColorEditFlags_AlphaBar: c_int = 65536;
pub const ImGuiColorEditFlags_AlphaPreview: c_int = 131072;
pub const ImGuiColorEditFlags_AlphaPreviewHalf: c_int = 262144;
pub const ImGuiColorEditFlags_HDR: c_int = 524288;
pub const ImGuiColorEditFlags_DisplayRGB: c_int = 1048576;
pub const ImGuiColorEditFlags_DisplayHSV: c_int = 2097152;
pub const ImGuiColorEditFlags_DisplayHex: c_int = 4194304;
pub const ImGuiColorEditFlags_Uint8: c_int = 8388608;
pub const ImGuiColorEditFlags_Float: c_int = 16777216;
pub const ImGuiColorEditFlags_PickerHueBar: c_int = 33554432;
pub const ImGuiColorEditFlags_PickerHueWheel: c_int = 67108864;
pub const ImGuiColorEditFlags_InputRGB: c_int = 134217728;
pub const ImGuiColorEditFlags_InputHSV: c_int = 268435456;
pub const ImGuiColorEditFlags_DefaultOptions_: c_int = 177209344;
pub const ImGuiColorEditFlags_DisplayMask_: c_int = 7340032;
pub const ImGuiColorEditFlags_DataTypeMask_: c_int = 25165824;
pub const ImGuiColorEditFlags_PickerMask_: c_int = 100663296;
pub const ImGuiColorEditFlags_InputMask_: c_int = 402653184;
pub const ImGuiColorEditFlags_ = c_uint;
pub const ImGuiSliderFlags_None: c_int = 0;
pub const ImGuiSliderFlags_AlwaysClamp: c_int = 16;
pub const ImGuiSliderFlags_Logarithmic: c_int = 32;
pub const ImGuiSliderFlags_NoRoundToFormat: c_int = 64;
pub const ImGuiSliderFlags_NoInput: c_int = 128;
pub const ImGuiSliderFlags_InvalidMask_: c_int = 1879048207;
pub const ImGuiSliderFlags_ = c_uint;
pub const ImGuiMouseButton_Left: c_int = 0;
pub const ImGuiMouseButton_Right: c_int = 1;
pub const ImGuiMouseButton_Middle: c_int = 2;
pub const ImGuiMouseButton_COUNT: c_int = 5;
pub const ImGuiMouseButton_ = c_uint;
pub const ImGuiMouseCursor_None: c_int = -1;
pub const ImGuiMouseCursor_Arrow: c_int = 0;
pub const ImGuiMouseCursor_TextInput: c_int = 1;
pub const ImGuiMouseCursor_ResizeAll: c_int = 2;
pub const ImGuiMouseCursor_ResizeNS: c_int = 3;
pub const ImGuiMouseCursor_ResizeEW: c_int = 4;
pub const ImGuiMouseCursor_ResizeNESW: c_int = 5;
pub const ImGuiMouseCursor_ResizeNWSE: c_int = 6;
pub const ImGuiMouseCursor_Hand: c_int = 7;
pub const ImGuiMouseCursor_NotAllowed: c_int = 8;
pub const ImGuiMouseCursor_COUNT: c_int = 9;
pub const ImGuiMouseCursor_ = c_int;
pub const ImGuiMouseSource_Mouse: c_int = 0;
pub const ImGuiMouseSource_TouchScreen: c_int = 1;
pub const ImGuiMouseSource_Pen: c_int = 2;
pub const ImGuiMouseSource_COUNT: c_int = 3;
pub const ImGuiMouseSource = c_uint;
pub const ImGuiCond_None: c_int = 0;
pub const ImGuiCond_Always: c_int = 1;
pub const ImGuiCond_Once: c_int = 2;
pub const ImGuiCond_FirstUseEver: c_int = 4;
pub const ImGuiCond_Appearing: c_int = 8;
pub const ImGuiCond_ = c_uint;
pub const ImGuiTableFlags_None: c_int = 0;
pub const ImGuiTableFlags_Resizable: c_int = 1;
pub const ImGuiTableFlags_Reorderable: c_int = 2;
pub const ImGuiTableFlags_Hideable: c_int = 4;
pub const ImGuiTableFlags_Sortable: c_int = 8;
pub const ImGuiTableFlags_NoSavedSettings: c_int = 16;
pub const ImGuiTableFlags_ContextMenuInBody: c_int = 32;
pub const ImGuiTableFlags_RowBg: c_int = 64;
pub const ImGuiTableFlags_BordersInnerH: c_int = 128;
pub const ImGuiTableFlags_BordersOuterH: c_int = 256;
pub const ImGuiTableFlags_BordersInnerV: c_int = 512;
pub const ImGuiTableFlags_BordersOuterV: c_int = 1024;
pub const ImGuiTableFlags_BordersH: c_int = 384;
pub const ImGuiTableFlags_BordersV: c_int = 1536;
pub const ImGuiTableFlags_BordersInner: c_int = 640;
pub const ImGuiTableFlags_BordersOuter: c_int = 1280;
pub const ImGuiTableFlags_Borders: c_int = 1920;
pub const ImGuiTableFlags_NoBordersInBody: c_int = 2048;
pub const ImGuiTableFlags_NoBordersInBodyUntilResize: c_int = 4096;
pub const ImGuiTableFlags_SizingFixedFit: c_int = 8192;
pub const ImGuiTableFlags_SizingFixedSame: c_int = 16384;
pub const ImGuiTableFlags_SizingStretchProp: c_int = 24576;
pub const ImGuiTableFlags_SizingStretchSame: c_int = 32768;
pub const ImGuiTableFlags_NoHostExtendX: c_int = 65536;
pub const ImGuiTableFlags_NoHostExtendY: c_int = 131072;
pub const ImGuiTableFlags_NoKeepColumnsVisible: c_int = 262144;
pub const ImGuiTableFlags_PreciseWidths: c_int = 524288;
pub const ImGuiTableFlags_NoClip: c_int = 1048576;
pub const ImGuiTableFlags_PadOuterX: c_int = 2097152;
pub const ImGuiTableFlags_NoPadOuterX: c_int = 4194304;
pub const ImGuiTableFlags_NoPadInnerX: c_int = 8388608;
pub const ImGuiTableFlags_ScrollX: c_int = 16777216;
pub const ImGuiTableFlags_ScrollY: c_int = 33554432;
pub const ImGuiTableFlags_SortMulti: c_int = 67108864;
pub const ImGuiTableFlags_SortTristate: c_int = 134217728;
pub const ImGuiTableFlags_HighlightHoveredColumn: c_int = 268435456;
pub const ImGuiTableFlags_SizingMask_: c_int = 57344;
pub const ImGuiTableFlags_ = c_uint;
pub const ImGuiTableColumnFlags_None: c_int = 0;
pub const ImGuiTableColumnFlags_Disabled: c_int = 1;
pub const ImGuiTableColumnFlags_DefaultHide: c_int = 2;
pub const ImGuiTableColumnFlags_DefaultSort: c_int = 4;
pub const ImGuiTableColumnFlags_WidthStretch: c_int = 8;
pub const ImGuiTableColumnFlags_WidthFixed: c_int = 16;
pub const ImGuiTableColumnFlags_NoResize: c_int = 32;
pub const ImGuiTableColumnFlags_NoReorder: c_int = 64;
pub const ImGuiTableColumnFlags_NoHide: c_int = 128;
pub const ImGuiTableColumnFlags_NoClip: c_int = 256;
pub const ImGuiTableColumnFlags_NoSort: c_int = 512;
pub const ImGuiTableColumnFlags_NoSortAscending: c_int = 1024;
pub const ImGuiTableColumnFlags_NoSortDescending: c_int = 2048;
pub const ImGuiTableColumnFlags_NoHeaderLabel: c_int = 4096;
pub const ImGuiTableColumnFlags_NoHeaderWidth: c_int = 8192;
pub const ImGuiTableColumnFlags_PreferSortAscending: c_int = 16384;
pub const ImGuiTableColumnFlags_PreferSortDescending: c_int = 32768;
pub const ImGuiTableColumnFlags_IndentEnable: c_int = 65536;
pub const ImGuiTableColumnFlags_IndentDisable: c_int = 131072;
pub const ImGuiTableColumnFlags_AngledHeader: c_int = 262144;
pub const ImGuiTableColumnFlags_IsEnabled: c_int = 16777216;
pub const ImGuiTableColumnFlags_IsVisible: c_int = 33554432;
pub const ImGuiTableColumnFlags_IsSorted: c_int = 67108864;
pub const ImGuiTableColumnFlags_IsHovered: c_int = 134217728;
pub const ImGuiTableColumnFlags_WidthMask_: c_int = 24;
pub const ImGuiTableColumnFlags_IndentMask_: c_int = 196608;
pub const ImGuiTableColumnFlags_StatusMask_: c_int = 251658240;
pub const ImGuiTableColumnFlags_NoDirectResize_: c_int = 1073741824;
pub const ImGuiTableColumnFlags_ = c_uint;
pub const ImGuiTableRowFlags_None: c_int = 0;
pub const ImGuiTableRowFlags_Headers: c_int = 1;
pub const ImGuiTableRowFlags_ = c_uint;
pub const ImGuiTableBgTarget_None: c_int = 0;
pub const ImGuiTableBgTarget_RowBg0: c_int = 1;
pub const ImGuiTableBgTarget_RowBg1: c_int = 2;
pub const ImGuiTableBgTarget_CellBg: c_int = 3;
pub const ImGuiTableBgTarget_ = c_uint;
pub const ImDrawFlags_None: c_int = 0;
pub const ImDrawFlags_Closed: c_int = 1;
pub const ImDrawFlags_RoundCornersTopLeft: c_int = 16;
pub const ImDrawFlags_RoundCornersTopRight: c_int = 32;
pub const ImDrawFlags_RoundCornersBottomLeft: c_int = 64;
pub const ImDrawFlags_RoundCornersBottomRight: c_int = 128;
pub const ImDrawFlags_RoundCornersNone: c_int = 256;
pub const ImDrawFlags_RoundCornersTop: c_int = 48;
pub const ImDrawFlags_RoundCornersBottom: c_int = 192;
pub const ImDrawFlags_RoundCornersLeft: c_int = 80;
pub const ImDrawFlags_RoundCornersRight: c_int = 160;
pub const ImDrawFlags_RoundCornersAll: c_int = 240;
pub const ImDrawFlags_RoundCornersDefault_: c_int = 240;
pub const ImDrawFlags_RoundCornersMask_: c_int = 496;
pub const ImDrawFlags_ = c_uint;
pub const ImDrawListFlags_None: c_int = 0;
pub const ImDrawListFlags_AntiAliasedLines: c_int = 1;
pub const ImDrawListFlags_AntiAliasedLinesUseTex: c_int = 2;
pub const ImDrawListFlags_AntiAliasedFill: c_int = 4;
pub const ImDrawListFlags_AllowVtxOffset: c_int = 8;
pub const ImDrawListFlags_ = c_uint;
pub const ImFontAtlasFlags_None: c_int = 0;
pub const ImFontAtlasFlags_NoPowerOfTwoHeight: c_int = 1;
pub const ImFontAtlasFlags_NoMouseCursors: c_int = 2;
pub const ImFontAtlasFlags_NoBakedLines: c_int = 4;
pub const ImFontAtlasFlags_ = c_uint;
pub const ImGuiViewportFlags_None: c_int = 0;
pub const ImGuiViewportFlags_IsPlatformWindow: c_int = 1;
pub const ImGuiViewportFlags_IsPlatformMonitor: c_int = 2;
pub const ImGuiViewportFlags_OwnedByApp: c_int = 4;
pub const ImGuiViewportFlags_NoDecoration: c_int = 8;
pub const ImGuiViewportFlags_NoTaskBarIcon: c_int = 16;
pub const ImGuiViewportFlags_NoFocusOnAppearing: c_int = 32;
pub const ImGuiViewportFlags_NoFocusOnClick: c_int = 64;
pub const ImGuiViewportFlags_NoInputs: c_int = 128;
pub const ImGuiViewportFlags_NoRendererClear: c_int = 256;
pub const ImGuiViewportFlags_NoAutoMerge: c_int = 512;
pub const ImGuiViewportFlags_TopMost: c_int = 1024;
pub const ImGuiViewportFlags_CanHostOtherWindows: c_int = 2048;
pub const ImGuiViewportFlags_IsMinimized: c_int = 4096;
pub const ImGuiViewportFlags_IsFocused: c_int = 8192;
pub const ImGuiViewportFlags_ = c_uint;
pub const ImGuiDataAuthority = c_int;
pub const ImGuiActivateFlags = c_int;
pub const ImGuiDebugLogFlags = c_int;
pub const ImGuiFocusRequestFlags = c_int;
pub const ImGuiInputFlags = c_int;
pub const ImGuiNavHighlightFlags = c_int;
pub const ImGuiNavMoveFlags = c_int;
pub const ImGuiScrollFlags = c_int;
pub const ImGuiSeparatorFlags = c_int;
pub const ImGuiTextFlags = c_int;
pub const ImGuiTooltipFlags = c_int;
pub const ImGuiErrorLogCallback = ?*const fn (?*anyopaque, [*c]const u8, ...) callconv(.C) void;
pub extern var GImGui: ?*ImGuiContext;
pub const struct_StbTexteditRow = extern struct {
    x0: f32 = @import("std").mem.zeroes(f32),
    x1: f32 = @import("std").mem.zeroes(f32),
    baseline_y_delta: f32 = @import("std").mem.zeroes(f32),
    ymin: f32 = @import("std").mem.zeroes(f32),
    ymax: f32 = @import("std").mem.zeroes(f32),
    num_chars: c_int = @import("std").mem.zeroes(c_int),
};
pub const StbTexteditRow = struct_StbTexteditRow;
pub const ImFileHandle = ?*FILE;
pub const ImPoolIdx = c_int;
pub const struct_ImVector_int = extern struct {
    Size: c_int = @import("std").mem.zeroes(c_int),
    Capacity: c_int = @import("std").mem.zeroes(c_int),
    Data: [*c]c_int = @import("std").mem.zeroes([*c]c_int),
};
pub const ImVector_int = struct_ImVector_int;
pub const struct_ImGuiTextIndex = extern struct {
    LineOffsets: ImVector_int = @import("std").mem.zeroes(ImVector_int),
    EndOffset: c_int = @import("std").mem.zeroes(c_int),
};
pub const ImGuiTextIndex = struct_ImGuiTextIndex;
pub const ImGuiItemFlags_None: c_int = 0;
pub const ImGuiItemFlags_NoTabStop: c_int = 1;
pub const ImGuiItemFlags_ButtonRepeat: c_int = 2;
pub const ImGuiItemFlags_Disabled: c_int = 4;
pub const ImGuiItemFlags_NoNav: c_int = 8;
pub const ImGuiItemFlags_NoNavDefaultFocus: c_int = 16;
pub const ImGuiItemFlags_SelectableDontClosePopup: c_int = 32;
pub const ImGuiItemFlags_MixedValue: c_int = 64;
pub const ImGuiItemFlags_ReadOnly: c_int = 128;
pub const ImGuiItemFlags_NoWindowHoverableCheck: c_int = 256;
pub const ImGuiItemFlags_AllowOverlap: c_int = 512;
pub const ImGuiItemFlags_Inputable: c_int = 1024;
pub const ImGuiItemFlags_HasSelectionUserData: c_int = 2048;
pub const ImGuiItemFlags_ = c_uint;
pub const ImGuiItemStatusFlags_None: c_int = 0;
pub const ImGuiItemStatusFlags_HoveredRect: c_int = 1;
pub const ImGuiItemStatusFlags_HasDisplayRect: c_int = 2;
pub const ImGuiItemStatusFlags_Edited: c_int = 4;
pub const ImGuiItemStatusFlags_ToggledSelection: c_int = 8;
pub const ImGuiItemStatusFlags_ToggledOpen: c_int = 16;
pub const ImGuiItemStatusFlags_HasDeactivated: c_int = 32;
pub const ImGuiItemStatusFlags_Deactivated: c_int = 64;
pub const ImGuiItemStatusFlags_HoveredWindow: c_int = 128;
pub const ImGuiItemStatusFlags_Visible: c_int = 256;
pub const ImGuiItemStatusFlags_HasClipRect: c_int = 512;
pub const ImGuiItemStatusFlags_ = c_uint;
pub const ImGuiHoveredFlags_DelayMask_: c_int = 245760;
pub const ImGuiHoveredFlags_AllowedMaskForIsWindowHovered: c_int = 12479;
pub const ImGuiHoveredFlags_AllowedMaskForIsItemHovered: c_int = 262048;
pub const ImGuiHoveredFlagsPrivate_ = c_uint;
pub const ImGuiInputTextFlags_Multiline: c_int = 67108864;
pub const ImGuiInputTextFlags_NoMarkEdited: c_int = 134217728;
pub const ImGuiInputTextFlags_MergedItem: c_int = 268435456;
pub const ImGuiInputTextFlags_LocalizeDecimalPoint: c_int = 536870912;
pub const ImGuiInputTextFlagsPrivate_ = c_uint;
pub const ImGuiButtonFlags_PressedOnClick: c_int = 16;
pub const ImGuiButtonFlags_PressedOnClickRelease: c_int = 32;
pub const ImGuiButtonFlags_PressedOnClickReleaseAnywhere: c_int = 64;
pub const ImGuiButtonFlags_PressedOnRelease: c_int = 128;
pub const ImGuiButtonFlags_PressedOnDoubleClick: c_int = 256;
pub const ImGuiButtonFlags_PressedOnDragDropHold: c_int = 512;
pub const ImGuiButtonFlags_Repeat: c_int = 1024;
pub const ImGuiButtonFlags_FlattenChildren: c_int = 2048;
pub const ImGuiButtonFlags_AllowOverlap: c_int = 4096;
pub const ImGuiButtonFlags_DontClosePopups: c_int = 8192;
pub const ImGuiButtonFlags_AlignTextBaseLine: c_int = 32768;
pub const ImGuiButtonFlags_NoKeyModifiers: c_int = 65536;
pub const ImGuiButtonFlags_NoHoldingActiveId: c_int = 131072;
pub const ImGuiButtonFlags_NoNavFocus: c_int = 262144;
pub const ImGuiButtonFlags_NoHoveredOnFocus: c_int = 524288;
pub const ImGuiButtonFlags_NoSetKeyOwner: c_int = 1048576;
pub const ImGuiButtonFlags_NoTestKeyOwner: c_int = 2097152;
pub const ImGuiButtonFlags_PressedOnMask_: c_int = 1008;
pub const ImGuiButtonFlags_PressedOnDefault_: c_int = 32;
pub const ImGuiButtonFlagsPrivate_ = c_uint;
pub const ImGuiComboFlags_CustomPreview: c_int = 1048576;
pub const ImGuiComboFlagsPrivate_ = c_uint;
pub const ImGuiSliderFlags_Vertical: c_int = 1048576;
pub const ImGuiSliderFlags_ReadOnly: c_int = 2097152;
pub const ImGuiSliderFlagsPrivate_ = c_uint;
pub const ImGuiSelectableFlags_NoHoldingActiveID: c_int = 1048576;
pub const ImGuiSelectableFlags_SelectOnNav: c_int = 2097152;
pub const ImGuiSelectableFlags_SelectOnClick: c_int = 4194304;
pub const ImGuiSelectableFlags_SelectOnRelease: c_int = 8388608;
pub const ImGuiSelectableFlags_SpanAvailWidth: c_int = 16777216;
pub const ImGuiSelectableFlags_SetNavIdOnHover: c_int = 33554432;
pub const ImGuiSelectableFlags_NoPadWithHalfSpacing: c_int = 67108864;
pub const ImGuiSelectableFlags_NoSetKeyOwner: c_int = 134217728;
pub const ImGuiSelectableFlagsPrivate_ = c_uint;
pub const ImGuiTreeNodeFlags_ClipLabelForTrailingButton: c_int = 1048576;
pub const ImGuiTreeNodeFlags_UpsideDownArrow: c_int = 2097152;
pub const ImGuiTreeNodeFlagsPrivate_ = c_uint;
pub const ImGuiSeparatorFlags_None: c_int = 0;
pub const ImGuiSeparatorFlags_Horizontal: c_int = 1;
pub const ImGuiSeparatorFlags_Vertical: c_int = 2;
pub const ImGuiSeparatorFlags_SpanAllColumns: c_int = 4;
pub const ImGuiSeparatorFlags_ = c_uint;
pub const ImGuiFocusRequestFlags_None: c_int = 0;
pub const ImGuiFocusRequestFlags_RestoreFocusedChild: c_int = 1;
pub const ImGuiFocusRequestFlags_UnlessBelowModal: c_int = 2;
pub const ImGuiFocusRequestFlags_ = c_uint;
pub const ImGuiTextFlags_None: c_int = 0;
pub const ImGuiTextFlags_NoWidthForLargeClippedText: c_int = 1;
pub const ImGuiTextFlags_ = c_uint;
pub const ImGuiTooltipFlags_None: c_int = 0;
pub const ImGuiTooltipFlags_OverridePrevious: c_int = 2;
pub const ImGuiTooltipFlags_ = c_uint;
pub const ImGuiLayoutType_Horizontal: c_int = 0;
pub const ImGuiLayoutType_Vertical: c_int = 1;
pub const ImGuiLayoutType_ = c_uint;
pub const ImGuiLogType_None: c_int = 0;
pub const ImGuiLogType_TTY: c_int = 1;
pub const ImGuiLogType_File: c_int = 2;
pub const ImGuiLogType_Buffer: c_int = 3;
pub const ImGuiLogType_Clipboard: c_int = 4;
pub const ImGuiLogType = c_uint;
pub const ImGuiAxis_None: c_int = -1;
pub const ImGuiAxis_X: c_int = 0;
pub const ImGuiAxis_Y: c_int = 1;
pub const ImGuiAxis = c_int;
pub const ImGuiPlotType_Lines: c_int = 0;
pub const ImGuiPlotType_Histogram: c_int = 1;
pub const ImGuiPlotType = c_uint;
pub const struct_ImGuiComboPreviewData = extern struct {
    PreviewRect: ImRect = @import("std").mem.zeroes(ImRect),
    BackupCursorPos: ImVec2 = @import("std").mem.zeroes(ImVec2),
    BackupCursorMaxPos: ImVec2 = @import("std").mem.zeroes(ImVec2),
    BackupCursorPosPrevLine: ImVec2 = @import("std").mem.zeroes(ImVec2),
    BackupPrevLineTextBaseOffset: f32 = @import("std").mem.zeroes(f32),
    BackupLayout: ImGuiLayoutType = @import("std").mem.zeroes(ImGuiLayoutType),
};
pub const ImGuiComboPreviewData = struct_ImGuiComboPreviewData;
pub const struct_ImGuiInputTextDeactivatedState = extern struct {
    ID: ImGuiID = @import("std").mem.zeroes(ImGuiID),
    TextA: ImVector_char = @import("std").mem.zeroes(ImVector_char),
};
pub const ImGuiInputTextDeactivatedState = struct_ImGuiInputTextDeactivatedState;
pub const ImGuiWindowRefreshFlags_None: c_int = 0;
pub const ImGuiWindowRefreshFlags_TryToAvoidRefresh: c_int = 1;
pub const ImGuiWindowRefreshFlags_RefreshOnHover: c_int = 2;
pub const ImGuiWindowRefreshFlags_RefreshOnFocus: c_int = 4;
pub const ImGuiWindowRefreshFlags_ = c_uint;
pub const ImGuiNextWindowDataFlags_None: c_int = 0;
pub const ImGuiNextWindowDataFlags_HasPos: c_int = 1;
pub const ImGuiNextWindowDataFlags_HasSize: c_int = 2;
pub const ImGuiNextWindowDataFlags_HasContentSize: c_int = 4;
pub const ImGuiNextWindowDataFlags_HasCollapsed: c_int = 8;
pub const ImGuiNextWindowDataFlags_HasSizeConstraint: c_int = 16;
pub const ImGuiNextWindowDataFlags_HasFocus: c_int = 32;
pub const ImGuiNextWindowDataFlags_HasBgAlpha: c_int = 64;
pub const ImGuiNextWindowDataFlags_HasScroll: c_int = 128;
pub const ImGuiNextWindowDataFlags_HasChildFlags: c_int = 256;
pub const ImGuiNextWindowDataFlags_HasRefreshPolicy: c_int = 512;
pub const ImGuiNextWindowDataFlags_HasViewport: c_int = 1024;
pub const ImGuiNextWindowDataFlags_HasDock: c_int = 2048;
pub const ImGuiNextWindowDataFlags_HasWindowClass: c_int = 4096;
pub const ImGuiNextWindowDataFlags_ = c_uint;
pub const ImGuiNextItemDataFlags_None: c_int = 0;
pub const ImGuiNextItemDataFlags_HasWidth: c_int = 1;
pub const ImGuiNextItemDataFlags_HasOpen: c_int = 2;
pub const ImGuiNextItemDataFlags_HasShortcut: c_int = 4;
pub const ImGuiNextItemDataFlags_ = c_uint;
pub const struct_ImGuiShrinkWidthItem = extern struct {
    Index: c_int = @import("std").mem.zeroes(c_int),
    Width: f32 = @import("std").mem.zeroes(f32),
    InitialWidth: f32 = @import("std").mem.zeroes(f32),
};
pub const ImGuiShrinkWidthItem = struct_ImGuiShrinkWidthItem;
pub const struct_ImGuiPtrOrIndex = extern struct {
    Ptr: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    Index: c_int = @import("std").mem.zeroes(c_int),
};
pub const ImGuiPtrOrIndex = struct_ImGuiPtrOrIndex;
pub const struct_ImGuiDataTypeTempStorage = extern struct {
    Data: [8]ImU8 = @import("std").mem.zeroes([8]ImU8),
};
pub const ImGuiDataTypeTempStorage = struct_ImGuiDataTypeTempStorage;
pub const ImGuiDataType_String: c_int = 11;
pub const ImGuiDataType_Pointer: c_int = 12;
pub const ImGuiDataType_ID: c_int = 13;
pub const ImGuiDataTypePrivate_ = c_uint;
pub const ImGuiPopupPositionPolicy_Default: c_int = 0;
pub const ImGuiPopupPositionPolicy_ComboBox: c_int = 1;
pub const ImGuiPopupPositionPolicy_Tooltip: c_int = 2;
pub const ImGuiPopupPositionPolicy = c_uint;
pub const struct_ImBitArray_ImGuiKey_NamedKey_COUNT__lessImGuiKey_NamedKey_BEGIN = extern struct {
    Storage: [5]ImU32 = @import("std").mem.zeroes([5]ImU32),
};
pub const ImBitArray_ImGuiKey_NamedKey_COUNT__lessImGuiKey_NamedKey_BEGIN = struct_ImBitArray_ImGuiKey_NamedKey_COUNT__lessImGuiKey_NamedKey_BEGIN;
pub const ImBitArrayForNamedKeys = ImBitArray_ImGuiKey_NamedKey_COUNT__lessImGuiKey_NamedKey_BEGIN;
pub const ImGuiInputEventType_None: c_int = 0;
pub const ImGuiInputEventType_MousePos: c_int = 1;
pub const ImGuiInputEventType_MouseWheel: c_int = 2;
pub const ImGuiInputEventType_MouseButton: c_int = 3;
pub const ImGuiInputEventType_MouseViewport: c_int = 4;
pub const ImGuiInputEventType_Key: c_int = 5;
pub const ImGuiInputEventType_Text: c_int = 6;
pub const ImGuiInputEventType_Focus: c_int = 7;
pub const ImGuiInputEventType_COUNT: c_int = 8;
pub const ImGuiInputEventType = c_uint;
pub const ImGuiInputSource_None: c_int = 0;
pub const ImGuiInputSource_Mouse: c_int = 1;
pub const ImGuiInputSource_Keyboard: c_int = 2;
pub const ImGuiInputSource_Gamepad: c_int = 3;
pub const ImGuiInputSource_COUNT: c_int = 4;
pub const ImGuiInputSource = c_uint;
pub const ImGuiKeyRoutingIndex = ImS16;
pub const struct_ImGuiKeyRoutingData = extern struct {
    NextEntryIndex: ImGuiKeyRoutingIndex = @import("std").mem.zeroes(ImGuiKeyRoutingIndex),
    Mods: ImU16 = @import("std").mem.zeroes(ImU16),
    RoutingCurrScore: ImU8 = @import("std").mem.zeroes(ImU8),
    RoutingNextScore: ImU8 = @import("std").mem.zeroes(ImU8),
    RoutingCurr: ImGuiID = @import("std").mem.zeroes(ImGuiID),
    RoutingNext: ImGuiID = @import("std").mem.zeroes(ImGuiID),
};
pub const ImGuiKeyRoutingData = struct_ImGuiKeyRoutingData;
pub const struct_ImVector_ImGuiKeyRoutingData = extern struct {
    Size: c_int = @import("std").mem.zeroes(c_int),
    Capacity: c_int = @import("std").mem.zeroes(c_int),
    Data: [*c]ImGuiKeyRoutingData = @import("std").mem.zeroes([*c]ImGuiKeyRoutingData),
};
pub const ImVector_ImGuiKeyRoutingData = struct_ImVector_ImGuiKeyRoutingData;
pub const struct_ImGuiKeyRoutingTable = extern struct {
    Index: [154]ImGuiKeyRoutingIndex = @import("std").mem.zeroes([154]ImGuiKeyRoutingIndex),
    Entries: ImVector_ImGuiKeyRoutingData = @import("std").mem.zeroes(ImVector_ImGuiKeyRoutingData),
    EntriesNext: ImVector_ImGuiKeyRoutingData = @import("std").mem.zeroes(ImVector_ImGuiKeyRoutingData),
};
pub const ImGuiKeyRoutingTable = struct_ImGuiKeyRoutingTable;
pub const struct_ImGuiKeyOwnerData = extern struct {
    OwnerCurr: ImGuiID = @import("std").mem.zeroes(ImGuiID),
    OwnerNext: ImGuiID = @import("std").mem.zeroes(ImGuiID),
    LockThisFrame: bool = @import("std").mem.zeroes(bool),
    LockUntilRelease: bool = @import("std").mem.zeroes(bool),
};
pub const ImGuiKeyOwnerData = struct_ImGuiKeyOwnerData;
pub const ImGuiInputFlags_None: c_int = 0;
pub const ImGuiInputFlags_Repeat: c_int = 1;
pub const ImGuiInputFlags_RepeatRateDefault: c_int = 2;
pub const ImGuiInputFlags_RepeatRateNavMove: c_int = 4;
pub const ImGuiInputFlags_RepeatRateNavTweak: c_int = 8;
pub const ImGuiInputFlags_RepeatUntilRelease: c_int = 16;
pub const ImGuiInputFlags_RepeatUntilKeyModsChange: c_int = 32;
pub const ImGuiInputFlags_RepeatUntilKeyModsChangeFromNone: c_int = 64;
pub const ImGuiInputFlags_RepeatUntilOtherKeyPress: c_int = 128;
pub const ImGuiInputFlags_CondHovered: c_int = 256;
pub const ImGuiInputFlags_CondActive: c_int = 512;
pub const ImGuiInputFlags_CondDefault_: c_int = 768;
pub const ImGuiInputFlags_LockThisFrame: c_int = 1024;
pub const ImGuiInputFlags_LockUntilRelease: c_int = 2048;
pub const ImGuiInputFlags_RouteFocused: c_int = 4096;
pub const ImGuiInputFlags_RouteGlobalLow: c_int = 8192;
pub const ImGuiInputFlags_RouteGlobal: c_int = 16384;
pub const ImGuiInputFlags_RouteGlobalHigh: c_int = 32768;
pub const ImGuiInputFlags_RouteAlways: c_int = 65536;
pub const ImGuiInputFlags_RouteUnlessBgFocused: c_int = 131072;
pub const ImGuiInputFlags_RepeatRateMask_: c_int = 14;
pub const ImGuiInputFlags_RepeatUntilMask_: c_int = 240;
pub const ImGuiInputFlags_RepeatMask_: c_int = 255;
pub const ImGuiInputFlags_CondMask_: c_int = 768;
pub const ImGuiInputFlags_RouteMask_: c_int = 61440;
pub const ImGuiInputFlags_SupportedByIsKeyPressed: c_int = 255;
pub const ImGuiInputFlags_SupportedByIsMouseClicked: c_int = 1;
pub const ImGuiInputFlags_SupportedByShortcut: c_int = 258303;
pub const ImGuiInputFlags_SupportedBySetKeyOwner: c_int = 3072;
pub const ImGuiInputFlags_SupportedBySetItemKeyOwner: c_int = 3840;
pub const ImGuiInputFlags_ = c_uint;
pub const struct_ImGuiListClipperRange = extern struct {
    Min: c_int = @import("std").mem.zeroes(c_int),
    Max: c_int = @import("std").mem.zeroes(c_int),
    PosToIndexConvert: bool = @import("std").mem.zeroes(bool),
    PosToIndexOffsetMin: ImS8 = @import("std").mem.zeroes(ImS8),
    PosToIndexOffsetMax: ImS8 = @import("std").mem.zeroes(ImS8),
};
pub const ImGuiListClipperRange = struct_ImGuiListClipperRange;
pub const struct_ImVector_ImGuiListClipperRange = extern struct {
    Size: c_int = @import("std").mem.zeroes(c_int),
    Capacity: c_int = @import("std").mem.zeroes(c_int),
    Data: [*c]ImGuiListClipperRange = @import("std").mem.zeroes([*c]ImGuiListClipperRange),
};
pub const ImVector_ImGuiListClipperRange = struct_ImVector_ImGuiListClipperRange;
pub const struct_ImGuiListClipperData = extern struct {
    ListClipper: [*c]ImGuiListClipper = @import("std").mem.zeroes([*c]ImGuiListClipper),
    LossynessOffset: f32 = @import("std").mem.zeroes(f32),
    StepNo: c_int = @import("std").mem.zeroes(c_int),
    ItemsFrozen: c_int = @import("std").mem.zeroes(c_int),
    Ranges: ImVector_ImGuiListClipperRange = @import("std").mem.zeroes(ImVector_ImGuiListClipperRange),
};
pub const ImGuiListClipperData = struct_ImGuiListClipperData;
pub const ImGuiActivateFlags_None: c_int = 0;
pub const ImGuiActivateFlags_PreferInput: c_int = 1;
pub const ImGuiActivateFlags_PreferTweak: c_int = 2;
pub const ImGuiActivateFlags_TryToPreserveState: c_int = 4;
pub const ImGuiActivateFlags_FromTabbing: c_int = 8;
pub const ImGuiActivateFlags_FromShortcut: c_int = 16;
pub const ImGuiActivateFlags_ = c_uint;
pub const ImGuiScrollFlags_None: c_int = 0;
pub const ImGuiScrollFlags_KeepVisibleEdgeX: c_int = 1;
pub const ImGuiScrollFlags_KeepVisibleEdgeY: c_int = 2;
pub const ImGuiScrollFlags_KeepVisibleCenterX: c_int = 4;
pub const ImGuiScrollFlags_KeepVisibleCenterY: c_int = 8;
pub const ImGuiScrollFlags_AlwaysCenterX: c_int = 16;
pub const ImGuiScrollFlags_AlwaysCenterY: c_int = 32;
pub const ImGuiScrollFlags_NoScrollParent: c_int = 64;
pub const ImGuiScrollFlags_MaskX_: c_int = 21;
pub const ImGuiScrollFlags_MaskY_: c_int = 42;
pub const ImGuiScrollFlags_ = c_uint;
pub const ImGuiNavHighlightFlags_None: c_int = 0;
pub const ImGuiNavHighlightFlags_Compact: c_int = 2;
pub const ImGuiNavHighlightFlags_AlwaysDraw: c_int = 4;
pub const ImGuiNavHighlightFlags_NoRounding: c_int = 8;
pub const ImGuiNavHighlightFlags_ = c_uint;
pub const ImGuiNavMoveFlags_None: c_int = 0;
pub const ImGuiNavMoveFlags_LoopX: c_int = 1;
pub const ImGuiNavMoveFlags_LoopY: c_int = 2;
pub const ImGuiNavMoveFlags_WrapX: c_int = 4;
pub const ImGuiNavMoveFlags_WrapY: c_int = 8;
pub const ImGuiNavMoveFlags_WrapMask_: c_int = 15;
pub const ImGuiNavMoveFlags_AllowCurrentNavId: c_int = 16;
pub const ImGuiNavMoveFlags_AlsoScoreVisibleSet: c_int = 32;
pub const ImGuiNavMoveFlags_ScrollToEdgeY: c_int = 64;
pub const ImGuiNavMoveFlags_Forwarded: c_int = 128;
pub const ImGuiNavMoveFlags_DebugNoResult: c_int = 256;
pub const ImGuiNavMoveFlags_FocusApi: c_int = 512;
pub const ImGuiNavMoveFlags_IsTabbing: c_int = 1024;
pub const ImGuiNavMoveFlags_IsPageMove: c_int = 2048;
pub const ImGuiNavMoveFlags_Activate: c_int = 4096;
pub const ImGuiNavMoveFlags_NoSelect: c_int = 8192;
pub const ImGuiNavMoveFlags_NoSetNavHighlight: c_int = 16384;
pub const ImGuiNavMoveFlags_NoClearActiveId: c_int = 32768;
pub const ImGuiNavMoveFlags_ = c_uint;
pub const ImGuiNavLayer_Main: c_int = 0;
pub const ImGuiNavLayer_Menu: c_int = 1;
pub const ImGuiNavLayer_COUNT: c_int = 2;
pub const ImGuiNavLayer = c_uint;
pub const struct_ImGuiFocusScopeData = extern struct {
    ID: ImGuiID = @import("std").mem.zeroes(ImGuiID),
    WindowID: ImGuiID = @import("std").mem.zeroes(ImGuiID),
};
pub const ImGuiFocusScopeData = struct_ImGuiFocusScopeData;
pub const ImGuiTypingSelectFlags_None: c_int = 0;
pub const ImGuiTypingSelectFlags_AllowBackspace: c_int = 1;
pub const ImGuiTypingSelectFlags_AllowSingleCharMode: c_int = 2;
pub const ImGuiTypingSelectFlags_ = c_uint;
pub const ImGuiOldColumnFlags_None: c_int = 0;
pub const ImGuiOldColumnFlags_NoBorder: c_int = 1;
pub const ImGuiOldColumnFlags_NoResize: c_int = 2;
pub const ImGuiOldColumnFlags_NoPreserveWidths: c_int = 4;
pub const ImGuiOldColumnFlags_NoForceWithinWindow: c_int = 8;
pub const ImGuiOldColumnFlags_GrowParentContentsSize: c_int = 16;
pub const ImGuiOldColumnFlags_ = c_uint;
pub const ImGuiDockNodeFlags_DockSpace: c_int = 1024;
pub const ImGuiDockNodeFlags_CentralNode: c_int = 2048;
pub const ImGuiDockNodeFlags_NoTabBar: c_int = 4096;
pub const ImGuiDockNodeFlags_HiddenTabBar: c_int = 8192;
pub const ImGuiDockNodeFlags_NoWindowMenuButton: c_int = 16384;
pub const ImGuiDockNodeFlags_NoCloseButton: c_int = 32768;
pub const ImGuiDockNodeFlags_NoResizeX: c_int = 65536;
pub const ImGuiDockNodeFlags_NoResizeY: c_int = 131072;
pub const ImGuiDockNodeFlags_DockedWindowsInFocusRoute: c_int = 262144;
pub const ImGuiDockNodeFlags_NoDockingSplitOther: c_int = 524288;
pub const ImGuiDockNodeFlags_NoDockingOverMe: c_int = 1048576;
pub const ImGuiDockNodeFlags_NoDockingOverOther: c_int = 2097152;
pub const ImGuiDockNodeFlags_NoDockingOverEmpty: c_int = 4194304;
pub const ImGuiDockNodeFlags_NoDocking: c_int = 7864336;
pub const ImGuiDockNodeFlags_SharedFlagsInheritMask_: c_int = -1;
pub const ImGuiDockNodeFlags_NoResizeFlagsMask_: c_int = 196640;
pub const ImGuiDockNodeFlags_LocalFlagsTransferMask_: c_int = 260208;
pub const ImGuiDockNodeFlags_SavedFlagsMask_: c_int = 261152;
pub const ImGuiDockNodeFlagsPrivate_ = c_int;
pub const ImGuiDataAuthority_Auto: c_int = 0;
pub const ImGuiDataAuthority_DockNode: c_int = 1;
pub const ImGuiDataAuthority_Window: c_int = 2;
pub const ImGuiDataAuthority_ = c_uint;
pub const ImGuiDockNodeState_Unknown: c_int = 0;
pub const ImGuiDockNodeState_HostWindowHiddenBecauseSingleWindow: c_int = 1;
pub const ImGuiDockNodeState_HostWindowHiddenBecauseWindowsAreResizing: c_int = 2;
pub const ImGuiDockNodeState_HostWindowVisible: c_int = 3;
pub const ImGuiDockNodeState = c_uint;
pub const ImGuiWindowDockStyleCol_Text: c_int = 0;
pub const ImGuiWindowDockStyleCol_Tab: c_int = 1;
pub const ImGuiWindowDockStyleCol_TabHovered: c_int = 2;
pub const ImGuiWindowDockStyleCol_TabActive: c_int = 3;
pub const ImGuiWindowDockStyleCol_TabUnfocused: c_int = 4;
pub const ImGuiWindowDockStyleCol_TabUnfocusedActive: c_int = 5;
pub const ImGuiWindowDockStyleCol_COUNT: c_int = 6;
pub const ImGuiWindowDockStyleCol = c_uint;
pub const ImGuiLocKey_VersionStr: c_int = 0;
pub const ImGuiLocKey_TableSizeOne: c_int = 1;
pub const ImGuiLocKey_TableSizeAllFit: c_int = 2;
pub const ImGuiLocKey_TableSizeAllDefault: c_int = 3;
pub const ImGuiLocKey_TableResetOrder: c_int = 4;
pub const ImGuiLocKey_WindowingMainMenuBar: c_int = 5;
pub const ImGuiLocKey_WindowingPopup: c_int = 6;
pub const ImGuiLocKey_WindowingUntitled: c_int = 7;
pub const ImGuiLocKey_DockingHideTabBar: c_int = 8;
pub const ImGuiLocKey_DockingHoldShiftToDock: c_int = 9;
pub const ImGuiLocKey_DockingDragToUndockOrMoveNode: c_int = 10;
pub const ImGuiLocKey_COUNT: c_int = 11;
pub const ImGuiLocKey = c_uint;
pub const ImGuiDebugLogFlags_None: c_int = 0;
pub const ImGuiDebugLogFlags_EventActiveId: c_int = 1;
pub const ImGuiDebugLogFlags_EventFocus: c_int = 2;
pub const ImGuiDebugLogFlags_EventPopup: c_int = 4;
pub const ImGuiDebugLogFlags_EventNav: c_int = 8;
pub const ImGuiDebugLogFlags_EventClipper: c_int = 16;
pub const ImGuiDebugLogFlags_EventSelection: c_int = 32;
pub const ImGuiDebugLogFlags_EventIO: c_int = 64;
pub const ImGuiDebugLogFlags_EventInputRouting: c_int = 128;
pub const ImGuiDebugLogFlags_EventDocking: c_int = 256;
pub const ImGuiDebugLogFlags_EventViewport: c_int = 512;
pub const ImGuiDebugLogFlags_EventMask_: c_int = 1023;
pub const ImGuiDebugLogFlags_OutputToTTY: c_int = 1048576;
pub const ImGuiDebugLogFlags_OutputToTestEngine: c_int = 2097152;
pub const ImGuiDebugLogFlags_ = c_uint;
pub const struct_ImGuiDebugAllocEntry = extern struct {
    FrameCount: c_int = @import("std").mem.zeroes(c_int),
    AllocCount: ImS16 = @import("std").mem.zeroes(ImS16),
    FreeCount: ImS16 = @import("std").mem.zeroes(ImS16),
};
pub const ImGuiDebugAllocEntry = struct_ImGuiDebugAllocEntry;
pub const struct_ImGuiDebugAllocInfo = extern struct {
    TotalAllocCount: c_int = @import("std").mem.zeroes(c_int),
    TotalFreeCount: c_int = @import("std").mem.zeroes(c_int),
    LastEntriesIdx: ImS16 = @import("std").mem.zeroes(ImS16),
    LastEntriesBuf: [6]ImGuiDebugAllocEntry = @import("std").mem.zeroes([6]ImGuiDebugAllocEntry),
};
pub const ImGuiDebugAllocInfo = struct_ImGuiDebugAllocInfo; // /home/antaraz/dev/slingshot/cimgui/cimgui.h:2473:19: warning: struct demoted to opaque type - has bitfield
pub const struct_ImGuiStackLevelInfo = opaque {};
pub const ImGuiStackLevelInfo = struct_ImGuiStackLevelInfo;
pub const struct_ImVector_ImGuiStackLevelInfo = extern struct {
    Size: c_int = @import("std").mem.zeroes(c_int),
    Capacity: c_int = @import("std").mem.zeroes(c_int),
    Data: ?*ImGuiStackLevelInfo = @import("std").mem.zeroes(?*ImGuiStackLevelInfo),
};
pub const ImVector_ImGuiStackLevelInfo = struct_ImVector_ImGuiStackLevelInfo;
pub const struct_ImGuiIDStackTool = extern struct {
    LastActiveFrame: c_int = @import("std").mem.zeroes(c_int),
    StackLevel: c_int = @import("std").mem.zeroes(c_int),
    QueryId: ImGuiID = @import("std").mem.zeroes(ImGuiID),
    Results: ImVector_ImGuiStackLevelInfo = @import("std").mem.zeroes(ImVector_ImGuiStackLevelInfo),
    CopyToClipboardOnCtrlC: bool = @import("std").mem.zeroes(bool),
    CopyToClipboardLastTime: f32 = @import("std").mem.zeroes(f32),
};
pub const ImGuiIDStackTool = struct_ImGuiIDStackTool;
pub const ImGuiContextHookType_NewFramePre: c_int = 0;
pub const ImGuiContextHookType_NewFramePost: c_int = 1;
pub const ImGuiContextHookType_EndFramePre: c_int = 2;
pub const ImGuiContextHookType_EndFramePost: c_int = 3;
pub const ImGuiContextHookType_RenderPre: c_int = 4;
pub const ImGuiContextHookType_RenderPost: c_int = 5;
pub const ImGuiContextHookType_Shutdown: c_int = 6;
pub const ImGuiContextHookType_PendingRemoval_: c_int = 7;
pub const ImGuiContextHookType = c_uint;
pub const struct_ImVector_ImGuiColorMod = extern struct {
    Size: c_int = @import("std").mem.zeroes(c_int),
    Capacity: c_int = @import("std").mem.zeroes(c_int),
    Data: [*c]ImGuiColorMod = @import("std").mem.zeroes([*c]ImGuiColorMod),
};
pub const ImVector_ImGuiColorMod = struct_ImVector_ImGuiColorMod;
pub const struct_ImVector_ImGuiStyleMod = extern struct {
    Size: c_int = @import("std").mem.zeroes(c_int),
    Capacity: c_int = @import("std").mem.zeroes(c_int),
    Data: [*c]ImGuiStyleMod = @import("std").mem.zeroes([*c]ImGuiStyleMod),
};
pub const ImVector_ImGuiStyleMod = struct_ImVector_ImGuiStyleMod;
pub const struct_ImVector_ImGuiFocusScopeData = extern struct {
    Size: c_int = @import("std").mem.zeroes(c_int),
    Capacity: c_int = @import("std").mem.zeroes(c_int),
    Data: [*c]ImGuiFocusScopeData = @import("std").mem.zeroes([*c]ImGuiFocusScopeData),
};
pub const ImVector_ImGuiFocusScopeData = struct_ImVector_ImGuiFocusScopeData;
pub const struct_ImVector_ImGuiItemFlags = extern struct {
    Size: c_int = @import("std").mem.zeroes(c_int),
    Capacity: c_int = @import("std").mem.zeroes(c_int),
    Data: [*c]ImGuiItemFlags = @import("std").mem.zeroes([*c]ImGuiItemFlags),
};
pub const ImVector_ImGuiItemFlags = struct_ImVector_ImGuiItemFlags;
pub const struct_ImVector_ImGuiGroupData = extern struct {
    Size: c_int = @import("std").mem.zeroes(c_int),
    Capacity: c_int = @import("std").mem.zeroes(c_int),
    Data: [*c]ImGuiGroupData = @import("std").mem.zeroes([*c]ImGuiGroupData),
};
pub const ImVector_ImGuiGroupData = struct_ImVector_ImGuiGroupData;
pub const struct_ImVector_ImGuiPopupData = extern struct {
    Size: c_int = @import("std").mem.zeroes(c_int),
    Capacity: c_int = @import("std").mem.zeroes(c_int),
    Data: [*c]ImGuiPopupData = @import("std").mem.zeroes([*c]ImGuiPopupData),
};
pub const ImVector_ImGuiPopupData = struct_ImVector_ImGuiPopupData;
pub const struct_ImVector_ImGuiNavTreeNodeData = extern struct {
    Size: c_int = @import("std").mem.zeroes(c_int),
    Capacity: c_int = @import("std").mem.zeroes(c_int),
    Data: [*c]ImGuiNavTreeNodeData = @import("std").mem.zeroes([*c]ImGuiNavTreeNodeData),
};
pub const ImVector_ImGuiNavTreeNodeData = struct_ImVector_ImGuiNavTreeNodeData;
pub const struct_ImVector_ImGuiViewportPPtr = extern struct {
    Size: c_int = @import("std").mem.zeroes(c_int),
    Capacity: c_int = @import("std").mem.zeroes(c_int),
    Data: [*c][*c]ImGuiViewportP = @import("std").mem.zeroes([*c][*c]ImGuiViewportP),
};
pub const ImVector_ImGuiViewportPPtr = struct_ImVector_ImGuiViewportPPtr;
pub const struct_ImVector_unsigned_char = extern struct {
    Size: c_int = @import("std").mem.zeroes(c_int),
    Capacity: c_int = @import("std").mem.zeroes(c_int),
    Data: [*c]u8 = @import("std").mem.zeroes([*c]u8),
};
pub const ImVector_unsigned_char = struct_ImVector_unsigned_char;
pub const struct_ImVector_ImGuiListClipperData = extern struct {
    Size: c_int = @import("std").mem.zeroes(c_int),
    Capacity: c_int = @import("std").mem.zeroes(c_int),
    Data: [*c]ImGuiListClipperData = @import("std").mem.zeroes([*c]ImGuiListClipperData),
};
pub const ImVector_ImGuiListClipperData = struct_ImVector_ImGuiListClipperData;
pub const struct_ImVector_ImGuiTableTempData = extern struct {
    Size: c_int = @import("std").mem.zeroes(c_int),
    Capacity: c_int = @import("std").mem.zeroes(c_int),
    Data: [*c]ImGuiTableTempData = @import("std").mem.zeroes([*c]ImGuiTableTempData),
};
pub const ImVector_ImGuiTableTempData = struct_ImVector_ImGuiTableTempData;
pub const struct_ImVector_ImGuiTable = extern struct {
    Size: c_int = @import("std").mem.zeroes(c_int),
    Capacity: c_int = @import("std").mem.zeroes(c_int),
    Data: ?*ImGuiTable = @import("std").mem.zeroes(?*ImGuiTable),
};
pub const ImVector_ImGuiTable = struct_ImVector_ImGuiTable;
pub const struct_ImPool_ImGuiTable = extern struct {
    Buf: ImVector_ImGuiTable = @import("std").mem.zeroes(ImVector_ImGuiTable),
    Map: ImGuiStorage = @import("std").mem.zeroes(ImGuiStorage),
    FreeIdx: ImPoolIdx = @import("std").mem.zeroes(ImPoolIdx),
    AliveCount: ImPoolIdx = @import("std").mem.zeroes(ImPoolIdx),
};
pub const ImPool_ImGuiTable = struct_ImPool_ImGuiTable;
pub const struct_ImVector_ImGuiTabBar = extern struct {
    Size: c_int = @import("std").mem.zeroes(c_int),
    Capacity: c_int = @import("std").mem.zeroes(c_int),
    Data: [*c]ImGuiTabBar = @import("std").mem.zeroes([*c]ImGuiTabBar),
};
pub const ImVector_ImGuiTabBar = struct_ImVector_ImGuiTabBar;
pub const struct_ImPool_ImGuiTabBar = extern struct {
    Buf: ImVector_ImGuiTabBar = @import("std").mem.zeroes(ImVector_ImGuiTabBar),
    Map: ImGuiStorage = @import("std").mem.zeroes(ImGuiStorage),
    FreeIdx: ImPoolIdx = @import("std").mem.zeroes(ImPoolIdx),
    AliveCount: ImPoolIdx = @import("std").mem.zeroes(ImPoolIdx),
};
pub const ImPool_ImGuiTabBar = struct_ImPool_ImGuiTabBar;
pub const struct_ImVector_ImGuiPtrOrIndex = extern struct {
    Size: c_int = @import("std").mem.zeroes(c_int),
    Capacity: c_int = @import("std").mem.zeroes(c_int),
    Data: [*c]ImGuiPtrOrIndex = @import("std").mem.zeroes([*c]ImGuiPtrOrIndex),
};
pub const ImVector_ImGuiPtrOrIndex = struct_ImVector_ImGuiPtrOrIndex;
pub const struct_ImVector_ImGuiShrinkWidthItem = extern struct {
    Size: c_int = @import("std").mem.zeroes(c_int),
    Capacity: c_int = @import("std").mem.zeroes(c_int),
    Data: [*c]ImGuiShrinkWidthItem = @import("std").mem.zeroes([*c]ImGuiShrinkWidthItem),
};
pub const ImVector_ImGuiShrinkWidthItem = struct_ImVector_ImGuiShrinkWidthItem;
pub const struct_ImVector_ImGuiID = extern struct {
    Size: c_int = @import("std").mem.zeroes(c_int),
    Capacity: c_int = @import("std").mem.zeroes(c_int),
    Data: [*c]ImGuiID = @import("std").mem.zeroes([*c]ImGuiID),
};
pub const ImVector_ImGuiID = struct_ImVector_ImGuiID;
pub const struct_ImVector_ImGuiSettingsHandler = extern struct {
    Size: c_int = @import("std").mem.zeroes(c_int),
    Capacity: c_int = @import("std").mem.zeroes(c_int),
    Data: [*c]ImGuiSettingsHandler = @import("std").mem.zeroes([*c]ImGuiSettingsHandler),
};
pub const ImVector_ImGuiSettingsHandler = struct_ImVector_ImGuiSettingsHandler;
pub const struct_ImChunkStream_ImGuiWindowSettings = extern struct {
    Buf: ImVector_char = @import("std").mem.zeroes(ImVector_char),
};
pub const ImChunkStream_ImGuiWindowSettings = struct_ImChunkStream_ImGuiWindowSettings;
pub const struct_ImChunkStream_ImGuiTableSettings = extern struct {
    Buf: ImVector_char = @import("std").mem.zeroes(ImVector_char),
};
pub const ImChunkStream_ImGuiTableSettings = struct_ImChunkStream_ImGuiTableSettings;
pub const struct_ImVector_ImGuiContextHook = extern struct {
    Size: c_int = @import("std").mem.zeroes(c_int),
    Capacity: c_int = @import("std").mem.zeroes(c_int),
    Data: [*c]ImGuiContextHook = @import("std").mem.zeroes([*c]ImGuiContextHook),
};
pub const ImVector_ImGuiContextHook = struct_ImVector_ImGuiContextHook;
pub const struct_ImVector_ImGuiOldColumns = extern struct {
    Size: c_int = @import("std").mem.zeroes(c_int),
    Capacity: c_int = @import("std").mem.zeroes(c_int),
    Data: [*c]ImGuiOldColumns = @import("std").mem.zeroes([*c]ImGuiOldColumns),
};
pub const ImVector_ImGuiOldColumns = struct_ImVector_ImGuiOldColumns;
pub const ImGuiTabBarFlags_DockNode: c_int = 1048576;
pub const ImGuiTabBarFlags_IsFocused: c_int = 2097152;
pub const ImGuiTabBarFlags_SaveSettings: c_int = 4194304;
pub const ImGuiTabBarFlagsPrivate_ = c_uint;
pub const ImGuiTabItemFlags_SectionMask_: c_int = 192;
pub const ImGuiTabItemFlags_NoCloseButton: c_int = 1048576;
pub const ImGuiTabItemFlags_Button: c_int = 2097152;
pub const ImGuiTabItemFlags_Unsorted: c_int = 4194304;
pub const ImGuiTabItemFlagsPrivate_ = c_uint;
pub const struct_ImVector_ImGuiTableInstanceData = extern struct {
    Size: c_int = @import("std").mem.zeroes(c_int),
    Capacity: c_int = @import("std").mem.zeroes(c_int),
    Data: [*c]ImGuiTableInstanceData = @import("std").mem.zeroes([*c]ImGuiTableInstanceData),
};
pub const ImVector_ImGuiTableInstanceData = struct_ImVector_ImGuiTableInstanceData;
pub const struct_ImVector_ImGuiTableColumnSortSpecs = extern struct {
    Size: c_int = @import("std").mem.zeroes(c_int),
    Capacity: c_int = @import("std").mem.zeroes(c_int),
    Data: ?*ImGuiTableColumnSortSpecs = @import("std").mem.zeroes(?*ImGuiTableColumnSortSpecs),
};
pub const ImVector_ImGuiTableColumnSortSpecs = struct_ImVector_ImGuiTableColumnSortSpecs; // /home/antaraz/dev/slingshot/cimgui/cimgui.h:3282:10: warning: struct demoted to opaque type - has bitfield
pub const struct_ImGuiTableColumnSettings = opaque {};
pub const ImGuiTableColumnSettings = struct_ImGuiTableColumnSettings;
pub extern fn ImVec2_ImVec2_Nil() [*c]ImVec2;
pub extern fn ImVec2_destroy(self: [*c]ImVec2) void;
pub extern fn ImVec2_ImVec2_Float(_x: f32, _y: f32) [*c]ImVec2;
pub extern fn ImVec4_ImVec4_Nil() [*c]ImVec4;
pub extern fn ImVec4_destroy(self: [*c]ImVec4) void;
pub extern fn ImVec4_ImVec4_Float(_x: f32, _y: f32, _z: f32, _w: f32) [*c]ImVec4;
pub extern fn igCreateContext(shared_font_atlas: [*c]ImFontAtlas) ?*ImGuiContext;
pub extern fn igDestroyContext(ctx: ?*ImGuiContext) void;
pub extern fn igGetCurrentContext() ?*ImGuiContext;
pub extern fn igSetCurrentContext(ctx: ?*ImGuiContext) void;
pub extern fn igGetIO() [*c]ImGuiIO;
pub extern fn igGetStyle() [*c]ImGuiStyle;
pub extern fn igNewFrame() void;
pub extern fn igEndFrame() void;
pub extern fn igRender() void;
pub extern fn igGetDrawData() [*c]ImDrawData;
pub extern fn igShowDemoWindow(p_open: [*c]bool) void;
pub extern fn igShowMetricsWindow(p_open: [*c]bool) void;
pub extern fn igShowDebugLogWindow(p_open: [*c]bool) void;
pub extern fn igShowIDStackToolWindow(p_open: [*c]bool) void;
pub extern fn igShowAboutWindow(p_open: [*c]bool) void;
pub extern fn igShowStyleEditor(ref: [*c]ImGuiStyle) void;
pub extern fn igShowStyleSelector(label: [*c]const u8) bool;
pub extern fn igShowFontSelector(label: [*c]const u8) void;
pub extern fn igShowUserGuide() void;
pub extern fn igGetVersion() [*c]const u8;
pub extern fn igStyleColorsDark(dst: [*c]ImGuiStyle) void;
pub extern fn igStyleColorsLight(dst: [*c]ImGuiStyle) void;
pub extern fn igStyleColorsClassic(dst: [*c]ImGuiStyle) void;
pub extern fn igBegin(name: [*c]const u8, p_open: [*c]bool, flags: ImGuiWindowFlags) bool;
pub extern fn igEnd() void;
pub extern fn igBeginChild_Str(str_id: [*c]const u8, size: ImVec2, child_flags: ImGuiChildFlags, window_flags: ImGuiWindowFlags) bool;
pub extern fn igBeginChild_ID(id: ImGuiID, size: ImVec2, child_flags: ImGuiChildFlags, window_flags: ImGuiWindowFlags) bool;
pub extern fn igEndChild() void;
pub extern fn igIsWindowAppearing() bool;
pub extern fn igIsWindowCollapsed() bool;
pub extern fn igIsWindowFocused(flags: ImGuiFocusedFlags) bool;
pub extern fn igIsWindowHovered(flags: ImGuiHoveredFlags) bool;
pub extern fn igGetWindowDrawList() [*c]ImDrawList;
pub extern fn igGetWindowDpiScale() f32;
pub extern fn igGetWindowPos(pOut: [*c]ImVec2) void;
pub extern fn igGetWindowSize(pOut: [*c]ImVec2) void;
pub extern fn igGetWindowWidth() f32;
pub extern fn igGetWindowHeight() f32;
pub extern fn igGetWindowViewport() [*c]ImGuiViewport;
pub extern fn igSetNextWindowPos(pos: ImVec2, cond: ImGuiCond, pivot: ImVec2) void;
pub extern fn igSetNextWindowSize(size: ImVec2, cond: ImGuiCond) void;
pub extern fn igSetNextWindowSizeConstraints(size_min: ImVec2, size_max: ImVec2, custom_callback: ImGuiSizeCallback, custom_callback_data: ?*anyopaque) void;
pub extern fn igSetNextWindowContentSize(size: ImVec2) void;
pub extern fn igSetNextWindowCollapsed(collapsed: bool, cond: ImGuiCond) void;
pub extern fn igSetNextWindowFocus() void;
pub extern fn igSetNextWindowScroll(scroll: ImVec2) void;
pub extern fn igSetNextWindowBgAlpha(alpha: f32) void;
pub extern fn igSetNextWindowViewport(viewport_id: ImGuiID) void;
pub extern fn igSetWindowPos_Vec2(pos: ImVec2, cond: ImGuiCond) void;
pub extern fn igSetWindowSize_Vec2(size: ImVec2, cond: ImGuiCond) void;
pub extern fn igSetWindowCollapsed_Bool(collapsed: bool, cond: ImGuiCond) void;
pub extern fn igSetWindowFocus_Nil() void;
pub extern fn igSetWindowFontScale(scale: f32) void;
pub extern fn igSetWindowPos_Str(name: [*c]const u8, pos: ImVec2, cond: ImGuiCond) void;
pub extern fn igSetWindowSize_Str(name: [*c]const u8, size: ImVec2, cond: ImGuiCond) void;
pub extern fn igSetWindowCollapsed_Str(name: [*c]const u8, collapsed: bool, cond: ImGuiCond) void;
pub extern fn igSetWindowFocus_Str(name: [*c]const u8) void;
pub extern fn igGetContentRegionAvail(pOut: [*c]ImVec2) void;
pub extern fn igGetContentRegionMax(pOut: [*c]ImVec2) void;
pub extern fn igGetWindowContentRegionMin(pOut: [*c]ImVec2) void;
pub extern fn igGetWindowContentRegionMax(pOut: [*c]ImVec2) void;
pub extern fn igGetScrollX() f32;
pub extern fn igGetScrollY() f32;
pub extern fn igSetScrollX_Float(scroll_x: f32) void;
pub extern fn igSetScrollY_Float(scroll_y: f32) void;
pub extern fn igGetScrollMaxX() f32;
pub extern fn igGetScrollMaxY() f32;
pub extern fn igSetScrollHereX(center_x_ratio: f32) void;
pub extern fn igSetScrollHereY(center_y_ratio: f32) void;
pub extern fn igSetScrollFromPosX_Float(local_x: f32, center_x_ratio: f32) void;
pub extern fn igSetScrollFromPosY_Float(local_y: f32, center_y_ratio: f32) void;
pub extern fn igPushFont(font: [*c]ImFont) void;
pub extern fn igPopFont() void;
pub extern fn igPushStyleColor_U32(idx: ImGuiCol, col: ImU32) void;
pub extern fn igPushStyleColor_Vec4(idx: ImGuiCol, col: ImVec4) void;
pub extern fn igPopStyleColor(count: c_int) void;
pub extern fn igPushStyleVar_Float(idx: ImGuiStyleVar, val: f32) void;
pub extern fn igPushStyleVar_Vec2(idx: ImGuiStyleVar, val: ImVec2) void;
pub extern fn igPopStyleVar(count: c_int) void;
pub extern fn igPushTabStop(tab_stop: bool) void;
pub extern fn igPopTabStop() void;
pub extern fn igPushButtonRepeat(repeat: bool) void;
pub extern fn igPopButtonRepeat() void;
pub extern fn igPushItemWidth(item_width: f32) void;
pub extern fn igPopItemWidth() void;
pub extern fn igSetNextItemWidth(item_width: f32) void;
pub extern fn igCalcItemWidth() f32;
pub extern fn igPushTextWrapPos(wrap_local_pos_x: f32) void;
pub extern fn igPopTextWrapPos() void;
pub extern fn igGetFont() [*c]ImFont;
pub extern fn igGetFontSize() f32;
pub extern fn igGetFontTexUvWhitePixel(pOut: [*c]ImVec2) void;
pub extern fn igGetColorU32_Col(idx: ImGuiCol, alpha_mul: f32) ImU32;
pub extern fn igGetColorU32_Vec4(col: ImVec4) ImU32;
pub extern fn igGetColorU32_U32(col: ImU32, alpha_mul: f32) ImU32;
pub extern fn igGetStyleColorVec4(idx: ImGuiCol) [*c]const ImVec4;
pub extern fn igGetCursorScreenPos(pOut: [*c]ImVec2) void;
pub extern fn igSetCursorScreenPos(pos: ImVec2) void;
pub extern fn igGetCursorPos(pOut: [*c]ImVec2) void;
pub extern fn igGetCursorPosX() f32;
pub extern fn igGetCursorPosY() f32;
pub extern fn igSetCursorPos(local_pos: ImVec2) void;
pub extern fn igSetCursorPosX(local_x: f32) void;
pub extern fn igSetCursorPosY(local_y: f32) void;
pub extern fn igGetCursorStartPos(pOut: [*c]ImVec2) void;
pub extern fn igSeparator() void;
pub extern fn igSameLine(offset_from_start_x: f32, spacing: f32) void;
pub extern fn igNewLine() void;
pub extern fn igSpacing() void;
pub extern fn igDummy(size: ImVec2) void;
pub extern fn igIndent(indent_w: f32) void;
pub extern fn igUnindent(indent_w: f32) void;
pub extern fn igBeginGroup() void;
pub extern fn igEndGroup() void;
pub extern fn igAlignTextToFramePadding() void;
pub extern fn igGetTextLineHeight() f32;
pub extern fn igGetTextLineHeightWithSpacing() f32;
pub extern fn igGetFrameHeight() f32;
pub extern fn igGetFrameHeightWithSpacing() f32;
pub extern fn igPushID_Str(str_id: [*c]const u8) void;
pub extern fn igPushID_StrStr(str_id_begin: [*c]const u8, str_id_end: [*c]const u8) void;
pub extern fn igPushID_Ptr(ptr_id: ?*const anyopaque) void;
pub extern fn igPushID_Int(int_id: c_int) void;
pub extern fn igPopID() void;
pub extern fn igGetID_Str(str_id: [*c]const u8) ImGuiID;
pub extern fn igGetID_StrStr(str_id_begin: [*c]const u8, str_id_end: [*c]const u8) ImGuiID;
pub extern fn igGetID_Ptr(ptr_id: ?*const anyopaque) ImGuiID;
pub extern fn igTextUnformatted(text: [*c]const u8, text_end: [*c]const u8) void;
pub extern fn igText(fmt: [*c]const u8, ...) void;
pub extern fn igTextV(fmt: [*c]const u8, args: va_list) void;
pub extern fn igTextColored(col: ImVec4, fmt: [*c]const u8, ...) void;
pub extern fn igTextColoredV(col: ImVec4, fmt: [*c]const u8, args: va_list) void;
pub extern fn igTextDisabled(fmt: [*c]const u8, ...) void;
pub extern fn igTextDisabledV(fmt: [*c]const u8, args: va_list) void;
pub extern fn igTextWrapped(fmt: [*c]const u8, ...) void;
pub extern fn igTextWrappedV(fmt: [*c]const u8, args: va_list) void;
pub extern fn igLabelText(label: [*c]const u8, fmt: [*c]const u8, ...) void;
pub extern fn igLabelTextV(label: [*c]const u8, fmt: [*c]const u8, args: va_list) void;
pub extern fn igBulletText(fmt: [*c]const u8, ...) void;
pub extern fn igBulletTextV(fmt: [*c]const u8, args: va_list) void;
pub extern fn igSeparatorText(label: [*c]const u8) void;
pub extern fn igButton(label: [*c]const u8, size: ImVec2) bool;
pub extern fn igSmallButton(label: [*c]const u8) bool;
pub extern fn igInvisibleButton(str_id: [*c]const u8, size: ImVec2, flags: ImGuiButtonFlags) bool;
pub extern fn igArrowButton(str_id: [*c]const u8, dir: ImGuiDir) bool;
pub extern fn igCheckbox(label: [*c]const u8, v: [*c]bool) bool;
pub extern fn igCheckboxFlags_IntPtr(label: [*c]const u8, flags: [*c]c_int, flags_value: c_int) bool;
pub extern fn igCheckboxFlags_UintPtr(label: [*c]const u8, flags: [*c]c_uint, flags_value: c_uint) bool;
pub extern fn igRadioButton_Bool(label: [*c]const u8, active: bool) bool;
pub extern fn igRadioButton_IntPtr(label: [*c]const u8, v: [*c]c_int, v_button: c_int) bool;
pub extern fn igProgressBar(fraction: f32, size_arg: ImVec2, overlay: [*c]const u8) void;
pub extern fn igBullet() void;
pub extern fn igImage(user_texture_id: ImTextureID, image_size: ImVec2, uv0: ImVec2, uv1: ImVec2, tint_col: ImVec4, border_col: ImVec4) void;
pub extern fn igImageButton(str_id: [*c]const u8, user_texture_id: ImTextureID, image_size: ImVec2, uv0: ImVec2, uv1: ImVec2, bg_col: ImVec4, tint_col: ImVec4) bool;
pub extern fn igBeginCombo(label: [*c]const u8, preview_value: [*c]const u8, flags: ImGuiComboFlags) bool;
pub extern fn igEndCombo() void;
pub extern fn igCombo_Str_arr(label: [*c]const u8, current_item: [*c]c_int, items: [*c]const [*c]const u8, items_count: c_int, popup_max_height_in_items: c_int) bool;
pub extern fn igCombo_Str(label: [*c]const u8, current_item: [*c]c_int, items_separated_by_zeros: [*c]const u8, popup_max_height_in_items: c_int) bool;
pub extern fn igCombo_FnStrPtr(label: [*c]const u8, current_item: [*c]c_int, getter: ?*const fn (?*anyopaque, c_int) callconv(.C) [*c]const u8, user_data: ?*anyopaque, items_count: c_int, popup_max_height_in_items: c_int) bool;
pub extern fn igDragFloat(label: [*c]const u8, v: [*c]f32, v_speed: f32, v_min: f32, v_max: f32, format: [*c]const u8, flags: ImGuiSliderFlags) bool;
pub extern fn igDragFloat2(label: [*c]const u8, v: [*c]f32, v_speed: f32, v_min: f32, v_max: f32, format: [*c]const u8, flags: ImGuiSliderFlags) bool;
pub extern fn igDragFloat3(label: [*c]const u8, v: [*c]f32, v_speed: f32, v_min: f32, v_max: f32, format: [*c]const u8, flags: ImGuiSliderFlags) bool;
pub extern fn igDragFloat4(label: [*c]const u8, v: [*c]f32, v_speed: f32, v_min: f32, v_max: f32, format: [*c]const u8, flags: ImGuiSliderFlags) bool;
pub extern fn igDragFloatRange2(label: [*c]const u8, v_current_min: [*c]f32, v_current_max: [*c]f32, v_speed: f32, v_min: f32, v_max: f32, format: [*c]const u8, format_max: [*c]const u8, flags: ImGuiSliderFlags) bool;
pub extern fn igDragInt(label: [*c]const u8, v: [*c]c_int, v_speed: f32, v_min: c_int, v_max: c_int, format: [*c]const u8, flags: ImGuiSliderFlags) bool;
pub extern fn igDragInt2(label: [*c]const u8, v: [*c]c_int, v_speed: f32, v_min: c_int, v_max: c_int, format: [*c]const u8, flags: ImGuiSliderFlags) bool;
pub extern fn igDragInt3(label: [*c]const u8, v: [*c]c_int, v_speed: f32, v_min: c_int, v_max: c_int, format: [*c]const u8, flags: ImGuiSliderFlags) bool;
pub extern fn igDragInt4(label: [*c]const u8, v: [*c]c_int, v_speed: f32, v_min: c_int, v_max: c_int, format: [*c]const u8, flags: ImGuiSliderFlags) bool;
pub extern fn igDragIntRange2(label: [*c]const u8, v_current_min: [*c]c_int, v_current_max: [*c]c_int, v_speed: f32, v_min: c_int, v_max: c_int, format: [*c]const u8, format_max: [*c]const u8, flags: ImGuiSliderFlags) bool;
pub extern fn igDragScalar(label: [*c]const u8, data_type: ImGuiDataType, p_data: ?*anyopaque, v_speed: f32, p_min: ?*const anyopaque, p_max: ?*const anyopaque, format: [*c]const u8, flags: ImGuiSliderFlags) bool;
pub extern fn igDragScalarN(label: [*c]const u8, data_type: ImGuiDataType, p_data: ?*anyopaque, components: c_int, v_speed: f32, p_min: ?*const anyopaque, p_max: ?*const anyopaque, format: [*c]const u8, flags: ImGuiSliderFlags) bool;
pub extern fn igSliderFloat(label: [*c]const u8, v: [*c]f32, v_min: f32, v_max: f32, format: [*c]const u8, flags: ImGuiSliderFlags) bool;
pub extern fn igSliderFloat2(label: [*c]const u8, v: [*c]f32, v_min: f32, v_max: f32, format: [*c]const u8, flags: ImGuiSliderFlags) bool;
pub extern fn igSliderFloat3(label: [*c]const u8, v: [*c]f32, v_min: f32, v_max: f32, format: [*c]const u8, flags: ImGuiSliderFlags) bool;
pub extern fn igSliderFloat4(label: [*c]const u8, v: [*c]f32, v_min: f32, v_max: f32, format: [*c]const u8, flags: ImGuiSliderFlags) bool;
pub extern fn igSliderAngle(label: [*c]const u8, v_rad: [*c]f32, v_degrees_min: f32, v_degrees_max: f32, format: [*c]const u8, flags: ImGuiSliderFlags) bool;
pub extern fn igSliderInt(label: [*c]const u8, v: [*c]c_int, v_min: c_int, v_max: c_int, format: [*c]const u8, flags: ImGuiSliderFlags) bool;
pub extern fn igSliderInt2(label: [*c]const u8, v: [*c]c_int, v_min: c_int, v_max: c_int, format: [*c]const u8, flags: ImGuiSliderFlags) bool;
pub extern fn igSliderInt3(label: [*c]const u8, v: [*c]c_int, v_min: c_int, v_max: c_int, format: [*c]const u8, flags: ImGuiSliderFlags) bool;
pub extern fn igSliderInt4(label: [*c]const u8, v: [*c]c_int, v_min: c_int, v_max: c_int, format: [*c]const u8, flags: ImGuiSliderFlags) bool;
pub extern fn igSliderScalar(label: [*c]const u8, data_type: ImGuiDataType, p_data: ?*anyopaque, p_min: ?*const anyopaque, p_max: ?*const anyopaque, format: [*c]const u8, flags: ImGuiSliderFlags) bool;
pub extern fn igSliderScalarN(label: [*c]const u8, data_type: ImGuiDataType, p_data: ?*anyopaque, components: c_int, p_min: ?*const anyopaque, p_max: ?*const anyopaque, format: [*c]const u8, flags: ImGuiSliderFlags) bool;
pub extern fn igVSliderFloat(label: [*c]const u8, size: ImVec2, v: [*c]f32, v_min: f32, v_max: f32, format: [*c]const u8, flags: ImGuiSliderFlags) bool;
pub extern fn igVSliderInt(label: [*c]const u8, size: ImVec2, v: [*c]c_int, v_min: c_int, v_max: c_int, format: [*c]const u8, flags: ImGuiSliderFlags) bool;
pub extern fn igVSliderScalar(label: [*c]const u8, size: ImVec2, data_type: ImGuiDataType, p_data: ?*anyopaque, p_min: ?*const anyopaque, p_max: ?*const anyopaque, format: [*c]const u8, flags: ImGuiSliderFlags) bool;
pub extern fn igInputText(label: [*c]const u8, buf: [*c]u8, buf_size: usize, flags: ImGuiInputTextFlags, callback: ImGuiInputTextCallback, user_data: ?*anyopaque) bool;
pub extern fn igInputTextMultiline(label: [*c]const u8, buf: [*c]u8, buf_size: usize, size: ImVec2, flags: ImGuiInputTextFlags, callback: ImGuiInputTextCallback, user_data: ?*anyopaque) bool;
pub extern fn igInputTextWithHint(label: [*c]const u8, hint: [*c]const u8, buf: [*c]u8, buf_size: usize, flags: ImGuiInputTextFlags, callback: ImGuiInputTextCallback, user_data: ?*anyopaque) bool;
pub extern fn igInputFloat(label: [*c]const u8, v: [*c]f32, step: f32, step_fast: f32, format: [*c]const u8, flags: ImGuiInputTextFlags) bool;
pub extern fn igInputFloat2(label: [*c]const u8, v: [*c]f32, format: [*c]const u8, flags: ImGuiInputTextFlags) bool;
pub extern fn igInputFloat3(label: [*c]const u8, v: [*c]f32, format: [*c]const u8, flags: ImGuiInputTextFlags) bool;
pub extern fn igInputFloat4(label: [*c]const u8, v: [*c]f32, format: [*c]const u8, flags: ImGuiInputTextFlags) bool;
pub extern fn igInputInt(label: [*c]const u8, v: [*c]c_int, step: c_int, step_fast: c_int, flags: ImGuiInputTextFlags) bool;
pub extern fn igInputInt2(label: [*c]const u8, v: [*c]c_int, flags: ImGuiInputTextFlags) bool;
pub extern fn igInputInt3(label: [*c]const u8, v: [*c]c_int, flags: ImGuiInputTextFlags) bool;
pub extern fn igInputInt4(label: [*c]const u8, v: [*c]c_int, flags: ImGuiInputTextFlags) bool;
pub extern fn igInputDouble(label: [*c]const u8, v: [*c]f64, step: f64, step_fast: f64, format: [*c]const u8, flags: ImGuiInputTextFlags) bool;
pub extern fn igInputScalar(label: [*c]const u8, data_type: ImGuiDataType, p_data: ?*anyopaque, p_step: ?*const anyopaque, p_step_fast: ?*const anyopaque, format: [*c]const u8, flags: ImGuiInputTextFlags) bool;
pub extern fn igInputScalarN(label: [*c]const u8, data_type: ImGuiDataType, p_data: ?*anyopaque, components: c_int, p_step: ?*const anyopaque, p_step_fast: ?*const anyopaque, format: [*c]const u8, flags: ImGuiInputTextFlags) bool;
pub extern fn igColorEdit3(label: [*c]const u8, col: [*c]f32, flags: ImGuiColorEditFlags) bool;
pub extern fn igColorEdit4(label: [*c]const u8, col: [*c]f32, flags: ImGuiColorEditFlags) bool;
pub extern fn igColorPicker3(label: [*c]const u8, col: [*c]f32, flags: ImGuiColorEditFlags) bool;
pub extern fn igColorPicker4(label: [*c]const u8, col: [*c]f32, flags: ImGuiColorEditFlags, ref_col: [*c]const f32) bool;
pub extern fn igColorButton(desc_id: [*c]const u8, col: ImVec4, flags: ImGuiColorEditFlags, size: ImVec2) bool;
pub extern fn igSetColorEditOptions(flags: ImGuiColorEditFlags) void;
pub extern fn igTreeNode_Str(label: [*c]const u8) bool;
pub extern fn igTreeNode_StrStr(str_id: [*c]const u8, fmt: [*c]const u8, ...) bool;
pub extern fn igTreeNode_Ptr(ptr_id: ?*const anyopaque, fmt: [*c]const u8, ...) bool;
pub extern fn igTreeNodeV_Str(str_id: [*c]const u8, fmt: [*c]const u8, args: va_list) bool;
pub extern fn igTreeNodeV_Ptr(ptr_id: ?*const anyopaque, fmt: [*c]const u8, args: va_list) bool;
pub extern fn igTreeNodeEx_Str(label: [*c]const u8, flags: ImGuiTreeNodeFlags) bool;
pub extern fn igTreeNodeEx_StrStr(str_id: [*c]const u8, flags: ImGuiTreeNodeFlags, fmt: [*c]const u8, ...) bool;
pub extern fn igTreeNodeEx_Ptr(ptr_id: ?*const anyopaque, flags: ImGuiTreeNodeFlags, fmt: [*c]const u8, ...) bool;
pub extern fn igTreeNodeExV_Str(str_id: [*c]const u8, flags: ImGuiTreeNodeFlags, fmt: [*c]const u8, args: va_list) bool;
pub extern fn igTreeNodeExV_Ptr(ptr_id: ?*const anyopaque, flags: ImGuiTreeNodeFlags, fmt: [*c]const u8, args: va_list) bool;
pub extern fn igTreePush_Str(str_id: [*c]const u8) void;
pub extern fn igTreePush_Ptr(ptr_id: ?*const anyopaque) void;
pub extern fn igTreePop() void;
pub extern fn igGetTreeNodeToLabelSpacing() f32;
pub extern fn igCollapsingHeader_TreeNodeFlags(label: [*c]const u8, flags: ImGuiTreeNodeFlags) bool;
pub extern fn igCollapsingHeader_BoolPtr(label: [*c]const u8, p_visible: [*c]bool, flags: ImGuiTreeNodeFlags) bool;
pub extern fn igSetNextItemOpen(is_open: bool, cond: ImGuiCond) void;
pub extern fn igSelectable_Bool(label: [*c]const u8, selected: bool, flags: ImGuiSelectableFlags, size: ImVec2) bool;
pub extern fn igSelectable_BoolPtr(label: [*c]const u8, p_selected: [*c]bool, flags: ImGuiSelectableFlags, size: ImVec2) bool;
pub extern fn igBeginListBox(label: [*c]const u8, size: ImVec2) bool;
pub extern fn igEndListBox() void;
pub extern fn igListBox_Str_arr(label: [*c]const u8, current_item: [*c]c_int, items: [*c]const [*c]const u8, items_count: c_int, height_in_items: c_int) bool;
pub extern fn igListBox_FnStrPtr(label: [*c]const u8, current_item: [*c]c_int, getter: ?*const fn (?*anyopaque, c_int) callconv(.C) [*c]const u8, user_data: ?*anyopaque, items_count: c_int, height_in_items: c_int) bool;
pub extern fn igPlotLines_FloatPtr(label: [*c]const u8, values: [*c]const f32, values_count: c_int, values_offset: c_int, overlay_text: [*c]const u8, scale_min: f32, scale_max: f32, graph_size: ImVec2, stride: c_int) void;
pub extern fn igPlotLines_FnFloatPtr(label: [*c]const u8, values_getter: ?*const fn (?*anyopaque, c_int) callconv(.C) f32, data: ?*anyopaque, values_count: c_int, values_offset: c_int, overlay_text: [*c]const u8, scale_min: f32, scale_max: f32, graph_size: ImVec2) void;
pub extern fn igPlotHistogram_FloatPtr(label: [*c]const u8, values: [*c]const f32, values_count: c_int, values_offset: c_int, overlay_text: [*c]const u8, scale_min: f32, scale_max: f32, graph_size: ImVec2, stride: c_int) void;
pub extern fn igPlotHistogram_FnFloatPtr(label: [*c]const u8, values_getter: ?*const fn (?*anyopaque, c_int) callconv(.C) f32, data: ?*anyopaque, values_count: c_int, values_offset: c_int, overlay_text: [*c]const u8, scale_min: f32, scale_max: f32, graph_size: ImVec2) void;
pub extern fn igValue_Bool(prefix: [*c]const u8, b: bool) void;
pub extern fn igValue_Int(prefix: [*c]const u8, v: c_int) void;
pub extern fn igValue_Uint(prefix: [*c]const u8, v: c_uint) void;
pub extern fn igValue_Float(prefix: [*c]const u8, v: f32, float_format: [*c]const u8) void;
pub extern fn igBeginMenuBar() bool;
pub extern fn igEndMenuBar() void;
pub extern fn igBeginMainMenuBar() bool;
pub extern fn igEndMainMenuBar() void;
pub extern fn igBeginMenu(label: [*c]const u8, enabled: bool) bool;
pub extern fn igEndMenu() void;
pub extern fn igMenuItem_Bool(label: [*c]const u8, shortcut: [*c]const u8, selected: bool, enabled: bool) bool;
pub extern fn igMenuItem_BoolPtr(label: [*c]const u8, shortcut: [*c]const u8, p_selected: [*c]bool, enabled: bool) bool;
pub extern fn igBeginTooltip() bool;
pub extern fn igEndTooltip() void;
pub extern fn igSetTooltip(fmt: [*c]const u8, ...) void;
pub extern fn igSetTooltipV(fmt: [*c]const u8, args: va_list) void;
pub extern fn igBeginItemTooltip() bool;
pub extern fn igSetItemTooltip(fmt: [*c]const u8, ...) void;
pub extern fn igSetItemTooltipV(fmt: [*c]const u8, args: va_list) void;
pub extern fn igBeginPopup(str_id: [*c]const u8, flags: ImGuiWindowFlags) bool;
pub extern fn igBeginPopupModal(name: [*c]const u8, p_open: [*c]bool, flags: ImGuiWindowFlags) bool;
pub extern fn igEndPopup() void;
pub extern fn igOpenPopup_Str(str_id: [*c]const u8, popup_flags: ImGuiPopupFlags) void;
pub extern fn igOpenPopup_ID(id: ImGuiID, popup_flags: ImGuiPopupFlags) void;
pub extern fn igOpenPopupOnItemClick(str_id: [*c]const u8, popup_flags: ImGuiPopupFlags) void;
pub extern fn igCloseCurrentPopup() void;
pub extern fn igBeginPopupContextItem(str_id: [*c]const u8, popup_flags: ImGuiPopupFlags) bool;
pub extern fn igBeginPopupContextWindow(str_id: [*c]const u8, popup_flags: ImGuiPopupFlags) bool;
pub extern fn igBeginPopupContextVoid(str_id: [*c]const u8, popup_flags: ImGuiPopupFlags) bool;
pub extern fn igIsPopupOpen_Str(str_id: [*c]const u8, flags: ImGuiPopupFlags) bool;
pub extern fn igBeginTable(str_id: [*c]const u8, column: c_int, flags: ImGuiTableFlags, outer_size: ImVec2, inner_width: f32) bool;
pub extern fn igEndTable() void;
pub extern fn igTableNextRow(row_flags: ImGuiTableRowFlags, min_row_height: f32) void;
pub extern fn igTableNextColumn() bool;
pub extern fn igTableSetColumnIndex(column_n: c_int) bool;
pub extern fn igTableSetupColumn(label: [*c]const u8, flags: ImGuiTableColumnFlags, init_width_or_weight: f32, user_id: ImGuiID) void;
pub extern fn igTableSetupScrollFreeze(cols: c_int, rows: c_int) void;
pub extern fn igTableHeader(label: [*c]const u8) void;
pub extern fn igTableHeadersRow() void;
pub extern fn igTableAngledHeadersRow() void;
pub extern fn igTableGetSortSpecs() [*c]ImGuiTableSortSpecs;
pub extern fn igTableGetColumnCount() c_int;
pub extern fn igTableGetColumnIndex() c_int;
pub extern fn igTableGetRowIndex() c_int;
pub extern fn igTableGetColumnName_Int(column_n: c_int) [*c]const u8;
pub extern fn igTableGetColumnFlags(column_n: c_int) ImGuiTableColumnFlags;
pub extern fn igTableSetColumnEnabled(column_n: c_int, v: bool) void;
pub extern fn igTableSetBgColor(target: ImGuiTableBgTarget, color: ImU32, column_n: c_int) void;
pub extern fn igColumns(count: c_int, id: [*c]const u8, border: bool) void;
pub extern fn igNextColumn() void;
pub extern fn igGetColumnIndex() c_int;
pub extern fn igGetColumnWidth(column_index: c_int) f32;
pub extern fn igSetColumnWidth(column_index: c_int, width: f32) void;
pub extern fn igGetColumnOffset(column_index: c_int) f32;
pub extern fn igSetColumnOffset(column_index: c_int, offset_x: f32) void;
pub extern fn igGetColumnsCount() c_int;
pub extern fn igBeginTabBar(str_id: [*c]const u8, flags: ImGuiTabBarFlags) bool;
pub extern fn igEndTabBar() void;
pub extern fn igBeginTabItem(label: [*c]const u8, p_open: [*c]bool, flags: ImGuiTabItemFlags) bool;
pub extern fn igEndTabItem() void;
pub extern fn igTabItemButton(label: [*c]const u8, flags: ImGuiTabItemFlags) bool;
pub extern fn igSetTabItemClosed(tab_or_docked_window_label: [*c]const u8) void;
pub extern fn igDockSpace(id: ImGuiID, size: ImVec2, flags: ImGuiDockNodeFlags, window_class: [*c]const ImGuiWindowClass) ImGuiID;
pub extern fn igDockSpaceOverViewport(viewport: [*c]const ImGuiViewport, flags: ImGuiDockNodeFlags, window_class: [*c]const ImGuiWindowClass) ImGuiID;
pub extern fn igSetNextWindowDockID(dock_id: ImGuiID, cond: ImGuiCond) void;
pub extern fn igSetNextWindowClass(window_class: [*c]const ImGuiWindowClass) void;
pub extern fn igGetWindowDockID() ImGuiID;
pub extern fn igIsWindowDocked() bool;
pub extern fn igLogToTTY(auto_open_depth: c_int) void;
pub extern fn igLogToFile(auto_open_depth: c_int, filename: [*c]const u8) void;
pub extern fn igLogToClipboard(auto_open_depth: c_int) void;
pub extern fn igLogFinish() void;
pub extern fn igLogButtons() void;
pub extern fn igLogTextV(fmt: [*c]const u8, args: va_list) void;
pub extern fn igBeginDragDropSource(flags: ImGuiDragDropFlags) bool;
pub extern fn igSetDragDropPayload(@"type": [*c]const u8, data: ?*const anyopaque, sz: usize, cond: ImGuiCond) bool;
pub extern fn igEndDragDropSource() void;
pub extern fn igBeginDragDropTarget() bool;
pub extern fn igAcceptDragDropPayload(@"type": [*c]const u8, flags: ImGuiDragDropFlags) [*c]const ImGuiPayload;
pub extern fn igEndDragDropTarget() void;
pub extern fn igGetDragDropPayload() [*c]const ImGuiPayload;
pub extern fn igBeginDisabled(disabled: bool) void;
pub extern fn igEndDisabled() void;
pub extern fn igPushClipRect(clip_rect_min: ImVec2, clip_rect_max: ImVec2, intersect_with_current_clip_rect: bool) void;
pub extern fn igPopClipRect() void;
pub extern fn igSetItemDefaultFocus() void;
pub extern fn igSetKeyboardFocusHere(offset: c_int) void;
pub extern fn igSetNextItemAllowOverlap() void;
pub extern fn igIsItemHovered(flags: ImGuiHoveredFlags) bool;
pub extern fn igIsItemActive() bool;
pub extern fn igIsItemFocused() bool;
pub extern fn igIsItemClicked(mouse_button: ImGuiMouseButton) bool;
pub extern fn igIsItemVisible() bool;
pub extern fn igIsItemEdited() bool;
pub extern fn igIsItemActivated() bool;
pub extern fn igIsItemDeactivated() bool;
pub extern fn igIsItemDeactivatedAfterEdit() bool;
pub extern fn igIsItemToggledOpen() bool;
pub extern fn igIsAnyItemHovered() bool;
pub extern fn igIsAnyItemActive() bool;
pub extern fn igIsAnyItemFocused() bool;
pub extern fn igGetItemID() ImGuiID;
pub extern fn igGetItemRectMin(pOut: [*c]ImVec2) void;
pub extern fn igGetItemRectMax(pOut: [*c]ImVec2) void;
pub extern fn igGetItemRectSize(pOut: [*c]ImVec2) void;
pub extern fn igGetMainViewport() [*c]ImGuiViewport;
pub extern fn igGetBackgroundDrawList_Nil() [*c]ImDrawList;
pub extern fn igGetForegroundDrawList_Nil() [*c]ImDrawList;
pub extern fn igGetBackgroundDrawList_ViewportPtr(viewport: [*c]ImGuiViewport) [*c]ImDrawList;
pub extern fn igGetForegroundDrawList_ViewportPtr(viewport: [*c]ImGuiViewport) [*c]ImDrawList;
pub extern fn igIsRectVisible_Nil(size: ImVec2) bool;
pub extern fn igIsRectVisible_Vec2(rect_min: ImVec2, rect_max: ImVec2) bool;
pub extern fn igGetTime() f64;
pub extern fn igGetFrameCount() c_int;
pub extern fn igGetDrawListSharedData() [*c]ImDrawListSharedData;
pub extern fn igGetStyleColorName(idx: ImGuiCol) [*c]const u8;
pub extern fn igSetStateStorage(storage: [*c]ImGuiStorage) void;
pub extern fn igGetStateStorage() [*c]ImGuiStorage;
pub extern fn igCalcTextSize(pOut: [*c]ImVec2, text: [*c]const u8, text_end: [*c]const u8, hide_text_after_double_hash: bool, wrap_width: f32) void;
pub extern fn igColorConvertU32ToFloat4(pOut: [*c]ImVec4, in: ImU32) void;
pub extern fn igColorConvertFloat4ToU32(in: ImVec4) ImU32;
pub extern fn igColorConvertRGBtoHSV(r: f32, g: f32, b: f32, out_h: [*c]f32, out_s: [*c]f32, out_v: [*c]f32) void;
pub extern fn igColorConvertHSVtoRGB(h: f32, s: f32, v: f32, out_r: [*c]f32, out_g: [*c]f32, out_b: [*c]f32) void;
pub extern fn igIsKeyDown_Nil(key: ImGuiKey) bool;
pub extern fn igIsKeyPressed_Bool(key: ImGuiKey, repeat: bool) bool;
pub extern fn igIsKeyReleased_Nil(key: ImGuiKey) bool;
pub extern fn igIsKeyChordPressed_Nil(key_chord: ImGuiKeyChord) bool;
pub extern fn igGetKeyPressedAmount(key: ImGuiKey, repeat_delay: f32, rate: f32) c_int;
pub extern fn igGetKeyName(key: ImGuiKey) [*c]const u8;
pub extern fn igSetNextFrameWantCaptureKeyboard(want_capture_keyboard: bool) void;
pub extern fn igIsMouseDown_Nil(button: ImGuiMouseButton) bool;
pub extern fn igIsMouseClicked_Bool(button: ImGuiMouseButton, repeat: bool) bool;
pub extern fn igIsMouseReleased_Nil(button: ImGuiMouseButton) bool;
pub extern fn igIsMouseDoubleClicked_Nil(button: ImGuiMouseButton) bool;
pub extern fn igGetMouseClickedCount(button: ImGuiMouseButton) c_int;
pub extern fn igIsMouseHoveringRect(r_min: ImVec2, r_max: ImVec2, clip: bool) bool;
pub extern fn igIsMousePosValid(mouse_pos: [*c]const ImVec2) bool;
pub extern fn igIsAnyMouseDown() bool;
pub extern fn igGetMousePos(pOut: [*c]ImVec2) void;
pub extern fn igGetMousePosOnOpeningCurrentPopup(pOut: [*c]ImVec2) void;
pub extern fn igIsMouseDragging(button: ImGuiMouseButton, lock_threshold: f32) bool;
pub extern fn igGetMouseDragDelta(pOut: [*c]ImVec2, button: ImGuiMouseButton, lock_threshold: f32) void;
pub extern fn igResetMouseDragDelta(button: ImGuiMouseButton) void;
pub extern fn igGetMouseCursor() ImGuiMouseCursor;
pub extern fn igSetMouseCursor(cursor_type: ImGuiMouseCursor) void;
pub extern fn igSetNextFrameWantCaptureMouse(want_capture_mouse: bool) void;
pub extern fn igGetClipboardText() [*c]const u8;
pub extern fn igSetClipboardText(text: [*c]const u8) void;
pub extern fn igLoadIniSettingsFromDisk(ini_filename: [*c]const u8) void;
pub extern fn igLoadIniSettingsFromMemory(ini_data: [*c]const u8, ini_size: usize) void;
pub extern fn igSaveIniSettingsToDisk(ini_filename: [*c]const u8) void;
pub extern fn igSaveIniSettingsToMemory(out_ini_size: [*c]usize) [*c]const u8;
pub extern fn igDebugTextEncoding(text: [*c]const u8) void;
pub extern fn igDebugFlashStyleColor(idx: ImGuiCol) void;
pub extern fn igDebugStartItemPicker() void;
pub extern fn igDebugCheckVersionAndDataLayout(version_str: [*c]const u8, sz_io: usize, sz_style: usize, sz_vec2: usize, sz_vec4: usize, sz_drawvert: usize, sz_drawidx: usize) bool;
pub extern fn igSetAllocatorFunctions(alloc_func: ImGuiMemAllocFunc, free_func: ImGuiMemFreeFunc, user_data: ?*anyopaque) void;
pub extern fn igGetAllocatorFunctions(p_alloc_func: [*c]ImGuiMemAllocFunc, p_free_func: [*c]ImGuiMemFreeFunc, p_user_data: [*c]?*anyopaque) void;
pub extern fn igMemAlloc(size: usize) ?*anyopaque;
pub extern fn igMemFree(ptr: ?*anyopaque) void;
pub extern fn igGetPlatformIO() [*c]ImGuiPlatformIO;
pub extern fn igUpdatePlatformWindows() void;
pub extern fn igRenderPlatformWindowsDefault(platform_render_arg: ?*anyopaque, renderer_render_arg: ?*anyopaque) void;
pub extern fn igDestroyPlatformWindows() void;
pub extern fn igFindViewportByID(id: ImGuiID) [*c]ImGuiViewport;
pub extern fn igFindViewportByPlatformHandle(platform_handle: ?*anyopaque) [*c]ImGuiViewport;
pub extern fn ImGuiTableSortSpecs_ImGuiTableSortSpecs() [*c]ImGuiTableSortSpecs;
pub extern fn ImGuiTableSortSpecs_destroy(self: [*c]ImGuiTableSortSpecs) void;
pub extern fn ImGuiTableColumnSortSpecs_ImGuiTableColumnSortSpecs() ?*ImGuiTableColumnSortSpecs;
pub extern fn ImGuiTableColumnSortSpecs_destroy(self: ?*ImGuiTableColumnSortSpecs) void;
pub extern fn ImGuiStyle_ImGuiStyle() [*c]ImGuiStyle;
pub extern fn ImGuiStyle_destroy(self: [*c]ImGuiStyle) void;
pub extern fn ImGuiStyle_ScaleAllSizes(self: [*c]ImGuiStyle, scale_factor: f32) void;
pub extern fn ImGuiIO_AddKeyEvent(self: [*c]ImGuiIO, key: ImGuiKey, down: bool) void;
pub extern fn ImGuiIO_AddKeyAnalogEvent(self: [*c]ImGuiIO, key: ImGuiKey, down: bool, v: f32) void;
pub extern fn ImGuiIO_AddMousePosEvent(self: [*c]ImGuiIO, x: f32, y: f32) void;
pub extern fn ImGuiIO_AddMouseButtonEvent(self: [*c]ImGuiIO, button: c_int, down: bool) void;
pub extern fn ImGuiIO_AddMouseWheelEvent(self: [*c]ImGuiIO, wheel_x: f32, wheel_y: f32) void;
pub extern fn ImGuiIO_AddMouseSourceEvent(self: [*c]ImGuiIO, source: ImGuiMouseSource) void;
pub extern fn ImGuiIO_AddMouseViewportEvent(self: [*c]ImGuiIO, id: ImGuiID) void;
pub extern fn ImGuiIO_AddFocusEvent(self: [*c]ImGuiIO, focused: bool) void;
pub extern fn ImGuiIO_AddInputCharacter(self: [*c]ImGuiIO, c: c_uint) void;
pub extern fn ImGuiIO_AddInputCharacterUTF16(self: [*c]ImGuiIO, c: ImWchar16) void;
pub extern fn ImGuiIO_AddInputCharactersUTF8(self: [*c]ImGuiIO, str: [*c]const u8) void;
pub extern fn ImGuiIO_SetKeyEventNativeData(self: [*c]ImGuiIO, key: ImGuiKey, native_keycode: c_int, native_scancode: c_int, native_legacy_index: c_int) void;
pub extern fn ImGuiIO_SetAppAcceptingEvents(self: [*c]ImGuiIO, accepting_events: bool) void;
pub extern fn ImGuiIO_ClearEventsQueue(self: [*c]ImGuiIO) void;
pub extern fn ImGuiIO_ClearInputKeys(self: [*c]ImGuiIO) void;
pub extern fn ImGuiIO_ImGuiIO() [*c]ImGuiIO;
pub extern fn ImGuiIO_destroy(self: [*c]ImGuiIO) void;
pub extern fn ImGuiInputTextCallbackData_ImGuiInputTextCallbackData() [*c]ImGuiInputTextCallbackData;
pub extern fn ImGuiInputTextCallbackData_destroy(self: [*c]ImGuiInputTextCallbackData) void;
pub extern fn ImGuiInputTextCallbackData_DeleteChars(self: [*c]ImGuiInputTextCallbackData, pos: c_int, bytes_count: c_int) void;
pub extern fn ImGuiInputTextCallbackData_InsertChars(self: [*c]ImGuiInputTextCallbackData, pos: c_int, text: [*c]const u8, text_end: [*c]const u8) void;
pub extern fn ImGuiInputTextCallbackData_SelectAll(self: [*c]ImGuiInputTextCallbackData) void;
pub extern fn ImGuiInputTextCallbackData_ClearSelection(self: [*c]ImGuiInputTextCallbackData) void;
pub extern fn ImGuiInputTextCallbackData_HasSelection(self: [*c]ImGuiInputTextCallbackData) bool;
pub extern fn ImGuiWindowClass_ImGuiWindowClass() [*c]ImGuiWindowClass;
pub extern fn ImGuiWindowClass_destroy(self: [*c]ImGuiWindowClass) void;
pub extern fn ImGuiPayload_ImGuiPayload() [*c]ImGuiPayload;
pub extern fn ImGuiPayload_destroy(self: [*c]ImGuiPayload) void;
pub extern fn ImGuiPayload_Clear(self: [*c]ImGuiPayload) void;
pub extern fn ImGuiPayload_IsDataType(self: [*c]ImGuiPayload, @"type": [*c]const u8) bool;
pub extern fn ImGuiPayload_IsPreview(self: [*c]ImGuiPayload) bool;
pub extern fn ImGuiPayload_IsDelivery(self: [*c]ImGuiPayload) bool;
pub extern fn ImGuiOnceUponAFrame_ImGuiOnceUponAFrame() [*c]ImGuiOnceUponAFrame;
pub extern fn ImGuiOnceUponAFrame_destroy(self: [*c]ImGuiOnceUponAFrame) void;
pub extern fn ImGuiTextFilter_ImGuiTextFilter(default_filter: [*c]const u8) [*c]ImGuiTextFilter;
pub extern fn ImGuiTextFilter_destroy(self: [*c]ImGuiTextFilter) void;
pub extern fn ImGuiTextFilter_Draw(self: [*c]ImGuiTextFilter, label: [*c]const u8, width: f32) bool;
pub extern fn ImGuiTextFilter_PassFilter(self: [*c]ImGuiTextFilter, text: [*c]const u8, text_end: [*c]const u8) bool;
pub extern fn ImGuiTextFilter_Build(self: [*c]ImGuiTextFilter) void;
pub extern fn ImGuiTextFilter_Clear(self: [*c]ImGuiTextFilter) void;
pub extern fn ImGuiTextFilter_IsActive(self: [*c]ImGuiTextFilter) bool;
pub extern fn ImGuiTextRange_ImGuiTextRange_Nil() [*c]ImGuiTextRange;
pub extern fn ImGuiTextRange_destroy(self: [*c]ImGuiTextRange) void;
pub extern fn ImGuiTextRange_ImGuiTextRange_Str(_b: [*c]const u8, _e: [*c]const u8) [*c]ImGuiTextRange;
pub extern fn ImGuiTextRange_empty(self: [*c]ImGuiTextRange) bool;
pub extern fn ImGuiTextRange_split(self: [*c]ImGuiTextRange, separator: u8, out: [*c]ImVector_ImGuiTextRange) void;
pub extern fn ImGuiTextBuffer_ImGuiTextBuffer() [*c]ImGuiTextBuffer;
pub extern fn ImGuiTextBuffer_destroy(self: [*c]ImGuiTextBuffer) void;
pub extern fn ImGuiTextBuffer_begin(self: [*c]ImGuiTextBuffer) [*c]const u8;
pub extern fn ImGuiTextBuffer_end(self: [*c]ImGuiTextBuffer) [*c]const u8;
pub extern fn ImGuiTextBuffer_size(self: [*c]ImGuiTextBuffer) c_int;
pub extern fn ImGuiTextBuffer_empty(self: [*c]ImGuiTextBuffer) bool;
pub extern fn ImGuiTextBuffer_clear(self: [*c]ImGuiTextBuffer) void;
pub extern fn ImGuiTextBuffer_reserve(self: [*c]ImGuiTextBuffer, capacity: c_int) void;
pub extern fn ImGuiTextBuffer_c_str(self: [*c]ImGuiTextBuffer) [*c]const u8;
pub extern fn ImGuiTextBuffer_append(self: [*c]ImGuiTextBuffer, str: [*c]const u8, str_end: [*c]const u8) void;
pub extern fn ImGuiTextBuffer_appendfv(self: [*c]ImGuiTextBuffer, fmt: [*c]const u8, args: va_list) void;
pub extern fn ImGuiStoragePair_ImGuiStoragePair_Int(_key: ImGuiID, _val: c_int) [*c]ImGuiStoragePair;
pub extern fn ImGuiStoragePair_destroy(self: [*c]ImGuiStoragePair) void;
pub extern fn ImGuiStoragePair_ImGuiStoragePair_Float(_key: ImGuiID, _val: f32) [*c]ImGuiStoragePair;
pub extern fn ImGuiStoragePair_ImGuiStoragePair_Ptr(_key: ImGuiID, _val: ?*anyopaque) [*c]ImGuiStoragePair;
pub extern fn ImGuiStorage_Clear(self: [*c]ImGuiStorage) void;
pub extern fn ImGuiStorage_GetInt(self: [*c]ImGuiStorage, key: ImGuiID, default_val: c_int) c_int;
pub extern fn ImGuiStorage_SetInt(self: [*c]ImGuiStorage, key: ImGuiID, val: c_int) void;
pub extern fn ImGuiStorage_GetBool(self: [*c]ImGuiStorage, key: ImGuiID, default_val: bool) bool;
pub extern fn ImGuiStorage_SetBool(self: [*c]ImGuiStorage, key: ImGuiID, val: bool) void;
pub extern fn ImGuiStorage_GetFloat(self: [*c]ImGuiStorage, key: ImGuiID, default_val: f32) f32;
pub extern fn ImGuiStorage_SetFloat(self: [*c]ImGuiStorage, key: ImGuiID, val: f32) void;
pub extern fn ImGuiStorage_GetVoidPtr(self: [*c]ImGuiStorage, key: ImGuiID) ?*anyopaque;
pub extern fn ImGuiStorage_SetVoidPtr(self: [*c]ImGuiStorage, key: ImGuiID, val: ?*anyopaque) void;
pub extern fn ImGuiStorage_GetIntRef(self: [*c]ImGuiStorage, key: ImGuiID, default_val: c_int) [*c]c_int;
pub extern fn ImGuiStorage_GetBoolRef(self: [*c]ImGuiStorage, key: ImGuiID, default_val: bool) [*c]bool;
pub extern fn ImGuiStorage_GetFloatRef(self: [*c]ImGuiStorage, key: ImGuiID, default_val: f32) [*c]f32;
pub extern fn ImGuiStorage_GetVoidPtrRef(self: [*c]ImGuiStorage, key: ImGuiID, default_val: ?*anyopaque) [*c]?*anyopaque;
pub extern fn ImGuiStorage_BuildSortByKey(self: [*c]ImGuiStorage) void;
pub extern fn ImGuiStorage_SetAllInt(self: [*c]ImGuiStorage, val: c_int) void;
pub extern fn ImGuiListClipper_ImGuiListClipper() [*c]ImGuiListClipper;
pub extern fn ImGuiListClipper_destroy(self: [*c]ImGuiListClipper) void;
pub extern fn ImGuiListClipper_Begin(self: [*c]ImGuiListClipper, items_count: c_int, items_height: f32) void;
pub extern fn ImGuiListClipper_End(self: [*c]ImGuiListClipper) void;
pub extern fn ImGuiListClipper_Step(self: [*c]ImGuiListClipper) bool;
pub extern fn ImGuiListClipper_IncludeItemByIndex(self: [*c]ImGuiListClipper, item_index: c_int) void;
pub extern fn ImGuiListClipper_IncludeItemsByIndex(self: [*c]ImGuiListClipper, item_begin: c_int, item_end: c_int) void;
pub extern fn ImColor_ImColor_Nil() [*c]ImColor;
pub extern fn ImColor_destroy(self: [*c]ImColor) void;
pub extern fn ImColor_ImColor_Float(r: f32, g: f32, b: f32, a: f32) [*c]ImColor;
pub extern fn ImColor_ImColor_Vec4(col: ImVec4) [*c]ImColor;
pub extern fn ImColor_ImColor_Int(r: c_int, g: c_int, b: c_int, a: c_int) [*c]ImColor;
pub extern fn ImColor_ImColor_U32(rgba: ImU32) [*c]ImColor;
pub extern fn ImColor_SetHSV(self: [*c]ImColor, h: f32, s: f32, v: f32, a: f32) void;
pub extern fn ImColor_HSV(pOut: [*c]ImColor, h: f32, s: f32, v: f32, a: f32) void;
pub extern fn ImDrawCmd_ImDrawCmd() [*c]ImDrawCmd;
pub extern fn ImDrawCmd_destroy(self: [*c]ImDrawCmd) void;
pub extern fn ImDrawCmd_GetTexID(self: [*c]ImDrawCmd) ImTextureID;
pub extern fn ImDrawListSplitter_ImDrawListSplitter() [*c]ImDrawListSplitter;
pub extern fn ImDrawListSplitter_destroy(self: [*c]ImDrawListSplitter) void;
pub extern fn ImDrawListSplitter_Clear(self: [*c]ImDrawListSplitter) void;
pub extern fn ImDrawListSplitter_ClearFreeMemory(self: [*c]ImDrawListSplitter) void;
pub extern fn ImDrawListSplitter_Split(self: [*c]ImDrawListSplitter, draw_list: [*c]ImDrawList, count: c_int) void;
pub extern fn ImDrawListSplitter_Merge(self: [*c]ImDrawListSplitter, draw_list: [*c]ImDrawList) void;
pub extern fn ImDrawListSplitter_SetCurrentChannel(self: [*c]ImDrawListSplitter, draw_list: [*c]ImDrawList, channel_idx: c_int) void;
pub extern fn ImDrawList_ImDrawList(shared_data: [*c]ImDrawListSharedData) [*c]ImDrawList;
pub extern fn ImDrawList_destroy(self: [*c]ImDrawList) void;
pub extern fn ImDrawList_PushClipRect(self: [*c]ImDrawList, clip_rect_min: ImVec2, clip_rect_max: ImVec2, intersect_with_current_clip_rect: bool) void;
pub extern fn ImDrawList_PushClipRectFullScreen(self: [*c]ImDrawList) void;
pub extern fn ImDrawList_PopClipRect(self: [*c]ImDrawList) void;
pub extern fn ImDrawList_PushTextureID(self: [*c]ImDrawList, texture_id: ImTextureID) void;
pub extern fn ImDrawList_PopTextureID(self: [*c]ImDrawList) void;
pub extern fn ImDrawList_GetClipRectMin(pOut: [*c]ImVec2, self: [*c]ImDrawList) void;
pub extern fn ImDrawList_GetClipRectMax(pOut: [*c]ImVec2, self: [*c]ImDrawList) void;
pub extern fn ImDrawList_AddLine(self: [*c]ImDrawList, p1: ImVec2, p2: ImVec2, col: ImU32, thickness: f32) void;
pub extern fn ImDrawList_AddRect(self: [*c]ImDrawList, p_min: ImVec2, p_max: ImVec2, col: ImU32, rounding: f32, flags: ImDrawFlags, thickness: f32) void;
pub extern fn ImDrawList_AddRectFilled(self: [*c]ImDrawList, p_min: ImVec2, p_max: ImVec2, col: ImU32, rounding: f32, flags: ImDrawFlags) void;
pub extern fn ImDrawList_AddRectFilledMultiColor(self: [*c]ImDrawList, p_min: ImVec2, p_max: ImVec2, col_upr_left: ImU32, col_upr_right: ImU32, col_bot_right: ImU32, col_bot_left: ImU32) void;
pub extern fn ImDrawList_AddQuad(self: [*c]ImDrawList, p1: ImVec2, p2: ImVec2, p3: ImVec2, p4: ImVec2, col: ImU32, thickness: f32) void;
pub extern fn ImDrawList_AddQuadFilled(self: [*c]ImDrawList, p1: ImVec2, p2: ImVec2, p3: ImVec2, p4: ImVec2, col: ImU32) void;
pub extern fn ImDrawList_AddTriangle(self: [*c]ImDrawList, p1: ImVec2, p2: ImVec2, p3: ImVec2, col: ImU32, thickness: f32) void;
pub extern fn ImDrawList_AddTriangleFilled(self: [*c]ImDrawList, p1: ImVec2, p2: ImVec2, p3: ImVec2, col: ImU32) void;
pub extern fn ImDrawList_AddCircle(self: [*c]ImDrawList, center: ImVec2, radius: f32, col: ImU32, num_segments: c_int, thickness: f32) void;
pub extern fn ImDrawList_AddCircleFilled(self: [*c]ImDrawList, center: ImVec2, radius: f32, col: ImU32, num_segments: c_int) void;
pub extern fn ImDrawList_AddNgon(self: [*c]ImDrawList, center: ImVec2, radius: f32, col: ImU32, num_segments: c_int, thickness: f32) void;
pub extern fn ImDrawList_AddNgonFilled(self: [*c]ImDrawList, center: ImVec2, radius: f32, col: ImU32, num_segments: c_int) void;
pub extern fn ImDrawList_AddEllipse(self: [*c]ImDrawList, center: ImVec2, radius: ImVec2, col: ImU32, rot: f32, num_segments: c_int, thickness: f32) void;
pub extern fn ImDrawList_AddEllipseFilled(self: [*c]ImDrawList, center: ImVec2, radius: ImVec2, col: ImU32, rot: f32, num_segments: c_int) void;
pub extern fn ImDrawList_AddText_Vec2(self: [*c]ImDrawList, pos: ImVec2, col: ImU32, text_begin: [*c]const u8, text_end: [*c]const u8) void;
pub extern fn ImDrawList_AddText_FontPtr(self: [*c]ImDrawList, font: [*c]const ImFont, font_size: f32, pos: ImVec2, col: ImU32, text_begin: [*c]const u8, text_end: [*c]const u8, wrap_width: f32, cpu_fine_clip_rect: [*c]const ImVec4) void;
pub extern fn ImDrawList_AddBezierCubic(self: [*c]ImDrawList, p1: ImVec2, p2: ImVec2, p3: ImVec2, p4: ImVec2, col: ImU32, thickness: f32, num_segments: c_int) void;
pub extern fn ImDrawList_AddBezierQuadratic(self: [*c]ImDrawList, p1: ImVec2, p2: ImVec2, p3: ImVec2, col: ImU32, thickness: f32, num_segments: c_int) void;
pub extern fn ImDrawList_AddPolyline(self: [*c]ImDrawList, points: [*c]const ImVec2, num_points: c_int, col: ImU32, flags: ImDrawFlags, thickness: f32) void;
pub extern fn ImDrawList_AddConvexPolyFilled(self: [*c]ImDrawList, points: [*c]const ImVec2, num_points: c_int, col: ImU32) void;
pub extern fn ImDrawList_AddConcavePolyFilled(self: [*c]ImDrawList, points: [*c]const ImVec2, num_points: c_int, col: ImU32) void;
pub extern fn ImDrawList_AddImage(self: [*c]ImDrawList, user_texture_id: ImTextureID, p_min: ImVec2, p_max: ImVec2, uv_min: ImVec2, uv_max: ImVec2, col: ImU32) void;
pub extern fn ImDrawList_AddImageQuad(self: [*c]ImDrawList, user_texture_id: ImTextureID, p1: ImVec2, p2: ImVec2, p3: ImVec2, p4: ImVec2, uv1: ImVec2, uv2: ImVec2, uv3: ImVec2, uv4: ImVec2, col: ImU32) void;
pub extern fn ImDrawList_AddImageRounded(self: [*c]ImDrawList, user_texture_id: ImTextureID, p_min: ImVec2, p_max: ImVec2, uv_min: ImVec2, uv_max: ImVec2, col: ImU32, rounding: f32, flags: ImDrawFlags) void;
pub extern fn ImDrawList_PathClear(self: [*c]ImDrawList) void;
pub extern fn ImDrawList_PathLineTo(self: [*c]ImDrawList, pos: ImVec2) void;
pub extern fn ImDrawList_PathLineToMergeDuplicate(self: [*c]ImDrawList, pos: ImVec2) void;
pub extern fn ImDrawList_PathFillConvex(self: [*c]ImDrawList, col: ImU32) void;
pub extern fn ImDrawList_PathFillConcave(self: [*c]ImDrawList, col: ImU32) void;
pub extern fn ImDrawList_PathStroke(self: [*c]ImDrawList, col: ImU32, flags: ImDrawFlags, thickness: f32) void;
pub extern fn ImDrawList_PathArcTo(self: [*c]ImDrawList, center: ImVec2, radius: f32, a_min: f32, a_max: f32, num_segments: c_int) void;
pub extern fn ImDrawList_PathArcToFast(self: [*c]ImDrawList, center: ImVec2, radius: f32, a_min_of_12: c_int, a_max_of_12: c_int) void;
pub extern fn ImDrawList_PathEllipticalArcTo(self: [*c]ImDrawList, center: ImVec2, radius: ImVec2, rot: f32, a_min: f32, a_max: f32, num_segments: c_int) void;
pub extern fn ImDrawList_PathBezierCubicCurveTo(self: [*c]ImDrawList, p2: ImVec2, p3: ImVec2, p4: ImVec2, num_segments: c_int) void;
pub extern fn ImDrawList_PathBezierQuadraticCurveTo(self: [*c]ImDrawList, p2: ImVec2, p3: ImVec2, num_segments: c_int) void;
pub extern fn ImDrawList_PathRect(self: [*c]ImDrawList, rect_min: ImVec2, rect_max: ImVec2, rounding: f32, flags: ImDrawFlags) void;
pub extern fn ImDrawList_AddCallback(self: [*c]ImDrawList, callback: ImDrawCallback, callback_data: ?*anyopaque) void;
pub extern fn ImDrawList_AddDrawCmd(self: [*c]ImDrawList) void;
pub extern fn ImDrawList_CloneOutput(self: [*c]ImDrawList) [*c]ImDrawList;
pub extern fn ImDrawList_ChannelsSplit(self: [*c]ImDrawList, count: c_int) void;
pub extern fn ImDrawList_ChannelsMerge(self: [*c]ImDrawList) void;
pub extern fn ImDrawList_ChannelsSetCurrent(self: [*c]ImDrawList, n: c_int) void;
pub extern fn ImDrawList_PrimReserve(self: [*c]ImDrawList, idx_count: c_int, vtx_count: c_int) void;
pub extern fn ImDrawList_PrimUnreserve(self: [*c]ImDrawList, idx_count: c_int, vtx_count: c_int) void;
pub extern fn ImDrawList_PrimRect(self: [*c]ImDrawList, a: ImVec2, b: ImVec2, col: ImU32) void;
pub extern fn ImDrawList_PrimRectUV(self: [*c]ImDrawList, a: ImVec2, b: ImVec2, uv_a: ImVec2, uv_b: ImVec2, col: ImU32) void;
pub extern fn ImDrawList_PrimQuadUV(self: [*c]ImDrawList, a: ImVec2, b: ImVec2, c: ImVec2, d: ImVec2, uv_a: ImVec2, uv_b: ImVec2, uv_c: ImVec2, uv_d: ImVec2, col: ImU32) void;
pub extern fn ImDrawList_PrimWriteVtx(self: [*c]ImDrawList, pos: ImVec2, uv: ImVec2, col: ImU32) void;
pub extern fn ImDrawList_PrimWriteIdx(self: [*c]ImDrawList, idx: ImDrawIdx) void;
pub extern fn ImDrawList_PrimVtx(self: [*c]ImDrawList, pos: ImVec2, uv: ImVec2, col: ImU32) void;
pub extern fn ImDrawList__ResetForNewFrame(self: [*c]ImDrawList) void;
pub extern fn ImDrawList__ClearFreeMemory(self: [*c]ImDrawList) void;
pub extern fn ImDrawList__PopUnusedDrawCmd(self: [*c]ImDrawList) void;
pub extern fn ImDrawList__TryMergeDrawCmds(self: [*c]ImDrawList) void;
pub extern fn ImDrawList__OnChangedClipRect(self: [*c]ImDrawList) void;
pub extern fn ImDrawList__OnChangedTextureID(self: [*c]ImDrawList) void;
pub extern fn ImDrawList__OnChangedVtxOffset(self: [*c]ImDrawList) void;
pub extern fn ImDrawList__CalcCircleAutoSegmentCount(self: [*c]ImDrawList, radius: f32) c_int;
pub extern fn ImDrawList__PathArcToFastEx(self: [*c]ImDrawList, center: ImVec2, radius: f32, a_min_sample: c_int, a_max_sample: c_int, a_step: c_int) void;
pub extern fn ImDrawList__PathArcToN(self: [*c]ImDrawList, center: ImVec2, radius: f32, a_min: f32, a_max: f32, num_segments: c_int) void;
pub extern fn ImDrawData_ImDrawData() [*c]ImDrawData;
pub extern fn ImDrawData_destroy(self: [*c]ImDrawData) void;
pub extern fn ImDrawData_Clear(self: [*c]ImDrawData) void;
pub extern fn ImDrawData_AddDrawList(self: [*c]ImDrawData, draw_list: [*c]ImDrawList) void;
pub extern fn ImDrawData_DeIndexAllBuffers(self: [*c]ImDrawData) void;
pub extern fn ImDrawData_ScaleClipRects(self: [*c]ImDrawData, fb_scale: ImVec2) void;
pub extern fn ImFontConfig_ImFontConfig() [*c]ImFontConfig;
pub extern fn ImFontConfig_destroy(self: [*c]ImFontConfig) void;
pub extern fn ImFontGlyphRangesBuilder_ImFontGlyphRangesBuilder() [*c]ImFontGlyphRangesBuilder;
pub extern fn ImFontGlyphRangesBuilder_destroy(self: [*c]ImFontGlyphRangesBuilder) void;
pub extern fn ImFontGlyphRangesBuilder_Clear(self: [*c]ImFontGlyphRangesBuilder) void;
pub extern fn ImFontGlyphRangesBuilder_GetBit(self: [*c]ImFontGlyphRangesBuilder, n: usize) bool;
pub extern fn ImFontGlyphRangesBuilder_SetBit(self: [*c]ImFontGlyphRangesBuilder, n: usize) void;
pub extern fn ImFontGlyphRangesBuilder_AddChar(self: [*c]ImFontGlyphRangesBuilder, c: ImWchar) void;
pub extern fn ImFontGlyphRangesBuilder_AddText(self: [*c]ImFontGlyphRangesBuilder, text: [*c]const u8, text_end: [*c]const u8) void;
pub extern fn ImFontGlyphRangesBuilder_AddRanges(self: [*c]ImFontGlyphRangesBuilder, ranges: [*c]const ImWchar) void;
pub extern fn ImFontGlyphRangesBuilder_BuildRanges(self: [*c]ImFontGlyphRangesBuilder, out_ranges: [*c]ImVector_ImWchar) void;
pub extern fn ImFontAtlasCustomRect_ImFontAtlasCustomRect() [*c]ImFontAtlasCustomRect;
pub extern fn ImFontAtlasCustomRect_destroy(self: [*c]ImFontAtlasCustomRect) void;
pub extern fn ImFontAtlasCustomRect_IsPacked(self: [*c]ImFontAtlasCustomRect) bool;
pub extern fn ImFontAtlas_ImFontAtlas() [*c]ImFontAtlas;
pub extern fn ImFontAtlas_destroy(self: [*c]ImFontAtlas) void;
pub extern fn ImFontAtlas_AddFont(self: [*c]ImFontAtlas, font_cfg: [*c]const ImFontConfig) [*c]ImFont;
pub extern fn ImFontAtlas_AddFontDefault(self: [*c]ImFontAtlas, font_cfg: [*c]const ImFontConfig) [*c]ImFont;
pub extern fn ImFontAtlas_AddFontFromFileTTF(self: [*c]ImFontAtlas, filename: [*c]const u8, size_pixels: f32, font_cfg: [*c]const ImFontConfig, glyph_ranges: [*c]const ImWchar) [*c]ImFont;
pub extern fn ImFontAtlas_AddFontFromMemoryTTF(self: [*c]ImFontAtlas, font_data: ?*anyopaque, font_data_size: c_int, size_pixels: f32, font_cfg: [*c]const ImFontConfig, glyph_ranges: [*c]const ImWchar) [*c]ImFont;
pub extern fn ImFontAtlas_AddFontFromMemoryCompressedTTF(self: [*c]ImFontAtlas, compressed_font_data: ?*const anyopaque, compressed_font_data_size: c_int, size_pixels: f32, font_cfg: [*c]const ImFontConfig, glyph_ranges: [*c]const ImWchar) [*c]ImFont;
pub extern fn ImFontAtlas_AddFontFromMemoryCompressedBase85TTF(self: [*c]ImFontAtlas, compressed_font_data_base85: [*c]const u8, size_pixels: f32, font_cfg: [*c]const ImFontConfig, glyph_ranges: [*c]const ImWchar) [*c]ImFont;
pub extern fn ImFontAtlas_ClearInputData(self: [*c]ImFontAtlas) void;
pub extern fn ImFontAtlas_ClearTexData(self: [*c]ImFontAtlas) void;
pub extern fn ImFontAtlas_ClearFonts(self: [*c]ImFontAtlas) void;
pub extern fn ImFontAtlas_Clear(self: [*c]ImFontAtlas) void;
pub extern fn ImFontAtlas_Build(self: [*c]ImFontAtlas) bool;
pub extern fn ImFontAtlas_GetTexDataAsAlpha8(self: [*c]ImFontAtlas, out_pixels: [*c][*c]u8, out_width: [*c]c_int, out_height: [*c]c_int, out_bytes_per_pixel: [*c]c_int) void;
pub extern fn ImFontAtlas_GetTexDataAsRGBA32(self: [*c]ImFontAtlas, out_pixels: [*c][*c]u8, out_width: [*c]c_int, out_height: [*c]c_int, out_bytes_per_pixel: [*c]c_int) void;
pub extern fn ImFontAtlas_IsBuilt(self: [*c]ImFontAtlas) bool;
pub extern fn ImFontAtlas_SetTexID(self: [*c]ImFontAtlas, id: ImTextureID) void;
pub extern fn ImFontAtlas_GetGlyphRangesDefault(self: [*c]ImFontAtlas) [*c]const ImWchar;
pub extern fn ImFontAtlas_GetGlyphRangesGreek(self: [*c]ImFontAtlas) [*c]const ImWchar;
pub extern fn ImFontAtlas_GetGlyphRangesKorean(self: [*c]ImFontAtlas) [*c]const ImWchar;
pub extern fn ImFontAtlas_GetGlyphRangesJapanese(self: [*c]ImFontAtlas) [*c]const ImWchar;
pub extern fn ImFontAtlas_GetGlyphRangesChineseFull(self: [*c]ImFontAtlas) [*c]const ImWchar;
pub extern fn ImFontAtlas_GetGlyphRangesChineseSimplifiedCommon(self: [*c]ImFontAtlas) [*c]const ImWchar;
pub extern fn ImFontAtlas_GetGlyphRangesCyrillic(self: [*c]ImFontAtlas) [*c]const ImWchar;
pub extern fn ImFontAtlas_GetGlyphRangesThai(self: [*c]ImFontAtlas) [*c]const ImWchar;
pub extern fn ImFontAtlas_GetGlyphRangesVietnamese(self: [*c]ImFontAtlas) [*c]const ImWchar;
pub extern fn ImFontAtlas_AddCustomRectRegular(self: [*c]ImFontAtlas, width: c_int, height: c_int) c_int;
pub extern fn ImFontAtlas_AddCustomRectFontGlyph(self: [*c]ImFontAtlas, font: [*c]ImFont, id: ImWchar, width: c_int, height: c_int, advance_x: f32, offset: ImVec2) c_int;
pub extern fn ImFontAtlas_GetCustomRectByIndex(self: [*c]ImFontAtlas, index: c_int) [*c]ImFontAtlasCustomRect;
pub extern fn ImFontAtlas_CalcCustomRectUV(self: [*c]ImFontAtlas, rect: [*c]const ImFontAtlasCustomRect, out_uv_min: [*c]ImVec2, out_uv_max: [*c]ImVec2) void;
pub extern fn ImFontAtlas_GetMouseCursorTexData(self: [*c]ImFontAtlas, cursor: ImGuiMouseCursor, out_offset: [*c]ImVec2, out_size: [*c]ImVec2, out_uv_border: [*c]ImVec2, out_uv_fill: [*c]ImVec2) bool;
pub extern fn ImFont_ImFont() [*c]ImFont;
pub extern fn ImFont_destroy(self: [*c]ImFont) void;
pub extern fn ImFont_FindGlyph(self: [*c]ImFont, c: ImWchar) ?*const ImFontGlyph;
pub extern fn ImFont_FindGlyphNoFallback(self: [*c]ImFont, c: ImWchar) ?*const ImFontGlyph;
pub extern fn ImFont_GetCharAdvance(self: [*c]ImFont, c: ImWchar) f32;
pub extern fn ImFont_IsLoaded(self: [*c]ImFont) bool;
pub extern fn ImFont_GetDebugName(self: [*c]ImFont) [*c]const u8;
pub extern fn ImFont_CalcTextSizeA(pOut: [*c]ImVec2, self: [*c]ImFont, size: f32, max_width: f32, wrap_width: f32, text_begin: [*c]const u8, text_end: [*c]const u8, remaining: [*c][*c]const u8) void;
pub extern fn ImFont_CalcWordWrapPositionA(self: [*c]ImFont, scale: f32, text: [*c]const u8, text_end: [*c]const u8, wrap_width: f32) [*c]const u8;
pub extern fn ImFont_RenderChar(self: [*c]ImFont, draw_list: [*c]ImDrawList, size: f32, pos: ImVec2, col: ImU32, c: ImWchar) void;
pub extern fn ImFont_RenderText(self: [*c]ImFont, draw_list: [*c]ImDrawList, size: f32, pos: ImVec2, col: ImU32, clip_rect: ImVec4, text_begin: [*c]const u8, text_end: [*c]const u8, wrap_width: f32, cpu_fine_clip: bool) void;
pub extern fn ImFont_BuildLookupTable(self: [*c]ImFont) void;
pub extern fn ImFont_ClearOutputData(self: [*c]ImFont) void;
pub extern fn ImFont_GrowIndex(self: [*c]ImFont, new_size: c_int) void;
pub extern fn ImFont_AddGlyph(self: [*c]ImFont, src_cfg: [*c]const ImFontConfig, c: ImWchar, x0: f32, y0: f32, x1: f32, y1: f32, @"u0": f32, v0: f32, @"u1": f32, v1: f32, advance_x: f32) void;
pub extern fn ImFont_AddRemapChar(self: [*c]ImFont, dst: ImWchar, src: ImWchar, overwrite_dst: bool) void;
pub extern fn ImFont_SetGlyphVisible(self: [*c]ImFont, c: ImWchar, visible: bool) void;
pub extern fn ImFont_IsGlyphRangeUnused(self: [*c]ImFont, c_begin: c_uint, c_last: c_uint) bool;
pub extern fn ImGuiViewport_ImGuiViewport() [*c]ImGuiViewport;
pub extern fn ImGuiViewport_destroy(self: [*c]ImGuiViewport) void;
pub extern fn ImGuiViewport_GetCenter(pOut: [*c]ImVec2, self: [*c]ImGuiViewport) void;
pub extern fn ImGuiViewport_GetWorkCenter(pOut: [*c]ImVec2, self: [*c]ImGuiViewport) void;
pub extern fn ImGuiPlatformIO_ImGuiPlatformIO() [*c]ImGuiPlatformIO;
pub extern fn ImGuiPlatformIO_destroy(self: [*c]ImGuiPlatformIO) void;
pub extern fn ImGuiPlatformMonitor_ImGuiPlatformMonitor() [*c]ImGuiPlatformMonitor;
pub extern fn ImGuiPlatformMonitor_destroy(self: [*c]ImGuiPlatformMonitor) void;
pub extern fn ImGuiPlatformImeData_ImGuiPlatformImeData() [*c]ImGuiPlatformImeData;
pub extern fn ImGuiPlatformImeData_destroy(self: [*c]ImGuiPlatformImeData) void;
pub extern fn igImHashData(data: ?*const anyopaque, data_size: usize, seed: ImGuiID) ImGuiID;
pub extern fn igImHashStr(data: [*c]const u8, data_size: usize, seed: ImGuiID) ImGuiID;
pub extern fn igImQsort(base: ?*anyopaque, count: usize, size_of_element: usize, compare_func: ?*const fn (?*const anyopaque, ?*const anyopaque) callconv(.C) c_int) void;
pub extern fn igImAlphaBlendColors(col_a: ImU32, col_b: ImU32) ImU32;
pub extern fn igImIsPowerOfTwo_Int(v: c_int) bool;
pub extern fn igImIsPowerOfTwo_U64(v: ImU64) bool;
pub extern fn igImUpperPowerOfTwo(v: c_int) c_int;
pub extern fn igImStricmp(str1: [*c]const u8, str2: [*c]const u8) c_int;
pub extern fn igImStrnicmp(str1: [*c]const u8, str2: [*c]const u8, count: usize) c_int;
pub extern fn igImStrncpy(dst: [*c]u8, src: [*c]const u8, count: usize) void;
pub extern fn igImStrdup(str: [*c]const u8) [*c]u8;
pub extern fn igImStrdupcpy(dst: [*c]u8, p_dst_size: [*c]usize, str: [*c]const u8) [*c]u8;
pub extern fn igImStrchrRange(str_begin: [*c]const u8, str_end: [*c]const u8, c: u8) [*c]const u8;
pub extern fn igImStreolRange(str: [*c]const u8, str_end: [*c]const u8) [*c]const u8;
pub extern fn igImStristr(haystack: [*c]const u8, haystack_end: [*c]const u8, needle: [*c]const u8, needle_end: [*c]const u8) [*c]const u8;
pub extern fn igImStrTrimBlanks(str: [*c]u8) void;
pub extern fn igImStrSkipBlank(str: [*c]const u8) [*c]const u8;
pub extern fn igImStrlenW(str: [*c]const ImWchar) c_int;
pub extern fn igImStrbolW(buf_mid_line: [*c]const ImWchar, buf_begin: [*c]const ImWchar) [*c]const ImWchar;
pub extern fn igImToUpper(c: u8) u8;
pub extern fn igImCharIsBlankA(c: u8) bool;
pub extern fn igImCharIsBlankW(c: c_uint) bool;
pub extern fn igImFormatString(buf: [*c]u8, buf_size: usize, fmt: [*c]const u8, ...) c_int;
pub extern fn igImFormatStringV(buf: [*c]u8, buf_size: usize, fmt: [*c]const u8, args: va_list) c_int;
pub extern fn igImFormatStringToTempBuffer(out_buf: [*c][*c]const u8, out_buf_end: [*c][*c]const u8, fmt: [*c]const u8, ...) void;
pub extern fn igImFormatStringToTempBufferV(out_buf: [*c][*c]const u8, out_buf_end: [*c][*c]const u8, fmt: [*c]const u8, args: va_list) void;
pub extern fn igImParseFormatFindStart(format: [*c]const u8) [*c]const u8;
pub extern fn igImParseFormatFindEnd(format: [*c]const u8) [*c]const u8;
pub extern fn igImParseFormatTrimDecorations(format: [*c]const u8, buf: [*c]u8, buf_size: usize) [*c]const u8;
pub extern fn igImParseFormatSanitizeForPrinting(fmt_in: [*c]const u8, fmt_out: [*c]u8, fmt_out_size: usize) void;
pub extern fn igImParseFormatSanitizeForScanning(fmt_in: [*c]const u8, fmt_out: [*c]u8, fmt_out_size: usize) [*c]const u8;
pub extern fn igImParseFormatPrecision(format: [*c]const u8, default_value: c_int) c_int;
pub extern fn igImTextCharToUtf8(out_buf: [*c]u8, c: c_uint) [*c]const u8;
pub extern fn igImTextStrToUtf8(out_buf: [*c]u8, out_buf_size: c_int, in_text: [*c]const ImWchar, in_text_end: [*c]const ImWchar) c_int;
pub extern fn igImTextCharFromUtf8(out_char: [*c]c_uint, in_text: [*c]const u8, in_text_end: [*c]const u8) c_int;
pub extern fn igImTextStrFromUtf8(out_buf: [*c]ImWchar, out_buf_size: c_int, in_text: [*c]const u8, in_text_end: [*c]const u8, in_remaining: [*c][*c]const u8) c_int;
pub extern fn igImTextCountCharsFromUtf8(in_text: [*c]const u8, in_text_end: [*c]const u8) c_int;
pub extern fn igImTextCountUtf8BytesFromChar(in_text: [*c]const u8, in_text_end: [*c]const u8) c_int;
pub extern fn igImTextCountUtf8BytesFromStr(in_text: [*c]const ImWchar, in_text_end: [*c]const ImWchar) c_int;
pub extern fn igImTextFindPreviousUtf8Codepoint(in_text_start: [*c]const u8, in_text_curr: [*c]const u8) [*c]const u8;
pub extern fn igImTextCountLines(in_text: [*c]const u8, in_text_end: [*c]const u8) c_int;
pub extern fn igImFileOpen(filename: [*c]const u8, mode: [*c]const u8) ImFileHandle;
pub extern fn igImFileClose(file: ImFileHandle) bool;
pub extern fn igImFileGetSize(file: ImFileHandle) ImU64;
pub extern fn igImFileRead(data: ?*anyopaque, size: ImU64, count: ImU64, file: ImFileHandle) ImU64;
pub extern fn igImFileWrite(data: ?*const anyopaque, size: ImU64, count: ImU64, file: ImFileHandle) ImU64;
pub extern fn igImFileLoadToMemory(filename: [*c]const u8, mode: [*c]const u8, out_file_size: [*c]usize, padding_bytes: c_int) ?*anyopaque;
pub extern fn igImPow_Float(x: f32, y: f32) f32;
pub extern fn igImPow_double(x: f64, y: f64) f64;
pub extern fn igImLog_Float(x: f32) f32;
pub extern fn igImLog_double(x: f64) f64;
pub extern fn igImAbs_Int(x: c_int) c_int;
pub extern fn igImAbs_Float(x: f32) f32;
pub extern fn igImAbs_double(x: f64) f64;
pub extern fn igImSign_Float(x: f32) f32;
pub extern fn igImSign_double(x: f64) f64;
pub extern fn igImRsqrt_Float(x: f32) f32;
pub extern fn igImRsqrt_double(x: f64) f64;
pub extern fn igImMin(pOut: [*c]ImVec2, lhs: ImVec2, rhs: ImVec2) void;
pub extern fn igImMax(pOut: [*c]ImVec2, lhs: ImVec2, rhs: ImVec2) void;
pub extern fn igImClamp(pOut: [*c]ImVec2, v: ImVec2, mn: ImVec2, mx: ImVec2) void;
pub extern fn igImLerp_Vec2Float(pOut: [*c]ImVec2, a: ImVec2, b: ImVec2, t: f32) void;
pub extern fn igImLerp_Vec2Vec2(pOut: [*c]ImVec2, a: ImVec2, b: ImVec2, t: ImVec2) void;
pub extern fn igImLerp_Vec4(pOut: [*c]ImVec4, a: ImVec4, b: ImVec4, t: f32) void;
pub extern fn igImSaturate(f: f32) f32;
pub extern fn igImLengthSqr_Vec2(lhs: ImVec2) f32;
pub extern fn igImLengthSqr_Vec4(lhs: ImVec4) f32;
pub extern fn igImInvLength(lhs: ImVec2, fail_value: f32) f32;
pub extern fn igImTrunc_Float(f: f32) f32;
pub extern fn igImTrunc_Vec2(pOut: [*c]ImVec2, v: ImVec2) void;
pub extern fn igImFloor_Float(f: f32) f32;
pub extern fn igImFloor_Vec2(pOut: [*c]ImVec2, v: ImVec2) void;
pub extern fn igImModPositive(a: c_int, b: c_int) c_int;
pub extern fn igImDot(a: ImVec2, b: ImVec2) f32;
pub extern fn igImRotate(pOut: [*c]ImVec2, v: ImVec2, cos_a: f32, sin_a: f32) void;
pub extern fn igImLinearSweep(current: f32, target: f32, speed: f32) f32;
pub extern fn igImMul(pOut: [*c]ImVec2, lhs: ImVec2, rhs: ImVec2) void;
pub extern fn igImIsFloatAboveGuaranteedIntegerPrecision(f: f32) bool;
pub extern fn igImExponentialMovingAverage(avg: f32, sample: f32, n: c_int) f32;
pub extern fn igImBezierCubicCalc(pOut: [*c]ImVec2, p1: ImVec2, p2: ImVec2, p3: ImVec2, p4: ImVec2, t: f32) void;
pub extern fn igImBezierCubicClosestPoint(pOut: [*c]ImVec2, p1: ImVec2, p2: ImVec2, p3: ImVec2, p4: ImVec2, p: ImVec2, num_segments: c_int) void;
pub extern fn igImBezierCubicClosestPointCasteljau(pOut: [*c]ImVec2, p1: ImVec2, p2: ImVec2, p3: ImVec2, p4: ImVec2, p: ImVec2, tess_tol: f32) void;
pub extern fn igImBezierQuadraticCalc(pOut: [*c]ImVec2, p1: ImVec2, p2: ImVec2, p3: ImVec2, t: f32) void;
pub extern fn igImLineClosestPoint(pOut: [*c]ImVec2, a: ImVec2, b: ImVec2, p: ImVec2) void;
pub extern fn igImTriangleContainsPoint(a: ImVec2, b: ImVec2, c: ImVec2, p: ImVec2) bool;
pub extern fn igImTriangleClosestPoint(pOut: [*c]ImVec2, a: ImVec2, b: ImVec2, c: ImVec2, p: ImVec2) void;
pub extern fn igImTriangleBarycentricCoords(a: ImVec2, b: ImVec2, c: ImVec2, p: ImVec2, out_u: [*c]f32, out_v: [*c]f32, out_w: [*c]f32) void;
pub extern fn igImTriangleArea(a: ImVec2, b: ImVec2, c: ImVec2) f32;
pub extern fn igImTriangleIsClockwise(a: ImVec2, b: ImVec2, c: ImVec2) bool;
pub extern fn ImVec1_ImVec1_Nil() [*c]ImVec1;
pub extern fn ImVec1_destroy(self: [*c]ImVec1) void;
pub extern fn ImVec1_ImVec1_Float(_x: f32) [*c]ImVec1;
pub extern fn ImVec2ih_ImVec2ih_Nil() [*c]ImVec2ih;
pub extern fn ImVec2ih_destroy(self: [*c]ImVec2ih) void;
pub extern fn ImVec2ih_ImVec2ih_short(_x: c_short, _y: c_short) [*c]ImVec2ih;
pub extern fn ImVec2ih_ImVec2ih_Vec2(rhs: ImVec2) [*c]ImVec2ih;
pub extern fn ImRect_ImRect_Nil() [*c]ImRect;
pub extern fn ImRect_destroy(self: [*c]ImRect) void;
pub extern fn ImRect_ImRect_Vec2(min: ImVec2, max: ImVec2) [*c]ImRect;
pub extern fn ImRect_ImRect_Vec4(v: ImVec4) [*c]ImRect;
pub extern fn ImRect_ImRect_Float(x1: f32, y1: f32, x2: f32, y2: f32) [*c]ImRect;
pub extern fn ImRect_GetCenter(pOut: [*c]ImVec2, self: [*c]ImRect) void;
pub extern fn ImRect_GetSize(pOut: [*c]ImVec2, self: [*c]ImRect) void;
pub extern fn ImRect_GetWidth(self: [*c]ImRect) f32;
pub extern fn ImRect_GetHeight(self: [*c]ImRect) f32;
pub extern fn ImRect_GetArea(self: [*c]ImRect) f32;
pub extern fn ImRect_GetTL(pOut: [*c]ImVec2, self: [*c]ImRect) void;
pub extern fn ImRect_GetTR(pOut: [*c]ImVec2, self: [*c]ImRect) void;
pub extern fn ImRect_GetBL(pOut: [*c]ImVec2, self: [*c]ImRect) void;
pub extern fn ImRect_GetBR(pOut: [*c]ImVec2, self: [*c]ImRect) void;
pub extern fn ImRect_Contains_Vec2(self: [*c]ImRect, p: ImVec2) bool;
pub extern fn ImRect_Contains_Rect(self: [*c]ImRect, r: ImRect) bool;
pub extern fn ImRect_ContainsWithPad(self: [*c]ImRect, p: ImVec2, pad: ImVec2) bool;
pub extern fn ImRect_Overlaps(self: [*c]ImRect, r: ImRect) bool;
pub extern fn ImRect_Add_Vec2(self: [*c]ImRect, p: ImVec2) void;
pub extern fn ImRect_Add_Rect(self: [*c]ImRect, r: ImRect) void;
pub extern fn ImRect_Expand_Float(self: [*c]ImRect, amount: f32) void;
pub extern fn ImRect_Expand_Vec2(self: [*c]ImRect, amount: ImVec2) void;
pub extern fn ImRect_Translate(self: [*c]ImRect, d: ImVec2) void;
pub extern fn ImRect_TranslateX(self: [*c]ImRect, dx: f32) void;
pub extern fn ImRect_TranslateY(self: [*c]ImRect, dy: f32) void;
pub extern fn ImRect_ClipWith(self: [*c]ImRect, r: ImRect) void;
pub extern fn ImRect_ClipWithFull(self: [*c]ImRect, r: ImRect) void;
pub extern fn ImRect_Floor(self: [*c]ImRect) void;
pub extern fn ImRect_IsInverted(self: [*c]ImRect) bool;
pub extern fn ImRect_ToVec4(pOut: [*c]ImVec4, self: [*c]ImRect) void;
pub extern fn igImBitArrayGetStorageSizeInBytes(bitcount: c_int) usize;
pub extern fn igImBitArrayClearAllBits(arr: [*c]ImU32, bitcount: c_int) void;
pub extern fn igImBitArrayTestBit(arr: [*c]const ImU32, n: c_int) bool;
pub extern fn igImBitArrayClearBit(arr: [*c]ImU32, n: c_int) void;
pub extern fn igImBitArraySetBit(arr: [*c]ImU32, n: c_int) void;
pub extern fn igImBitArraySetBitRange(arr: [*c]ImU32, n: c_int, n2: c_int) void;
pub extern fn ImBitVector_Create(self: [*c]ImBitVector, sz: c_int) void;
pub extern fn ImBitVector_Clear(self: [*c]ImBitVector) void;
pub extern fn ImBitVector_TestBit(self: [*c]ImBitVector, n: c_int) bool;
pub extern fn ImBitVector_SetBit(self: [*c]ImBitVector, n: c_int) void;
pub extern fn ImBitVector_ClearBit(self: [*c]ImBitVector, n: c_int) void;
pub extern fn ImGuiTextIndex_clear(self: [*c]ImGuiTextIndex) void;
pub extern fn ImGuiTextIndex_size(self: [*c]ImGuiTextIndex) c_int;
pub extern fn ImGuiTextIndex_get_line_begin(self: [*c]ImGuiTextIndex, base: [*c]const u8, n: c_int) [*c]const u8;
pub extern fn ImGuiTextIndex_get_line_end(self: [*c]ImGuiTextIndex, base: [*c]const u8, n: c_int) [*c]const u8;
pub extern fn ImGuiTextIndex_append(self: [*c]ImGuiTextIndex, base: [*c]const u8, old_size: c_int, new_size: c_int) void;
pub extern fn ImDrawListSharedData_ImDrawListSharedData() [*c]ImDrawListSharedData;
pub extern fn ImDrawListSharedData_destroy(self: [*c]ImDrawListSharedData) void;
pub extern fn ImDrawListSharedData_SetCircleTessellationMaxError(self: [*c]ImDrawListSharedData, max_error: f32) void;
pub extern fn ImDrawDataBuilder_ImDrawDataBuilder() [*c]ImDrawDataBuilder;
pub extern fn ImDrawDataBuilder_destroy(self: [*c]ImDrawDataBuilder) void;
pub extern fn ImGuiStyleMod_ImGuiStyleMod_Int(idx: ImGuiStyleVar, v: c_int) [*c]ImGuiStyleMod;
pub extern fn ImGuiStyleMod_destroy(self: [*c]ImGuiStyleMod) void;
pub extern fn ImGuiStyleMod_ImGuiStyleMod_Float(idx: ImGuiStyleVar, v: f32) [*c]ImGuiStyleMod;
pub extern fn ImGuiStyleMod_ImGuiStyleMod_Vec2(idx: ImGuiStyleVar, v: ImVec2) [*c]ImGuiStyleMod;
pub extern fn ImGuiComboPreviewData_ImGuiComboPreviewData() [*c]ImGuiComboPreviewData;
pub extern fn ImGuiComboPreviewData_destroy(self: [*c]ImGuiComboPreviewData) void;
pub extern fn ImGuiMenuColumns_ImGuiMenuColumns() [*c]ImGuiMenuColumns;
pub extern fn ImGuiMenuColumns_destroy(self: [*c]ImGuiMenuColumns) void;
pub extern fn ImGuiMenuColumns_Update(self: [*c]ImGuiMenuColumns, spacing: f32, window_reappearing: bool) void;
pub extern fn ImGuiMenuColumns_DeclColumns(self: [*c]ImGuiMenuColumns, w_icon: f32, w_label: f32, w_shortcut: f32, w_mark: f32) f32;
pub extern fn ImGuiMenuColumns_CalcNextTotalWidth(self: [*c]ImGuiMenuColumns, update_offsets: bool) void;
pub extern fn ImGuiInputTextDeactivatedState_ImGuiInputTextDeactivatedState() [*c]ImGuiInputTextDeactivatedState;
pub extern fn ImGuiInputTextDeactivatedState_destroy(self: [*c]ImGuiInputTextDeactivatedState) void;
pub extern fn ImGuiInputTextDeactivatedState_ClearFreeMemory(self: [*c]ImGuiInputTextDeactivatedState) void;
pub extern fn ImGuiInputTextState_ImGuiInputTextState() [*c]ImGuiInputTextState;
pub extern fn ImGuiInputTextState_destroy(self: [*c]ImGuiInputTextState) void;
pub extern fn ImGuiInputTextState_ClearText(self: [*c]ImGuiInputTextState) void;
pub extern fn ImGuiInputTextState_ClearFreeMemory(self: [*c]ImGuiInputTextState) void;
pub extern fn ImGuiInputTextState_GetUndoAvailCount(self: [*c]ImGuiInputTextState) c_int;
pub extern fn ImGuiInputTextState_GetRedoAvailCount(self: [*c]ImGuiInputTextState) c_int;
pub extern fn ImGuiInputTextState_OnKeyPressed(self: [*c]ImGuiInputTextState, key: c_int) void;
pub extern fn ImGuiInputTextState_CursorAnimReset(self: [*c]ImGuiInputTextState) void;
pub extern fn ImGuiInputTextState_CursorClamp(self: [*c]ImGuiInputTextState) void;
pub extern fn ImGuiInputTextState_HasSelection(self: [*c]ImGuiInputTextState) bool;
pub extern fn ImGuiInputTextState_ClearSelection(self: [*c]ImGuiInputTextState) void;
pub extern fn ImGuiInputTextState_GetCursorPos(self: [*c]ImGuiInputTextState) c_int;
pub extern fn ImGuiInputTextState_GetSelectionStart(self: [*c]ImGuiInputTextState) c_int;
pub extern fn ImGuiInputTextState_GetSelectionEnd(self: [*c]ImGuiInputTextState) c_int;
pub extern fn ImGuiInputTextState_SelectAll(self: [*c]ImGuiInputTextState) void;
pub extern fn ImGuiInputTextState_ReloadUserBufAndSelectAll(self: [*c]ImGuiInputTextState) void;
pub extern fn ImGuiInputTextState_ReloadUserBufAndKeepSelection(self: [*c]ImGuiInputTextState) void;
pub extern fn ImGuiInputTextState_ReloadUserBufAndMoveToEnd(self: [*c]ImGuiInputTextState) void;
pub extern fn ImGuiNextWindowData_ImGuiNextWindowData() [*c]ImGuiNextWindowData;
pub extern fn ImGuiNextWindowData_destroy(self: [*c]ImGuiNextWindowData) void;
pub extern fn ImGuiNextWindowData_ClearFlags(self: [*c]ImGuiNextWindowData) void;
pub extern fn ImGuiNextItemData_ImGuiNextItemData() ?*ImGuiNextItemData;
pub extern fn ImGuiNextItemData_destroy(self: ?*ImGuiNextItemData) void;
pub extern fn ImGuiNextItemData_ClearFlags(self: ?*ImGuiNextItemData) void;
pub extern fn ImGuiLastItemData_ImGuiLastItemData() [*c]ImGuiLastItemData;
pub extern fn ImGuiLastItemData_destroy(self: [*c]ImGuiLastItemData) void;
pub extern fn ImGuiStackSizes_ImGuiStackSizes() [*c]ImGuiStackSizes;
pub extern fn ImGuiStackSizes_destroy(self: [*c]ImGuiStackSizes) void;
pub extern fn ImGuiStackSizes_SetToContextState(self: [*c]ImGuiStackSizes, ctx: ?*ImGuiContext) void;
pub extern fn ImGuiStackSizes_CompareWithContextState(self: [*c]ImGuiStackSizes, ctx: ?*ImGuiContext) void;
pub extern fn ImGuiPtrOrIndex_ImGuiPtrOrIndex_Ptr(ptr: ?*anyopaque) [*c]ImGuiPtrOrIndex;
pub extern fn ImGuiPtrOrIndex_destroy(self: [*c]ImGuiPtrOrIndex) void;
pub extern fn ImGuiPtrOrIndex_ImGuiPtrOrIndex_Int(index: c_int) [*c]ImGuiPtrOrIndex;
pub extern fn ImGuiDataVarInfo_GetVarPtr(self: [*c]ImGuiDataVarInfo, parent: ?*anyopaque) ?*anyopaque;
pub extern fn ImGuiPopupData_ImGuiPopupData() [*c]ImGuiPopupData;
pub extern fn ImGuiPopupData_destroy(self: [*c]ImGuiPopupData) void;
pub extern fn ImGuiInputEvent_ImGuiInputEvent() [*c]ImGuiInputEvent;
pub extern fn ImGuiInputEvent_destroy(self: [*c]ImGuiInputEvent) void;
pub extern fn ImGuiKeyRoutingData_ImGuiKeyRoutingData() [*c]ImGuiKeyRoutingData;
pub extern fn ImGuiKeyRoutingData_destroy(self: [*c]ImGuiKeyRoutingData) void;
pub extern fn ImGuiKeyRoutingTable_ImGuiKeyRoutingTable() [*c]ImGuiKeyRoutingTable;
pub extern fn ImGuiKeyRoutingTable_destroy(self: [*c]ImGuiKeyRoutingTable) void;
pub extern fn ImGuiKeyRoutingTable_Clear(self: [*c]ImGuiKeyRoutingTable) void;
pub extern fn ImGuiKeyOwnerData_ImGuiKeyOwnerData() [*c]ImGuiKeyOwnerData;
pub extern fn ImGuiKeyOwnerData_destroy(self: [*c]ImGuiKeyOwnerData) void;
pub extern fn ImGuiListClipperRange_FromIndices(min: c_int, max: c_int) ImGuiListClipperRange;
pub extern fn ImGuiListClipperRange_FromPositions(y1: f32, y2: f32, off_min: c_int, off_max: c_int) ImGuiListClipperRange;
pub extern fn ImGuiListClipperData_ImGuiListClipperData() [*c]ImGuiListClipperData;
pub extern fn ImGuiListClipperData_destroy(self: [*c]ImGuiListClipperData) void;
pub extern fn ImGuiListClipperData_Reset(self: [*c]ImGuiListClipperData, clipper: [*c]ImGuiListClipper) void;
pub extern fn ImGuiNavItemData_ImGuiNavItemData() [*c]ImGuiNavItemData;
pub extern fn ImGuiNavItemData_destroy(self: [*c]ImGuiNavItemData) void;
pub extern fn ImGuiNavItemData_Clear(self: [*c]ImGuiNavItemData) void;
pub extern fn ImGuiTypingSelectState_ImGuiTypingSelectState() [*c]ImGuiTypingSelectState;
pub extern fn ImGuiTypingSelectState_destroy(self: [*c]ImGuiTypingSelectState) void;
pub extern fn ImGuiTypingSelectState_Clear(self: [*c]ImGuiTypingSelectState) void;
pub extern fn ImGuiOldColumnData_ImGuiOldColumnData() [*c]ImGuiOldColumnData;
pub extern fn ImGuiOldColumnData_destroy(self: [*c]ImGuiOldColumnData) void;
pub extern fn ImGuiOldColumns_ImGuiOldColumns() [*c]ImGuiOldColumns;
pub extern fn ImGuiOldColumns_destroy(self: [*c]ImGuiOldColumns) void;
pub extern fn ImGuiDockNode_ImGuiDockNode(id: ImGuiID) ?*ImGuiDockNode;
pub extern fn ImGuiDockNode_destroy(self: ?*ImGuiDockNode) void;
pub extern fn ImGuiDockNode_IsRootNode(self: ?*ImGuiDockNode) bool;
pub extern fn ImGuiDockNode_IsDockSpace(self: ?*ImGuiDockNode) bool;
pub extern fn ImGuiDockNode_IsFloatingNode(self: ?*ImGuiDockNode) bool;
pub extern fn ImGuiDockNode_IsCentralNode(self: ?*ImGuiDockNode) bool;
pub extern fn ImGuiDockNode_IsHiddenTabBar(self: ?*ImGuiDockNode) bool;
pub extern fn ImGuiDockNode_IsNoTabBar(self: ?*ImGuiDockNode) bool;
pub extern fn ImGuiDockNode_IsSplitNode(self: ?*ImGuiDockNode) bool;
pub extern fn ImGuiDockNode_IsLeafNode(self: ?*ImGuiDockNode) bool;
pub extern fn ImGuiDockNode_IsEmpty(self: ?*ImGuiDockNode) bool;
pub extern fn ImGuiDockNode_Rect(pOut: [*c]ImRect, self: ?*ImGuiDockNode) void;
pub extern fn ImGuiDockNode_SetLocalFlags(self: ?*ImGuiDockNode, flags: ImGuiDockNodeFlags) void;
pub extern fn ImGuiDockNode_UpdateMergedFlags(self: ?*ImGuiDockNode) void;
pub extern fn ImGuiDockContext_ImGuiDockContext() [*c]ImGuiDockContext;
pub extern fn ImGuiDockContext_destroy(self: [*c]ImGuiDockContext) void;
pub extern fn ImGuiViewportP_ImGuiViewportP() [*c]ImGuiViewportP;
pub extern fn ImGuiViewportP_destroy(self: [*c]ImGuiViewportP) void;
pub extern fn ImGuiViewportP_ClearRequestFlags(self: [*c]ImGuiViewportP) void;
pub extern fn ImGuiViewportP_CalcWorkRectPos(pOut: [*c]ImVec2, self: [*c]ImGuiViewportP, off_min: ImVec2) void;
pub extern fn ImGuiViewportP_CalcWorkRectSize(pOut: [*c]ImVec2, self: [*c]ImGuiViewportP, off_min: ImVec2, off_max: ImVec2) void;
pub extern fn ImGuiViewportP_UpdateWorkRect(self: [*c]ImGuiViewportP) void;
pub extern fn ImGuiViewportP_GetMainRect(pOut: [*c]ImRect, self: [*c]ImGuiViewportP) void;
pub extern fn ImGuiViewportP_GetWorkRect(pOut: [*c]ImRect, self: [*c]ImGuiViewportP) void;
pub extern fn ImGuiViewportP_GetBuildWorkRect(pOut: [*c]ImRect, self: [*c]ImGuiViewportP) void;
pub extern fn ImGuiWindowSettings_ImGuiWindowSettings() [*c]ImGuiWindowSettings;
pub extern fn ImGuiWindowSettings_destroy(self: [*c]ImGuiWindowSettings) void;
pub extern fn ImGuiWindowSettings_GetName(self: [*c]ImGuiWindowSettings) [*c]u8;
pub extern fn ImGuiSettingsHandler_ImGuiSettingsHandler() [*c]ImGuiSettingsHandler;
pub extern fn ImGuiSettingsHandler_destroy(self: [*c]ImGuiSettingsHandler) void;
pub extern fn ImGuiDebugAllocInfo_ImGuiDebugAllocInfo() [*c]ImGuiDebugAllocInfo;
pub extern fn ImGuiDebugAllocInfo_destroy(self: [*c]ImGuiDebugAllocInfo) void;
pub extern fn ImGuiStackLevelInfo_ImGuiStackLevelInfo() ?*ImGuiStackLevelInfo;
pub extern fn ImGuiStackLevelInfo_destroy(self: ?*ImGuiStackLevelInfo) void;
pub extern fn ImGuiIDStackTool_ImGuiIDStackTool() [*c]ImGuiIDStackTool;
pub extern fn ImGuiIDStackTool_destroy(self: [*c]ImGuiIDStackTool) void;
pub extern fn ImGuiContextHook_ImGuiContextHook() [*c]ImGuiContextHook;
pub extern fn ImGuiContextHook_destroy(self: [*c]ImGuiContextHook) void;
pub extern fn ImGuiContext_ImGuiContext(shared_font_atlas: [*c]ImFontAtlas) ?*ImGuiContext;
pub extern fn ImGuiContext_destroy(self: ?*ImGuiContext) void;
pub extern fn ImGuiWindow_ImGuiWindow(context: ?*ImGuiContext, name: [*c]const u8) ?*ImGuiWindow;
pub extern fn ImGuiWindow_destroy(self: ?*ImGuiWindow) void;
pub extern fn ImGuiWindow_GetID_Str(self: ?*ImGuiWindow, str: [*c]const u8, str_end: [*c]const u8) ImGuiID;
pub extern fn ImGuiWindow_GetID_Ptr(self: ?*ImGuiWindow, ptr: ?*const anyopaque) ImGuiID;
pub extern fn ImGuiWindow_GetID_Int(self: ?*ImGuiWindow, n: c_int) ImGuiID;
pub extern fn ImGuiWindow_GetIDFromRectangle(self: ?*ImGuiWindow, r_abs: ImRect) ImGuiID;
pub extern fn ImGuiWindow_Rect(pOut: [*c]ImRect, self: ?*ImGuiWindow) void;
pub extern fn ImGuiWindow_CalcFontSize(self: ?*ImGuiWindow) f32;
pub extern fn ImGuiWindow_TitleBarHeight(self: ?*ImGuiWindow) f32;
pub extern fn ImGuiWindow_TitleBarRect(pOut: [*c]ImRect, self: ?*ImGuiWindow) void;
pub extern fn ImGuiWindow_MenuBarHeight(self: ?*ImGuiWindow) f32;
pub extern fn ImGuiWindow_MenuBarRect(pOut: [*c]ImRect, self: ?*ImGuiWindow) void;
pub extern fn ImGuiTabItem_ImGuiTabItem() [*c]ImGuiTabItem;
pub extern fn ImGuiTabItem_destroy(self: [*c]ImGuiTabItem) void;
pub extern fn ImGuiTabBar_ImGuiTabBar() [*c]ImGuiTabBar;
pub extern fn ImGuiTabBar_destroy(self: [*c]ImGuiTabBar) void;
pub extern fn ImGuiTableColumn_ImGuiTableColumn() ?*ImGuiTableColumn;
pub extern fn ImGuiTableColumn_destroy(self: ?*ImGuiTableColumn) void;
pub extern fn ImGuiTableInstanceData_ImGuiTableInstanceData() [*c]ImGuiTableInstanceData;
pub extern fn ImGuiTableInstanceData_destroy(self: [*c]ImGuiTableInstanceData) void;
pub extern fn ImGuiTable_ImGuiTable() ?*ImGuiTable;
pub extern fn ImGuiTable_destroy(self: ?*ImGuiTable) void;
pub extern fn ImGuiTableTempData_ImGuiTableTempData() [*c]ImGuiTableTempData;
pub extern fn ImGuiTableTempData_destroy(self: [*c]ImGuiTableTempData) void;
pub extern fn ImGuiTableColumnSettings_ImGuiTableColumnSettings() ?*ImGuiTableColumnSettings;
pub extern fn ImGuiTableColumnSettings_destroy(self: ?*ImGuiTableColumnSettings) void;
pub extern fn ImGuiTableSettings_ImGuiTableSettings() [*c]ImGuiTableSettings;
pub extern fn ImGuiTableSettings_destroy(self: [*c]ImGuiTableSettings) void;
pub extern fn ImGuiTableSettings_GetColumnSettings(self: [*c]ImGuiTableSettings) ?*ImGuiTableColumnSettings;
pub extern fn igGetCurrentWindowRead() ?*ImGuiWindow;
pub extern fn igGetCurrentWindow() ?*ImGuiWindow;
pub extern fn igFindWindowByID(id: ImGuiID) ?*ImGuiWindow;
pub extern fn igFindWindowByName(name: [*c]const u8) ?*ImGuiWindow;
pub extern fn igUpdateWindowParentAndRootLinks(window: ?*ImGuiWindow, flags: ImGuiWindowFlags, parent_window: ?*ImGuiWindow) void;
pub extern fn igUpdateWindowSkipRefresh(window: ?*ImGuiWindow) void;
pub extern fn igCalcWindowNextAutoFitSize(pOut: [*c]ImVec2, window: ?*ImGuiWindow) void;
pub extern fn igIsWindowChildOf(window: ?*ImGuiWindow, potential_parent: ?*ImGuiWindow, popup_hierarchy: bool, dock_hierarchy: bool) bool;
pub extern fn igIsWindowWithinBeginStackOf(window: ?*ImGuiWindow, potential_parent: ?*ImGuiWindow) bool;
pub extern fn igIsWindowAbove(potential_above: ?*ImGuiWindow, potential_below: ?*ImGuiWindow) bool;
pub extern fn igIsWindowNavFocusable(window: ?*ImGuiWindow) bool;
pub extern fn igSetWindowPos_WindowPtr(window: ?*ImGuiWindow, pos: ImVec2, cond: ImGuiCond) void;
pub extern fn igSetWindowSize_WindowPtr(window: ?*ImGuiWindow, size: ImVec2, cond: ImGuiCond) void;
pub extern fn igSetWindowCollapsed_WindowPtr(window: ?*ImGuiWindow, collapsed: bool, cond: ImGuiCond) void;
pub extern fn igSetWindowHitTestHole(window: ?*ImGuiWindow, pos: ImVec2, size: ImVec2) void;
pub extern fn igSetWindowHiddenAndSkipItemsForCurrentFrame(window: ?*ImGuiWindow) void;
pub extern fn igSetWindowParentWindowForFocusRoute(window: ?*ImGuiWindow, parent_window: ?*ImGuiWindow) void;
pub extern fn igWindowRectAbsToRel(pOut: [*c]ImRect, window: ?*ImGuiWindow, r: ImRect) void;
pub extern fn igWindowRectRelToAbs(pOut: [*c]ImRect, window: ?*ImGuiWindow, r: ImRect) void;
pub extern fn igWindowPosRelToAbs(pOut: [*c]ImVec2, window: ?*ImGuiWindow, p: ImVec2) void;
pub extern fn igFocusWindow(window: ?*ImGuiWindow, flags: ImGuiFocusRequestFlags) void;
pub extern fn igFocusTopMostWindowUnderOne(under_this_window: ?*ImGuiWindow, ignore_window: ?*ImGuiWindow, filter_viewport: [*c]ImGuiViewport, flags: ImGuiFocusRequestFlags) void;
pub extern fn igBringWindowToFocusFront(window: ?*ImGuiWindow) void;
pub extern fn igBringWindowToDisplayFront(window: ?*ImGuiWindow) void;
pub extern fn igBringWindowToDisplayBack(window: ?*ImGuiWindow) void;
pub extern fn igBringWindowToDisplayBehind(window: ?*ImGuiWindow, above_window: ?*ImGuiWindow) void;
pub extern fn igFindWindowDisplayIndex(window: ?*ImGuiWindow) c_int;
pub extern fn igFindBottomMostVisibleWindowWithinBeginStack(window: ?*ImGuiWindow) ?*ImGuiWindow;
pub extern fn igSetNextWindowRefreshPolicy(flags: ImGuiWindowRefreshFlags) void;
pub extern fn igSetCurrentFont(font: [*c]ImFont) void;
pub extern fn igGetDefaultFont() [*c]ImFont;
pub extern fn igGetForegroundDrawList_WindowPtr(window: ?*ImGuiWindow) [*c]ImDrawList;
pub extern fn igAddDrawListToDrawDataEx(draw_data: [*c]ImDrawData, out_list: [*c]ImVector_ImDrawListPtr, draw_list: [*c]ImDrawList) void;
pub extern fn igInitialize() void;
pub extern fn igShutdown() void;
pub extern fn igUpdateInputEvents(trickle_fast_inputs: bool) void;
pub extern fn igUpdateHoveredWindowAndCaptureFlags() void;
pub extern fn igStartMouseMovingWindow(window: ?*ImGuiWindow) void;
pub extern fn igStartMouseMovingWindowOrNode(window: ?*ImGuiWindow, node: ?*ImGuiDockNode, undock: bool) void;
pub extern fn igUpdateMouseMovingWindowNewFrame() void;
pub extern fn igUpdateMouseMovingWindowEndFrame() void;
pub extern fn igAddContextHook(context: ?*ImGuiContext, hook: [*c]const ImGuiContextHook) ImGuiID;
pub extern fn igRemoveContextHook(context: ?*ImGuiContext, hook_to_remove: ImGuiID) void;
pub extern fn igCallContextHooks(context: ?*ImGuiContext, @"type": ImGuiContextHookType) void;
pub extern fn igTranslateWindowsInViewport(viewport: [*c]ImGuiViewportP, old_pos: ImVec2, new_pos: ImVec2) void;
pub extern fn igScaleWindowsInViewport(viewport: [*c]ImGuiViewportP, scale: f32) void;
pub extern fn igDestroyPlatformWindow(viewport: [*c]ImGuiViewportP) void;
pub extern fn igSetWindowViewport(window: ?*ImGuiWindow, viewport: [*c]ImGuiViewportP) void;
pub extern fn igSetCurrentViewport(window: ?*ImGuiWindow, viewport: [*c]ImGuiViewportP) void;
pub extern fn igGetViewportPlatformMonitor(viewport: [*c]ImGuiViewport) [*c]const ImGuiPlatformMonitor;
pub extern fn igFindHoveredViewportFromPlatformWindowStack(mouse_platform_pos: ImVec2) [*c]ImGuiViewportP;
pub extern fn igMarkIniSettingsDirty_Nil() void;
pub extern fn igMarkIniSettingsDirty_WindowPtr(window: ?*ImGuiWindow) void;
pub extern fn igClearIniSettings() void;
pub extern fn igAddSettingsHandler(handler: [*c]const ImGuiSettingsHandler) void;
pub extern fn igRemoveSettingsHandler(type_name: [*c]const u8) void;
pub extern fn igFindSettingsHandler(type_name: [*c]const u8) [*c]ImGuiSettingsHandler;
pub extern fn igCreateNewWindowSettings(name: [*c]const u8) [*c]ImGuiWindowSettings;
pub extern fn igFindWindowSettingsByID(id: ImGuiID) [*c]ImGuiWindowSettings;
pub extern fn igFindWindowSettingsByWindow(window: ?*ImGuiWindow) [*c]ImGuiWindowSettings;
pub extern fn igClearWindowSettings(name: [*c]const u8) void;
pub extern fn igLocalizeRegisterEntries(entries: [*c]const ImGuiLocEntry, count: c_int) void;
pub extern fn igLocalizeGetMsg(key: ImGuiLocKey) [*c]const u8;
pub extern fn igSetScrollX_WindowPtr(window: ?*ImGuiWindow, scroll_x: f32) void;
pub extern fn igSetScrollY_WindowPtr(window: ?*ImGuiWindow, scroll_y: f32) void;
pub extern fn igSetScrollFromPosX_WindowPtr(window: ?*ImGuiWindow, local_x: f32, center_x_ratio: f32) void;
pub extern fn igSetScrollFromPosY_WindowPtr(window: ?*ImGuiWindow, local_y: f32, center_y_ratio: f32) void;
pub extern fn igScrollToItem(flags: ImGuiScrollFlags) void;
pub extern fn igScrollToRect(window: ?*ImGuiWindow, rect: ImRect, flags: ImGuiScrollFlags) void;
pub extern fn igScrollToRectEx(pOut: [*c]ImVec2, window: ?*ImGuiWindow, rect: ImRect, flags: ImGuiScrollFlags) void;
pub extern fn igScrollToBringRectIntoView(window: ?*ImGuiWindow, rect: ImRect) void;
pub extern fn igGetItemStatusFlags() ImGuiItemStatusFlags;
pub extern fn igGetItemFlags() ImGuiItemFlags;
pub extern fn igGetActiveID() ImGuiID;
pub extern fn igGetFocusID() ImGuiID;
pub extern fn igSetActiveID(id: ImGuiID, window: ?*ImGuiWindow) void;
pub extern fn igSetFocusID(id: ImGuiID, window: ?*ImGuiWindow) void;
pub extern fn igClearActiveID() void;
pub extern fn igGetHoveredID() ImGuiID;
pub extern fn igSetHoveredID(id: ImGuiID) void;
pub extern fn igKeepAliveID(id: ImGuiID) void;
pub extern fn igMarkItemEdited(id: ImGuiID) void;
pub extern fn igPushOverrideID(id: ImGuiID) void;
pub extern fn igGetIDWithSeed_Str(str_id_begin: [*c]const u8, str_id_end: [*c]const u8, seed: ImGuiID) ImGuiID;
pub extern fn igGetIDWithSeed_Int(n: c_int, seed: ImGuiID) ImGuiID;
pub extern fn igItemSize_Vec2(size: ImVec2, text_baseline_y: f32) void;
pub extern fn igItemSize_Rect(bb: ImRect, text_baseline_y: f32) void;
pub extern fn igItemAdd(bb: ImRect, id: ImGuiID, nav_bb: [*c]const ImRect, extra_flags: ImGuiItemFlags) bool;
pub extern fn igItemHoverable(bb: ImRect, id: ImGuiID, item_flags: ImGuiItemFlags) bool;
pub extern fn igIsWindowContentHoverable(window: ?*ImGuiWindow, flags: ImGuiHoveredFlags) bool;
pub extern fn igIsClippedEx(bb: ImRect, id: ImGuiID) bool;
pub extern fn igSetLastItemData(item_id: ImGuiID, in_flags: ImGuiItemFlags, status_flags: ImGuiItemStatusFlags, item_rect: ImRect) void;
pub extern fn igCalcItemSize(pOut: [*c]ImVec2, size: ImVec2, default_w: f32, default_h: f32) void;
pub extern fn igCalcWrapWidthForPos(pos: ImVec2, wrap_pos_x: f32) f32;
pub extern fn igPushMultiItemsWidths(components: c_int, width_full: f32) void;
pub extern fn igIsItemToggledSelection() bool;
pub extern fn igGetContentRegionMaxAbs(pOut: [*c]ImVec2) void;
pub extern fn igShrinkWidths(items: [*c]ImGuiShrinkWidthItem, count: c_int, width_excess: f32) void;
pub extern fn igPushItemFlag(option: ImGuiItemFlags, enabled: bool) void;
pub extern fn igPopItemFlag() void;
pub extern fn igGetStyleVarInfo(idx: ImGuiStyleVar) [*c]const ImGuiDataVarInfo;
pub extern fn igLogBegin(@"type": ImGuiLogType, auto_open_depth: c_int) void;
pub extern fn igLogToBuffer(auto_open_depth: c_int) void;
pub extern fn igLogRenderedText(ref_pos: [*c]const ImVec2, text: [*c]const u8, text_end: [*c]const u8) void;
pub extern fn igLogSetNextTextDecoration(prefix: [*c]const u8, suffix: [*c]const u8) void;
pub extern fn igBeginChildEx(name: [*c]const u8, id: ImGuiID, size_arg: ImVec2, child_flags: ImGuiChildFlags, window_flags: ImGuiWindowFlags) bool;
pub extern fn igOpenPopupEx(id: ImGuiID, popup_flags: ImGuiPopupFlags) void;
pub extern fn igClosePopupToLevel(remaining: c_int, restore_focus_to_window_under_popup: bool) void;
pub extern fn igClosePopupsOverWindow(ref_window: ?*ImGuiWindow, restore_focus_to_window_under_popup: bool) void;
pub extern fn igClosePopupsExceptModals() void;
pub extern fn igIsPopupOpen_ID(id: ImGuiID, popup_flags: ImGuiPopupFlags) bool;
pub extern fn igBeginPopupEx(id: ImGuiID, extra_flags: ImGuiWindowFlags) bool;
pub extern fn igBeginTooltipEx(tooltip_flags: ImGuiTooltipFlags, extra_window_flags: ImGuiWindowFlags) bool;
pub extern fn igBeginTooltipHidden() bool;
pub extern fn igGetPopupAllowedExtentRect(pOut: [*c]ImRect, window: ?*ImGuiWindow) void;
pub extern fn igGetTopMostPopupModal() ?*ImGuiWindow;
pub extern fn igGetTopMostAndVisiblePopupModal() ?*ImGuiWindow;
pub extern fn igFindBlockingModal(window: ?*ImGuiWindow) ?*ImGuiWindow;
pub extern fn igFindBestWindowPosForPopup(pOut: [*c]ImVec2, window: ?*ImGuiWindow) void;
pub extern fn igFindBestWindowPosForPopupEx(pOut: [*c]ImVec2, ref_pos: ImVec2, size: ImVec2, last_dir: [*c]ImGuiDir, r_outer: ImRect, r_avoid: ImRect, policy: ImGuiPopupPositionPolicy) void;
pub extern fn igBeginViewportSideBar(name: [*c]const u8, viewport: [*c]ImGuiViewport, dir: ImGuiDir, size: f32, window_flags: ImGuiWindowFlags) bool;
pub extern fn igBeginMenuEx(label: [*c]const u8, icon: [*c]const u8, enabled: bool) bool;
pub extern fn igMenuItemEx(label: [*c]const u8, icon: [*c]const u8, shortcut: [*c]const u8, selected: bool, enabled: bool) bool;
pub extern fn igBeginComboPopup(popup_id: ImGuiID, bb: ImRect, flags: ImGuiComboFlags) bool;
pub extern fn igBeginComboPreview() bool;
pub extern fn igEndComboPreview() void;
pub extern fn igNavInitWindow(window: ?*ImGuiWindow, force_reinit: bool) void;
pub extern fn igNavInitRequestApplyResult() void;
pub extern fn igNavMoveRequestButNoResultYet() bool;
pub extern fn igNavMoveRequestSubmit(move_dir: ImGuiDir, clip_dir: ImGuiDir, move_flags: ImGuiNavMoveFlags, scroll_flags: ImGuiScrollFlags) void;
pub extern fn igNavMoveRequestForward(move_dir: ImGuiDir, clip_dir: ImGuiDir, move_flags: ImGuiNavMoveFlags, scroll_flags: ImGuiScrollFlags) void;
pub extern fn igNavMoveRequestResolveWithLastItem(result: [*c]ImGuiNavItemData) void;
pub extern fn igNavMoveRequestResolveWithPastTreeNode(result: [*c]ImGuiNavItemData, tree_node_data: [*c]ImGuiNavTreeNodeData) void;
pub extern fn igNavMoveRequestCancel() void;
pub extern fn igNavMoveRequestApplyResult() void;
pub extern fn igNavMoveRequestTryWrapping(window: ?*ImGuiWindow, move_flags: ImGuiNavMoveFlags) void;
pub extern fn igNavHighlightActivated(id: ImGuiID) void;
pub extern fn igNavClearPreferredPosForAxis(axis: ImGuiAxis) void;
pub extern fn igNavRestoreHighlightAfterMove() void;
pub extern fn igNavUpdateCurrentWindowIsScrollPushableX() void;
pub extern fn igSetNavWindow(window: ?*ImGuiWindow) void;
pub extern fn igSetNavID(id: ImGuiID, nav_layer: ImGuiNavLayer, focus_scope_id: ImGuiID, rect_rel: ImRect) void;
pub extern fn igSetNavFocusScope(focus_scope_id: ImGuiID) void;
pub extern fn igFocusItem() void;
pub extern fn igActivateItemByID(id: ImGuiID) void;
pub extern fn igIsNamedKey(key: ImGuiKey) bool;
pub extern fn igIsNamedKeyOrModKey(key: ImGuiKey) bool;
pub extern fn igIsLegacyKey(key: ImGuiKey) bool;
pub extern fn igIsKeyboardKey(key: ImGuiKey) bool;
pub extern fn igIsGamepadKey(key: ImGuiKey) bool;
pub extern fn igIsMouseKey(key: ImGuiKey) bool;
pub extern fn igIsAliasKey(key: ImGuiKey) bool;
pub extern fn igIsModKey(key: ImGuiKey) bool;
pub extern fn igFixupKeyChord(ctx: ?*ImGuiContext, key_chord: ImGuiKeyChord) ImGuiKeyChord;
pub extern fn igConvertSingleModFlagToKey(ctx: ?*ImGuiContext, key: ImGuiKey) ImGuiKey;
pub extern fn igGetKeyData_ContextPtr(ctx: ?*ImGuiContext, key: ImGuiKey) [*c]ImGuiKeyData;
pub extern fn igGetKeyData_Key(key: ImGuiKey) [*c]ImGuiKeyData;
pub extern fn igGetKeyChordName(key_chord: ImGuiKeyChord) [*c]const u8;
pub extern fn igMouseButtonToKey(button: ImGuiMouseButton) ImGuiKey;
pub extern fn igIsMouseDragPastThreshold(button: ImGuiMouseButton, lock_threshold: f32) bool;
pub extern fn igGetKeyMagnitude2d(pOut: [*c]ImVec2, key_left: ImGuiKey, key_right: ImGuiKey, key_up: ImGuiKey, key_down: ImGuiKey) void;
pub extern fn igGetNavTweakPressedAmount(axis: ImGuiAxis) f32;
pub extern fn igCalcTypematicRepeatAmount(t0: f32, t1: f32, repeat_delay: f32, repeat_rate: f32) c_int;
pub extern fn igGetTypematicRepeatRate(flags: ImGuiInputFlags, repeat_delay: [*c]f32, repeat_rate: [*c]f32) void;
pub extern fn igTeleportMousePos(pos: ImVec2) void;
pub extern fn igSetActiveIdUsingAllKeyboardKeys() void;
pub extern fn igIsActiveIdUsingNavDir(dir: ImGuiDir) bool;
pub extern fn igGetKeyOwner(key: ImGuiKey) ImGuiID;
pub extern fn igSetKeyOwner(key: ImGuiKey, owner_id: ImGuiID, flags: ImGuiInputFlags) void;
pub extern fn igSetKeyOwnersForKeyChord(key: ImGuiKeyChord, owner_id: ImGuiID, flags: ImGuiInputFlags) void;
pub extern fn igSetItemKeyOwner(key: ImGuiKey, flags: ImGuiInputFlags) void;
pub extern fn igTestKeyOwner(key: ImGuiKey, owner_id: ImGuiID) bool;
pub extern fn igGetKeyOwnerData(ctx: ?*ImGuiContext, key: ImGuiKey) [*c]ImGuiKeyOwnerData;
pub extern fn igIsKeyDown_ID(key: ImGuiKey, owner_id: ImGuiID) bool;
pub extern fn igIsKeyPressed_ID(key: ImGuiKey, owner_id: ImGuiID, flags: ImGuiInputFlags) bool;
pub extern fn igIsKeyReleased_ID(key: ImGuiKey, owner_id: ImGuiID) bool;
pub extern fn igIsMouseDown_ID(button: ImGuiMouseButton, owner_id: ImGuiID) bool;
pub extern fn igIsMouseClicked_ID(button: ImGuiMouseButton, owner_id: ImGuiID, flags: ImGuiInputFlags) bool;
pub extern fn igIsMouseReleased_ID(button: ImGuiMouseButton, owner_id: ImGuiID) bool;
pub extern fn igIsMouseDoubleClicked_ID(button: ImGuiMouseButton, owner_id: ImGuiID) bool;
pub extern fn igIsKeyChordPressed_ID(key_chord: ImGuiKeyChord, owner_id: ImGuiID, flags: ImGuiInputFlags) bool;
pub extern fn igSetNextItemShortcut(key_chord: ImGuiKeyChord) void;
pub extern fn igShortcut(key_chord: ImGuiKeyChord, owner_id: ImGuiID, flags: ImGuiInputFlags) bool;
pub extern fn igSetShortcutRouting(key_chord: ImGuiKeyChord, owner_id: ImGuiID, flags: ImGuiInputFlags) bool;
pub extern fn igTestShortcutRouting(key_chord: ImGuiKeyChord, owner_id: ImGuiID) bool;
pub extern fn igGetShortcutRoutingData(key_chord: ImGuiKeyChord) [*c]ImGuiKeyRoutingData;
pub extern fn igDockContextInitialize(ctx: ?*ImGuiContext) void;
pub extern fn igDockContextShutdown(ctx: ?*ImGuiContext) void;
pub extern fn igDockContextClearNodes(ctx: ?*ImGuiContext, root_id: ImGuiID, clear_settings_refs: bool) void;
pub extern fn igDockContextRebuildNodes(ctx: ?*ImGuiContext) void;
pub extern fn igDockContextNewFrameUpdateUndocking(ctx: ?*ImGuiContext) void;
pub extern fn igDockContextNewFrameUpdateDocking(ctx: ?*ImGuiContext) void;
pub extern fn igDockContextEndFrame(ctx: ?*ImGuiContext) void;
pub extern fn igDockContextGenNodeID(ctx: ?*ImGuiContext) ImGuiID;
pub extern fn igDockContextQueueDock(ctx: ?*ImGuiContext, target: ?*ImGuiWindow, target_node: ?*ImGuiDockNode, payload: ?*ImGuiWindow, split_dir: ImGuiDir, split_ratio: f32, split_outer: bool) void;
pub extern fn igDockContextQueueUndockWindow(ctx: ?*ImGuiContext, window: ?*ImGuiWindow) void;
pub extern fn igDockContextQueueUndockNode(ctx: ?*ImGuiContext, node: ?*ImGuiDockNode) void;
pub extern fn igDockContextProcessUndockWindow(ctx: ?*ImGuiContext, window: ?*ImGuiWindow, clear_persistent_docking_ref: bool) void;
pub extern fn igDockContextProcessUndockNode(ctx: ?*ImGuiContext, node: ?*ImGuiDockNode) void;
pub extern fn igDockContextCalcDropPosForDocking(target: ?*ImGuiWindow, target_node: ?*ImGuiDockNode, payload_window: ?*ImGuiWindow, payload_node: ?*ImGuiDockNode, split_dir: ImGuiDir, split_outer: bool, out_pos: [*c]ImVec2) bool;
pub extern fn igDockContextFindNodeByID(ctx: ?*ImGuiContext, id: ImGuiID) ?*ImGuiDockNode;
pub extern fn igDockNodeWindowMenuHandler_Default(ctx: ?*ImGuiContext, node: ?*ImGuiDockNode, tab_bar: [*c]ImGuiTabBar) void;
pub extern fn igDockNodeBeginAmendTabBar(node: ?*ImGuiDockNode) bool;
pub extern fn igDockNodeEndAmendTabBar() void;
pub extern fn igDockNodeGetRootNode(node: ?*ImGuiDockNode) ?*ImGuiDockNode;
pub extern fn igDockNodeIsInHierarchyOf(node: ?*ImGuiDockNode, parent: ?*ImGuiDockNode) bool;
pub extern fn igDockNodeGetDepth(node: ?*const ImGuiDockNode) c_int;
pub extern fn igDockNodeGetWindowMenuButtonId(node: ?*const ImGuiDockNode) ImGuiID;
pub extern fn igGetWindowDockNode() ?*ImGuiDockNode;
pub extern fn igGetWindowAlwaysWantOwnTabBar(window: ?*ImGuiWindow) bool;
pub extern fn igBeginDocked(window: ?*ImGuiWindow, p_open: [*c]bool) void;
pub extern fn igBeginDockableDragDropSource(window: ?*ImGuiWindow) void;
pub extern fn igBeginDockableDragDropTarget(window: ?*ImGuiWindow) void;
pub extern fn igSetWindowDock(window: ?*ImGuiWindow, dock_id: ImGuiID, cond: ImGuiCond) void;
pub extern fn igDockBuilderDockWindow(window_name: [*c]const u8, node_id: ImGuiID) void;
pub extern fn igDockBuilderGetNode(node_id: ImGuiID) ?*ImGuiDockNode;
pub extern fn igDockBuilderGetCentralNode(node_id: ImGuiID) ?*ImGuiDockNode;
pub extern fn igDockBuilderAddNode(node_id: ImGuiID, flags: ImGuiDockNodeFlags) ImGuiID;
pub extern fn igDockBuilderRemoveNode(node_id: ImGuiID) void;
pub extern fn igDockBuilderRemoveNodeDockedWindows(node_id: ImGuiID, clear_settings_refs: bool) void;
pub extern fn igDockBuilderRemoveNodeChildNodes(node_id: ImGuiID) void;
pub extern fn igDockBuilderSetNodePos(node_id: ImGuiID, pos: ImVec2) void;
pub extern fn igDockBuilderSetNodeSize(node_id: ImGuiID, size: ImVec2) void;
pub extern fn igDockBuilderSplitNode(node_id: ImGuiID, split_dir: ImGuiDir, size_ratio_for_node_at_dir: f32, out_id_at_dir: [*c]ImGuiID, out_id_at_opposite_dir: [*c]ImGuiID) ImGuiID;
pub extern fn igDockBuilderCopyDockSpace(src_dockspace_id: ImGuiID, dst_dockspace_id: ImGuiID, in_window_remap_pairs: [*c]ImVector_const_charPtr) void;
pub extern fn igDockBuilderCopyNode(src_node_id: ImGuiID, dst_node_id: ImGuiID, out_node_remap_pairs: [*c]ImVector_ImGuiID) void;
pub extern fn igDockBuilderCopyWindowSettings(src_name: [*c]const u8, dst_name: [*c]const u8) void;
pub extern fn igDockBuilderFinish(node_id: ImGuiID) void;
pub extern fn igPushFocusScope(id: ImGuiID) void;
pub extern fn igPopFocusScope() void;
pub extern fn igGetCurrentFocusScope() ImGuiID;
pub extern fn igIsDragDropActive() bool;
pub extern fn igBeginDragDropTargetCustom(bb: ImRect, id: ImGuiID) bool;
pub extern fn igClearDragDrop() void;
pub extern fn igIsDragDropPayloadBeingAccepted() bool;
pub extern fn igRenderDragDropTargetRect(bb: ImRect, item_clip_rect: ImRect) void;
pub extern fn igGetTypingSelectRequest(flags: ImGuiTypingSelectFlags) [*c]ImGuiTypingSelectRequest;
pub extern fn igTypingSelectFindMatch(req: [*c]ImGuiTypingSelectRequest, items_count: c_int, get_item_name_func: ?*const fn (?*anyopaque, c_int) callconv(.C) [*c]const u8, user_data: ?*anyopaque, nav_item_idx: c_int) c_int;
pub extern fn igTypingSelectFindNextSingleCharMatch(req: [*c]ImGuiTypingSelectRequest, items_count: c_int, get_item_name_func: ?*const fn (?*anyopaque, c_int) callconv(.C) [*c]const u8, user_data: ?*anyopaque, nav_item_idx: c_int) c_int;
pub extern fn igTypingSelectFindBestLeadingMatch(req: [*c]ImGuiTypingSelectRequest, items_count: c_int, get_item_name_func: ?*const fn (?*anyopaque, c_int) callconv(.C) [*c]const u8, user_data: ?*anyopaque) c_int;
pub extern fn igSetWindowClipRectBeforeSetChannel(window: ?*ImGuiWindow, clip_rect: ImRect) void;
pub extern fn igBeginColumns(str_id: [*c]const u8, count: c_int, flags: ImGuiOldColumnFlags) void;
pub extern fn igEndColumns() void;
pub extern fn igPushColumnClipRect(column_index: c_int) void;
pub extern fn igPushColumnsBackground() void;
pub extern fn igPopColumnsBackground() void;
pub extern fn igGetColumnsID(str_id: [*c]const u8, count: c_int) ImGuiID;
pub extern fn igFindOrCreateColumns(window: ?*ImGuiWindow, id: ImGuiID) [*c]ImGuiOldColumns;
pub extern fn igGetColumnOffsetFromNorm(columns: [*c]const ImGuiOldColumns, offset_norm: f32) f32;
pub extern fn igGetColumnNormFromOffset(columns: [*c]const ImGuiOldColumns, offset: f32) f32;
pub extern fn igTableOpenContextMenu(column_n: c_int) void;
pub extern fn igTableSetColumnWidth(column_n: c_int, width: f32) void;
pub extern fn igTableSetColumnSortDirection(column_n: c_int, sort_direction: ImGuiSortDirection, append_to_sort_specs: bool) void;
pub extern fn igTableGetHoveredColumn() c_int;
pub extern fn igTableGetHoveredRow() c_int;
pub extern fn igTableGetHeaderRowHeight() f32;
pub extern fn igTableGetHeaderAngledMaxLabelWidth() f32;
pub extern fn igTablePushBackgroundChannel() void;
pub extern fn igTablePopBackgroundChannel() void;
pub extern fn igTableAngledHeadersRowEx(row_id: ImGuiID, angle: f32, max_label_width: f32, data: [*c]const ImGuiTableHeaderData, data_count: c_int) void;
pub extern fn igGetCurrentTable() ?*ImGuiTable;
pub extern fn igTableFindByID(id: ImGuiID) ?*ImGuiTable;
pub extern fn igBeginTableEx(name: [*c]const u8, id: ImGuiID, columns_count: c_int, flags: ImGuiTableFlags, outer_size: ImVec2, inner_width: f32) bool;
pub extern fn igTableBeginInitMemory(table: ?*ImGuiTable, columns_count: c_int) void;
pub extern fn igTableBeginApplyRequests(table: ?*ImGuiTable) void;
pub extern fn igTableSetupDrawChannels(table: ?*ImGuiTable) void;
pub extern fn igTableUpdateLayout(table: ?*ImGuiTable) void;
pub extern fn igTableUpdateBorders(table: ?*ImGuiTable) void;
pub extern fn igTableUpdateColumnsWeightFromWidth(table: ?*ImGuiTable) void;
pub extern fn igTableDrawBorders(table: ?*ImGuiTable) void;
pub extern fn igTableDrawDefaultContextMenu(table: ?*ImGuiTable, flags_for_section_to_display: ImGuiTableFlags) void;
pub extern fn igTableBeginContextMenuPopup(table: ?*ImGuiTable) bool;
pub extern fn igTableMergeDrawChannels(table: ?*ImGuiTable) void;
pub extern fn igTableGetInstanceData(table: ?*ImGuiTable, instance_no: c_int) [*c]ImGuiTableInstanceData;
pub extern fn igTableGetInstanceID(table: ?*ImGuiTable, instance_no: c_int) ImGuiID;
pub extern fn igTableSortSpecsSanitize(table: ?*ImGuiTable) void;
pub extern fn igTableSortSpecsBuild(table: ?*ImGuiTable) void;
pub extern fn igTableGetColumnNextSortDirection(column: ?*ImGuiTableColumn) ImGuiSortDirection;
pub extern fn igTableFixColumnSortDirection(table: ?*ImGuiTable, column: ?*ImGuiTableColumn) void;
pub extern fn igTableGetColumnWidthAuto(table: ?*ImGuiTable, column: ?*ImGuiTableColumn) f32;
pub extern fn igTableBeginRow(table: ?*ImGuiTable) void;
pub extern fn igTableEndRow(table: ?*ImGuiTable) void;
pub extern fn igTableBeginCell(table: ?*ImGuiTable, column_n: c_int) void;
pub extern fn igTableEndCell(table: ?*ImGuiTable) void;
pub extern fn igTableGetCellBgRect(pOut: [*c]ImRect, table: ?*const ImGuiTable, column_n: c_int) void;
pub extern fn igTableGetColumnName_TablePtr(table: ?*const ImGuiTable, column_n: c_int) [*c]const u8;
pub extern fn igTableGetColumnResizeID(table: ?*ImGuiTable, column_n: c_int, instance_no: c_int) ImGuiID;
pub extern fn igTableGetMaxColumnWidth(table: ?*const ImGuiTable, column_n: c_int) f32;
pub extern fn igTableSetColumnWidthAutoSingle(table: ?*ImGuiTable, column_n: c_int) void;
pub extern fn igTableSetColumnWidthAutoAll(table: ?*ImGuiTable) void;
pub extern fn igTableRemove(table: ?*ImGuiTable) void;
pub extern fn igTableGcCompactTransientBuffers_TablePtr(table: ?*ImGuiTable) void;
pub extern fn igTableGcCompactTransientBuffers_TableTempDataPtr(table: [*c]ImGuiTableTempData) void;
pub extern fn igTableGcCompactSettings() void;
pub extern fn igTableLoadSettings(table: ?*ImGuiTable) void;
pub extern fn igTableSaveSettings(table: ?*ImGuiTable) void;
pub extern fn igTableResetSettings(table: ?*ImGuiTable) void;
pub extern fn igTableGetBoundSettings(table: ?*ImGuiTable) [*c]ImGuiTableSettings;
pub extern fn igTableSettingsAddSettingsHandler() void;
pub extern fn igTableSettingsCreate(id: ImGuiID, columns_count: c_int) [*c]ImGuiTableSettings;
pub extern fn igTableSettingsFindByID(id: ImGuiID) [*c]ImGuiTableSettings;
pub extern fn igGetCurrentTabBar() [*c]ImGuiTabBar;
pub extern fn igBeginTabBarEx(tab_bar: [*c]ImGuiTabBar, bb: ImRect, flags: ImGuiTabBarFlags) bool;
pub extern fn igTabBarFindTabByID(tab_bar: [*c]ImGuiTabBar, tab_id: ImGuiID) [*c]ImGuiTabItem;
pub extern fn igTabBarFindTabByOrder(tab_bar: [*c]ImGuiTabBar, order: c_int) [*c]ImGuiTabItem;
pub extern fn igTabBarFindMostRecentlySelectedTabForActiveWindow(tab_bar: [*c]ImGuiTabBar) [*c]ImGuiTabItem;
pub extern fn igTabBarGetCurrentTab(tab_bar: [*c]ImGuiTabBar) [*c]ImGuiTabItem;
pub extern fn igTabBarGetTabOrder(tab_bar: [*c]ImGuiTabBar, tab: [*c]ImGuiTabItem) c_int;
pub extern fn igTabBarGetTabName(tab_bar: [*c]ImGuiTabBar, tab: [*c]ImGuiTabItem) [*c]const u8;
pub extern fn igTabBarAddTab(tab_bar: [*c]ImGuiTabBar, tab_flags: ImGuiTabItemFlags, window: ?*ImGuiWindow) void;
pub extern fn igTabBarRemoveTab(tab_bar: [*c]ImGuiTabBar, tab_id: ImGuiID) void;
pub extern fn igTabBarCloseTab(tab_bar: [*c]ImGuiTabBar, tab: [*c]ImGuiTabItem) void;
pub extern fn igTabBarQueueFocus(tab_bar: [*c]ImGuiTabBar, tab: [*c]ImGuiTabItem) void;
pub extern fn igTabBarQueueReorder(tab_bar: [*c]ImGuiTabBar, tab: [*c]ImGuiTabItem, offset: c_int) void;
pub extern fn igTabBarQueueReorderFromMousePos(tab_bar: [*c]ImGuiTabBar, tab: [*c]ImGuiTabItem, mouse_pos: ImVec2) void;
pub extern fn igTabBarProcessReorder(tab_bar: [*c]ImGuiTabBar) bool;
pub extern fn igTabItemEx(tab_bar: [*c]ImGuiTabBar, label: [*c]const u8, p_open: [*c]bool, flags: ImGuiTabItemFlags, docked_window: ?*ImGuiWindow) bool;
pub extern fn igTabItemCalcSize_Str(pOut: [*c]ImVec2, label: [*c]const u8, has_close_button_or_unsaved_marker: bool) void;
pub extern fn igTabItemCalcSize_WindowPtr(pOut: [*c]ImVec2, window: ?*ImGuiWindow) void;
pub extern fn igTabItemBackground(draw_list: [*c]ImDrawList, bb: ImRect, flags: ImGuiTabItemFlags, col: ImU32) void;
pub extern fn igTabItemLabelAndCloseButton(draw_list: [*c]ImDrawList, bb: ImRect, flags: ImGuiTabItemFlags, frame_padding: ImVec2, label: [*c]const u8, tab_id: ImGuiID, close_button_id: ImGuiID, is_contents_visible: bool, out_just_closed: [*c]bool, out_text_clipped: [*c]bool) void;
pub extern fn igRenderText(pos: ImVec2, text: [*c]const u8, text_end: [*c]const u8, hide_text_after_hash: bool) void;
pub extern fn igRenderTextWrapped(pos: ImVec2, text: [*c]const u8, text_end: [*c]const u8, wrap_width: f32) void;
pub extern fn igRenderTextClipped(pos_min: ImVec2, pos_max: ImVec2, text: [*c]const u8, text_end: [*c]const u8, text_size_if_known: [*c]const ImVec2, @"align": ImVec2, clip_rect: [*c]const ImRect) void;
pub extern fn igRenderTextClippedEx(draw_list: [*c]ImDrawList, pos_min: ImVec2, pos_max: ImVec2, text: [*c]const u8, text_end: [*c]const u8, text_size_if_known: [*c]const ImVec2, @"align": ImVec2, clip_rect: [*c]const ImRect) void;
pub extern fn igRenderTextEllipsis(draw_list: [*c]ImDrawList, pos_min: ImVec2, pos_max: ImVec2, clip_max_x: f32, ellipsis_max_x: f32, text: [*c]const u8, text_end: [*c]const u8, text_size_if_known: [*c]const ImVec2) void;
pub extern fn igRenderFrame(p_min: ImVec2, p_max: ImVec2, fill_col: ImU32, border: bool, rounding: f32) void;
pub extern fn igRenderFrameBorder(p_min: ImVec2, p_max: ImVec2, rounding: f32) void;
pub extern fn igRenderColorRectWithAlphaCheckerboard(draw_list: [*c]ImDrawList, p_min: ImVec2, p_max: ImVec2, fill_col: ImU32, grid_step: f32, grid_off: ImVec2, rounding: f32, flags: ImDrawFlags) void;
pub extern fn igRenderNavHighlight(bb: ImRect, id: ImGuiID, flags: ImGuiNavHighlightFlags) void;
pub extern fn igFindRenderedTextEnd(text: [*c]const u8, text_end: [*c]const u8) [*c]const u8;
pub extern fn igRenderMouseCursor(pos: ImVec2, scale: f32, mouse_cursor: ImGuiMouseCursor, col_fill: ImU32, col_border: ImU32, col_shadow: ImU32) void;
pub extern fn igRenderArrow(draw_list: [*c]ImDrawList, pos: ImVec2, col: ImU32, dir: ImGuiDir, scale: f32) void;
pub extern fn igRenderBullet(draw_list: [*c]ImDrawList, pos: ImVec2, col: ImU32) void;
pub extern fn igRenderCheckMark(draw_list: [*c]ImDrawList, pos: ImVec2, col: ImU32, sz: f32) void;
pub extern fn igRenderArrowPointingAt(draw_list: [*c]ImDrawList, pos: ImVec2, half_sz: ImVec2, direction: ImGuiDir, col: ImU32) void;
pub extern fn igRenderArrowDockMenu(draw_list: [*c]ImDrawList, p_min: ImVec2, sz: f32, col: ImU32) void;
pub extern fn igRenderRectFilledRangeH(draw_list: [*c]ImDrawList, rect: ImRect, col: ImU32, x_start_norm: f32, x_end_norm: f32, rounding: f32) void;
pub extern fn igRenderRectFilledWithHole(draw_list: [*c]ImDrawList, outer: ImRect, inner: ImRect, col: ImU32, rounding: f32) void;
pub extern fn igCalcRoundingFlagsForRectInRect(r_in: ImRect, r_outer: ImRect, threshold: f32) ImDrawFlags;
pub extern fn igTextEx(text: [*c]const u8, text_end: [*c]const u8, flags: ImGuiTextFlags) void;
pub extern fn igButtonEx(label: [*c]const u8, size_arg: ImVec2, flags: ImGuiButtonFlags) bool;
pub extern fn igArrowButtonEx(str_id: [*c]const u8, dir: ImGuiDir, size_arg: ImVec2, flags: ImGuiButtonFlags) bool;
pub extern fn igImageButtonEx(id: ImGuiID, texture_id: ImTextureID, image_size: ImVec2, uv0: ImVec2, uv1: ImVec2, bg_col: ImVec4, tint_col: ImVec4, flags: ImGuiButtonFlags) bool;
pub extern fn igSeparatorEx(flags: ImGuiSeparatorFlags, thickness: f32) void;
pub extern fn igSeparatorTextEx(id: ImGuiID, label: [*c]const u8, label_end: [*c]const u8, extra_width: f32) void;
pub extern fn igCheckboxFlags_S64Ptr(label: [*c]const u8, flags: [*c]ImS64, flags_value: ImS64) bool;
pub extern fn igCheckboxFlags_U64Ptr(label: [*c]const u8, flags: [*c]ImU64, flags_value: ImU64) bool;
pub extern fn igCloseButton(id: ImGuiID, pos: ImVec2) bool;
pub extern fn igCollapseButton(id: ImGuiID, pos: ImVec2, dock_node: ?*ImGuiDockNode) bool;
pub extern fn igScrollbar(axis: ImGuiAxis) void;
pub extern fn igScrollbarEx(bb: ImRect, id: ImGuiID, axis: ImGuiAxis, p_scroll_v: [*c]ImS64, avail_v: ImS64, contents_v: ImS64, flags: ImDrawFlags) bool;
pub extern fn igGetWindowScrollbarRect(pOut: [*c]ImRect, window: ?*ImGuiWindow, axis: ImGuiAxis) void;
pub extern fn igGetWindowScrollbarID(window: ?*ImGuiWindow, axis: ImGuiAxis) ImGuiID;
pub extern fn igGetWindowResizeCornerID(window: ?*ImGuiWindow, n: c_int) ImGuiID;
pub extern fn igGetWindowResizeBorderID(window: ?*ImGuiWindow, dir: ImGuiDir) ImGuiID;
pub extern fn igButtonBehavior(bb: ImRect, id: ImGuiID, out_hovered: [*c]bool, out_held: [*c]bool, flags: ImGuiButtonFlags) bool;
pub extern fn igDragBehavior(id: ImGuiID, data_type: ImGuiDataType, p_v: ?*anyopaque, v_speed: f32, p_min: ?*const anyopaque, p_max: ?*const anyopaque, format: [*c]const u8, flags: ImGuiSliderFlags) bool;
pub extern fn igSliderBehavior(bb: ImRect, id: ImGuiID, data_type: ImGuiDataType, p_v: ?*anyopaque, p_min: ?*const anyopaque, p_max: ?*const anyopaque, format: [*c]const u8, flags: ImGuiSliderFlags, out_grab_bb: [*c]ImRect) bool;
pub extern fn igSplitterBehavior(bb: ImRect, id: ImGuiID, axis: ImGuiAxis, size1: [*c]f32, size2: [*c]f32, min_size1: f32, min_size2: f32, hover_extend: f32, hover_visibility_delay: f32, bg_col: ImU32) bool;
pub extern fn igTreeNodeBehavior(id: ImGuiID, flags: ImGuiTreeNodeFlags, label: [*c]const u8, label_end: [*c]const u8) bool;
pub extern fn igTreePushOverrideID(id: ImGuiID) void;
pub extern fn igTreeNodeSetOpen(id: ImGuiID, open: bool) void;
pub extern fn igTreeNodeUpdateNextOpen(id: ImGuiID, flags: ImGuiTreeNodeFlags) bool;
pub extern fn igSetNextItemSelectionUserData(selection_user_data: ImGuiSelectionUserData) void;
pub extern fn igDataTypeGetInfo(data_type: ImGuiDataType) [*c]const ImGuiDataTypeInfo;
pub extern fn igDataTypeFormatString(buf: [*c]u8, buf_size: c_int, data_type: ImGuiDataType, p_data: ?*const anyopaque, format: [*c]const u8) c_int;
pub extern fn igDataTypeApplyOp(data_type: ImGuiDataType, op: c_int, output: ?*anyopaque, arg_1: ?*const anyopaque, arg_2: ?*const anyopaque) void;
pub extern fn igDataTypeApplyFromText(buf: [*c]const u8, data_type: ImGuiDataType, p_data: ?*anyopaque, format: [*c]const u8) bool;
pub extern fn igDataTypeCompare(data_type: ImGuiDataType, arg_1: ?*const anyopaque, arg_2: ?*const anyopaque) c_int;
pub extern fn igDataTypeClamp(data_type: ImGuiDataType, p_data: ?*anyopaque, p_min: ?*const anyopaque, p_max: ?*const anyopaque) bool;
pub extern fn igInputTextEx(label: [*c]const u8, hint: [*c]const u8, buf: [*c]u8, buf_size: c_int, size_arg: ImVec2, flags: ImGuiInputTextFlags, callback: ImGuiInputTextCallback, user_data: ?*anyopaque) bool;
pub extern fn igInputTextDeactivateHook(id: ImGuiID) void;
pub extern fn igTempInputText(bb: ImRect, id: ImGuiID, label: [*c]const u8, buf: [*c]u8, buf_size: c_int, flags: ImGuiInputTextFlags) bool;
pub extern fn igTempInputScalar(bb: ImRect, id: ImGuiID, label: [*c]const u8, data_type: ImGuiDataType, p_data: ?*anyopaque, format: [*c]const u8, p_clamp_min: ?*const anyopaque, p_clamp_max: ?*const anyopaque) bool;
pub extern fn igTempInputIsActive(id: ImGuiID) bool;
pub extern fn igGetInputTextState(id: ImGuiID) [*c]ImGuiInputTextState;
pub extern fn igColorTooltip(text: [*c]const u8, col: [*c]const f32, flags: ImGuiColorEditFlags) void;
pub extern fn igColorEditOptionsPopup(col: [*c]const f32, flags: ImGuiColorEditFlags) void;
pub extern fn igColorPickerOptionsPopup(ref_col: [*c]const f32, flags: ImGuiColorEditFlags) void;
pub extern fn igPlotEx(plot_type: ImGuiPlotType, label: [*c]const u8, values_getter: ?*const fn (?*anyopaque, c_int) callconv(.C) f32, data: ?*anyopaque, values_count: c_int, values_offset: c_int, overlay_text: [*c]const u8, scale_min: f32, scale_max: f32, size_arg: ImVec2) c_int;
pub extern fn igShadeVertsLinearColorGradientKeepAlpha(draw_list: [*c]ImDrawList, vert_start_idx: c_int, vert_end_idx: c_int, gradient_p0: ImVec2, gradient_p1: ImVec2, col0: ImU32, col1: ImU32) void;
pub extern fn igShadeVertsLinearUV(draw_list: [*c]ImDrawList, vert_start_idx: c_int, vert_end_idx: c_int, a: ImVec2, b: ImVec2, uv_a: ImVec2, uv_b: ImVec2, clamp: bool) void;
pub extern fn igShadeVertsTransformPos(draw_list: [*c]ImDrawList, vert_start_idx: c_int, vert_end_idx: c_int, pivot_in: ImVec2, cos_a: f32, sin_a: f32, pivot_out: ImVec2) void;
pub extern fn igGcCompactTransientMiscBuffers() void;
pub extern fn igGcCompactTransientWindowBuffers(window: ?*ImGuiWindow) void;
pub extern fn igGcAwakeTransientWindowBuffers(window: ?*ImGuiWindow) void;
pub extern fn igDebugLog(fmt: [*c]const u8, ...) void;
pub extern fn igDebugLogV(fmt: [*c]const u8, args: va_list) void;
pub extern fn igDebugAllocHook(info: [*c]ImGuiDebugAllocInfo, frame_count: c_int, ptr: ?*anyopaque, size: usize) void;
pub extern fn igErrorCheckEndFrameRecover(log_callback: ImGuiErrorLogCallback, user_data: ?*anyopaque) void;
pub extern fn igErrorCheckEndWindowRecover(log_callback: ImGuiErrorLogCallback, user_data: ?*anyopaque) void;
pub extern fn igErrorCheckUsingSetCursorPosToExtendParentBoundaries() void;
pub extern fn igDebugDrawCursorPos(col: ImU32) void;
pub extern fn igDebugDrawLineExtents(col: ImU32) void;
pub extern fn igDebugDrawItemRect(col: ImU32) void;
pub extern fn igDebugLocateItem(target_id: ImGuiID) void;
pub extern fn igDebugLocateItemOnHover(target_id: ImGuiID) void;
pub extern fn igDebugLocateItemResolveWithLastItem() void;
pub extern fn igDebugBreakClearData() void;
pub extern fn igDebugBreakButton(label: [*c]const u8, description_of_location: [*c]const u8) bool;
pub extern fn igDebugBreakButtonTooltip(keyboard_only: bool, description_of_location: [*c]const u8) void;
pub extern fn igShowFontAtlas(atlas: [*c]ImFontAtlas) void;
pub extern fn igDebugHookIdInfo(id: ImGuiID, data_type: ImGuiDataType, data_id: ?*const anyopaque, data_id_end: ?*const anyopaque) void;
pub extern fn igDebugNodeColumns(columns: [*c]ImGuiOldColumns) void;
pub extern fn igDebugNodeDockNode(node: ?*ImGuiDockNode, label: [*c]const u8) void;
pub extern fn igDebugNodeDrawList(window: ?*ImGuiWindow, viewport: [*c]ImGuiViewportP, draw_list: [*c]const ImDrawList, label: [*c]const u8) void;
pub extern fn igDebugNodeDrawCmdShowMeshAndBoundingBox(out_draw_list: [*c]ImDrawList, draw_list: [*c]const ImDrawList, draw_cmd: [*c]const ImDrawCmd, show_mesh: bool, show_aabb: bool) void;
pub extern fn igDebugNodeFont(font: [*c]ImFont) void;
pub extern fn igDebugNodeFontGlyph(font: [*c]ImFont, glyph: ?*const ImFontGlyph) void;
pub extern fn igDebugNodeStorage(storage: [*c]ImGuiStorage, label: [*c]const u8) void;
pub extern fn igDebugNodeTabBar(tab_bar: [*c]ImGuiTabBar, label: [*c]const u8) void;
pub extern fn igDebugNodeTable(table: ?*ImGuiTable) void;
pub extern fn igDebugNodeTableSettings(settings: [*c]ImGuiTableSettings) void;
pub extern fn igDebugNodeInputTextState(state: [*c]ImGuiInputTextState) void;
pub extern fn igDebugNodeTypingSelectState(state: [*c]ImGuiTypingSelectState) void;
pub extern fn igDebugNodeWindow(window: ?*ImGuiWindow, label: [*c]const u8) void;
pub extern fn igDebugNodeWindowSettings(settings: [*c]ImGuiWindowSettings) void;
pub extern fn igDebugNodeWindowsList(windows: [*c]ImVector_ImGuiWindowPtr, label: [*c]const u8) void;
pub extern fn igDebugNodeWindowsListByBeginStackParent(windows: [*c]?*ImGuiWindow, windows_size: c_int, parent_in_begin_stack: ?*ImGuiWindow) void;
pub extern fn igDebugNodeViewport(viewport: [*c]ImGuiViewportP) void;
pub extern fn igDebugRenderKeyboardPreview(draw_list: [*c]ImDrawList) void;
pub extern fn igDebugRenderViewportThumbnail(draw_list: [*c]ImDrawList, viewport: [*c]ImGuiViewportP, bb: ImRect) void;
pub extern fn igImFontAtlasGetBuilderForStbTruetype() [*c]const ImFontBuilderIO;
pub extern fn igImFontAtlasUpdateConfigDataPointers(atlas: [*c]ImFontAtlas) void;
pub extern fn igImFontAtlasBuildInit(atlas: [*c]ImFontAtlas) void;
pub extern fn igImFontAtlasBuildSetupFont(atlas: [*c]ImFontAtlas, font: [*c]ImFont, font_config: [*c]ImFontConfig, ascent: f32, descent: f32) void;
pub extern fn igImFontAtlasBuildPackCustomRects(atlas: [*c]ImFontAtlas, stbrp_context_opaque: ?*anyopaque) void;
pub extern fn igImFontAtlasBuildFinish(atlas: [*c]ImFontAtlas) void;
pub extern fn igImFontAtlasBuildRender8bppRectFromString(atlas: [*c]ImFontAtlas, x: c_int, y: c_int, w: c_int, h: c_int, in_str: [*c]const u8, in_marker_char: u8, in_marker_pixel_value: u8) void;
pub extern fn igImFontAtlasBuildRender32bppRectFromString(atlas: [*c]ImFontAtlas, x: c_int, y: c_int, w: c_int, h: c_int, in_str: [*c]const u8, in_marker_char: u8, in_marker_pixel_value: c_uint) void;
pub extern fn igImFontAtlasBuildMultiplyCalcLookupTable(out_table: [*c]u8, in_multiply_factor: f32) void;
pub extern fn igImFontAtlasBuildMultiplyRectAlpha8(table: [*c]const u8, pixels: [*c]u8, x: c_int, y: c_int, w: c_int, h: c_int, stride: c_int) void;
pub extern fn igLogText(fmt: [*c]const u8, ...) void;
pub extern fn ImGuiTextBuffer_appendf(buffer: [*c]struct_ImGuiTextBuffer, fmt: [*c]const u8, ...) void;
pub extern fn igGET_FLT_MAX() f32;
pub extern fn igGET_FLT_MIN() f32;
pub extern fn ImVector_ImWchar_create() [*c]ImVector_ImWchar;
pub extern fn ImVector_ImWchar_destroy(self: [*c]ImVector_ImWchar) void;
pub extern fn ImVector_ImWchar_Init(p: [*c]ImVector_ImWchar) void;
pub extern fn ImVector_ImWchar_UnInit(p: [*c]ImVector_ImWchar) void;
pub const __INTMAX_C_SUFFIX__ = @compileError("unable to translate macro: undefined identifier `LL`"); // (no file):91:9
pub const __UINTMAX_C_SUFFIX__ = @compileError("unable to translate macro: undefined identifier `ULL`"); // (no file):97:9
pub const __INT64_C_SUFFIX__ = @compileError("unable to translate macro: undefined identifier `LL`"); // (no file):179:9
pub const __UINT32_C_SUFFIX__ = @compileError("unable to translate macro: undefined identifier `U`"); // (no file):201:9
pub const __UINT64_C_SUFFIX__ = @compileError("unable to translate macro: undefined identifier `ULL`"); // (no file):209:9
pub const va_start = @compileError("unable to translate macro: undefined identifier `__builtin_va_start`"); // /home/antaraz/dev/slingshot/emsdk/upstream/emscripten/cache/sysroot/include/stdarg.h:12:9
pub const va_end = @compileError("unable to translate macro: undefined identifier `__builtin_va_end`"); // /home/antaraz/dev/slingshot/emsdk/upstream/emscripten/cache/sysroot/include/stdarg.h:13:9
pub const va_arg = @compileError("unable to translate C expr: unexpected token 'an identifier'"); // /home/antaraz/dev/slingshot/emsdk/upstream/emscripten/cache/sysroot/include/stdarg.h:14:9
pub const va_copy = @compileError("unable to translate macro: undefined identifier `__builtin_va_copy`"); // /home/antaraz/dev/slingshot/emsdk/upstream/emscripten/cache/sysroot/include/stdarg.h:15:9
pub const RL_MALLOC = @compileError("unable to translate macro: undefined identifier `malloc`"); // /home/antaraz/dev/slingshot/raylib/src/raylib.h:127:13
pub const RL_CALLOC = @compileError("unable to translate macro: undefined identifier `calloc`"); // /home/antaraz/dev/slingshot/raylib/src/raylib.h:130:13
pub const RL_REALLOC = @compileError("unable to translate macro: undefined identifier `realloc`"); // /home/antaraz/dev/slingshot/raylib/src/raylib.h:133:13
pub const RL_FREE = @compileError("unable to translate macro: undefined identifier `free`"); // /home/antaraz/dev/slingshot/raylib/src/raylib.h:136:13
pub const offsetof = @compileError("unable to translate C expr: unexpected token 'an identifier'"); // /home/antaraz/dev/slingshot/emsdk/upstream/emscripten/cache/sysroot/include/stddef.h:22:9
pub const _Static_assert = @compileError("unable to translate C expr: unexpected token ''"); // /home/antaraz/dev/slingshot/emsdk/upstream/emscripten/cache/sysroot/include/wasi/api.h:34:9
pub const __restrict = @compileError("unable to translate C expr: unexpected token 'restrict'"); // /home/antaraz/dev/slingshot/emsdk/upstream/emscripten/cache/sysroot/include/features.h:27:9
pub const __inline = @compileError("unable to translate C expr: unexpected token 'inline'"); // /home/antaraz/dev/slingshot/emsdk/upstream/emscripten/cache/sysroot/include/features.h:33:9
pub const __REDIR = @compileError("unable to translate C expr: unexpected token '__typeof__'"); // /home/antaraz/dev/slingshot/emsdk/upstream/emscripten/cache/sysroot/include/features.h:45:9
pub const API = @compileError("unable to translate macro: undefined identifier `__visibility__`"); // /home/antaraz/dev/slingshot/cimgui/cimgui.h:17:17
pub const EXTERN = @compileError("unable to translate C expr: unexpected token 'extern'"); // /home/antaraz/dev/slingshot/cimgui/cimgui.h:28:13
pub const CONST = @compileError("unable to translate C expr: unexpected token 'const'"); // /home/antaraz/dev/slingshot/cimgui/cimgui.h:32:9
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
pub const __OPTIMIZE__ = @as(c_int, 1);
pub const __ORDER_LITTLE_ENDIAN__ = @as(c_int, 1234);
pub const __ORDER_BIG_ENDIAN__ = @as(c_int, 4321);
pub const __ORDER_PDP_ENDIAN__ = @as(c_int, 3412);
pub const __BYTE_ORDER__ = __ORDER_LITTLE_ENDIAN__;
pub const __LITTLE_ENDIAN__ = @as(c_int, 1);
pub const _ILP32 = @as(c_int, 1);
pub const __ILP32__ = @as(c_int, 1);
pub const __CHAR_BIT__ = @as(c_int, 8);
pub const __BOOL_WIDTH__ = @as(c_int, 8);
pub const __SHRT_WIDTH__ = @as(c_int, 16);
pub const __INT_WIDTH__ = @as(c_int, 32);
pub const __LONG_WIDTH__ = @as(c_int, 32);
pub const __LLONG_WIDTH__ = @as(c_int, 64);
pub const __BITINT_MAXWIDTH__ = @as(c_int, 128);
pub const __SCHAR_MAX__ = @as(c_int, 127);
pub const __SHRT_MAX__ = @as(c_int, 32767);
pub const __INT_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_int, 2147483647, .decimal);
pub const __LONG_MAX__ = @as(c_long, 2147483647);
pub const __LONG_LONG_MAX__ = @as(c_longlong, 9223372036854775807);
pub const __WCHAR_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_int, 2147483647, .decimal);
pub const __WCHAR_WIDTH__ = @as(c_int, 32);
pub const __WINT_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_int, 2147483647, .decimal);
pub const __WINT_WIDTH__ = @as(c_int, 32);
pub const __INTMAX_MAX__ = @as(c_longlong, 9223372036854775807);
pub const __INTMAX_WIDTH__ = @as(c_int, 64);
pub const __SIZE_MAX__ = @as(c_ulong, 4294967295);
pub const __SIZE_WIDTH__ = @as(c_int, 32);
pub const __UINTMAX_MAX__ = @as(c_ulonglong, 18446744073709551615);
pub const __UINTMAX_WIDTH__ = @as(c_int, 64);
pub const __PTRDIFF_MAX__ = @as(c_long, 2147483647);
pub const __PTRDIFF_WIDTH__ = @as(c_int, 32);
pub const __INTPTR_MAX__ = @as(c_long, 2147483647);
pub const __INTPTR_WIDTH__ = @as(c_int, 32);
pub const __UINTPTR_MAX__ = @as(c_ulong, 4294967295);
pub const __UINTPTR_WIDTH__ = @as(c_int, 32);
pub const __SIZEOF_DOUBLE__ = @as(c_int, 8);
pub const __SIZEOF_FLOAT__ = @as(c_int, 4);
pub const __SIZEOF_INT__ = @as(c_int, 4);
pub const __SIZEOF_LONG__ = @as(c_int, 4);
pub const __SIZEOF_LONG_DOUBLE__ = @as(c_int, 16);
pub const __SIZEOF_LONG_LONG__ = @as(c_int, 8);
pub const __SIZEOF_POINTER__ = @as(c_int, 4);
pub const __SIZEOF_SHORT__ = @as(c_int, 2);
pub const __SIZEOF_PTRDIFF_T__ = @as(c_int, 4);
pub const __SIZEOF_SIZE_T__ = @as(c_int, 4);
pub const __SIZEOF_WCHAR_T__ = @as(c_int, 4);
pub const __SIZEOF_WINT_T__ = @as(c_int, 4);
pub const __SIZEOF_INT128__ = @as(c_int, 16);
pub const __INTMAX_TYPE__ = c_longlong;
pub const __INTMAX_FMTd__ = "lld";
pub const __INTMAX_FMTi__ = "lli";
pub const __UINTMAX_TYPE__ = c_ulonglong;
pub const __UINTMAX_FMTo__ = "llo";
pub const __UINTMAX_FMTu__ = "llu";
pub const __UINTMAX_FMTx__ = "llx";
pub const __UINTMAX_FMTX__ = "llX";
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
pub const __WINT_TYPE__ = c_int;
pub const __SIG_ATOMIC_MAX__ = @as(c_long, 2147483647);
pub const __SIG_ATOMIC_WIDTH__ = @as(c_int, 32);
pub const __CHAR16_TYPE__ = c_ushort;
pub const __CHAR32_TYPE__ = c_uint;
pub const __UINTPTR_TYPE__ = c_ulong;
pub const __UINTPTR_FMTo__ = "lo";
pub const __UINTPTR_FMTu__ = "lu";
pub const __UINTPTR_FMTx__ = "lx";
pub const __UINTPTR_FMTX__ = "lX";
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
pub const __LDBL_DENORM_MIN__ = @as(c_longdouble, 6.47517511943802511092443895822764655e-4966);
pub const __LDBL_HAS_DENORM__ = @as(c_int, 1);
pub const __LDBL_DIG__ = @as(c_int, 33);
pub const __LDBL_DECIMAL_DIG__ = @as(c_int, 36);
pub const __LDBL_EPSILON__ = @as(c_longdouble, 1.92592994438723585305597794258492732e-34);
pub const __LDBL_HAS_INFINITY__ = @as(c_int, 1);
pub const __LDBL_HAS_QUIET_NAN__ = @as(c_int, 1);
pub const __LDBL_MANT_DIG__ = @as(c_int, 113);
pub const __LDBL_MAX_10_EXP__ = @as(c_int, 4932);
pub const __LDBL_MAX_EXP__ = @as(c_int, 16384);
pub const __LDBL_MAX__ = @as(c_longdouble, 1.18973149535723176508575932662800702e+4932);
pub const __LDBL_MIN_10_EXP__ = -@as(c_int, 4931);
pub const __LDBL_MIN_EXP__ = -@as(c_int, 16381);
pub const __LDBL_MIN__ = @as(c_longdouble, 3.36210314311209350626267781732175260e-4932);
pub const __POINTER_WIDTH__ = @as(c_int, 32);
pub const __BIGGEST_ALIGNMENT__ = @as(c_int, 16);
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
pub const __INT64_TYPE__ = c_longlong;
pub const __INT64_FMTd__ = "lld";
pub const __INT64_FMTi__ = "lli";
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
pub const __UINT64_TYPE__ = c_ulonglong;
pub const __UINT64_FMTo__ = "llo";
pub const __UINT64_FMTu__ = "llu";
pub const __UINT64_FMTx__ = "llx";
pub const __UINT64_FMTX__ = "llX";
pub const __UINT64_MAX__ = @as(c_ulonglong, 18446744073709551615);
pub const __INT64_MAX__ = @as(c_longlong, 9223372036854775807);
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
pub const __INT_LEAST64_TYPE__ = c_longlong;
pub const __INT_LEAST64_MAX__ = @as(c_longlong, 9223372036854775807);
pub const __INT_LEAST64_WIDTH__ = @as(c_int, 64);
pub const __INT_LEAST64_FMTd__ = "lld";
pub const __INT_LEAST64_FMTi__ = "lli";
pub const __UINT_LEAST64_TYPE__ = c_ulonglong;
pub const __UINT_LEAST64_MAX__ = @as(c_ulonglong, 18446744073709551615);
pub const __UINT_LEAST64_FMTo__ = "llo";
pub const __UINT_LEAST64_FMTu__ = "llu";
pub const __UINT_LEAST64_FMTx__ = "llx";
pub const __UINT_LEAST64_FMTX__ = "llX";
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
pub const __INT_FAST64_TYPE__ = c_longlong;
pub const __INT_FAST64_MAX__ = @as(c_longlong, 9223372036854775807);
pub const __INT_FAST64_WIDTH__ = @as(c_int, 64);
pub const __INT_FAST64_FMTd__ = "lld";
pub const __INT_FAST64_FMTi__ = "lli";
pub const __UINT_FAST64_TYPE__ = c_ulonglong;
pub const __UINT_FAST64_MAX__ = @as(c_ulonglong, 18446744073709551615);
pub const __UINT_FAST64_FMTo__ = "llo";
pub const __UINT_FAST64_FMTu__ = "llu";
pub const __UINT_FAST64_FMTx__ = "llx";
pub const __UINT_FAST64_FMTX__ = "llX";
pub const __USER_LABEL_PREFIX__ = "";
pub const __NO_MATH_ERRNO__ = @as(c_int, 1);
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
pub const __FLT_RADIX__ = @as(c_int, 2);
pub const __DECIMAL_DIG__ = __LDBL_DECIMAL_DIG__;
pub const __wasm = @as(c_int, 1);
pub const __wasm__ = @as(c_int, 1);
pub const __wasm_sign_ext__ = @as(c_int, 1);
pub const __wasm_mutable_globals__ = @as(c_int, 1);
pub const __GCC_HAVE_SYNC_COMPARE_AND_SWAP_1 = @as(c_int, 1);
pub const __GCC_HAVE_SYNC_COMPARE_AND_SWAP_2 = @as(c_int, 1);
pub const __GCC_HAVE_SYNC_COMPARE_AND_SWAP_4 = @as(c_int, 1);
pub const __GCC_HAVE_SYNC_COMPARE_AND_SWAP_8 = @as(c_int, 1);
pub const __wasm32 = @as(c_int, 1);
pub const __wasm32__ = @as(c_int, 1);
pub const __FLOAT128__ = @as(c_int, 1);
pub const unix = @as(c_int, 1);
pub const __unix = @as(c_int, 1);
pub const __unix__ = @as(c_int, 1);
pub const __EMSCRIPTEN__ = @as(c_int, 1);
pub const __STDC__ = @as(c_int, 1);
pub const __STDC_HOSTED__ = @as(c_int, 1);
pub const __STDC_VERSION__ = @as(c_long, 201710);
pub const __STDC_UTF_16__ = @as(c_int, 1);
pub const __STDC_UTF_32__ = @as(c_int, 1);
pub const NDEBUG = @as(c_int, 1);
pub const CIMGUI_DEFINE_ENUMS_AND_STRUCTS = @as(c_int, 1);
pub const RAYLIB_H = "";
pub const _STDARG_H = "";
pub const __NEED_va_list = "";
pub const __LITTLE_ENDIAN = @as(c_int, 1234);
pub const __BIG_ENDIAN = @as(c_int, 4321);
pub const __USE_TIME_BITS64 = @as(c_int, 1);
pub const __BYTE_ORDER = __LITTLE_ENDIAN;
pub const __LONG_MAX = __LONG_MAX__;
pub const _Addr = __PTRDIFF_TYPE__;
pub const _Int64 = __INT64_TYPE__;
pub const _Reg = __PTRDIFF_TYPE__;
pub const __DEFINED_va_list = "";
pub const RAYLIB_VERSION_MAJOR = @as(c_int, 5);
pub const RAYLIB_VERSION_MINOR = @as(c_int, 1);
pub const RAYLIB_VERSION_PATCH = @as(c_int, 0);
pub const RAYLIB_VERSION = "5.1-dev";
pub const RLAPI = "";
pub const PI = @as(f32, 3.14159265358979323846);
pub const DEG2RAD = @import("std").zig.c_translation.MacroArithmetic.div(PI, @as(f32, 180.0));
pub const RAD2DEG = @import("std").zig.c_translation.MacroArithmetic.div(@as(f32, 180.0), PI);
pub inline fn CLITERAL(@"type": anytype) @TypeOf(@"type") {
    _ = &@"type";
    return @"type";
}
pub const RL_COLOR_TYPE = "";
pub const RL_RECTANGLE_TYPE = "";
pub const RL_VECTOR2_TYPE = "";
pub const RL_VECTOR3_TYPE = "";
pub const RL_VECTOR4_TYPE = "";
pub const RL_QUATERNION_TYPE = "";
pub const RL_MATRIX_TYPE = "";
pub const LIGHTGRAY = @import("std").mem.zeroInit(CLITERAL(Color), .{ @as(c_int, 200), @as(c_int, 200), @as(c_int, 200), @as(c_int, 255) });
pub const GRAY = @import("std").mem.zeroInit(CLITERAL(Color), .{ @as(c_int, 130), @as(c_int, 130), @as(c_int, 130), @as(c_int, 255) });
pub const DARKGRAY = @import("std").mem.zeroInit(CLITERAL(Color), .{ @as(c_int, 80), @as(c_int, 80), @as(c_int, 80), @as(c_int, 255) });
pub const YELLOW = @import("std").mem.zeroInit(CLITERAL(Color), .{ @as(c_int, 253), @as(c_int, 249), @as(c_int, 0), @as(c_int, 255) });
pub const GOLD = @import("std").mem.zeroInit(CLITERAL(Color), .{ @as(c_int, 255), @as(c_int, 203), @as(c_int, 0), @as(c_int, 255) });
pub const ORANGE = @import("std").mem.zeroInit(CLITERAL(Color), .{ @as(c_int, 255), @as(c_int, 161), @as(c_int, 0), @as(c_int, 255) });
pub const PINK = @import("std").mem.zeroInit(CLITERAL(Color), .{ @as(c_int, 255), @as(c_int, 109), @as(c_int, 194), @as(c_int, 255) });
pub const RED = @import("std").mem.zeroInit(CLITERAL(Color), .{ @as(c_int, 230), @as(c_int, 41), @as(c_int, 55), @as(c_int, 255) });
pub const MAROON = @import("std").mem.zeroInit(CLITERAL(Color), .{ @as(c_int, 190), @as(c_int, 33), @as(c_int, 55), @as(c_int, 255) });
pub const GREEN = @import("std").mem.zeroInit(CLITERAL(Color), .{ @as(c_int, 0), @as(c_int, 228), @as(c_int, 48), @as(c_int, 255) });
pub const LIME = @import("std").mem.zeroInit(CLITERAL(Color), .{ @as(c_int, 0), @as(c_int, 158), @as(c_int, 47), @as(c_int, 255) });
pub const DARKGREEN = @import("std").mem.zeroInit(CLITERAL(Color), .{ @as(c_int, 0), @as(c_int, 117), @as(c_int, 44), @as(c_int, 255) });
pub const SKYBLUE = @import("std").mem.zeroInit(CLITERAL(Color), .{ @as(c_int, 102), @as(c_int, 191), @as(c_int, 255), @as(c_int, 255) });
pub const BLUE = @import("std").mem.zeroInit(CLITERAL(Color), .{ @as(c_int, 0), @as(c_int, 121), @as(c_int, 241), @as(c_int, 255) });
pub const DARKBLUE = @import("std").mem.zeroInit(CLITERAL(Color), .{ @as(c_int, 0), @as(c_int, 82), @as(c_int, 172), @as(c_int, 255) });
pub const PURPLE = @import("std").mem.zeroInit(CLITERAL(Color), .{ @as(c_int, 200), @as(c_int, 122), @as(c_int, 255), @as(c_int, 255) });
pub const VIOLET = @import("std").mem.zeroInit(CLITERAL(Color), .{ @as(c_int, 135), @as(c_int, 60), @as(c_int, 190), @as(c_int, 255) });
pub const DARKPURPLE = @import("std").mem.zeroInit(CLITERAL(Color), .{ @as(c_int, 112), @as(c_int, 31), @as(c_int, 126), @as(c_int, 255) });
pub const BEIGE = @import("std").mem.zeroInit(CLITERAL(Color), .{ @as(c_int, 211), @as(c_int, 176), @as(c_int, 131), @as(c_int, 255) });
pub const BROWN = @import("std").mem.zeroInit(CLITERAL(Color), .{ @as(c_int, 127), @as(c_int, 106), @as(c_int, 79), @as(c_int, 255) });
pub const DARKBROWN = @import("std").mem.zeroInit(CLITERAL(Color), .{ @as(c_int, 76), @as(c_int, 63), @as(c_int, 47), @as(c_int, 255) });
pub const WHITE = @import("std").mem.zeroInit(CLITERAL(Color), .{ @as(c_int, 255), @as(c_int, 255), @as(c_int, 255), @as(c_int, 255) });
pub const BLACK = @import("std").mem.zeroInit(CLITERAL(Color), .{ @as(c_int, 0), @as(c_int, 0), @as(c_int, 0), @as(c_int, 255) });
pub const BLANK = @import("std").mem.zeroInit(CLITERAL(Color), .{ @as(c_int, 0), @as(c_int, 0), @as(c_int, 0), @as(c_int, 0) });
pub const MAGENTA = @import("std").mem.zeroInit(CLITERAL(Color), .{ @as(c_int, 255), @as(c_int, 0), @as(c_int, 255), @as(c_int, 255) });
pub const RAYWHITE = @import("std").mem.zeroInit(CLITERAL(Color), .{ @as(c_int, 245), @as(c_int, 245), @as(c_int, 245), @as(c_int, 255) });
pub const _STDBOOL_H = "";
pub const @"true" = @as(c_int, 1);
pub const @"false" = @as(c_int, 0);
pub const @"bool" = bool;
pub const __bool_true_false_are_defined = @as(c_int, 1);
pub const MOUSE_LEFT_BUTTON = MOUSE_BUTTON_LEFT;
pub const MOUSE_RIGHT_BUTTON = MOUSE_BUTTON_RIGHT;
pub const MOUSE_MIDDLE_BUTTON = MOUSE_BUTTON_MIDDLE;
pub const MATERIAL_MAP_DIFFUSE = MATERIAL_MAP_ALBEDO;
pub const MATERIAL_MAP_SPECULAR = MATERIAL_MAP_METALNESS;
pub const SHADER_LOC_MAP_DIFFUSE = SHADER_LOC_MAP_ALBEDO;
pub const SHADER_LOC_MAP_SPECULAR = SHADER_LOC_MAP_METALNESS;
pub const GetMouseRay = GetScreenToWorldRay;
pub const FONT_ICON_FILE_NAME_FAR = "fa-regular-400.ttf";
pub const FONT_ICON_FILE_NAME_FAS = "fa-solid-900.ttf";
pub const ICON_MIN_FA = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0xe005, .hex);
pub const ICON_MAX_16_FA = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0xf8ff, .hex);
pub const ICON_MAX_FA = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0xf8ff, .hex);
pub const ICON_FA_0 = "0";
pub const ICON_FA_1 = "1";
pub const ICON_FA_2 = "2";
pub const ICON_FA_3 = "3";
pub const ICON_FA_4 = "4";
pub const ICON_FA_5 = "5";
pub const ICON_FA_6 = "6";
pub const ICON_FA_7 = "7";
pub const ICON_FA_8 = "8";
pub const ICON_FA_9 = "9";
pub const ICON_FA_A = "A";
pub const ICON_FA_ADDRESS_BOOK = "\xef\x8a\xb9";
pub const ICON_FA_ADDRESS_CARD = "\xef\x8a\xbb";
pub const ICON_FA_ALIGN_CENTER = "\xef\x80\xb7";
pub const ICON_FA_ALIGN_JUSTIFY = "\xef\x80\xb9";
pub const ICON_FA_ALIGN_LEFT = "\xef\x80\xb6";
pub const ICON_FA_ALIGN_RIGHT = "\xef\x80\xb8";
pub const ICON_FA_ANCHOR = "\xef\x84\xbd";
pub const ICON_FA_ANCHOR_CIRCLE_CHECK = "\xee\x92\xaa";
pub const ICON_FA_ANCHOR_CIRCLE_EXCLAMATION = "\xee\x92\xab";
pub const ICON_FA_ANCHOR_CIRCLE_XMARK = "\xee\x92\xac";
pub const ICON_FA_ANCHOR_LOCK = "\xee\x92\xad";
pub const ICON_FA_ANGLE_DOWN = "\xef\x84\x87";
pub const ICON_FA_ANGLE_LEFT = "\xef\x84\x84";
pub const ICON_FA_ANGLE_RIGHT = "\xef\x84\x85";
pub const ICON_FA_ANGLE_UP = "\xef\x84\x86";
pub const ICON_FA_ANGLES_DOWN = "\xef\x84\x83";
pub const ICON_FA_ANGLES_LEFT = "\xef\x84\x80";
pub const ICON_FA_ANGLES_RIGHT = "\xef\x84\x81";
pub const ICON_FA_ANGLES_UP = "\xef\x84\x82";
pub const ICON_FA_ANKH = "\xef\x99\x84";
pub const ICON_FA_APPLE_WHOLE = "\xef\x97\x91";
pub const ICON_FA_ARCHWAY = "\xef\x95\x97";
pub const ICON_FA_ARROW_DOWN = "\xef\x81\xa3";
pub const ICON_FA_ARROW_DOWN_1_9 = "\xef\x85\xa2";
pub const ICON_FA_ARROW_DOWN_9_1 = "\xef\xa2\x86";
pub const ICON_FA_ARROW_DOWN_A_Z = "\xef\x85\x9d";
pub const ICON_FA_ARROW_DOWN_LONG = "\xef\x85\xb5";
pub const ICON_FA_ARROW_DOWN_SHORT_WIDE = "\xef\xa2\x84";
pub const ICON_FA_ARROW_DOWN_UP_ACROSS_LINE = "\xee\x92\xaf";
pub const ICON_FA_ARROW_DOWN_UP_LOCK = "\xee\x92\xb0";
pub const ICON_FA_ARROW_DOWN_WIDE_SHORT = "\xef\x85\xa0";
pub const ICON_FA_ARROW_DOWN_Z_A = "\xef\xa2\x81";
pub const ICON_FA_ARROW_LEFT = "\xef\x81\xa0";
pub const ICON_FA_ARROW_LEFT_LONG = "\xef\x85\xb7";
pub const ICON_FA_ARROW_POINTER = "\xef\x89\x85";
pub const ICON_FA_ARROW_RIGHT = "\xef\x81\xa1";
pub const ICON_FA_ARROW_RIGHT_ARROW_LEFT = "\xef\x83\xac";
pub const ICON_FA_ARROW_RIGHT_FROM_BRACKET = "\xef\x82\x8b";
pub const ICON_FA_ARROW_RIGHT_LONG = "\xef\x85\xb8";
pub const ICON_FA_ARROW_RIGHT_TO_BRACKET = "\xef\x82\x90";
pub const ICON_FA_ARROW_RIGHT_TO_CITY = "\xee\x92\xb3";
pub const ICON_FA_ARROW_ROTATE_LEFT = "\xef\x83\xa2";
pub const ICON_FA_ARROW_ROTATE_RIGHT = "\xef\x80\x9e";
pub const ICON_FA_ARROW_TREND_DOWN = "\xee\x82\x97";
pub const ICON_FA_ARROW_TREND_UP = "\xee\x82\x98";
pub const ICON_FA_ARROW_TURN_DOWN = "\xef\x85\x89";
pub const ICON_FA_ARROW_TURN_UP = "\xef\x85\x88";
pub const ICON_FA_ARROW_UP = "\xef\x81\xa2";
pub const ICON_FA_ARROW_UP_1_9 = "\xef\x85\xa3";
pub const ICON_FA_ARROW_UP_9_1 = "\xef\xa2\x87";
pub const ICON_FA_ARROW_UP_A_Z = "\xef\x85\x9e";
pub const ICON_FA_ARROW_UP_FROM_BRACKET = "\xee\x82\x9a";
pub const ICON_FA_ARROW_UP_FROM_GROUND_WATER = "\xee\x92\xb5";
pub const ICON_FA_ARROW_UP_FROM_WATER_PUMP = "\xee\x92\xb6";
pub const ICON_FA_ARROW_UP_LONG = "\xef\x85\xb6";
pub const ICON_FA_ARROW_UP_RIGHT_DOTS = "\xee\x92\xb7";
pub const ICON_FA_ARROW_UP_RIGHT_FROM_SQUARE = "\xef\x82\x8e";
pub const ICON_FA_ARROW_UP_SHORT_WIDE = "\xef\xa2\x85";
pub const ICON_FA_ARROW_UP_WIDE_SHORT = "\xef\x85\xa1";
pub const ICON_FA_ARROW_UP_Z_A = "\xef\xa2\x82";
pub const ICON_FA_ARROWS_DOWN_TO_LINE = "\xee\x92\xb8";
pub const ICON_FA_ARROWS_DOWN_TO_PEOPLE = "\xee\x92\xb9";
pub const ICON_FA_ARROWS_LEFT_RIGHT = "\xef\x81\xbe";
pub const ICON_FA_ARROWS_LEFT_RIGHT_TO_LINE = "\xee\x92\xba";
pub const ICON_FA_ARROWS_ROTATE = "\xef\x80\xa1";
pub const ICON_FA_ARROWS_SPIN = "\xee\x92\xbb";
pub const ICON_FA_ARROWS_SPLIT_UP_AND_LEFT = "\xee\x92\xbc";
pub const ICON_FA_ARROWS_TO_CIRCLE = "\xee\x92\xbd";
pub const ICON_FA_ARROWS_TO_DOT = "\xee\x92\xbe";
pub const ICON_FA_ARROWS_TO_EYE = "\xee\x92\xbf";
pub const ICON_FA_ARROWS_TURN_RIGHT = "\xee\x93\x80";
pub const ICON_FA_ARROWS_TURN_TO_DOTS = "\xee\x93\x81";
pub const ICON_FA_ARROWS_UP_DOWN = "\xef\x81\xbd";
pub const ICON_FA_ARROWS_UP_DOWN_LEFT_RIGHT = "\xef\x81\x87";
pub const ICON_FA_ARROWS_UP_TO_LINE = "\xee\x93\x82";
pub const ICON_FA_ASTERISK = "*";
pub const ICON_FA_AT = "@";
pub const ICON_FA_ATOM = "\xef\x97\x92";
pub const ICON_FA_AUDIO_DESCRIPTION = "\xef\x8a\x9e";
pub const ICON_FA_AUSTRAL_SIGN = "\xee\x82\xa9";
pub const ICON_FA_AWARD = "\xef\x95\x99";
pub const ICON_FA_B = "B";
pub const ICON_FA_BABY = "\xef\x9d\xbc";
pub const ICON_FA_BABY_CARRIAGE = "\xef\x9d\xbd";
pub const ICON_FA_BACKWARD = "\xef\x81\x8a";
pub const ICON_FA_BACKWARD_FAST = "\xef\x81\x89";
pub const ICON_FA_BACKWARD_STEP = "\xef\x81\x88";
pub const ICON_FA_BACON = "\xef\x9f\xa5";
pub const ICON_FA_BACTERIA = "\xee\x81\x99";
pub const ICON_FA_BACTERIUM = "\xee\x81\x9a";
pub const ICON_FA_BAG_SHOPPING = "\xef\x8a\x90";
pub const ICON_FA_BAHAI = "\xef\x99\xa6";
pub const ICON_FA_BAHT_SIGN = "\xee\x82\xac";
pub const ICON_FA_BAN = "\xef\x81\x9e";
pub const ICON_FA_BAN_SMOKING = "\xef\x95\x8d";
pub const ICON_FA_BANDAGE = "\xef\x91\xa2";
pub const ICON_FA_BARCODE = "\xef\x80\xaa";
pub const ICON_FA_BARS = "\xef\x83\x89";
pub const ICON_FA_BARS_PROGRESS = "\xef\xa0\xa8";
pub const ICON_FA_BARS_STAGGERED = "\xef\x95\x90";
pub const ICON_FA_BASEBALL = "\xef\x90\xb3";
pub const ICON_FA_BASEBALL_BAT_BALL = "\xef\x90\xb2";
pub const ICON_FA_BASKET_SHOPPING = "\xef\x8a\x91";
pub const ICON_FA_BASKETBALL = "\xef\x90\xb4";
pub const ICON_FA_BATH = "\xef\x8b\x8d";
pub const ICON_FA_BATTERY_EMPTY = "\xef\x89\x84";
pub const ICON_FA_BATTERY_FULL = "\xef\x89\x80";
pub const ICON_FA_BATTERY_HALF = "\xef\x89\x82";
pub const ICON_FA_BATTERY_QUARTER = "\xef\x89\x83";
pub const ICON_FA_BATTERY_THREE_QUARTERS = "\xef\x89\x81";
pub const ICON_FA_BED = "\xef\x88\xb6";
pub const ICON_FA_BED_PULSE = "\xef\x92\x87";
pub const ICON_FA_BEER_MUG_EMPTY = "\xef\x83\xbc";
pub const ICON_FA_BELL = "\xef\x83\xb3";
pub const ICON_FA_BELL_CONCIERGE = "\xef\x95\xa2";
pub const ICON_FA_BELL_SLASH = "\xef\x87\xb6";
pub const ICON_FA_BEZIER_CURVE = "\xef\x95\x9b";
pub const ICON_FA_BICYCLE = "\xef\x88\x86";
pub const ICON_FA_BINOCULARS = "\xef\x87\xa5";
pub const ICON_FA_BIOHAZARD = "\xef\x9e\x80";
pub const ICON_FA_BITCOIN_SIGN = "\xee\x82\xb4";
pub const ICON_FA_BLENDER = "\xef\x94\x97";
pub const ICON_FA_BLENDER_PHONE = "\xef\x9a\xb6";
pub const ICON_FA_BLOG = "\xef\x9e\x81";
pub const ICON_FA_BOLD = "\xef\x80\xb2";
pub const ICON_FA_BOLT = "\xef\x83\xa7";
pub const ICON_FA_BOLT_LIGHTNING = "\xee\x82\xb7";
pub const ICON_FA_BOMB = "\xef\x87\xa2";
pub const ICON_FA_BONE = "\xef\x97\x97";
pub const ICON_FA_BONG = "\xef\x95\x9c";
pub const ICON_FA_BOOK = "\xef\x80\xad";
pub const ICON_FA_BOOK_ATLAS = "\xef\x95\x98";
pub const ICON_FA_BOOK_BIBLE = "\xef\x99\x87";
pub const ICON_FA_BOOK_BOOKMARK = "\xee\x82\xbb";
pub const ICON_FA_BOOK_JOURNAL_WHILLS = "\xef\x99\xaa";
pub const ICON_FA_BOOK_MEDICAL = "\xef\x9f\xa6";
pub const ICON_FA_BOOK_OPEN = "\xef\x94\x98";
pub const ICON_FA_BOOK_OPEN_READER = "\xef\x97\x9a";
pub const ICON_FA_BOOK_QURAN = "\xef\x9a\x87";
pub const ICON_FA_BOOK_SKULL = "\xef\x9a\xb7";
pub const ICON_FA_BOOKMARK = "\xef\x80\xae";
pub const ICON_FA_BORDER_ALL = "\xef\xa1\x8c";
pub const ICON_FA_BORDER_NONE = "\xef\xa1\x90";
pub const ICON_FA_BORDER_TOP_LEFT = "\xef\xa1\x93";
pub const ICON_FA_BORE_HOLE = "\xee\x93\x83";
pub const ICON_FA_BOTTLE_DROPLET = "\xee\x93\x84";
pub const ICON_FA_BOTTLE_WATER = "\xee\x93\x85";
pub const ICON_FA_BOWL_FOOD = "\xee\x93\x86";
pub const ICON_FA_BOWL_RICE = "\xee\x8b\xab";
pub const ICON_FA_BOWLING_BALL = "\xef\x90\xb6";
pub const ICON_FA_BOX = "\xef\x91\xa6";
pub const ICON_FA_BOX_ARCHIVE = "\xef\x86\x87";
pub const ICON_FA_BOX_OPEN = "\xef\x92\x9e";
pub const ICON_FA_BOX_TISSUE = "\xee\x81\x9b";
pub const ICON_FA_BOXES_PACKING = "\xee\x93\x87";
pub const ICON_FA_BOXES_STACKED = "\xef\x91\xa8";
pub const ICON_FA_BRAILLE = "\xef\x8a\xa1";
pub const ICON_FA_BRAIN = "\xef\x97\x9c";
pub const ICON_FA_BRAZILIAN_REAL_SIGN = "\xee\x91\xac";
pub const ICON_FA_BREAD_SLICE = "\xef\x9f\xac";
pub const ICON_FA_BRIDGE = "\xee\x93\x88";
pub const ICON_FA_BRIDGE_CIRCLE_CHECK = "\xee\x93\x89";
pub const ICON_FA_BRIDGE_CIRCLE_EXCLAMATION = "\xee\x93\x8a";
pub const ICON_FA_BRIDGE_CIRCLE_XMARK = "\xee\x93\x8b";
pub const ICON_FA_BRIDGE_LOCK = "\xee\x93\x8c";
pub const ICON_FA_BRIDGE_WATER = "\xee\x93\x8e";
pub const ICON_FA_BRIEFCASE = "\xef\x82\xb1";
pub const ICON_FA_BRIEFCASE_MEDICAL = "\xef\x91\xa9";
pub const ICON_FA_BROOM = "\xef\x94\x9a";
pub const ICON_FA_BROOM_BALL = "\xef\x91\x98";
pub const ICON_FA_BRUSH = "\xef\x95\x9d";
pub const ICON_FA_BUCKET = "\xee\x93\x8f";
pub const ICON_FA_BUG = "\xef\x86\x88";
pub const ICON_FA_BUG_SLASH = "\xee\x92\x90";
pub const ICON_FA_BUGS = "\xee\x93\x90";
pub const ICON_FA_BUILDING = "\xef\x86\xad";
pub const ICON_FA_BUILDING_CIRCLE_ARROW_RIGHT = "\xee\x93\x91";
pub const ICON_FA_BUILDING_CIRCLE_CHECK = "\xee\x93\x92";
pub const ICON_FA_BUILDING_CIRCLE_EXCLAMATION = "\xee\x93\x93";
pub const ICON_FA_BUILDING_CIRCLE_XMARK = "\xee\x93\x94";
pub const ICON_FA_BUILDING_COLUMNS = "\xef\x86\x9c";
pub const ICON_FA_BUILDING_FLAG = "\xee\x93\x95";
pub const ICON_FA_BUILDING_LOCK = "\xee\x93\x96";
pub const ICON_FA_BUILDING_NGO = "\xee\x93\x97";
pub const ICON_FA_BUILDING_SHIELD = "\xee\x93\x98";
pub const ICON_FA_BUILDING_UN = "\xee\x93\x99";
pub const ICON_FA_BUILDING_USER = "\xee\x93\x9a";
pub const ICON_FA_BUILDING_WHEAT = "\xee\x93\x9b";
pub const ICON_FA_BULLHORN = "\xef\x82\xa1";
pub const ICON_FA_BULLSEYE = "\xef\x85\x80";
pub const ICON_FA_BURGER = "\xef\xa0\x85";
pub const ICON_FA_BURST = "\xee\x93\x9c";
pub const ICON_FA_BUS = "\xef\x88\x87";
pub const ICON_FA_BUS_SIMPLE = "\xef\x95\x9e";
pub const ICON_FA_BUSINESS_TIME = "\xef\x99\x8a";
pub const ICON_FA_C = "C";
pub const ICON_FA_CAKE_CANDLES = "\xef\x87\xbd";
pub const ICON_FA_CALCULATOR = "\xef\x87\xac";
pub const ICON_FA_CALENDAR = "\xef\x84\xb3";
pub const ICON_FA_CALENDAR_CHECK = "\xef\x89\xb4";
pub const ICON_FA_CALENDAR_DAY = "\xef\x9e\x83";
pub const ICON_FA_CALENDAR_DAYS = "\xef\x81\xb3";
pub const ICON_FA_CALENDAR_MINUS = "\xef\x89\xb2";
pub const ICON_FA_CALENDAR_PLUS = "\xef\x89\xb1";
pub const ICON_FA_CALENDAR_WEEK = "\xef\x9e\x84";
pub const ICON_FA_CALENDAR_XMARK = "\xef\x89\xb3";
pub const ICON_FA_CAMERA = "\xef\x80\xb0";
pub const ICON_FA_CAMERA_RETRO = "\xef\x82\x83";
pub const ICON_FA_CAMERA_ROTATE = "\xee\x83\x98";
pub const ICON_FA_CAMPGROUND = "\xef\x9a\xbb";
pub const ICON_FA_CANDY_CANE = "\xef\x9e\x86";
pub const ICON_FA_CANNABIS = "\xef\x95\x9f";
pub const ICON_FA_CAPSULES = "\xef\x91\xab";
pub const ICON_FA_CAR = "\xef\x86\xb9";
pub const ICON_FA_CAR_BATTERY = "\xef\x97\x9f";
pub const ICON_FA_CAR_BURST = "\xef\x97\xa1";
pub const ICON_FA_CAR_ON = "\xee\x93\x9d";
pub const ICON_FA_CAR_REAR = "\xef\x97\x9e";
pub const ICON_FA_CAR_SIDE = "\xef\x97\xa4";
pub const ICON_FA_CAR_TUNNEL = "\xee\x93\x9e";
pub const ICON_FA_CARAVAN = "\xef\xa3\xbf";
pub const ICON_FA_CARET_DOWN = "\xef\x83\x97";
pub const ICON_FA_CARET_LEFT = "\xef\x83\x99";
pub const ICON_FA_CARET_RIGHT = "\xef\x83\x9a";
pub const ICON_FA_CARET_UP = "\xef\x83\x98";
pub const ICON_FA_CARROT = "\xef\x9e\x87";
pub const ICON_FA_CART_ARROW_DOWN = "\xef\x88\x98";
pub const ICON_FA_CART_FLATBED = "\xef\x91\xb4";
pub const ICON_FA_CART_FLATBED_SUITCASE = "\xef\x96\x9d";
pub const ICON_FA_CART_PLUS = "\xef\x88\x97";
pub const ICON_FA_CART_SHOPPING = "\xef\x81\xba";
pub const ICON_FA_CASH_REGISTER = "\xef\x9e\x88";
pub const ICON_FA_CAT = "\xef\x9a\xbe";
pub const ICON_FA_CEDI_SIGN = "\xee\x83\x9f";
pub const ICON_FA_CENT_SIGN = "\xee\x8f\xb5";
pub const ICON_FA_CERTIFICATE = "\xef\x82\xa3";
pub const ICON_FA_CHAIR = "\xef\x9b\x80";
pub const ICON_FA_CHALKBOARD = "\xef\x94\x9b";
pub const ICON_FA_CHALKBOARD_USER = "\xef\x94\x9c";
pub const ICON_FA_CHAMPAGNE_GLASSES = "\xef\x9e\x9f";
pub const ICON_FA_CHARGING_STATION = "\xef\x97\xa7";
pub const ICON_FA_CHART_AREA = "\xef\x87\xbe";
pub const ICON_FA_CHART_BAR = "\xef\x82\x80";
pub const ICON_FA_CHART_COLUMN = "\xee\x83\xa3";
pub const ICON_FA_CHART_GANTT = "\xee\x83\xa4";
pub const ICON_FA_CHART_LINE = "\xef\x88\x81";
pub const ICON_FA_CHART_PIE = "\xef\x88\x80";
pub const ICON_FA_CHART_SIMPLE = "\xee\x91\xb3";
pub const ICON_FA_CHECK = "\xef\x80\x8c";
pub const ICON_FA_CHECK_DOUBLE = "\xef\x95\xa0";
pub const ICON_FA_CHECK_TO_SLOT = "\xef\x9d\xb2";
pub const ICON_FA_CHEESE = "\xef\x9f\xaf";
pub const ICON_FA_CHESS = "\xef\x90\xb9";
pub const ICON_FA_CHESS_BISHOP = "\xef\x90\xba";
pub const ICON_FA_CHESS_BOARD = "\xef\x90\xbc";
pub const ICON_FA_CHESS_KING = "\xef\x90\xbf";
pub const ICON_FA_CHESS_KNIGHT = "\xef\x91\x81";
pub const ICON_FA_CHESS_PAWN = "\xef\x91\x83";
pub const ICON_FA_CHESS_QUEEN = "\xef\x91\x85";
pub const ICON_FA_CHESS_ROOK = "\xef\x91\x87";
pub const ICON_FA_CHEVRON_DOWN = "\xef\x81\xb8";
pub const ICON_FA_CHEVRON_LEFT = "\xef\x81\x93";
pub const ICON_FA_CHEVRON_RIGHT = "\xef\x81\x94";
pub const ICON_FA_CHEVRON_UP = "\xef\x81\xb7";
pub const ICON_FA_CHILD = "\xef\x86\xae";
pub const ICON_FA_CHILD_DRESS = "\xee\x96\x9c";
pub const ICON_FA_CHILD_REACHING = "\xee\x96\x9d";
pub const ICON_FA_CHILD_RIFLE = "\xee\x93\xa0";
pub const ICON_FA_CHILDREN = "\xee\x93\xa1";
pub const ICON_FA_CHURCH = "\xef\x94\x9d";
pub const ICON_FA_CIRCLE = "\xef\x84\x91";
pub const ICON_FA_CIRCLE_ARROW_DOWN = "\xef\x82\xab";
pub const ICON_FA_CIRCLE_ARROW_LEFT = "\xef\x82\xa8";
pub const ICON_FA_CIRCLE_ARROW_RIGHT = "\xef\x82\xa9";
pub const ICON_FA_CIRCLE_ARROW_UP = "\xef\x82\xaa";
pub const ICON_FA_CIRCLE_CHECK = "\xef\x81\x98";
pub const ICON_FA_CIRCLE_CHEVRON_DOWN = "\xef\x84\xba";
pub const ICON_FA_CIRCLE_CHEVRON_LEFT = "\xef\x84\xb7";
pub const ICON_FA_CIRCLE_CHEVRON_RIGHT = "\xef\x84\xb8";
pub const ICON_FA_CIRCLE_CHEVRON_UP = "\xef\x84\xb9";
pub const ICON_FA_CIRCLE_DOLLAR_TO_SLOT = "\xef\x92\xb9";
pub const ICON_FA_CIRCLE_DOT = "\xef\x86\x92";
pub const ICON_FA_CIRCLE_DOWN = "\xef\x8d\x98";
pub const ICON_FA_CIRCLE_EXCLAMATION = "\xef\x81\xaa";
pub const ICON_FA_CIRCLE_H = "\xef\x91\xbe";
pub const ICON_FA_CIRCLE_HALF_STROKE = "\xef\x81\x82";
pub const ICON_FA_CIRCLE_INFO = "\xef\x81\x9a";
pub const ICON_FA_CIRCLE_LEFT = "\xef\x8d\x99";
pub const ICON_FA_CIRCLE_MINUS = "\xef\x81\x96";
pub const ICON_FA_CIRCLE_NODES = "\xee\x93\xa2";
pub const ICON_FA_CIRCLE_NOTCH = "\xef\x87\x8e";
pub const ICON_FA_CIRCLE_PAUSE = "\xef\x8a\x8b";
pub const ICON_FA_CIRCLE_PLAY = "\xef\x85\x84";
pub const ICON_FA_CIRCLE_PLUS = "\xef\x81\x95";
pub const ICON_FA_CIRCLE_QUESTION = "\xef\x81\x99";
pub const ICON_FA_CIRCLE_RADIATION = "\xef\x9e\xba";
pub const ICON_FA_CIRCLE_RIGHT = "\xef\x8d\x9a";
pub const ICON_FA_CIRCLE_STOP = "\xef\x8a\x8d";
pub const ICON_FA_CIRCLE_UP = "\xef\x8d\x9b";
pub const ICON_FA_CIRCLE_USER = "\xef\x8a\xbd";
pub const ICON_FA_CIRCLE_XMARK = "\xef\x81\x97";
pub const ICON_FA_CITY = "\xef\x99\x8f";
pub const ICON_FA_CLAPPERBOARD = "\xee\x84\xb1";
pub const ICON_FA_CLIPBOARD = "\xef\x8c\xa8";
pub const ICON_FA_CLIPBOARD_CHECK = "\xef\x91\xac";
pub const ICON_FA_CLIPBOARD_LIST = "\xef\x91\xad";
pub const ICON_FA_CLIPBOARD_QUESTION = "\xee\x93\xa3";
pub const ICON_FA_CLIPBOARD_USER = "\xef\x9f\xb3";
pub const ICON_FA_CLOCK = "\xef\x80\x97";
pub const ICON_FA_CLOCK_ROTATE_LEFT = "\xef\x87\x9a";
pub const ICON_FA_CLONE = "\xef\x89\x8d";
pub const ICON_FA_CLOSED_CAPTIONING = "\xef\x88\x8a";
pub const ICON_FA_CLOUD = "\xef\x83\x82";
pub const ICON_FA_CLOUD_ARROW_DOWN = "\xef\x83\xad";
pub const ICON_FA_CLOUD_ARROW_UP = "\xef\x83\xae";
pub const ICON_FA_CLOUD_BOLT = "\xef\x9d\xac";
pub const ICON_FA_CLOUD_MEATBALL = "\xef\x9c\xbb";
pub const ICON_FA_CLOUD_MOON = "\xef\x9b\x83";
pub const ICON_FA_CLOUD_MOON_RAIN = "\xef\x9c\xbc";
pub const ICON_FA_CLOUD_RAIN = "\xef\x9c\xbd";
pub const ICON_FA_CLOUD_SHOWERS_HEAVY = "\xef\x9d\x80";
pub const ICON_FA_CLOUD_SHOWERS_WATER = "\xee\x93\xa4";
pub const ICON_FA_CLOUD_SUN = "\xef\x9b\x84";
pub const ICON_FA_CLOUD_SUN_RAIN = "\xef\x9d\x83";
pub const ICON_FA_CLOVER = "\xee\x84\xb9";
pub const ICON_FA_CODE = "\xef\x84\xa1";
pub const ICON_FA_CODE_BRANCH = "\xef\x84\xa6";
pub const ICON_FA_CODE_COMMIT = "\xef\x8e\x86";
pub const ICON_FA_CODE_COMPARE = "\xee\x84\xba";
pub const ICON_FA_CODE_FORK = "\xee\x84\xbb";
pub const ICON_FA_CODE_MERGE = "\xef\x8e\x87";
pub const ICON_FA_CODE_PULL_REQUEST = "\xee\x84\xbc";
pub const ICON_FA_COINS = "\xef\x94\x9e";
pub const ICON_FA_COLON_SIGN = "\xee\x85\x80";
pub const ICON_FA_COMMENT = "\xef\x81\xb5";
pub const ICON_FA_COMMENT_DOLLAR = "\xef\x99\x91";
pub const ICON_FA_COMMENT_DOTS = "\xef\x92\xad";
pub const ICON_FA_COMMENT_MEDICAL = "\xef\x9f\xb5";
pub const ICON_FA_COMMENT_SLASH = "\xef\x92\xb3";
pub const ICON_FA_COMMENT_SMS = "\xef\x9f\x8d";
pub const ICON_FA_COMMENTS = "\xef\x82\x86";
pub const ICON_FA_COMMENTS_DOLLAR = "\xef\x99\x93";
pub const ICON_FA_COMPACT_DISC = "\xef\x94\x9f";
pub const ICON_FA_COMPASS = "\xef\x85\x8e";
pub const ICON_FA_COMPASS_DRAFTING = "\xef\x95\xa8";
pub const ICON_FA_COMPRESS = "\xef\x81\xa6";
pub const ICON_FA_COMPUTER = "\xee\x93\xa5";
pub const ICON_FA_COMPUTER_MOUSE = "\xef\xa3\x8c";
pub const ICON_FA_COOKIE = "\xef\x95\xa3";
pub const ICON_FA_COOKIE_BITE = "\xef\x95\xa4";
pub const ICON_FA_COPY = "\xef\x83\x85";
pub const ICON_FA_COPYRIGHT = "\xef\x87\xb9";
pub const ICON_FA_COUCH = "\xef\x92\xb8";
pub const ICON_FA_COW = "\xef\x9b\x88";
pub const ICON_FA_CREDIT_CARD = "\xef\x82\x9d";
pub const ICON_FA_CROP = "\xef\x84\xa5";
pub const ICON_FA_CROP_SIMPLE = "\xef\x95\xa5";
pub const ICON_FA_CROSS = "\xef\x99\x94";
pub const ICON_FA_CROSSHAIRS = "\xef\x81\x9b";
pub const ICON_FA_CROW = "\xef\x94\xa0";
pub const ICON_FA_CROWN = "\xef\x94\xa1";
pub const ICON_FA_CRUTCH = "\xef\x9f\xb7";
pub const ICON_FA_CRUZEIRO_SIGN = "\xee\x85\x92";
pub const ICON_FA_CUBE = "\xef\x86\xb2";
pub const ICON_FA_CUBES = "\xef\x86\xb3";
pub const ICON_FA_CUBES_STACKED = "\xee\x93\xa6";
pub const ICON_FA_D = "D";
pub const ICON_FA_DATABASE = "\xef\x87\x80";
pub const ICON_FA_DELETE_LEFT = "\xef\x95\x9a";
pub const ICON_FA_DEMOCRAT = "\xef\x9d\x87";
pub const ICON_FA_DESKTOP = "\xef\x8e\x90";
pub const ICON_FA_DHARMACHAKRA = "\xef\x99\x95";
pub const ICON_FA_DIAGRAM_NEXT = "\xee\x91\xb6";
pub const ICON_FA_DIAGRAM_PREDECESSOR = "\xee\x91\xb7";
pub const ICON_FA_DIAGRAM_PROJECT = "\xef\x95\x82";
pub const ICON_FA_DIAGRAM_SUCCESSOR = "\xee\x91\xba";
pub const ICON_FA_DIAMOND = "\xef\x88\x99";
pub const ICON_FA_DIAMOND_TURN_RIGHT = "\xef\x97\xab";
pub const ICON_FA_DICE = "\xef\x94\xa2";
pub const ICON_FA_DICE_D20 = "\xef\x9b\x8f";
pub const ICON_FA_DICE_D6 = "\xef\x9b\x91";
pub const ICON_FA_DICE_FIVE = "\xef\x94\xa3";
pub const ICON_FA_DICE_FOUR = "\xef\x94\xa4";
pub const ICON_FA_DICE_ONE = "\xef\x94\xa5";
pub const ICON_FA_DICE_SIX = "\xef\x94\xa6";
pub const ICON_FA_DICE_THREE = "\xef\x94\xa7";
pub const ICON_FA_DICE_TWO = "\xef\x94\xa8";
pub const ICON_FA_DISEASE = "\xef\x9f\xba";
pub const ICON_FA_DISPLAY = "\xee\x85\xa3";
pub const ICON_FA_DIVIDE = "\xef\x94\xa9";
pub const ICON_FA_DNA = "\xef\x91\xb1";
pub const ICON_FA_DOG = "\xef\x9b\x93";
pub const ICON_FA_DOLLAR_SIGN = "$";
pub const ICON_FA_DOLLY = "\xef\x91\xb2";
pub const ICON_FA_DONG_SIGN = "\xee\x85\xa9";
pub const ICON_FA_DOOR_CLOSED = "\xef\x94\xaa";
pub const ICON_FA_DOOR_OPEN = "\xef\x94\xab";
pub const ICON_FA_DOVE = "\xef\x92\xba";
pub const ICON_FA_DOWN_LEFT_AND_UP_RIGHT_TO_CENTER = "\xef\x90\xa2";
pub const ICON_FA_DOWN_LONG = "\xef\x8c\x89";
pub const ICON_FA_DOWNLOAD = "\xef\x80\x99";
pub const ICON_FA_DRAGON = "\xef\x9b\x95";
pub const ICON_FA_DRAW_POLYGON = "\xef\x97\xae";
pub const ICON_FA_DROPLET = "\xef\x81\x83";
pub const ICON_FA_DROPLET_SLASH = "\xef\x97\x87";
pub const ICON_FA_DRUM = "\xef\x95\xa9";
pub const ICON_FA_DRUM_STEELPAN = "\xef\x95\xaa";
pub const ICON_FA_DRUMSTICK_BITE = "\xef\x9b\x97";
pub const ICON_FA_DUMBBELL = "\xef\x91\x8b";
pub const ICON_FA_DUMPSTER = "\xef\x9e\x93";
pub const ICON_FA_DUMPSTER_FIRE = "\xef\x9e\x94";
pub const ICON_FA_DUNGEON = "\xef\x9b\x99";
pub const ICON_FA_E = "E";
pub const ICON_FA_EAR_DEAF = "\xef\x8a\xa4";
pub const ICON_FA_EAR_LISTEN = "\xef\x8a\xa2";
pub const ICON_FA_EARTH_AFRICA = "\xef\x95\xbc";
pub const ICON_FA_EARTH_AMERICAS = "\xef\x95\xbd";
pub const ICON_FA_EARTH_ASIA = "\xef\x95\xbe";
pub const ICON_FA_EARTH_EUROPE = "\xef\x9e\xa2";
pub const ICON_FA_EARTH_OCEANIA = "\xee\x91\xbb";
pub const ICON_FA_EGG = "\xef\x9f\xbb";
pub const ICON_FA_EJECT = "\xef\x81\x92";
pub const ICON_FA_ELEVATOR = "\xee\x85\xad";
pub const ICON_FA_ELLIPSIS = "\xef\x85\x81";
pub const ICON_FA_ELLIPSIS_VERTICAL = "\xef\x85\x82";
pub const ICON_FA_ENVELOPE = "\xef\x83\xa0";
pub const ICON_FA_ENVELOPE_CIRCLE_CHECK = "\xee\x93\xa8";
pub const ICON_FA_ENVELOPE_OPEN = "\xef\x8a\xb6";
pub const ICON_FA_ENVELOPE_OPEN_TEXT = "\xef\x99\x98";
pub const ICON_FA_ENVELOPES_BULK = "\xef\x99\xb4";
pub const ICON_FA_EQUALS = "=";
pub const ICON_FA_ERASER = "\xef\x84\xad";
pub const ICON_FA_ETHERNET = "\xef\x9e\x96";
pub const ICON_FA_EURO_SIGN = "\xef\x85\x93";
pub const ICON_FA_EXCLAMATION = "!";
pub const ICON_FA_EXPAND = "\xef\x81\xa5";
pub const ICON_FA_EXPLOSION = "\xee\x93\xa9";
pub const ICON_FA_EYE = "\xef\x81\xae";
pub const ICON_FA_EYE_DROPPER = "\xef\x87\xbb";
pub const ICON_FA_EYE_LOW_VISION = "\xef\x8a\xa8";
pub const ICON_FA_EYE_SLASH = "\xef\x81\xb0";
pub const ICON_FA_F = "F";
pub const ICON_FA_FACE_ANGRY = "\xef\x95\x96";
pub const ICON_FA_FACE_DIZZY = "\xef\x95\xa7";
pub const ICON_FA_FACE_FLUSHED = "\xef\x95\xb9";
pub const ICON_FA_FACE_FROWN = "\xef\x84\x99";
pub const ICON_FA_FACE_FROWN_OPEN = "\xef\x95\xba";
pub const ICON_FA_FACE_GRIMACE = "\xef\x95\xbf";
pub const ICON_FA_FACE_GRIN = "\xef\x96\x80";
pub const ICON_FA_FACE_GRIN_BEAM = "\xef\x96\x82";
pub const ICON_FA_FACE_GRIN_BEAM_SWEAT = "\xef\x96\x83";
pub const ICON_FA_FACE_GRIN_HEARTS = "\xef\x96\x84";
pub const ICON_FA_FACE_GRIN_SQUINT = "\xef\x96\x85";
pub const ICON_FA_FACE_GRIN_SQUINT_TEARS = "\xef\x96\x86";
pub const ICON_FA_FACE_GRIN_STARS = "\xef\x96\x87";
pub const ICON_FA_FACE_GRIN_TEARS = "\xef\x96\x88";
pub const ICON_FA_FACE_GRIN_TONGUE = "\xef\x96\x89";
pub const ICON_FA_FACE_GRIN_TONGUE_SQUINT = "\xef\x96\x8a";
pub const ICON_FA_FACE_GRIN_TONGUE_WINK = "\xef\x96\x8b";
pub const ICON_FA_FACE_GRIN_WIDE = "\xef\x96\x81";
pub const ICON_FA_FACE_GRIN_WINK = "\xef\x96\x8c";
pub const ICON_FA_FACE_KISS = "\xef\x96\x96";
pub const ICON_FA_FACE_KISS_BEAM = "\xef\x96\x97";
pub const ICON_FA_FACE_KISS_WINK_HEART = "\xef\x96\x98";
pub const ICON_FA_FACE_LAUGH = "\xef\x96\x99";
pub const ICON_FA_FACE_LAUGH_BEAM = "\xef\x96\x9a";
pub const ICON_FA_FACE_LAUGH_SQUINT = "\xef\x96\x9b";
pub const ICON_FA_FACE_LAUGH_WINK = "\xef\x96\x9c";
pub const ICON_FA_FACE_MEH = "\xef\x84\x9a";
pub const ICON_FA_FACE_MEH_BLANK = "\xef\x96\xa4";
pub const ICON_FA_FACE_ROLLING_EYES = "\xef\x96\xa5";
pub const ICON_FA_FACE_SAD_CRY = "\xef\x96\xb3";
pub const ICON_FA_FACE_SAD_TEAR = "\xef\x96\xb4";
pub const ICON_FA_FACE_SMILE = "\xef\x84\x98";
pub const ICON_FA_FACE_SMILE_BEAM = "\xef\x96\xb8";
pub const ICON_FA_FACE_SMILE_WINK = "\xef\x93\x9a";
pub const ICON_FA_FACE_SURPRISE = "\xef\x97\x82";
pub const ICON_FA_FACE_TIRED = "\xef\x97\x88";
pub const ICON_FA_FAN = "\xef\xa1\xa3";
pub const ICON_FA_FAUCET = "\xee\x80\x85";
pub const ICON_FA_FAUCET_DRIP = "\xee\x80\x86";
pub const ICON_FA_FAX = "\xef\x86\xac";
pub const ICON_FA_FEATHER = "\xef\x94\xad";
pub const ICON_FA_FEATHER_POINTED = "\xef\x95\xab";
pub const ICON_FA_FERRY = "\xee\x93\xaa";
pub const ICON_FA_FILE = "\xef\x85\x9b";
pub const ICON_FA_FILE_ARROW_DOWN = "\xef\x95\xad";
pub const ICON_FA_FILE_ARROW_UP = "\xef\x95\xb4";
pub const ICON_FA_FILE_AUDIO = "\xef\x87\x87";
pub const ICON_FA_FILE_CIRCLE_CHECK = "\xee\x92\x93";
pub const ICON_FA_FILE_CIRCLE_EXCLAMATION = "\xee\x93\xab";
pub const ICON_FA_FILE_CIRCLE_MINUS = "\xee\x93\xad";
pub const ICON_FA_FILE_CIRCLE_PLUS = "\xee\x93\xae";
pub const ICON_FA_FILE_CIRCLE_QUESTION = "\xee\x93\xaf";
pub const ICON_FA_FILE_CIRCLE_XMARK = "\xee\x92\x94";
pub const ICON_FA_FILE_CODE = "\xef\x87\x89";
pub const ICON_FA_FILE_CONTRACT = "\xef\x95\xac";
pub const ICON_FA_FILE_CSV = "\xef\x9b\x9d";
pub const ICON_FA_FILE_EXCEL = "\xef\x87\x83";
pub const ICON_FA_FILE_EXPORT = "\xef\x95\xae";
pub const ICON_FA_FILE_IMAGE = "\xef\x87\x85";
pub const ICON_FA_FILE_IMPORT = "\xef\x95\xaf";
pub const ICON_FA_FILE_INVOICE = "\xef\x95\xb0";
pub const ICON_FA_FILE_INVOICE_DOLLAR = "\xef\x95\xb1";
pub const ICON_FA_FILE_LINES = "\xef\x85\x9c";
pub const ICON_FA_FILE_MEDICAL = "\xef\x91\xb7";
pub const ICON_FA_FILE_PDF = "\xef\x87\x81";
pub const ICON_FA_FILE_PEN = "\xef\x8c\x9c";
pub const ICON_FA_FILE_POWERPOINT = "\xef\x87\x84";
pub const ICON_FA_FILE_PRESCRIPTION = "\xef\x95\xb2";
pub const ICON_FA_FILE_SHIELD = "\xee\x93\xb0";
pub const ICON_FA_FILE_SIGNATURE = "\xef\x95\xb3";
pub const ICON_FA_FILE_VIDEO = "\xef\x87\x88";
pub const ICON_FA_FILE_WAVEFORM = "\xef\x91\xb8";
pub const ICON_FA_FILE_WORD = "\xef\x87\x82";
pub const ICON_FA_FILE_ZIPPER = "\xef\x87\x86";
pub const ICON_FA_FILL = "\xef\x95\xb5";
pub const ICON_FA_FILL_DRIP = "\xef\x95\xb6";
pub const ICON_FA_FILM = "\xef\x80\x88";
pub const ICON_FA_FILTER = "\xef\x82\xb0";
pub const ICON_FA_FILTER_CIRCLE_DOLLAR = "\xef\x99\xa2";
pub const ICON_FA_FILTER_CIRCLE_XMARK = "\xee\x85\xbb";
pub const ICON_FA_FINGERPRINT = "\xef\x95\xb7";
pub const ICON_FA_FIRE = "\xef\x81\xad";
pub const ICON_FA_FIRE_BURNER = "\xee\x93\xb1";
pub const ICON_FA_FIRE_EXTINGUISHER = "\xef\x84\xb4";
pub const ICON_FA_FIRE_FLAME_CURVED = "\xef\x9f\xa4";
pub const ICON_FA_FIRE_FLAME_SIMPLE = "\xef\x91\xaa";
pub const ICON_FA_FISH = "\xef\x95\xb8";
pub const ICON_FA_FISH_FINS = "\xee\x93\xb2";
pub const ICON_FA_FLAG = "\xef\x80\xa4";
pub const ICON_FA_FLAG_CHECKERED = "\xef\x84\x9e";
pub const ICON_FA_FLAG_USA = "\xef\x9d\x8d";
pub const ICON_FA_FLASK = "\xef\x83\x83";
pub const ICON_FA_FLASK_VIAL = "\xee\x93\xb3";
pub const ICON_FA_FLOPPY_DISK = "\xef\x83\x87";
pub const ICON_FA_FLORIN_SIGN = "\xee\x86\x84";
pub const ICON_FA_FOLDER = "\xef\x81\xbb";
pub const ICON_FA_FOLDER_CLOSED = "\xee\x86\x85";
pub const ICON_FA_FOLDER_MINUS = "\xef\x99\x9d";
pub const ICON_FA_FOLDER_OPEN = "\xef\x81\xbc";
pub const ICON_FA_FOLDER_PLUS = "\xef\x99\x9e";
pub const ICON_FA_FOLDER_TREE = "\xef\xa0\x82";
pub const ICON_FA_FONT = "\xef\x80\xb1";
pub const ICON_FA_FONT_AWESOME = "\xef\x8a\xb4";
pub const ICON_FA_FOOTBALL = "\xef\x91\x8e";
pub const ICON_FA_FORWARD = "\xef\x81\x8e";
pub const ICON_FA_FORWARD_FAST = "\xef\x81\x90";
pub const ICON_FA_FORWARD_STEP = "\xef\x81\x91";
pub const ICON_FA_FRANC_SIGN = "\xee\x86\x8f";
pub const ICON_FA_FROG = "\xef\x94\xae";
pub const ICON_FA_FUTBOL = "\xef\x87\xa3";
pub const ICON_FA_G = "G";
pub const ICON_FA_GAMEPAD = "\xef\x84\x9b";
pub const ICON_FA_GAS_PUMP = "\xef\x94\xaf";
pub const ICON_FA_GAUGE = "\xef\x98\xa4";
pub const ICON_FA_GAUGE_HIGH = "\xef\x98\xa5";
pub const ICON_FA_GAUGE_SIMPLE = "\xef\x98\xa9";
pub const ICON_FA_GAUGE_SIMPLE_HIGH = "\xef\x98\xaa";
pub const ICON_FA_GAVEL = "\xef\x83\xa3";
pub const ICON_FA_GEAR = "\xef\x80\x93";
pub const ICON_FA_GEARS = "\xef\x82\x85";
pub const ICON_FA_GEM = "\xef\x8e\xa5";
pub const ICON_FA_GENDERLESS = "\xef\x88\xad";
pub const ICON_FA_GHOST = "\xef\x9b\xa2";
pub const ICON_FA_GIFT = "\xef\x81\xab";
pub const ICON_FA_GIFTS = "\xef\x9e\x9c";
pub const ICON_FA_GLASS_WATER = "\xee\x93\xb4";
pub const ICON_FA_GLASS_WATER_DROPLET = "\xee\x93\xb5";
pub const ICON_FA_GLASSES = "\xef\x94\xb0";
pub const ICON_FA_GLOBE = "\xef\x82\xac";
pub const ICON_FA_GOLF_BALL_TEE = "\xef\x91\x90";
pub const ICON_FA_GOPURAM = "\xef\x99\xa4";
pub const ICON_FA_GRADUATION_CAP = "\xef\x86\x9d";
pub const ICON_FA_GREATER_THAN = ">";
pub const ICON_FA_GREATER_THAN_EQUAL = "\xef\x94\xb2";
pub const ICON_FA_GRIP = "\xef\x96\x8d";
pub const ICON_FA_GRIP_LINES = "\xef\x9e\xa4";
pub const ICON_FA_GRIP_LINES_VERTICAL = "\xef\x9e\xa5";
pub const ICON_FA_GRIP_VERTICAL = "\xef\x96\x8e";
pub const ICON_FA_GROUP_ARROWS_ROTATE = "\xee\x93\xb6";
pub const ICON_FA_GUARANI_SIGN = "\xee\x86\x9a";
pub const ICON_FA_GUITAR = "\xef\x9e\xa6";
pub const ICON_FA_GUN = "\xee\x86\x9b";
pub const ICON_FA_H = "H";
pub const ICON_FA_HAMMER = "\xef\x9b\xa3";
pub const ICON_FA_HAMSA = "\xef\x99\xa5";
pub const ICON_FA_HAND = "\xef\x89\x96";
pub const ICON_FA_HAND_BACK_FIST = "\xef\x89\x95";
pub const ICON_FA_HAND_DOTS = "\xef\x91\xa1";
pub const ICON_FA_HAND_FIST = "\xef\x9b\x9e";
pub const ICON_FA_HAND_HOLDING = "\xef\x92\xbd";
pub const ICON_FA_HAND_HOLDING_DOLLAR = "\xef\x93\x80";
pub const ICON_FA_HAND_HOLDING_DROPLET = "\xef\x93\x81";
pub const ICON_FA_HAND_HOLDING_HAND = "\xee\x93\xb7";
pub const ICON_FA_HAND_HOLDING_HEART = "\xef\x92\xbe";
pub const ICON_FA_HAND_HOLDING_MEDICAL = "\xee\x81\x9c";
pub const ICON_FA_HAND_LIZARD = "\xef\x89\x98";
pub const ICON_FA_HAND_MIDDLE_FINGER = "\xef\xa0\x86";
pub const ICON_FA_HAND_PEACE = "\xef\x89\x9b";
pub const ICON_FA_HAND_POINT_DOWN = "\xef\x82\xa7";
pub const ICON_FA_HAND_POINT_LEFT = "\xef\x82\xa5";
pub const ICON_FA_HAND_POINT_RIGHT = "\xef\x82\xa4";
pub const ICON_FA_HAND_POINT_UP = "\xef\x82\xa6";
pub const ICON_FA_HAND_POINTER = "\xef\x89\x9a";
pub const ICON_FA_HAND_SCISSORS = "\xef\x89\x97";
pub const ICON_FA_HAND_SPARKLES = "\xee\x81\x9d";
pub const ICON_FA_HAND_SPOCK = "\xef\x89\x99";
pub const ICON_FA_HANDCUFFS = "\xee\x93\xb8";
pub const ICON_FA_HANDS = "\xef\x8a\xa7";
pub const ICON_FA_HANDS_ASL_INTERPRETING = "\xef\x8a\xa3";
pub const ICON_FA_HANDS_BOUND = "\xee\x93\xb9";
pub const ICON_FA_HANDS_BUBBLES = "\xee\x81\x9e";
pub const ICON_FA_HANDS_CLAPPING = "\xee\x86\xa8";
pub const ICON_FA_HANDS_HOLDING = "\xef\x93\x82";
pub const ICON_FA_HANDS_HOLDING_CHILD = "\xee\x93\xba";
pub const ICON_FA_HANDS_HOLDING_CIRCLE = "\xee\x93\xbb";
pub const ICON_FA_HANDS_PRAYING = "\xef\x9a\x84";
pub const ICON_FA_HANDSHAKE = "\xef\x8a\xb5";
pub const ICON_FA_HANDSHAKE_ANGLE = "\xef\x93\x84";
pub const ICON_FA_HANDSHAKE_SIMPLE = "\xef\x93\x86";
pub const ICON_FA_HANDSHAKE_SIMPLE_SLASH = "\xee\x81\x9f";
pub const ICON_FA_HANDSHAKE_SLASH = "\xee\x81\xa0";
pub const ICON_FA_HANUKIAH = "\xef\x9b\xa6";
pub const ICON_FA_HARD_DRIVE = "\xef\x82\xa0";
pub const ICON_FA_HASHTAG = "#";
pub const ICON_FA_HAT_COWBOY = "\xef\xa3\x80";
pub const ICON_FA_HAT_COWBOY_SIDE = "\xef\xa3\x81";
pub const ICON_FA_HAT_WIZARD = "\xef\x9b\xa8";
pub const ICON_FA_HEAD_SIDE_COUGH = "\xee\x81\xa1";
pub const ICON_FA_HEAD_SIDE_COUGH_SLASH = "\xee\x81\xa2";
pub const ICON_FA_HEAD_SIDE_MASK = "\xee\x81\xa3";
pub const ICON_FA_HEAD_SIDE_VIRUS = "\xee\x81\xa4";
pub const ICON_FA_HEADING = "\xef\x87\x9c";
pub const ICON_FA_HEADPHONES = "\xef\x80\xa5";
pub const ICON_FA_HEADPHONES_SIMPLE = "\xef\x96\x8f";
pub const ICON_FA_HEADSET = "\xef\x96\x90";
pub const ICON_FA_HEART = "\xef\x80\x84";
pub const ICON_FA_HEART_CIRCLE_BOLT = "\xee\x93\xbc";
pub const ICON_FA_HEART_CIRCLE_CHECK = "\xee\x93\xbd";
pub const ICON_FA_HEART_CIRCLE_EXCLAMATION = "\xee\x93\xbe";
pub const ICON_FA_HEART_CIRCLE_MINUS = "\xee\x93\xbf";
pub const ICON_FA_HEART_CIRCLE_PLUS = "\xee\x94\x80";
pub const ICON_FA_HEART_CIRCLE_XMARK = "\xee\x94\x81";
pub const ICON_FA_HEART_CRACK = "\xef\x9e\xa9";
pub const ICON_FA_HEART_PULSE = "\xef\x88\x9e";
pub const ICON_FA_HELICOPTER = "\xef\x94\xb3";
pub const ICON_FA_HELICOPTER_SYMBOL = "\xee\x94\x82";
pub const ICON_FA_HELMET_SAFETY = "\xef\xa0\x87";
pub const ICON_FA_HELMET_UN = "\xee\x94\x83";
pub const ICON_FA_HIGHLIGHTER = "\xef\x96\x91";
pub const ICON_FA_HILL_AVALANCHE = "\xee\x94\x87";
pub const ICON_FA_HILL_ROCKSLIDE = "\xee\x94\x88";
pub const ICON_FA_HIPPO = "\xef\x9b\xad";
pub const ICON_FA_HOCKEY_PUCK = "\xef\x91\x93";
pub const ICON_FA_HOLLY_BERRY = "\xef\x9e\xaa";
pub const ICON_FA_HORSE = "\xef\x9b\xb0";
pub const ICON_FA_HORSE_HEAD = "\xef\x9e\xab";
pub const ICON_FA_HOSPITAL = "\xef\x83\xb8";
pub const ICON_FA_HOSPITAL_USER = "\xef\xa0\x8d";
pub const ICON_FA_HOT_TUB_PERSON = "\xef\x96\x93";
pub const ICON_FA_HOTDOG = "\xef\xa0\x8f";
pub const ICON_FA_HOTEL = "\xef\x96\x94";
pub const ICON_FA_HOURGLASS = "\xef\x89\x94";
pub const ICON_FA_HOURGLASS_EMPTY = "\xef\x89\x92";
pub const ICON_FA_HOURGLASS_END = "\xef\x89\x93";
pub const ICON_FA_HOURGLASS_START = "\xef\x89\x91";
pub const ICON_FA_HOUSE = "\xef\x80\x95";
pub const ICON_FA_HOUSE_CHIMNEY = "\xee\x8e\xaf";
pub const ICON_FA_HOUSE_CHIMNEY_CRACK = "\xef\x9b\xb1";
pub const ICON_FA_HOUSE_CHIMNEY_MEDICAL = "\xef\x9f\xb2";
pub const ICON_FA_HOUSE_CHIMNEY_USER = "\xee\x81\xa5";
pub const ICON_FA_HOUSE_CHIMNEY_WINDOW = "\xee\x80\x8d";
pub const ICON_FA_HOUSE_CIRCLE_CHECK = "\xee\x94\x89";
pub const ICON_FA_HOUSE_CIRCLE_EXCLAMATION = "\xee\x94\x8a";
pub const ICON_FA_HOUSE_CIRCLE_XMARK = "\xee\x94\x8b";
pub const ICON_FA_HOUSE_CRACK = "\xee\x8e\xb1";
pub const ICON_FA_HOUSE_FIRE = "\xee\x94\x8c";
pub const ICON_FA_HOUSE_FLAG = "\xee\x94\x8d";
pub const ICON_FA_HOUSE_FLOOD_WATER = "\xee\x94\x8e";
pub const ICON_FA_HOUSE_FLOOD_WATER_CIRCLE_ARROW_RIGHT = "\xee\x94\x8f";
pub const ICON_FA_HOUSE_LAPTOP = "\xee\x81\xa6";
pub const ICON_FA_HOUSE_LOCK = "\xee\x94\x90";
pub const ICON_FA_HOUSE_MEDICAL = "\xee\x8e\xb2";
pub const ICON_FA_HOUSE_MEDICAL_CIRCLE_CHECK = "\xee\x94\x91";
pub const ICON_FA_HOUSE_MEDICAL_CIRCLE_EXCLAMATION = "\xee\x94\x92";
pub const ICON_FA_HOUSE_MEDICAL_CIRCLE_XMARK = "\xee\x94\x93";
pub const ICON_FA_HOUSE_MEDICAL_FLAG = "\xee\x94\x94";
pub const ICON_FA_HOUSE_SIGNAL = "\xee\x80\x92";
pub const ICON_FA_HOUSE_TSUNAMI = "\xee\x94\x95";
pub const ICON_FA_HOUSE_USER = "\xee\x86\xb0";
pub const ICON_FA_HRYVNIA_SIGN = "\xef\x9b\xb2";
pub const ICON_FA_HURRICANE = "\xef\x9d\x91";
pub const ICON_FA_I = "I";
pub const ICON_FA_I_CURSOR = "\xef\x89\x86";
pub const ICON_FA_ICE_CREAM = "\xef\xa0\x90";
pub const ICON_FA_ICICLES = "\xef\x9e\xad";
pub const ICON_FA_ICONS = "\xef\xa1\xad";
pub const ICON_FA_ID_BADGE = "\xef\x8b\x81";
pub const ICON_FA_ID_CARD = "\xef\x8b\x82";
pub const ICON_FA_ID_CARD_CLIP = "\xef\x91\xbf";
pub const ICON_FA_IGLOO = "\xef\x9e\xae";
pub const ICON_FA_IMAGE = "\xef\x80\xbe";
pub const ICON_FA_IMAGE_PORTRAIT = "\xef\x8f\xa0";
pub const ICON_FA_IMAGES = "\xef\x8c\x82";
pub const ICON_FA_INBOX = "\xef\x80\x9c";
pub const ICON_FA_INDENT = "\xef\x80\xbc";
pub const ICON_FA_INDIAN_RUPEE_SIGN = "\xee\x86\xbc";
pub const ICON_FA_INDUSTRY = "\xef\x89\xb5";
pub const ICON_FA_INFINITY = "\xef\x94\xb4";
pub const ICON_FA_INFO = "\xef\x84\xa9";
pub const ICON_FA_ITALIC = "\xef\x80\xb3";
pub const ICON_FA_J = "J";
pub const ICON_FA_JAR = "\xee\x94\x96";
pub const ICON_FA_JAR_WHEAT = "\xee\x94\x97";
pub const ICON_FA_JEDI = "\xef\x99\xa9";
pub const ICON_FA_JET_FIGHTER = "\xef\x83\xbb";
pub const ICON_FA_JET_FIGHTER_UP = "\xee\x94\x98";
pub const ICON_FA_JOINT = "\xef\x96\x95";
pub const ICON_FA_JUG_DETERGENT = "\xee\x94\x99";
pub const ICON_FA_K = "K";
pub const ICON_FA_KAABA = "\xef\x99\xab";
pub const ICON_FA_KEY = "\xef\x82\x84";
pub const ICON_FA_KEYBOARD = "\xef\x84\x9c";
pub const ICON_FA_KHANDA = "\xef\x99\xad";
pub const ICON_FA_KIP_SIGN = "\xee\x87\x84";
pub const ICON_FA_KIT_MEDICAL = "\xef\x91\xb9";
pub const ICON_FA_KITCHEN_SET = "\xee\x94\x9a";
pub const ICON_FA_KIWI_BIRD = "\xef\x94\xb5";
pub const ICON_FA_L = "L";
pub const ICON_FA_LAND_MINE_ON = "\xee\x94\x9b";
pub const ICON_FA_LANDMARK = "\xef\x99\xaf";
pub const ICON_FA_LANDMARK_DOME = "\xef\x9d\x92";
pub const ICON_FA_LANDMARK_FLAG = "\xee\x94\x9c";
pub const ICON_FA_LANGUAGE = "\xef\x86\xab";
pub const ICON_FA_LAPTOP = "\xef\x84\x89";
pub const ICON_FA_LAPTOP_CODE = "\xef\x97\xbc";
pub const ICON_FA_LAPTOP_FILE = "\xee\x94\x9d";
pub const ICON_FA_LAPTOP_MEDICAL = "\xef\xa0\x92";
pub const ICON_FA_LARI_SIGN = "\xee\x87\x88";
pub const ICON_FA_LAYER_GROUP = "\xef\x97\xbd";
pub const ICON_FA_LEAF = "\xef\x81\xac";
pub const ICON_FA_LEFT_LONG = "\xef\x8c\x8a";
pub const ICON_FA_LEFT_RIGHT = "\xef\x8c\xb7";
pub const ICON_FA_LEMON = "\xef\x82\x94";
pub const ICON_FA_LESS_THAN = "<";
pub const ICON_FA_LESS_THAN_EQUAL = "\xef\x94\xb7";
pub const ICON_FA_LIFE_RING = "\xef\x87\x8d";
pub const ICON_FA_LIGHTBULB = "\xef\x83\xab";
pub const ICON_FA_LINES_LEANING = "\xee\x94\x9e";
pub const ICON_FA_LINK = "\xef\x83\x81";
pub const ICON_FA_LINK_SLASH = "\xef\x84\xa7";
pub const ICON_FA_LIRA_SIGN = "\xef\x86\x95";
pub const ICON_FA_LIST = "\xef\x80\xba";
pub const ICON_FA_LIST_CHECK = "\xef\x82\xae";
pub const ICON_FA_LIST_OL = "\xef\x83\x8b";
pub const ICON_FA_LIST_UL = "\xef\x83\x8a";
pub const ICON_FA_LITECOIN_SIGN = "\xee\x87\x93";
pub const ICON_FA_LOCATION_ARROW = "\xef\x84\xa4";
pub const ICON_FA_LOCATION_CROSSHAIRS = "\xef\x98\x81";
pub const ICON_FA_LOCATION_DOT = "\xef\x8f\x85";
pub const ICON_FA_LOCATION_PIN = "\xef\x81\x81";
pub const ICON_FA_LOCATION_PIN_LOCK = "\xee\x94\x9f";
pub const ICON_FA_LOCK = "\xef\x80\xa3";
pub const ICON_FA_LOCK_OPEN = "\xef\x8f\x81";
pub const ICON_FA_LOCUST = "\xee\x94\xa0";
pub const ICON_FA_LUNGS = "\xef\x98\x84";
pub const ICON_FA_LUNGS_VIRUS = "\xee\x81\xa7";
pub const ICON_FA_M = "M";
pub const ICON_FA_MAGNET = "\xef\x81\xb6";
pub const ICON_FA_MAGNIFYING_GLASS = "\xef\x80\x82";
pub const ICON_FA_MAGNIFYING_GLASS_ARROW_RIGHT = "\xee\x94\xa1";
pub const ICON_FA_MAGNIFYING_GLASS_CHART = "\xee\x94\xa2";
pub const ICON_FA_MAGNIFYING_GLASS_DOLLAR = "\xef\x9a\x88";
pub const ICON_FA_MAGNIFYING_GLASS_LOCATION = "\xef\x9a\x89";
pub const ICON_FA_MAGNIFYING_GLASS_MINUS = "\xef\x80\x90";
pub const ICON_FA_MAGNIFYING_GLASS_PLUS = "\xef\x80\x8e";
pub const ICON_FA_MANAT_SIGN = "\xee\x87\x95";
pub const ICON_FA_MAP = "\xef\x89\xb9";
pub const ICON_FA_MAP_LOCATION = "\xef\x96\x9f";
pub const ICON_FA_MAP_LOCATION_DOT = "\xef\x96\xa0";
pub const ICON_FA_MAP_PIN = "\xef\x89\xb6";
pub const ICON_FA_MARKER = "\xef\x96\xa1";
pub const ICON_FA_MARS = "\xef\x88\xa2";
pub const ICON_FA_MARS_AND_VENUS = "\xef\x88\xa4";
pub const ICON_FA_MARS_AND_VENUS_BURST = "\xee\x94\xa3";
pub const ICON_FA_MARS_DOUBLE = "\xef\x88\xa7";
pub const ICON_FA_MARS_STROKE = "\xef\x88\xa9";
pub const ICON_FA_MARS_STROKE_RIGHT = "\xef\x88\xab";
pub const ICON_FA_MARS_STROKE_UP = "\xef\x88\xaa";
pub const ICON_FA_MARTINI_GLASS = "\xef\x95\xbb";
pub const ICON_FA_MARTINI_GLASS_CITRUS = "\xef\x95\xa1";
pub const ICON_FA_MARTINI_GLASS_EMPTY = "\xef\x80\x80";
pub const ICON_FA_MASK = "\xef\x9b\xba";
pub const ICON_FA_MASK_FACE = "\xee\x87\x97";
pub const ICON_FA_MASK_VENTILATOR = "\xee\x94\xa4";
pub const ICON_FA_MASKS_THEATER = "\xef\x98\xb0";
pub const ICON_FA_MATTRESS_PILLOW = "\xee\x94\xa5";
pub const ICON_FA_MAXIMIZE = "\xef\x8c\x9e";
pub const ICON_FA_MEDAL = "\xef\x96\xa2";
pub const ICON_FA_MEMORY = "\xef\x94\xb8";
pub const ICON_FA_MENORAH = "\xef\x99\xb6";
pub const ICON_FA_MERCURY = "\xef\x88\xa3";
pub const ICON_FA_MESSAGE = "\xef\x89\xba";
pub const ICON_FA_METEOR = "\xef\x9d\x93";
pub const ICON_FA_MICROCHIP = "\xef\x8b\x9b";
pub const ICON_FA_MICROPHONE = "\xef\x84\xb0";
pub const ICON_FA_MICROPHONE_LINES = "\xef\x8f\x89";
pub const ICON_FA_MICROPHONE_LINES_SLASH = "\xef\x94\xb9";
pub const ICON_FA_MICROPHONE_SLASH = "\xef\x84\xb1";
pub const ICON_FA_MICROSCOPE = "\xef\x98\x90";
pub const ICON_FA_MILL_SIGN = "\xee\x87\xad";
pub const ICON_FA_MINIMIZE = "\xef\x9e\x8c";
pub const ICON_FA_MINUS = "\xef\x81\xa8";
pub const ICON_FA_MITTEN = "\xef\x9e\xb5";
pub const ICON_FA_MOBILE = "\xef\x8f\x8e";
pub const ICON_FA_MOBILE_BUTTON = "\xef\x84\x8b";
pub const ICON_FA_MOBILE_RETRO = "\xee\x94\xa7";
pub const ICON_FA_MOBILE_SCREEN = "\xef\x8f\x8f";
pub const ICON_FA_MOBILE_SCREEN_BUTTON = "\xef\x8f\x8d";
pub const ICON_FA_MONEY_BILL = "\xef\x83\x96";
pub const ICON_FA_MONEY_BILL_1 = "\xef\x8f\x91";
pub const ICON_FA_MONEY_BILL_1_WAVE = "\xef\x94\xbb";
pub const ICON_FA_MONEY_BILL_TRANSFER = "\xee\x94\xa8";
pub const ICON_FA_MONEY_BILL_TREND_UP = "\xee\x94\xa9";
pub const ICON_FA_MONEY_BILL_WAVE = "\xef\x94\xba";
pub const ICON_FA_MONEY_BILL_WHEAT = "\xee\x94\xaa";
pub const ICON_FA_MONEY_BILLS = "\xee\x87\xb3";
pub const ICON_FA_MONEY_CHECK = "\xef\x94\xbc";
pub const ICON_FA_MONEY_CHECK_DOLLAR = "\xef\x94\xbd";
pub const ICON_FA_MONUMENT = "\xef\x96\xa6";
pub const ICON_FA_MOON = "\xef\x86\x86";
pub const ICON_FA_MORTAR_PESTLE = "\xef\x96\xa7";
pub const ICON_FA_MOSQUE = "\xef\x99\xb8";
pub const ICON_FA_MOSQUITO = "\xee\x94\xab";
pub const ICON_FA_MOSQUITO_NET = "\xee\x94\xac";
pub const ICON_FA_MOTORCYCLE = "\xef\x88\x9c";
pub const ICON_FA_MOUND = "\xee\x94\xad";
pub const ICON_FA_MOUNTAIN = "\xef\x9b\xbc";
pub const ICON_FA_MOUNTAIN_CITY = "\xee\x94\xae";
pub const ICON_FA_MOUNTAIN_SUN = "\xee\x94\xaf";
pub const ICON_FA_MUG_HOT = "\xef\x9e\xb6";
pub const ICON_FA_MUG_SAUCER = "\xef\x83\xb4";
pub const ICON_FA_MUSIC = "\xef\x80\x81";
pub const ICON_FA_N = "N";
pub const ICON_FA_NAIRA_SIGN = "\xee\x87\xb6";
pub const ICON_FA_NETWORK_WIRED = "\xef\x9b\xbf";
pub const ICON_FA_NEUTER = "\xef\x88\xac";
pub const ICON_FA_NEWSPAPER = "\xef\x87\xaa";
pub const ICON_FA_NOT_EQUAL = "\xef\x94\xbe";
pub const ICON_FA_NOTE_STICKY = "\xef\x89\x89";
pub const ICON_FA_NOTES_MEDICAL = "\xef\x92\x81";
pub const ICON_FA_O = "O";
pub const ICON_FA_OBJECT_GROUP = "\xef\x89\x87";
pub const ICON_FA_OBJECT_UNGROUP = "\xef\x89\x88";
pub const ICON_FA_OIL_CAN = "\xef\x98\x93";
pub const ICON_FA_OIL_WELL = "\xee\x94\xb2";
pub const ICON_FA_OM = "\xef\x99\xb9";
pub const ICON_FA_OTTER = "\xef\x9c\x80";
pub const ICON_FA_OUTDENT = "\xef\x80\xbb";
pub const ICON_FA_P = "P";
pub const ICON_FA_PAGER = "\xef\xa0\x95";
pub const ICON_FA_PAINT_ROLLER = "\xef\x96\xaa";
pub const ICON_FA_PAINTBRUSH = "\xef\x87\xbc";
pub const ICON_FA_PALETTE = "\xef\x94\xbf";
pub const ICON_FA_PALLET = "\xef\x92\x82";
pub const ICON_FA_PANORAMA = "\xee\x88\x89";
pub const ICON_FA_PAPER_PLANE = "\xef\x87\x98";
pub const ICON_FA_PAPERCLIP = "\xef\x83\x86";
pub const ICON_FA_PARACHUTE_BOX = "\xef\x93\x8d";
pub const ICON_FA_PARAGRAPH = "\xef\x87\x9d";
pub const ICON_FA_PASSPORT = "\xef\x96\xab";
pub const ICON_FA_PASTE = "\xef\x83\xaa";
pub const ICON_FA_PAUSE = "\xef\x81\x8c";
pub const ICON_FA_PAW = "\xef\x86\xb0";
pub const ICON_FA_PEACE = "\xef\x99\xbc";
pub const ICON_FA_PEN = "\xef\x8c\x84";
pub const ICON_FA_PEN_CLIP = "\xef\x8c\x85";
pub const ICON_FA_PEN_FANCY = "\xef\x96\xac";
pub const ICON_FA_PEN_NIB = "\xef\x96\xad";
pub const ICON_FA_PEN_RULER = "\xef\x96\xae";
pub const ICON_FA_PEN_TO_SQUARE = "\xef\x81\x84";
pub const ICON_FA_PENCIL = "\xef\x8c\x83";
pub const ICON_FA_PEOPLE_ARROWS_LEFT_RIGHT = "\xee\x81\xa8";
pub const ICON_FA_PEOPLE_CARRY_BOX = "\xef\x93\x8e";
pub const ICON_FA_PEOPLE_GROUP = "\xee\x94\xb3";
pub const ICON_FA_PEOPLE_LINE = "\xee\x94\xb4";
pub const ICON_FA_PEOPLE_PULLING = "\xee\x94\xb5";
pub const ICON_FA_PEOPLE_ROBBERY = "\xee\x94\xb6";
pub const ICON_FA_PEOPLE_ROOF = "\xee\x94\xb7";
pub const ICON_FA_PEPPER_HOT = "\xef\xa0\x96";
pub const ICON_FA_PERCENT = "%";
pub const ICON_FA_PERSON = "\xef\x86\x83";
pub const ICON_FA_PERSON_ARROW_DOWN_TO_LINE = "\xee\x94\xb8";
pub const ICON_FA_PERSON_ARROW_UP_FROM_LINE = "\xee\x94\xb9";
pub const ICON_FA_PERSON_BIKING = "\xef\xa1\x8a";
pub const ICON_FA_PERSON_BOOTH = "\xef\x9d\x96";
pub const ICON_FA_PERSON_BREASTFEEDING = "\xee\x94\xba";
pub const ICON_FA_PERSON_BURST = "\xee\x94\xbb";
pub const ICON_FA_PERSON_CANE = "\xee\x94\xbc";
pub const ICON_FA_PERSON_CHALKBOARD = "\xee\x94\xbd";
pub const ICON_FA_PERSON_CIRCLE_CHECK = "\xee\x94\xbe";
pub const ICON_FA_PERSON_CIRCLE_EXCLAMATION = "\xee\x94\xbf";
pub const ICON_FA_PERSON_CIRCLE_MINUS = "\xee\x95\x80";
pub const ICON_FA_PERSON_CIRCLE_PLUS = "\xee\x95\x81";
pub const ICON_FA_PERSON_CIRCLE_QUESTION = "\xee\x95\x82";
pub const ICON_FA_PERSON_CIRCLE_XMARK = "\xee\x95\x83";
pub const ICON_FA_PERSON_DIGGING = "\xef\xa1\x9e";
pub const ICON_FA_PERSON_DOTS_FROM_LINE = "\xef\x91\xb0";
pub const ICON_FA_PERSON_DRESS = "\xef\x86\x82";
pub const ICON_FA_PERSON_DRESS_BURST = "\xee\x95\x84";
pub const ICON_FA_PERSON_DROWNING = "\xee\x95\x85";
pub const ICON_FA_PERSON_FALLING = "\xee\x95\x86";
pub const ICON_FA_PERSON_FALLING_BURST = "\xee\x95\x87";
pub const ICON_FA_PERSON_HALF_DRESS = "\xee\x95\x88";
pub const ICON_FA_PERSON_HARASSING = "\xee\x95\x89";
pub const ICON_FA_PERSON_HIKING = "\xef\x9b\xac";
pub const ICON_FA_PERSON_MILITARY_POINTING = "\xee\x95\x8a";
pub const ICON_FA_PERSON_MILITARY_RIFLE = "\xee\x95\x8b";
pub const ICON_FA_PERSON_MILITARY_TO_PERSON = "\xee\x95\x8c";
pub const ICON_FA_PERSON_PRAYING = "\xef\x9a\x83";
pub const ICON_FA_PERSON_PREGNANT = "\xee\x8c\x9e";
pub const ICON_FA_PERSON_RAYS = "\xee\x95\x8d";
pub const ICON_FA_PERSON_RIFLE = "\xee\x95\x8e";
pub const ICON_FA_PERSON_RUNNING = "\xef\x9c\x8c";
pub const ICON_FA_PERSON_SHELTER = "\xee\x95\x8f";
pub const ICON_FA_PERSON_SKATING = "\xef\x9f\x85";
pub const ICON_FA_PERSON_SKIING = "\xef\x9f\x89";
pub const ICON_FA_PERSON_SKIING_NORDIC = "\xef\x9f\x8a";
pub const ICON_FA_PERSON_SNOWBOARDING = "\xef\x9f\x8e";
pub const ICON_FA_PERSON_SWIMMING = "\xef\x97\x84";
pub const ICON_FA_PERSON_THROUGH_WINDOW = "\xee\x90\xb3";
pub const ICON_FA_PERSON_WALKING = "\xef\x95\x94";
pub const ICON_FA_PERSON_WALKING_ARROW_LOOP_LEFT = "\xee\x95\x91";
pub const ICON_FA_PERSON_WALKING_ARROW_RIGHT = "\xee\x95\x92";
pub const ICON_FA_PERSON_WALKING_DASHED_LINE_ARROW_RIGHT = "\xee\x95\x93";
pub const ICON_FA_PERSON_WALKING_LUGGAGE = "\xee\x95\x94";
pub const ICON_FA_PERSON_WALKING_WITH_CANE = "\xef\x8a\x9d";
pub const ICON_FA_PESETA_SIGN = "\xee\x88\xa1";
pub const ICON_FA_PESO_SIGN = "\xee\x88\xa2";
pub const ICON_FA_PHONE = "\xef\x82\x95";
pub const ICON_FA_PHONE_FLIP = "\xef\xa1\xb9";
pub const ICON_FA_PHONE_SLASH = "\xef\x8f\x9d";
pub const ICON_FA_PHONE_VOLUME = "\xef\x8a\xa0";
pub const ICON_FA_PHOTO_FILM = "\xef\xa1\xbc";
pub const ICON_FA_PIGGY_BANK = "\xef\x93\x93";
pub const ICON_FA_PILLS = "\xef\x92\x84";
pub const ICON_FA_PIZZA_SLICE = "\xef\xa0\x98";
pub const ICON_FA_PLACE_OF_WORSHIP = "\xef\x99\xbf";
pub const ICON_FA_PLANE = "\xef\x81\xb2";
pub const ICON_FA_PLANE_ARRIVAL = "\xef\x96\xaf";
pub const ICON_FA_PLANE_CIRCLE_CHECK = "\xee\x95\x95";
pub const ICON_FA_PLANE_CIRCLE_EXCLAMATION = "\xee\x95\x96";
pub const ICON_FA_PLANE_CIRCLE_XMARK = "\xee\x95\x97";
pub const ICON_FA_PLANE_DEPARTURE = "\xef\x96\xb0";
pub const ICON_FA_PLANE_LOCK = "\xee\x95\x98";
pub const ICON_FA_PLANE_SLASH = "\xee\x81\xa9";
pub const ICON_FA_PLANE_UP = "\xee\x88\xad";
pub const ICON_FA_PLANT_WILT = "\xee\x90\xbb";
pub const ICON_FA_PLATE_WHEAT = "\xee\x95\x9a";
pub const ICON_FA_PLAY = "\xef\x81\x8b";
pub const ICON_FA_PLUG = "\xef\x87\xa6";
pub const ICON_FA_PLUG_CIRCLE_BOLT = "\xee\x95\x9b";
pub const ICON_FA_PLUG_CIRCLE_CHECK = "\xee\x95\x9c";
pub const ICON_FA_PLUG_CIRCLE_EXCLAMATION = "\xee\x95\x9d";
pub const ICON_FA_PLUG_CIRCLE_MINUS = "\xee\x95\x9e";
pub const ICON_FA_PLUG_CIRCLE_PLUS = "\xee\x95\x9f";
pub const ICON_FA_PLUG_CIRCLE_XMARK = "\xee\x95\xa0";
pub const ICON_FA_PLUS = "+";
pub const ICON_FA_PLUS_MINUS = "\xee\x90\xbc";
pub const ICON_FA_PODCAST = "\xef\x8b\x8e";
pub const ICON_FA_POO = "\xef\x8b\xbe";
pub const ICON_FA_POO_STORM = "\xef\x9d\x9a";
pub const ICON_FA_POOP = "\xef\x98\x99";
pub const ICON_FA_POWER_OFF = "\xef\x80\x91";
pub const ICON_FA_PRESCRIPTION = "\xef\x96\xb1";
pub const ICON_FA_PRESCRIPTION_BOTTLE = "\xef\x92\x85";
pub const ICON_FA_PRESCRIPTION_BOTTLE_MEDICAL = "\xef\x92\x86";
pub const ICON_FA_PRINT = "\xef\x80\xaf";
pub const ICON_FA_PUMP_MEDICAL = "\xee\x81\xaa";
pub const ICON_FA_PUMP_SOAP = "\xee\x81\xab";
pub const ICON_FA_PUZZLE_PIECE = "\xef\x84\xae";
pub const ICON_FA_Q = "Q";
pub const ICON_FA_QRCODE = "\xef\x80\xa9";
pub const ICON_FA_QUESTION = "?";
pub const ICON_FA_QUOTE_LEFT = "\xef\x84\x8d";
pub const ICON_FA_QUOTE_RIGHT = "\xef\x84\x8e";
pub const ICON_FA_R = "R";
pub const ICON_FA_RADIATION = "\xef\x9e\xb9";
pub const ICON_FA_RADIO = "\xef\xa3\x97";
pub const ICON_FA_RAINBOW = "\xef\x9d\x9b";
pub const ICON_FA_RANKING_STAR = "\xee\x95\xa1";
pub const ICON_FA_RECEIPT = "\xef\x95\x83";
pub const ICON_FA_RECORD_VINYL = "\xef\xa3\x99";
pub const ICON_FA_RECTANGLE_AD = "\xef\x99\x81";
pub const ICON_FA_RECTANGLE_LIST = "\xef\x80\xa2";
pub const ICON_FA_RECTANGLE_XMARK = "\xef\x90\x90";
pub const ICON_FA_RECYCLE = "\xef\x86\xb8";
pub const ICON_FA_REGISTERED = "\xef\x89\x9d";
pub const ICON_FA_REPEAT = "\xef\x8d\xa3";
pub const ICON_FA_REPLY = "\xef\x8f\xa5";
pub const ICON_FA_REPLY_ALL = "\xef\x84\xa2";
pub const ICON_FA_REPUBLICAN = "\xef\x9d\x9e";
pub const ICON_FA_RESTROOM = "\xef\x9e\xbd";
pub const ICON_FA_RETWEET = "\xef\x81\xb9";
pub const ICON_FA_RIBBON = "\xef\x93\x96";
pub const ICON_FA_RIGHT_FROM_BRACKET = "\xef\x8b\xb5";
pub const ICON_FA_RIGHT_LEFT = "\xef\x8d\xa2";
pub const ICON_FA_RIGHT_LONG = "\xef\x8c\x8b";
pub const ICON_FA_RIGHT_TO_BRACKET = "\xef\x8b\xb6";
pub const ICON_FA_RING = "\xef\x9c\x8b";
pub const ICON_FA_ROAD = "\xef\x80\x98";
pub const ICON_FA_ROAD_BARRIER = "\xee\x95\xa2";
pub const ICON_FA_ROAD_BRIDGE = "\xee\x95\xa3";
pub const ICON_FA_ROAD_CIRCLE_CHECK = "\xee\x95\xa4";
pub const ICON_FA_ROAD_CIRCLE_EXCLAMATION = "\xee\x95\xa5";
pub const ICON_FA_ROAD_CIRCLE_XMARK = "\xee\x95\xa6";
pub const ICON_FA_ROAD_LOCK = "\xee\x95\xa7";
pub const ICON_FA_ROAD_SPIKES = "\xee\x95\xa8";
pub const ICON_FA_ROBOT = "\xef\x95\x84";
pub const ICON_FA_ROCKET = "\xef\x84\xb5";
pub const ICON_FA_ROTATE = "\xef\x8b\xb1";
pub const ICON_FA_ROTATE_LEFT = "\xef\x8b\xaa";
pub const ICON_FA_ROTATE_RIGHT = "\xef\x8b\xb9";
pub const ICON_FA_ROUTE = "\xef\x93\x97";
pub const ICON_FA_RSS = "\xef\x82\x9e";
pub const ICON_FA_RUBLE_SIGN = "\xef\x85\x98";
pub const ICON_FA_RUG = "\xee\x95\xa9";
pub const ICON_FA_RULER = "\xef\x95\x85";
pub const ICON_FA_RULER_COMBINED = "\xef\x95\x86";
pub const ICON_FA_RULER_HORIZONTAL = "\xef\x95\x87";
pub const ICON_FA_RULER_VERTICAL = "\xef\x95\x88";
pub const ICON_FA_RUPEE_SIGN = "\xef\x85\x96";
pub const ICON_FA_RUPIAH_SIGN = "\xee\x88\xbd";
pub const ICON_FA_S = "S";
pub const ICON_FA_SACK_DOLLAR = "\xef\xa0\x9d";
pub const ICON_FA_SACK_XMARK = "\xee\x95\xaa";
pub const ICON_FA_SAILBOAT = "\xee\x91\x85";
pub const ICON_FA_SATELLITE = "\xef\x9e\xbf";
pub const ICON_FA_SATELLITE_DISH = "\xef\x9f\x80";
pub const ICON_FA_SCALE_BALANCED = "\xef\x89\x8e";
pub const ICON_FA_SCALE_UNBALANCED = "\xef\x94\x95";
pub const ICON_FA_SCALE_UNBALANCED_FLIP = "\xef\x94\x96";
pub const ICON_FA_SCHOOL = "\xef\x95\x89";
pub const ICON_FA_SCHOOL_CIRCLE_CHECK = "\xee\x95\xab";
pub const ICON_FA_SCHOOL_CIRCLE_EXCLAMATION = "\xee\x95\xac";
pub const ICON_FA_SCHOOL_CIRCLE_XMARK = "\xee\x95\xad";
pub const ICON_FA_SCHOOL_FLAG = "\xee\x95\xae";
pub const ICON_FA_SCHOOL_LOCK = "\xee\x95\xaf";
pub const ICON_FA_SCISSORS = "\xef\x83\x84";
pub const ICON_FA_SCREWDRIVER = "\xef\x95\x8a";
pub const ICON_FA_SCREWDRIVER_WRENCH = "\xef\x9f\x99";
pub const ICON_FA_SCROLL = "\xef\x9c\x8e";
pub const ICON_FA_SCROLL_TORAH = "\xef\x9a\xa0";
pub const ICON_FA_SD_CARD = "\xef\x9f\x82";
pub const ICON_FA_SECTION = "\xee\x91\x87";
pub const ICON_FA_SEEDLING = "\xef\x93\x98";
pub const ICON_FA_SERVER = "\xef\x88\xb3";
pub const ICON_FA_SHAPES = "\xef\x98\x9f";
pub const ICON_FA_SHARE = "\xef\x81\xa4";
pub const ICON_FA_SHARE_FROM_SQUARE = "\xef\x85\x8d";
pub const ICON_FA_SHARE_NODES = "\xef\x87\xa0";
pub const ICON_FA_SHEET_PLASTIC = "\xee\x95\xb1";
pub const ICON_FA_SHEKEL_SIGN = "\xef\x88\x8b";
pub const ICON_FA_SHIELD = "\xef\x84\xb2";
pub const ICON_FA_SHIELD_CAT = "\xee\x95\xb2";
pub const ICON_FA_SHIELD_DOG = "\xee\x95\xb3";
pub const ICON_FA_SHIELD_HALVED = "\xef\x8f\xad";
pub const ICON_FA_SHIELD_HEART = "\xee\x95\xb4";
pub const ICON_FA_SHIELD_VIRUS = "\xee\x81\xac";
pub const ICON_FA_SHIP = "\xef\x88\x9a";
pub const ICON_FA_SHIRT = "\xef\x95\x93";
pub const ICON_FA_SHOE_PRINTS = "\xef\x95\x8b";
pub const ICON_FA_SHOP = "\xef\x95\x8f";
pub const ICON_FA_SHOP_LOCK = "\xee\x92\xa5";
pub const ICON_FA_SHOP_SLASH = "\xee\x81\xb0";
pub const ICON_FA_SHOWER = "\xef\x8b\x8c";
pub const ICON_FA_SHRIMP = "\xee\x91\x88";
pub const ICON_FA_SHUFFLE = "\xef\x81\xb4";
pub const ICON_FA_SHUTTLE_SPACE = "\xef\x86\x97";
pub const ICON_FA_SIGN_HANGING = "\xef\x93\x99";
pub const ICON_FA_SIGNAL = "\xef\x80\x92";
pub const ICON_FA_SIGNATURE = "\xef\x96\xb7";
pub const ICON_FA_SIGNS_POST = "\xef\x89\xb7";
pub const ICON_FA_SIM_CARD = "\xef\x9f\x84";
pub const ICON_FA_SINK = "\xee\x81\xad";
pub const ICON_FA_SITEMAP = "\xef\x83\xa8";
pub const ICON_FA_SKULL = "\xef\x95\x8c";
pub const ICON_FA_SKULL_CROSSBONES = "\xef\x9c\x94";
pub const ICON_FA_SLASH = "\xef\x9c\x95";
pub const ICON_FA_SLEIGH = "\xef\x9f\x8c";
pub const ICON_FA_SLIDERS = "\xef\x87\x9e";
pub const ICON_FA_SMOG = "\xef\x9d\x9f";
pub const ICON_FA_SMOKING = "\xef\x92\x8d";
pub const ICON_FA_SNOWFLAKE = "\xef\x8b\x9c";
pub const ICON_FA_SNOWMAN = "\xef\x9f\x90";
pub const ICON_FA_SNOWPLOW = "\xef\x9f\x92";
pub const ICON_FA_SOAP = "\xee\x81\xae";
pub const ICON_FA_SOCKS = "\xef\x9a\x96";
pub const ICON_FA_SOLAR_PANEL = "\xef\x96\xba";
pub const ICON_FA_SORT = "\xef\x83\x9c";
pub const ICON_FA_SORT_DOWN = "\xef\x83\x9d";
pub const ICON_FA_SORT_UP = "\xef\x83\x9e";
pub const ICON_FA_SPA = "\xef\x96\xbb";
pub const ICON_FA_SPAGHETTI_MONSTER_FLYING = "\xef\x99\xbb";
pub const ICON_FA_SPELL_CHECK = "\xef\xa2\x91";
pub const ICON_FA_SPIDER = "\xef\x9c\x97";
pub const ICON_FA_SPINNER = "\xef\x84\x90";
pub const ICON_FA_SPLOTCH = "\xef\x96\xbc";
pub const ICON_FA_SPOON = "\xef\x8b\xa5";
pub const ICON_FA_SPRAY_CAN = "\xef\x96\xbd";
pub const ICON_FA_SPRAY_CAN_SPARKLES = "\xef\x97\x90";
pub const ICON_FA_SQUARE = "\xef\x83\x88";
pub const ICON_FA_SQUARE_ARROW_UP_RIGHT = "\xef\x85\x8c";
pub const ICON_FA_SQUARE_CARET_DOWN = "\xef\x85\x90";
pub const ICON_FA_SQUARE_CARET_LEFT = "\xef\x86\x91";
pub const ICON_FA_SQUARE_CARET_RIGHT = "\xef\x85\x92";
pub const ICON_FA_SQUARE_CARET_UP = "\xef\x85\x91";
pub const ICON_FA_SQUARE_CHECK = "\xef\x85\x8a";
pub const ICON_FA_SQUARE_ENVELOPE = "\xef\x86\x99";
pub const ICON_FA_SQUARE_FULL = "\xef\x91\x9c";
pub const ICON_FA_SQUARE_H = "\xef\x83\xbd";
pub const ICON_FA_SQUARE_MINUS = "\xef\x85\x86";
pub const ICON_FA_SQUARE_NFI = "\xee\x95\xb6";
pub const ICON_FA_SQUARE_PARKING = "\xef\x95\x80";
pub const ICON_FA_SQUARE_PEN = "\xef\x85\x8b";
pub const ICON_FA_SQUARE_PERSON_CONFINED = "\xee\x95\xb7";
pub const ICON_FA_SQUARE_PHONE = "\xef\x82\x98";
pub const ICON_FA_SQUARE_PHONE_FLIP = "\xef\xa1\xbb";
pub const ICON_FA_SQUARE_PLUS = "\xef\x83\xbe";
pub const ICON_FA_SQUARE_POLL_HORIZONTAL = "\xef\x9a\x82";
pub const ICON_FA_SQUARE_POLL_VERTICAL = "\xef\x9a\x81";
pub const ICON_FA_SQUARE_ROOT_VARIABLE = "\xef\x9a\x98";
pub const ICON_FA_SQUARE_RSS = "\xef\x85\x83";
pub const ICON_FA_SQUARE_SHARE_NODES = "\xef\x87\xa1";
pub const ICON_FA_SQUARE_UP_RIGHT = "\xef\x8d\xa0";
pub const ICON_FA_SQUARE_VIRUS = "\xee\x95\xb8";
pub const ICON_FA_SQUARE_XMARK = "\xef\x8b\x93";
pub const ICON_FA_STAFF_AESCULAPIUS = "\xee\x95\xb9";
pub const ICON_FA_STAIRS = "\xee\x8a\x89";
pub const ICON_FA_STAMP = "\xef\x96\xbf";
pub const ICON_FA_STAR = "\xef\x80\x85";
pub const ICON_FA_STAR_AND_CRESCENT = "\xef\x9a\x99";
pub const ICON_FA_STAR_HALF = "\xef\x82\x89";
pub const ICON_FA_STAR_HALF_STROKE = "\xef\x97\x80";
pub const ICON_FA_STAR_OF_DAVID = "\xef\x9a\x9a";
pub const ICON_FA_STAR_OF_LIFE = "\xef\x98\xa1";
pub const ICON_FA_STERLING_SIGN = "\xef\x85\x94";
pub const ICON_FA_STETHOSCOPE = "\xef\x83\xb1";
pub const ICON_FA_STOP = "\xef\x81\x8d";
pub const ICON_FA_STOPWATCH = "\xef\x8b\xb2";
pub const ICON_FA_STOPWATCH_20 = "\xee\x81\xaf";
pub const ICON_FA_STORE = "\xef\x95\x8e";
pub const ICON_FA_STORE_SLASH = "\xee\x81\xb1";
pub const ICON_FA_STREET_VIEW = "\xef\x88\x9d";
pub const ICON_FA_STRIKETHROUGH = "\xef\x83\x8c";
pub const ICON_FA_STROOPWAFEL = "\xef\x95\x91";
pub const ICON_FA_SUBSCRIPT = "\xef\x84\xac";
pub const ICON_FA_SUITCASE = "\xef\x83\xb2";
pub const ICON_FA_SUITCASE_MEDICAL = "\xef\x83\xba";
pub const ICON_FA_SUITCASE_ROLLING = "\xef\x97\x81";
pub const ICON_FA_SUN = "\xef\x86\x85";
pub const ICON_FA_SUN_PLANT_WILT = "\xee\x95\xba";
pub const ICON_FA_SUPERSCRIPT = "\xef\x84\xab";
pub const ICON_FA_SWATCHBOOK = "\xef\x97\x83";
pub const ICON_FA_SYNAGOGUE = "\xef\x9a\x9b";
pub const ICON_FA_SYRINGE = "\xef\x92\x8e";
pub const ICON_FA_T = "T";
pub const ICON_FA_TABLE = "\xef\x83\x8e";
pub const ICON_FA_TABLE_CELLS = "\xef\x80\x8a";
pub const ICON_FA_TABLE_CELLS_LARGE = "\xef\x80\x89";
pub const ICON_FA_TABLE_COLUMNS = "\xef\x83\x9b";
pub const ICON_FA_TABLE_LIST = "\xef\x80\x8b";
pub const ICON_FA_TABLE_TENNIS_PADDLE_BALL = "\xef\x91\x9d";
pub const ICON_FA_TABLET = "\xef\x8f\xbb";
pub const ICON_FA_TABLET_BUTTON = "\xef\x84\x8a";
pub const ICON_FA_TABLET_SCREEN_BUTTON = "\xef\x8f\xba";
pub const ICON_FA_TABLETS = "\xef\x92\x90";
pub const ICON_FA_TACHOGRAPH_DIGITAL = "\xef\x95\xa6";
pub const ICON_FA_TAG = "\xef\x80\xab";
pub const ICON_FA_TAGS = "\xef\x80\xac";
pub const ICON_FA_TAPE = "\xef\x93\x9b";
pub const ICON_FA_TARP = "\xee\x95\xbb";
pub const ICON_FA_TARP_DROPLET = "\xee\x95\xbc";
pub const ICON_FA_TAXI = "\xef\x86\xba";
pub const ICON_FA_TEETH = "\xef\x98\xae";
pub const ICON_FA_TEETH_OPEN = "\xef\x98\xaf";
pub const ICON_FA_TEMPERATURE_ARROW_DOWN = "\xee\x80\xbf";
pub const ICON_FA_TEMPERATURE_ARROW_UP = "\xee\x81\x80";
pub const ICON_FA_TEMPERATURE_EMPTY = "\xef\x8b\x8b";
pub const ICON_FA_TEMPERATURE_FULL = "\xef\x8b\x87";
pub const ICON_FA_TEMPERATURE_HALF = "\xef\x8b\x89";
pub const ICON_FA_TEMPERATURE_HIGH = "\xef\x9d\xa9";
pub const ICON_FA_TEMPERATURE_LOW = "\xef\x9d\xab";
pub const ICON_FA_TEMPERATURE_QUARTER = "\xef\x8b\x8a";
pub const ICON_FA_TEMPERATURE_THREE_QUARTERS = "\xef\x8b\x88";
pub const ICON_FA_TENGE_SIGN = "\xef\x9f\x97";
pub const ICON_FA_TENT = "\xee\x95\xbd";
pub const ICON_FA_TENT_ARROW_DOWN_TO_LINE = "\xee\x95\xbe";
pub const ICON_FA_TENT_ARROW_LEFT_RIGHT = "\xee\x95\xbf";
pub const ICON_FA_TENT_ARROW_TURN_LEFT = "\xee\x96\x80";
pub const ICON_FA_TENT_ARROWS_DOWN = "\xee\x96\x81";
pub const ICON_FA_TENTS = "\xee\x96\x82";
pub const ICON_FA_TERMINAL = "\xef\x84\xa0";
pub const ICON_FA_TEXT_HEIGHT = "\xef\x80\xb4";
pub const ICON_FA_TEXT_SLASH = "\xef\xa1\xbd";
pub const ICON_FA_TEXT_WIDTH = "\xef\x80\xb5";
pub const ICON_FA_THERMOMETER = "\xef\x92\x91";
pub const ICON_FA_THUMBS_DOWN = "\xef\x85\xa5";
pub const ICON_FA_THUMBS_UP = "\xef\x85\xa4";
pub const ICON_FA_THUMBTACK = "\xef\x82\x8d";
pub const ICON_FA_TICKET = "\xef\x85\x85";
pub const ICON_FA_TICKET_SIMPLE = "\xef\x8f\xbf";
pub const ICON_FA_TIMELINE = "\xee\x8a\x9c";
pub const ICON_FA_TOGGLE_OFF = "\xef\x88\x84";
pub const ICON_FA_TOGGLE_ON = "\xef\x88\x85";
pub const ICON_FA_TOILET = "\xef\x9f\x98";
pub const ICON_FA_TOILET_PAPER = "\xef\x9c\x9e";
pub const ICON_FA_TOILET_PAPER_SLASH = "\xee\x81\xb2";
pub const ICON_FA_TOILET_PORTABLE = "\xee\x96\x83";
pub const ICON_FA_TOILETS_PORTABLE = "\xee\x96\x84";
pub const ICON_FA_TOOLBOX = "\xef\x95\x92";
pub const ICON_FA_TOOTH = "\xef\x97\x89";
pub const ICON_FA_TORII_GATE = "\xef\x9a\xa1";
pub const ICON_FA_TORNADO = "\xef\x9d\xaf";
pub const ICON_FA_TOWER_BROADCAST = "\xef\x94\x99";
pub const ICON_FA_TOWER_CELL = "\xee\x96\x85";
pub const ICON_FA_TOWER_OBSERVATION = "\xee\x96\x86";
pub const ICON_FA_TRACTOR = "\xef\x9c\xa2";
pub const ICON_FA_TRADEMARK = "\xef\x89\x9c";
pub const ICON_FA_TRAFFIC_LIGHT = "\xef\x98\xb7";
pub const ICON_FA_TRAILER = "\xee\x81\x81";
pub const ICON_FA_TRAIN = "\xef\x88\xb8";
pub const ICON_FA_TRAIN_SUBWAY = "\xef\x88\xb9";
pub const ICON_FA_TRAIN_TRAM = "\xef\x9f\x9a";
pub const ICON_FA_TRANSGENDER = "\xef\x88\xa5";
pub const ICON_FA_TRASH = "\xef\x87\xb8";
pub const ICON_FA_TRASH_ARROW_UP = "\xef\xa0\xa9";
pub const ICON_FA_TRASH_CAN = "\xef\x8b\xad";
pub const ICON_FA_TRASH_CAN_ARROW_UP = "\xef\xa0\xaa";
pub const ICON_FA_TREE = "\xef\x86\xbb";
pub const ICON_FA_TREE_CITY = "\xee\x96\x87";
pub const ICON_FA_TRIANGLE_EXCLAMATION = "\xef\x81\xb1";
pub const ICON_FA_TROPHY = "\xef\x82\x91";
pub const ICON_FA_TROWEL = "\xee\x96\x89";
pub const ICON_FA_TROWEL_BRICKS = "\xee\x96\x8a";
pub const ICON_FA_TRUCK = "\xef\x83\x91";
pub const ICON_FA_TRUCK_ARROW_RIGHT = "\xee\x96\x8b";
pub const ICON_FA_TRUCK_DROPLET = "\xee\x96\x8c";
pub const ICON_FA_TRUCK_FAST = "\xef\x92\x8b";
pub const ICON_FA_TRUCK_FIELD = "\xee\x96\x8d";
pub const ICON_FA_TRUCK_FIELD_UN = "\xee\x96\x8e";
pub const ICON_FA_TRUCK_FRONT = "\xee\x8a\xb7";
pub const ICON_FA_TRUCK_MEDICAL = "\xef\x83\xb9";
pub const ICON_FA_TRUCK_MONSTER = "\xef\x98\xbb";
pub const ICON_FA_TRUCK_MOVING = "\xef\x93\x9f";
pub const ICON_FA_TRUCK_PICKUP = "\xef\x98\xbc";
pub const ICON_FA_TRUCK_PLANE = "\xee\x96\x8f";
pub const ICON_FA_TRUCK_RAMP_BOX = "\xef\x93\x9e";
pub const ICON_FA_TTY = "\xef\x87\xa4";
pub const ICON_FA_TURKISH_LIRA_SIGN = "\xee\x8a\xbb";
pub const ICON_FA_TURN_DOWN = "\xef\x8e\xbe";
pub const ICON_FA_TURN_UP = "\xef\x8e\xbf";
pub const ICON_FA_TV = "\xef\x89\xac";
pub const ICON_FA_U = "U";
pub const ICON_FA_UMBRELLA = "\xef\x83\xa9";
pub const ICON_FA_UMBRELLA_BEACH = "\xef\x97\x8a";
pub const ICON_FA_UNDERLINE = "\xef\x83\x8d";
pub const ICON_FA_UNIVERSAL_ACCESS = "\xef\x8a\x9a";
pub const ICON_FA_UNLOCK = "\xef\x82\x9c";
pub const ICON_FA_UNLOCK_KEYHOLE = "\xef\x84\xbe";
pub const ICON_FA_UP_DOWN = "\xef\x8c\xb8";
pub const ICON_FA_UP_DOWN_LEFT_RIGHT = "\xef\x82\xb2";
pub const ICON_FA_UP_LONG = "\xef\x8c\x8c";
pub const ICON_FA_UP_RIGHT_AND_DOWN_LEFT_FROM_CENTER = "\xef\x90\xa4";
pub const ICON_FA_UP_RIGHT_FROM_SQUARE = "\xef\x8d\x9d";
pub const ICON_FA_UPLOAD = "\xef\x82\x93";
pub const ICON_FA_USER = "\xef\x80\x87";
pub const ICON_FA_USER_ASTRONAUT = "\xef\x93\xbb";
pub const ICON_FA_USER_CHECK = "\xef\x93\xbc";
pub const ICON_FA_USER_CLOCK = "\xef\x93\xbd";
pub const ICON_FA_USER_DOCTOR = "\xef\x83\xb0";
pub const ICON_FA_USER_GEAR = "\xef\x93\xbe";
pub const ICON_FA_USER_GRADUATE = "\xef\x94\x81";
pub const ICON_FA_USER_GROUP = "\xef\x94\x80";
pub const ICON_FA_USER_INJURED = "\xef\x9c\xa8";
pub const ICON_FA_USER_LARGE = "\xef\x90\x86";
pub const ICON_FA_USER_LARGE_SLASH = "\xef\x93\xba";
pub const ICON_FA_USER_LOCK = "\xef\x94\x82";
pub const ICON_FA_USER_MINUS = "\xef\x94\x83";
pub const ICON_FA_USER_NINJA = "\xef\x94\x84";
pub const ICON_FA_USER_NURSE = "\xef\xa0\xaf";
pub const ICON_FA_USER_PEN = "\xef\x93\xbf";
pub const ICON_FA_USER_PLUS = "\xef\x88\xb4";
pub const ICON_FA_USER_SECRET = "\xef\x88\x9b";
pub const ICON_FA_USER_SHIELD = "\xef\x94\x85";
pub const ICON_FA_USER_SLASH = "\xef\x94\x86";
pub const ICON_FA_USER_TAG = "\xef\x94\x87";
pub const ICON_FA_USER_TIE = "\xef\x94\x88";
pub const ICON_FA_USER_XMARK = "\xef\x88\xb5";
pub const ICON_FA_USERS = "\xef\x83\x80";
pub const ICON_FA_USERS_BETWEEN_LINES = "\xee\x96\x91";
pub const ICON_FA_USERS_GEAR = "\xef\x94\x89";
pub const ICON_FA_USERS_LINE = "\xee\x96\x92";
pub const ICON_FA_USERS_RAYS = "\xee\x96\x93";
pub const ICON_FA_USERS_RECTANGLE = "\xee\x96\x94";
pub const ICON_FA_USERS_SLASH = "\xee\x81\xb3";
pub const ICON_FA_USERS_VIEWFINDER = "\xee\x96\x95";
pub const ICON_FA_UTENSILS = "\xef\x8b\xa7";
pub const ICON_FA_V = "V";
pub const ICON_FA_VAN_SHUTTLE = "\xef\x96\xb6";
pub const ICON_FA_VAULT = "\xee\x8b\x85";
pub const ICON_FA_VECTOR_SQUARE = "\xef\x97\x8b";
pub const ICON_FA_VENUS = "\xef\x88\xa1";
pub const ICON_FA_VENUS_DOUBLE = "\xef\x88\xa6";
pub const ICON_FA_VENUS_MARS = "\xef\x88\xa8";
pub const ICON_FA_VEST = "\xee\x82\x85";
pub const ICON_FA_VEST_PATCHES = "\xee\x82\x86";
pub const ICON_FA_VIAL = "\xef\x92\x92";
pub const ICON_FA_VIAL_CIRCLE_CHECK = "\xee\x96\x96";
pub const ICON_FA_VIAL_VIRUS = "\xee\x96\x97";
pub const ICON_FA_VIALS = "\xef\x92\x93";
pub const ICON_FA_VIDEO = "\xef\x80\xbd";
pub const ICON_FA_VIDEO_SLASH = "\xef\x93\xa2";
pub const ICON_FA_VIHARA = "\xef\x9a\xa7";
pub const ICON_FA_VIRUS = "\xee\x81\xb4";
pub const ICON_FA_VIRUS_COVID = "\xee\x92\xa8";
pub const ICON_FA_VIRUS_COVID_SLASH = "\xee\x92\xa9";
pub const ICON_FA_VIRUS_SLASH = "\xee\x81\xb5";
pub const ICON_FA_VIRUSES = "\xee\x81\xb6";
pub const ICON_FA_VOICEMAIL = "\xef\xa2\x97";
pub const ICON_FA_VOLCANO = "\xef\x9d\xb0";
pub const ICON_FA_VOLLEYBALL = "\xef\x91\x9f";
pub const ICON_FA_VOLUME_HIGH = "\xef\x80\xa8";
pub const ICON_FA_VOLUME_LOW = "\xef\x80\xa7";
pub const ICON_FA_VOLUME_OFF = "\xef\x80\xa6";
pub const ICON_FA_VOLUME_XMARK = "\xef\x9a\xa9";
pub const ICON_FA_VR_CARDBOARD = "\xef\x9c\xa9";
pub const ICON_FA_W = "W";
pub const ICON_FA_WALKIE_TALKIE = "\xef\xa3\xaf";
pub const ICON_FA_WALLET = "\xef\x95\x95";
pub const ICON_FA_WAND_MAGIC = "\xef\x83\x90";
pub const ICON_FA_WAND_MAGIC_SPARKLES = "\xee\x8b\x8a";
pub const ICON_FA_WAND_SPARKLES = "\xef\x9c\xab";
pub const ICON_FA_WAREHOUSE = "\xef\x92\x94";
pub const ICON_FA_WATER = "\xef\x9d\xb3";
pub const ICON_FA_WATER_LADDER = "\xef\x97\x85";
pub const ICON_FA_WAVE_SQUARE = "\xef\xa0\xbe";
pub const ICON_FA_WEIGHT_HANGING = "\xef\x97\x8d";
pub const ICON_FA_WEIGHT_SCALE = "\xef\x92\x96";
pub const ICON_FA_WHEAT_AWN = "\xee\x8b\x8d";
pub const ICON_FA_WHEAT_AWN_CIRCLE_EXCLAMATION = "\xee\x96\x98";
pub const ICON_FA_WHEELCHAIR = "\xef\x86\x93";
pub const ICON_FA_WHEELCHAIR_MOVE = "\xee\x8b\x8e";
pub const ICON_FA_WHISKEY_GLASS = "\xef\x9e\xa0";
pub const ICON_FA_WIFI = "\xef\x87\xab";
pub const ICON_FA_WIND = "\xef\x9c\xae";
pub const ICON_FA_WINDOW_MAXIMIZE = "\xef\x8b\x90";
pub const ICON_FA_WINDOW_MINIMIZE = "\xef\x8b\x91";
pub const ICON_FA_WINDOW_RESTORE = "\xef\x8b\x92";
pub const ICON_FA_WINE_BOTTLE = "\xef\x9c\xaf";
pub const ICON_FA_WINE_GLASS = "\xef\x93\xa3";
pub const ICON_FA_WINE_GLASS_EMPTY = "\xef\x97\x8e";
pub const ICON_FA_WON_SIGN = "\xef\x85\x99";
pub const ICON_FA_WORM = "\xee\x96\x99";
pub const ICON_FA_WRENCH = "\xef\x82\xad";
pub const ICON_FA_X = "X";
pub const ICON_FA_X_RAY = "\xef\x92\x97";
pub const ICON_FA_XMARK = "\xef\x80\x8d";
pub const ICON_FA_XMARKS_LINES = "\xee\x96\x9a";
pub const ICON_FA_Y = "Y";
pub const ICON_FA_YEN_SIGN = "\xef\x85\x97";
pub const ICON_FA_YIN_YANG = "\xef\x9a\xad";
pub const ICON_FA_Z = "Z";
pub const FONT_AWESOME_ICON_SIZE = @as(c_int, 11);
pub const CIMGUI_INCLUDED = "";
pub const _STDIO_H = "";
pub const __wasi_api_h = "";
pub const _STDDEF_H = "";
pub const NULL = @import("std").zig.c_translation.cast(?*anyopaque, @as(c_int, 0));
pub const __NEED_ptrdiff_t = "";
pub const __NEED_size_t = "";
pub const __NEED_wchar_t = "";
pub const __NEED_max_align_t = "";
pub const __DEFINED_wchar_t = "";
pub const __DEFINED_size_t = "";
pub const __DEFINED_ptrdiff_t = "";
pub const __DEFINED_max_align_t = "";
pub const _STDINT_H = "";
pub const __NEED_int8_t = "";
pub const __NEED_int16_t = "";
pub const __NEED_int32_t = "";
pub const __NEED_int64_t = "";
pub const __NEED_uint8_t = "";
pub const __NEED_uint16_t = "";
pub const __NEED_uint32_t = "";
pub const __NEED_uint64_t = "";
pub const __NEED_intptr_t = "";
pub const __NEED_uintptr_t = "";
pub const __NEED_intmax_t = "";
pub const __NEED_uintmax_t = "";
pub const __DEFINED_uintptr_t = "";
pub const __DEFINED_intptr_t = "";
pub const __DEFINED_int8_t = "";
pub const __DEFINED_int16_t = "";
pub const __DEFINED_int32_t = "";
pub const __DEFINED_int64_t = "";
pub const __DEFINED_intmax_t = "";
pub const __DEFINED_uint8_t = "";
pub const __DEFINED_uint16_t = "";
pub const __DEFINED_uint32_t = "";
pub const __DEFINED_uint64_t = "";
pub const __DEFINED_uintmax_t = "";
pub const INT8_MIN = -@as(c_int, 1) - @as(c_int, 0x7f);
pub const INT16_MIN = -@as(c_int, 1) - @as(c_int, 0x7fff);
pub const INT32_MIN = -@as(c_int, 1) - @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x7fffffff, .hex);
pub const INT64_MIN = -@as(c_int, 1) - @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x7fffffffffffffff, .hex);
pub const INT8_MAX = @as(c_int, 0x7f);
pub const INT16_MAX = @as(c_int, 0x7fff);
pub const INT32_MAX = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x7fffffff, .hex);
pub const INT64_MAX = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x7fffffffffffffff, .hex);
pub const UINT8_MAX = @as(c_int, 0xff);
pub const UINT16_MAX = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0xffff, .hex);
pub const UINT32_MAX = @import("std").zig.c_translation.promoteIntLiteral(c_uint, 0xffffffff, .hex);
pub const UINT64_MAX = @import("std").zig.c_translation.promoteIntLiteral(c_uint, 0xffffffffffffffff, .hex);
pub const INT_FAST8_MIN = INT8_MIN;
pub const INT_FAST64_MIN = INT64_MIN;
pub const INT_LEAST8_MIN = INT8_MIN;
pub const INT_LEAST16_MIN = INT16_MIN;
pub const INT_LEAST32_MIN = INT32_MIN;
pub const INT_LEAST64_MIN = INT64_MIN;
pub const INT_FAST8_MAX = INT8_MAX;
pub const INT_FAST64_MAX = INT64_MAX;
pub const INT_LEAST8_MAX = INT8_MAX;
pub const INT_LEAST16_MAX = INT16_MAX;
pub const INT_LEAST32_MAX = INT32_MAX;
pub const INT_LEAST64_MAX = INT64_MAX;
pub const UINT_FAST8_MAX = UINT8_MAX;
pub const UINT_FAST64_MAX = UINT64_MAX;
pub const UINT_LEAST8_MAX = UINT8_MAX;
pub const UINT_LEAST16_MAX = UINT16_MAX;
pub const UINT_LEAST32_MAX = UINT32_MAX;
pub const UINT_LEAST64_MAX = UINT64_MAX;
pub const INTMAX_MIN = INT64_MIN;
pub const INTMAX_MAX = INT64_MAX;
pub const UINTMAX_MAX = UINT64_MAX;
pub const WINT_MIN = @as(c_uint, 0);
pub const WINT_MAX = UINT32_MAX;
pub const WCHAR_MAX = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x7fffffff, .hex) + '\x00';
pub const WCHAR_MIN = (-@as(c_int, 1) - @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x7fffffff, .hex)) + '\x00';
pub const SIG_ATOMIC_MIN = INT32_MIN;
pub const SIG_ATOMIC_MAX = INT32_MAX;
pub const INT_FAST16_MIN = INT32_MIN;
pub const INT_FAST32_MIN = INT32_MIN;
pub const INT_FAST16_MAX = INT32_MAX;
pub const INT_FAST32_MAX = INT32_MAX;
pub const UINT_FAST16_MAX = UINT32_MAX;
pub const UINT_FAST32_MAX = UINT32_MAX;
pub const INTPTR_MIN = -@as(c_int, 1) - __INTPTR_MAX__;
pub const INTPTR_MAX = __INTPTR_MAX__;
pub const UINTPTR_MAX = __UINTPTR_MAX__;
pub const PTRDIFF_MIN = -@as(c_int, 1) - __PTRDIFF_MAX__;
pub const PTRDIFF_MAX = __PTRDIFF_MAX__;
pub const SIZE_MAX = __SIZE_MAX__;
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
pub inline fn UINT8_C(c: anytype) @TypeOf(c) {
    _ = &c;
    return c;
}
pub inline fn UINT16_C(c: anytype) @TypeOf(c) {
    _ = &c;
    return c;
}
pub const UINT32_C = @import("std").zig.c_translation.Macros.U_SUFFIX;
pub const INT64_C = @import("std").zig.c_translation.Macros.LL_SUFFIX;
pub const UINT64_C = @import("std").zig.c_translation.Macros.ULL_SUFFIX;
pub const INTMAX_C = @import("std").zig.c_translation.Macros.LL_SUFFIX;
pub const UINTMAX_C = @import("std").zig.c_translation.Macros.ULL_SUFFIX;
pub const __WASI_DIRCOOKIE_START = UINT64_C(@as(c_int, 0));
pub const __WASI_CLOCKID_REALTIME = UINT32_C(@as(c_int, 0));
pub const __WASI_CLOCKID_MONOTONIC = UINT32_C(@as(c_int, 1));
pub const __WASI_CLOCKID_PROCESS_CPUTIME_ID = UINT32_C(@as(c_int, 2));
pub const __WASI_CLOCKID_THREAD_CPUTIME_ID = UINT32_C(@as(c_int, 3));
pub const __WASI_ERRNO_SUCCESS = UINT16_C(@as(c_int, 0));
pub const __WASI_ERRNO_2BIG = UINT16_C(@as(c_int, 1));
pub const __WASI_ERRNO_ACCES = UINT16_C(@as(c_int, 2));
pub const __WASI_ERRNO_ADDRINUSE = UINT16_C(@as(c_int, 3));
pub const __WASI_ERRNO_ADDRNOTAVAIL = UINT16_C(@as(c_int, 4));
pub const __WASI_ERRNO_AFNOSUPPORT = UINT16_C(@as(c_int, 5));
pub const __WASI_ERRNO_AGAIN = UINT16_C(@as(c_int, 6));
pub const __WASI_ERRNO_ALREADY = UINT16_C(@as(c_int, 7));
pub const __WASI_ERRNO_BADF = UINT16_C(@as(c_int, 8));
pub const __WASI_ERRNO_BADMSG = UINT16_C(@as(c_int, 9));
pub const __WASI_ERRNO_BUSY = UINT16_C(@as(c_int, 10));
pub const __WASI_ERRNO_CANCELED = UINT16_C(@as(c_int, 11));
pub const __WASI_ERRNO_CHILD = UINT16_C(@as(c_int, 12));
pub const __WASI_ERRNO_CONNABORTED = UINT16_C(@as(c_int, 13));
pub const __WASI_ERRNO_CONNREFUSED = UINT16_C(@as(c_int, 14));
pub const __WASI_ERRNO_CONNRESET = UINT16_C(@as(c_int, 15));
pub const __WASI_ERRNO_DEADLK = UINT16_C(@as(c_int, 16));
pub const __WASI_ERRNO_DESTADDRREQ = UINT16_C(@as(c_int, 17));
pub const __WASI_ERRNO_DOM = UINT16_C(@as(c_int, 18));
pub const __WASI_ERRNO_DQUOT = UINT16_C(@as(c_int, 19));
pub const __WASI_ERRNO_EXIST = UINT16_C(@as(c_int, 20));
pub const __WASI_ERRNO_FAULT = UINT16_C(@as(c_int, 21));
pub const __WASI_ERRNO_FBIG = UINT16_C(@as(c_int, 22));
pub const __WASI_ERRNO_HOSTUNREACH = UINT16_C(@as(c_int, 23));
pub const __WASI_ERRNO_IDRM = UINT16_C(@as(c_int, 24));
pub const __WASI_ERRNO_ILSEQ = UINT16_C(@as(c_int, 25));
pub const __WASI_ERRNO_INPROGRESS = UINT16_C(@as(c_int, 26));
pub const __WASI_ERRNO_INTR = UINT16_C(@as(c_int, 27));
pub const __WASI_ERRNO_INVAL = UINT16_C(@as(c_int, 28));
pub const __WASI_ERRNO_IO = UINT16_C(@as(c_int, 29));
pub const __WASI_ERRNO_ISCONN = UINT16_C(@as(c_int, 30));
pub const __WASI_ERRNO_ISDIR = UINT16_C(@as(c_int, 31));
pub const __WASI_ERRNO_LOOP = UINT16_C(@as(c_int, 32));
pub const __WASI_ERRNO_MFILE = UINT16_C(@as(c_int, 33));
pub const __WASI_ERRNO_MLINK = UINT16_C(@as(c_int, 34));
pub const __WASI_ERRNO_MSGSIZE = UINT16_C(@as(c_int, 35));
pub const __WASI_ERRNO_MULTIHOP = UINT16_C(@as(c_int, 36));
pub const __WASI_ERRNO_NAMETOOLONG = UINT16_C(@as(c_int, 37));
pub const __WASI_ERRNO_NETDOWN = UINT16_C(@as(c_int, 38));
pub const __WASI_ERRNO_NETRESET = UINT16_C(@as(c_int, 39));
pub const __WASI_ERRNO_NETUNREACH = UINT16_C(@as(c_int, 40));
pub const __WASI_ERRNO_NFILE = UINT16_C(@as(c_int, 41));
pub const __WASI_ERRNO_NOBUFS = UINT16_C(@as(c_int, 42));
pub const __WASI_ERRNO_NODEV = UINT16_C(@as(c_int, 43));
pub const __WASI_ERRNO_NOENT = UINT16_C(@as(c_int, 44));
pub const __WASI_ERRNO_NOEXEC = UINT16_C(@as(c_int, 45));
pub const __WASI_ERRNO_NOLCK = UINT16_C(@as(c_int, 46));
pub const __WASI_ERRNO_NOLINK = UINT16_C(@as(c_int, 47));
pub const __WASI_ERRNO_NOMEM = UINT16_C(@as(c_int, 48));
pub const __WASI_ERRNO_NOMSG = UINT16_C(@as(c_int, 49));
pub const __WASI_ERRNO_NOPROTOOPT = UINT16_C(@as(c_int, 50));
pub const __WASI_ERRNO_NOSPC = UINT16_C(@as(c_int, 51));
pub const __WASI_ERRNO_NOSYS = UINT16_C(@as(c_int, 52));
pub const __WASI_ERRNO_NOTCONN = UINT16_C(@as(c_int, 53));
pub const __WASI_ERRNO_NOTDIR = UINT16_C(@as(c_int, 54));
pub const __WASI_ERRNO_NOTEMPTY = UINT16_C(@as(c_int, 55));
pub const __WASI_ERRNO_NOTRECOVERABLE = UINT16_C(@as(c_int, 56));
pub const __WASI_ERRNO_NOTSOCK = UINT16_C(@as(c_int, 57));
pub const __WASI_ERRNO_NOTSUP = UINT16_C(@as(c_int, 58));
pub const __WASI_ERRNO_NOTTY = UINT16_C(@as(c_int, 59));
pub const __WASI_ERRNO_NXIO = UINT16_C(@as(c_int, 60));
pub const __WASI_ERRNO_OVERFLOW = UINT16_C(@as(c_int, 61));
pub const __WASI_ERRNO_OWNERDEAD = UINT16_C(@as(c_int, 62));
pub const __WASI_ERRNO_PERM = UINT16_C(@as(c_int, 63));
pub const __WASI_ERRNO_PIPE = UINT16_C(@as(c_int, 64));
pub const __WASI_ERRNO_PROTO = UINT16_C(@as(c_int, 65));
pub const __WASI_ERRNO_PROTONOSUPPORT = UINT16_C(@as(c_int, 66));
pub const __WASI_ERRNO_PROTOTYPE = UINT16_C(@as(c_int, 67));
pub const __WASI_ERRNO_RANGE = UINT16_C(@as(c_int, 68));
pub const __WASI_ERRNO_ROFS = UINT16_C(@as(c_int, 69));
pub const __WASI_ERRNO_SPIPE = UINT16_C(@as(c_int, 70));
pub const __WASI_ERRNO_SRCH = UINT16_C(@as(c_int, 71));
pub const __WASI_ERRNO_STALE = UINT16_C(@as(c_int, 72));
pub const __WASI_ERRNO_TIMEDOUT = UINT16_C(@as(c_int, 73));
pub const __WASI_ERRNO_TXTBSY = UINT16_C(@as(c_int, 74));
pub const __WASI_ERRNO_XDEV = UINT16_C(@as(c_int, 75));
pub const __WASI_ERRNO_NOTCAPABLE = UINT16_C(@as(c_int, 76));
pub const __WASI_RIGHTS_FD_DATASYNC = UINT64_C(@as(c_int, 1));
pub const __WASI_RIGHTS_FD_READ = UINT64_C(@as(c_int, 2));
pub const __WASI_RIGHTS_FD_SEEK = UINT64_C(@as(c_int, 4));
pub const __WASI_RIGHTS_FD_FDSTAT_SET_FLAGS = UINT64_C(@as(c_int, 8));
pub const __WASI_RIGHTS_FD_SYNC = UINT64_C(@as(c_int, 16));
pub const __WASI_RIGHTS_FD_TELL = UINT64_C(@as(c_int, 32));
pub const __WASI_RIGHTS_FD_WRITE = UINT64_C(@as(c_int, 64));
pub const __WASI_RIGHTS_FD_ADVISE = UINT64_C(@as(c_int, 128));
pub const __WASI_RIGHTS_FD_ALLOCATE = UINT64_C(@as(c_int, 256));
pub const __WASI_RIGHTS_PATH_CREATE_DIRECTORY = UINT64_C(@as(c_int, 512));
pub const __WASI_RIGHTS_PATH_CREATE_FILE = UINT64_C(@as(c_int, 1024));
pub const __WASI_RIGHTS_PATH_LINK_SOURCE = UINT64_C(@as(c_int, 2048));
pub const __WASI_RIGHTS_PATH_LINK_TARGET = UINT64_C(@as(c_int, 4096));
pub const __WASI_RIGHTS_PATH_OPEN = UINT64_C(@as(c_int, 8192));
pub const __WASI_RIGHTS_FD_READDIR = UINT64_C(@as(c_int, 16384));
pub const __WASI_RIGHTS_PATH_READLINK = UINT64_C(@import("std").zig.c_translation.promoteIntLiteral(c_int, 32768, .decimal));
pub const __WASI_RIGHTS_PATH_RENAME_SOURCE = UINT64_C(@import("std").zig.c_translation.promoteIntLiteral(c_int, 65536, .decimal));
pub const __WASI_RIGHTS_PATH_RENAME_TARGET = UINT64_C(@import("std").zig.c_translation.promoteIntLiteral(c_int, 131072, .decimal));
pub const __WASI_RIGHTS_PATH_FILESTAT_GET = UINT64_C(@import("std").zig.c_translation.promoteIntLiteral(c_int, 262144, .decimal));
pub const __WASI_RIGHTS_PATH_FILESTAT_SET_SIZE = UINT64_C(@import("std").zig.c_translation.promoteIntLiteral(c_int, 524288, .decimal));
pub const __WASI_RIGHTS_PATH_FILESTAT_SET_TIMES = UINT64_C(@import("std").zig.c_translation.promoteIntLiteral(c_int, 1048576, .decimal));
pub const __WASI_RIGHTS_FD_FILESTAT_GET = UINT64_C(@import("std").zig.c_translation.promoteIntLiteral(c_int, 2097152, .decimal));
pub const __WASI_RIGHTS_FD_FILESTAT_SET_SIZE = UINT64_C(@import("std").zig.c_translation.promoteIntLiteral(c_int, 4194304, .decimal));
pub const __WASI_RIGHTS_FD_FILESTAT_SET_TIMES = UINT64_C(@import("std").zig.c_translation.promoteIntLiteral(c_int, 8388608, .decimal));
pub const __WASI_RIGHTS_PATH_SYMLINK = UINT64_C(@import("std").zig.c_translation.promoteIntLiteral(c_int, 16777216, .decimal));
pub const __WASI_RIGHTS_PATH_REMOVE_DIRECTORY = UINT64_C(@import("std").zig.c_translation.promoteIntLiteral(c_int, 33554432, .decimal));
pub const __WASI_RIGHTS_PATH_UNLINK_FILE = UINT64_C(@import("std").zig.c_translation.promoteIntLiteral(c_int, 67108864, .decimal));
pub const __WASI_RIGHTS_POLL_FD_READWRITE = UINT64_C(@import("std").zig.c_translation.promoteIntLiteral(c_int, 134217728, .decimal));
pub const __WASI_RIGHTS_SOCK_SHUTDOWN = UINT64_C(@import("std").zig.c_translation.promoteIntLiteral(c_int, 268435456, .decimal));
pub const __WASI_WHENCE_SET = UINT8_C(@as(c_int, 0));
pub const __WASI_WHENCE_CUR = UINT8_C(@as(c_int, 1));
pub const __WASI_WHENCE_END = UINT8_C(@as(c_int, 2));
pub const __WASI_FILETYPE_UNKNOWN = UINT8_C(@as(c_int, 0));
pub const __WASI_FILETYPE_BLOCK_DEVICE = UINT8_C(@as(c_int, 1));
pub const __WASI_FILETYPE_CHARACTER_DEVICE = UINT8_C(@as(c_int, 2));
pub const __WASI_FILETYPE_DIRECTORY = UINT8_C(@as(c_int, 3));
pub const __WASI_FILETYPE_REGULAR_FILE = UINT8_C(@as(c_int, 4));
pub const __WASI_FILETYPE_SOCKET_DGRAM = UINT8_C(@as(c_int, 5));
pub const __WASI_FILETYPE_SOCKET_STREAM = UINT8_C(@as(c_int, 6));
pub const __WASI_FILETYPE_SYMBOLIC_LINK = UINT8_C(@as(c_int, 7));
pub const __WASI_ADVICE_NORMAL = UINT8_C(@as(c_int, 0));
pub const __WASI_ADVICE_SEQUENTIAL = UINT8_C(@as(c_int, 1));
pub const __WASI_ADVICE_RANDOM = UINT8_C(@as(c_int, 2));
pub const __WASI_ADVICE_WILLNEED = UINT8_C(@as(c_int, 3));
pub const __WASI_ADVICE_DONTNEED = UINT8_C(@as(c_int, 4));
pub const __WASI_ADVICE_NOREUSE = UINT8_C(@as(c_int, 5));
pub const __WASI_FDFLAGS_APPEND = UINT16_C(@as(c_int, 1));
pub const __WASI_FDFLAGS_DSYNC = UINT16_C(@as(c_int, 2));
pub const __WASI_FDFLAGS_NONBLOCK = UINT16_C(@as(c_int, 4));
pub const __WASI_FDFLAGS_RSYNC = UINT16_C(@as(c_int, 8));
pub const __WASI_FDFLAGS_SYNC = UINT16_C(@as(c_int, 16));
pub const __WASI_FSTFLAGS_ATIM = UINT16_C(@as(c_int, 1));
pub const __WASI_FSTFLAGS_ATIM_NOW = UINT16_C(@as(c_int, 2));
pub const __WASI_FSTFLAGS_MTIM = UINT16_C(@as(c_int, 4));
pub const __WASI_FSTFLAGS_MTIM_NOW = UINT16_C(@as(c_int, 8));
pub const __WASI_LOOKUPFLAGS_SYMLINK_FOLLOW = UINT32_C(@as(c_int, 1));
pub const __WASI_OFLAGS_CREAT = UINT16_C(@as(c_int, 1));
pub const __WASI_OFLAGS_DIRECTORY = UINT16_C(@as(c_int, 2));
pub const __WASI_OFLAGS_EXCL = UINT16_C(@as(c_int, 4));
pub const __WASI_OFLAGS_TRUNC = UINT16_C(@as(c_int, 8));
pub const __WASI_EVENTTYPE_CLOCK = UINT8_C(@as(c_int, 0));
pub const __WASI_EVENTTYPE_FD_READ = UINT8_C(@as(c_int, 1));
pub const __WASI_EVENTTYPE_FD_WRITE = UINT8_C(@as(c_int, 2));
pub const __WASI_EVENTRWFLAGS_FD_READWRITE_HANGUP = UINT16_C(@as(c_int, 1));
pub const __WASI_SUBCLOCKFLAGS_SUBSCRIPTION_CLOCK_ABSTIME = UINT16_C(@as(c_int, 1));
pub const __WASI_SIGNAL_NONE = UINT8_C(@as(c_int, 0));
pub const __WASI_SIGNAL_HUP = UINT8_C(@as(c_int, 1));
pub const __WASI_SIGNAL_INT = UINT8_C(@as(c_int, 2));
pub const __WASI_SIGNAL_QUIT = UINT8_C(@as(c_int, 3));
pub const __WASI_SIGNAL_ILL = UINT8_C(@as(c_int, 4));
pub const __WASI_SIGNAL_TRAP = UINT8_C(@as(c_int, 5));
pub const __WASI_SIGNAL_ABRT = UINT8_C(@as(c_int, 6));
pub const __WASI_SIGNAL_BUS = UINT8_C(@as(c_int, 7));
pub const __WASI_SIGNAL_FPE = UINT8_C(@as(c_int, 8));
pub const __WASI_SIGNAL_KILL = UINT8_C(@as(c_int, 9));
pub const __WASI_SIGNAL_USR1 = UINT8_C(@as(c_int, 10));
pub const __WASI_SIGNAL_SEGV = UINT8_C(@as(c_int, 11));
pub const __WASI_SIGNAL_USR2 = UINT8_C(@as(c_int, 12));
pub const __WASI_SIGNAL_PIPE = UINT8_C(@as(c_int, 13));
pub const __WASI_SIGNAL_ALRM = UINT8_C(@as(c_int, 14));
pub const __WASI_SIGNAL_TERM = UINT8_C(@as(c_int, 15));
pub const __WASI_SIGNAL_CHLD = UINT8_C(@as(c_int, 16));
pub const __WASI_SIGNAL_CONT = UINT8_C(@as(c_int, 17));
pub const __WASI_SIGNAL_STOP = UINT8_C(@as(c_int, 18));
pub const __WASI_SIGNAL_TSTP = UINT8_C(@as(c_int, 19));
pub const __WASI_SIGNAL_TTIN = UINT8_C(@as(c_int, 20));
pub const __WASI_SIGNAL_TTOU = UINT8_C(@as(c_int, 21));
pub const __WASI_SIGNAL_URG = UINT8_C(@as(c_int, 22));
pub const __WASI_SIGNAL_XCPU = UINT8_C(@as(c_int, 23));
pub const __WASI_SIGNAL_XFSZ = UINT8_C(@as(c_int, 24));
pub const __WASI_SIGNAL_VTALRM = UINT8_C(@as(c_int, 25));
pub const __WASI_SIGNAL_PROF = UINT8_C(@as(c_int, 26));
pub const __WASI_SIGNAL_WINCH = UINT8_C(@as(c_int, 27));
pub const __WASI_SIGNAL_POLL = UINT8_C(@as(c_int, 28));
pub const __WASI_SIGNAL_PWR = UINT8_C(@as(c_int, 29));
pub const __WASI_SIGNAL_SYS = UINT8_C(@as(c_int, 30));
pub const __WASI_RIFLAGS_RECV_PEEK = UINT16_C(@as(c_int, 1));
pub const __WASI_RIFLAGS_RECV_WAITALL = UINT16_C(@as(c_int, 2));
pub const __WASI_ROFLAGS_RECV_DATA_TRUNCATED = UINT16_C(@as(c_int, 1));
pub const __WASI_SDFLAGS_RD = UINT8_C(@as(c_int, 1));
pub const __WASI_SDFLAGS_WR = UINT8_C(@as(c_int, 2));
pub const __WASI_PREOPENTYPE_DIR = UINT8_C(@as(c_int, 0));
pub const _FEATURES_H = "";
pub const _BSD_SOURCE = @as(c_int, 1);
pub const _XOPEN_SOURCE = @as(c_int, 700);
pub const __NEED_FILE = "";
pub const __NEED___isoc_va_list = "";
pub const __NEED_ssize_t = "";
pub const __NEED_off_t = "";
pub const __DEFINED___isoc_va_list = "";
pub const __DEFINED_ssize_t = "";
pub const __DEFINED_off_t = "";
pub const __DEFINED_FILE = "";
pub const EOF = -@as(c_int, 1);
pub const SEEK_SET = __WASI_WHENCE_SET;
pub const SEEK_CUR = __WASI_WHENCE_CUR;
pub const SEEK_END = __WASI_WHENCE_END;
pub const _IOFBF = @as(c_int, 0);
pub const _IOLBF = @as(c_int, 1);
pub const _IONBF = @as(c_int, 2);
pub const BUFSIZ = @as(c_int, 1024);
pub const FILENAME_MAX = @as(c_int, 4096);
pub const FOPEN_MAX = @as(c_int, 1000);
pub const TMP_MAX = @as(c_int, 10000);
pub const L_tmpnam = @as(c_int, 20);
pub const L_ctermid = @as(c_int, 20);
pub const P_tmpdir = "/tmp";
pub const L_cuserid = @as(c_int, 20);
pub const CIMGUI_API = EXTERN ++ API;
pub const IMGUI_HAS_DOCK = @as(c_int, 1);
pub const ImDrawCallback_ResetRenderState = @import("std").zig.c_translation.cast(ImDrawCallback, -@as(c_int, 8));
pub const _IO_FILE = struct__IO_FILE;
pub const _G_fpos64_t = union__G_fpos64_t;

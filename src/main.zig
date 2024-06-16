const std = @import("std");
const builtin = @import("builtin");

const GameV2 = @import("game.zig").GameV2;

const _settings = @import("settings.zig");
const Settings = _settings.Settings;
const DEFAULT_SETTINGS_PATH = _settings.DEFAULT_SETTINGS_PATH;

fn emscripten_log(
    comptime message_level: std.log.Level,
    comptime scope: @Type(.EnumLiteral),
    comptime format: []const u8,
    args: anytype,
) void {
    const level_txt = comptime message_level.asText();
    const prefix2 = if (scope == .default) ": " else "(" ++ @tagName(scope) ++ "): ";

    var buffer: [1024:0]u8 = undefined;
    _ = std.fmt.bufPrint(&buffer, level_txt ++ prefix2 ++ format ++ "\n", args) catch return;
    std.os.emscripten.emscripten_log(0, &buffer);
}

pub const std_options = if (builtin.os.tag != .emscripten) .{} else std.Options{
    .log_level = .debug,
    .logFn = emscripten_log,
};

pub const os = if (builtin.os.tag != .emscripten) std.os else struct {
    pub const heap = struct {
        pub const page_allocator = std.heap.c_allocator;
    };
};

var game: GameV2 = undefined;

// const flecs = @import("deps/flecs.zig");

// const Tag = struct {};
// const CompA = struct {
//     a: u8,
// };
// const CompB = struct {
//     a: u8,
// };
//
// const SSS = struct {
//     a: u8,
// };

// const SPT = flecs.SYSTEM_PARAMETER_TAG;
// const SPC = flecs.SYSTEM_PARAMETER_COMPONENT;
// const SPC_MUT = flecs.SYSTEM_PARAMETER_COMPONENT;
// const SPS = flecs.SYSTEM_PARAMETER_SINGLETON;
// const SPS_MUT = flecs.SYSTEM_PARAMETER_SINGLETON_MUT;

// fn test_system(
//     t: SPT(Tag),
//     c: SPC(CompA, .In),
//     s: SPS(SSS),
// ) void {
//     _ = t;
//     const comp_a = c.data;
//     for (comp_a) |a| {
//         std.log.info("c: {}", .{a.a});
//     }
//     const sss = s.data;
//     std.log.info("s: {}", .{sss.a});
// }

pub fn main() anyerror!void {
    var gpa = std.heap.GeneralPurposeAllocator(.{}){};
    defer _ = gpa.deinit();
    const allocator = gpa.allocator();

    game = try GameV2.new(allocator);
    defer game.deinit();

    game.run();

    // const world = flecs.init();
    // defer _ = flecs.fini(world);
    //
    // flecs.TAG(world, Tag);
    // flecs.COMPONENT(world, CompA);
    // flecs.COMPONENT(world, CompB);
    // flecs.COMPONENT(world, SSS);
    //
    // flecs.ADD_SYSTEM(world, "test_system", flecs.OnUpdate, test_system);
    //
    // const e = flecs.new_id(world);
    // _ = flecs.add(world, e, Tag);
    // _ = flecs.set(world, e, CompA, .{ .a = 1 });
    //
    // const e1 = flecs.new_id(world);
    // _ = flecs.add(world, e1, Tag);
    // _ = flecs.set(world, e1, CompA, .{ .a = 2 });
    //
    // _ = flecs.singleton_set(world, SSS, .{ .a = 3 });
    //
    // _ = flecs.progress(world, 0.0);

    // {
    //     const rl = @import("deps/raylib.zig");
    //
    //     rl.InitWindow(
    //         500,
    //         500,
    //         "Slingshot",
    //     );
    //     rl.SetTargetFPS(60);
    //
    //     const camera = rl.Camera2D{
    //         .offset = rl.Vector2{
    //             .x = 400.0 / 2.0,
    //             .y = 400.0 / 2.0,
    //         },
    //         .target = rl.Vector2{ .x = 0.0, .y = 0.0 },
    //         .rotation = 0.0,
    //         .zoom = 1.0,
    //     };
    //
    //     const shader = rl.LoadShader(null, "./resources/shaders/base.fs");
    //     const time_loc = rl.GetShaderLocation(shader, "time");
    //     const noise_loc = rl.GetShaderLocation(shader, "noise");
    //     const noise = rl.LoadTexture("./resources/shaders/noise.png");
    //
    //     const target = rl.LoadRenderTexture(400, 400);
    //
    //     while (!rl.WindowShouldClose()) {
    //         rl.BeginDrawing();
    //         defer rl.EndDrawing();
    //
    //         {
    //             rl.BeginTextureMode(target); // Enable drawing to texture
    //             defer rl.EndTextureMode();
    //
    //             rl.ClearBackground(rl.BLACK);
    //
    //             rl.BeginMode2D(camera);
    //             defer rl.EndMode2D();
    //             rl.BeginShaderMode(shader);
    //             defer rl.EndShaderMode();
    //
    //             const time: f32 = @floatCast(rl.GetTime());
    //             rl.SetShaderValue(shader, time_loc, &time, rl.SHADER_UNIFORM_FLOAT);
    //             rl.SetShaderValueTexture(shader, noise_loc, noise);
    //
    //             rl.DrawRectangleV(
    //                 rl.Vector2{
    //                     .x = -200.0,
    //                     .y = -200.0,
    //                 },
    //                 rl.Vector2{
    //                     .x = 400.0,
    //                     .y = 400.0,
    //                 },
    //                 rl.WHITE,
    //             );
    //         }
    //
    //         rl.DrawTextureRec(
    //             target.texture,
    //             rl.Rectangle{
    //                 .x = 0.0,
    //                 .y = 0.0,
    //                 .width = @as(f32, @floatFromInt(target.texture.width)),
    //                 .height = -@as(f32, @floatFromInt(target.texture.height)),
    //             },
    //             rl.Vector2{
    //                 .x = 500.0 / 2.0 - 400.0 / 2.0,
    //                 .y = 500.0 / 2.0 - 400.0 / 2.0,
    //             },
    //             rl.WHITE,
    //         );
    //     }
    // }
}

const std = @import("std");
const CSourceFile = std.build.Step.Compile.CSourceFile;

// Although this function looks imperative, note that its job is to
// declaratively construct a build graph that will be executed by an external
// runner.
pub fn build(b: *std.Build) void {
    // Standard target options allows the person running `zig build` to choose
    // what target to build for. Here we do not override the defaults, which
    // means any target is allowed, and the default is native. Other options
    // for restricting supported target set are available.
    const target = b.standardTargetOptions(.{});

    // Standard optimization options allow the person running `zig build` to select
    // between Debug, ReleaseSafe, ReleaseFast, and ReleaseSmall. Here we do not
    // set a preferred release mode, allowing the user to decide how to optimize.
    const optimize = b.standardOptimizeOption(.{});

    const raylib_build = @import("raylib/src/build.zig");
    const raylib = raylib_build.addRaylib(
        b,
        target,
        optimize,
        .{
            .raygui = true,
            .linux_display_backend = raylib_build.LinuxDisplayBackend.Wayland,
        },
    ) catch |err| std.debug.panic("addRaylib error: {any}", .{err});

    const box2c = b.addStaticLibrary(.{
        .name = "box2c",
        .target = target,
        .optimize = optimize,
    });
    box2c.addIncludePath(.{ .path = "box2c/extern/glad/include" });
    box2c.addIncludePath(.{ .path = "box2c/extern/jsmn" });
    box2c.addIncludePath(.{ .path = "box2c/extern/simde" });
    box2c.addIncludePath(.{ .path = "box2c/include" });
    box2c.addIncludePath(.{ .path = "box2c/src" });

    var box2d_flags = std.ArrayList([]const u8).init(std.heap.page_allocator);
    defer box2d_flags.deinit();

    // Special flags for box2c needed only for wasi builds
    if (target.result.os.tag == .emscripten) {
        box2d_flags.appendSlice(&[_][]const u8{
            "-fno-stack-protector",
            "-D_GNU_SOURCE",
            "-fno-sanitize=undefined",
            "-D__EMSCRIPTEN__",
        }) catch unreachable;
    }
    box2c.addCSourceFiles(
        .{
            .files = &.{
                "box2c/src/aabb.c",
                "box2c/src/allocate.c",
                "box2c/src/array.c",
                "box2c/src/bitset.c",
                "box2c/src/block_allocator.c",
                "box2c/src/body.c",
                "box2c/src/broad_phase.c",
                "box2c/src/constraint_graph.c",
                "box2c/src/contact.c",
                "box2c/src/contact_solver.c",
                "box2c/src/core.c",
                "box2c/src/distance.c",
                "box2c/src/distance_joint.c",
                "box2c/src/dynamic_tree.c",
                "box2c/src/geometry.c",
                "box2c/src/hull.c",
                "box2c/src/implementation.c",
                "box2c/src/island.c",
                "box2c/src/joint.c",
                "box2c/src/manifold.c",
                "box2c/src/math.c",
                "box2c/src/motor_joint.c",
                "box2c/src/mouse_joint.c",
                "box2c/src/pool.c",
                "box2c/src/prismatic_joint.c",
                "box2c/src/revolute_joint.c",
                "box2c/src/shape.c",
                "box2c/src/solver.c",
                "box2c/src/stack_allocator.c",
                "box2c/src/table.c",
                "box2c/src/timer.c",
                "box2c/src/types.c",
                "box2c/src/weld_joint.c",
                "box2c/src/wheel_joint.c",
                "box2c/src/world.c",
            },
            .flags = box2d_flags.items,
        },
    );
    box2c.linkLibC();

    // If compiled for wasm32-wasi, compile project as a static lib
    // const artifact = if (target.result.os.tag == .wasi) blk: {
    const artifact = if (target.result.os.tag == .emscripten) blk: {
        const cache_include = std.fs.path.join(b.allocator, &.{ b.sysroot.?, "cache", "sysroot", "include" }) catch @panic("Out of memory");
        defer b.allocator.free(cache_include);
        box2c.addIncludePath(.{ .path = cache_include });

        const lib = b.addStaticLibrary(.{
            .name = "slingshot",
            .root_source_file = .{ .path = "src/main.zig" },
            .target = target,
            .optimize = optimize,
        });
        lib.addIncludePath(.{ .path = cache_include });

        lib.addIncludePath(.{ .path = "raylib/src" });
        lib.addIncludePath(.{ .path = "raygui/src" });
        lib.linkLibrary(raylib);

        lib.addIncludePath(.{ .path = "box2c/include" });
        lib.linkLibrary(box2c);

        lib.linkLibC();

        break :blk lib;
    } else blk: {
        const exe = b.addExecutable(.{
            .name = "slingshot",
            .root_source_file = .{ .path = "src/main.zig" },
            .target = target,
            .optimize = optimize,
        });

        exe.addIncludePath(.{ .path = "raylib/src" });
        exe.addIncludePath(.{ .path = "raygui/src" });
        exe.linkLibrary(raylib);

        exe.addIncludePath(.{ .path = "box2c/include" });
        exe.linkLibrary(box2c);

        exe.linkLibC();

        break :blk exe;
    };

    // This declares intent for the executable to be installed into the
    // standard location when the user invokes the "install" step (the default
    // step when running `zig build`).
    b.installArtifact(artifact);

    // This *creates* a Run step in the build graph, to be executed when another
    // step is evaluated that depends on it. The next line below will establish
    // such a dependency.
    const run_cmd = b.addRunArtifact(artifact);

    // By making the run step depend on the install step, it will be run from the
    // installation directory rather than directly from within the cache directory.
    // This is not necessary, however, if the application depends on other installed
    // files, this ensures they will be present and in the expected location.
    run_cmd.step.dependOn(b.getInstallStep());

    // This allows the user to pass arguments to the application in the build
    // command itself, like this: `zig build run -- arg1 arg2 etc`
    if (b.args) |args| {
        run_cmd.addArgs(args);
    }

    // This creates a build step. It will be visible in the `zig build --help` menu,
    // and can be selected like this: `zig build run`
    // This will evaluate the `run` step rather than the default, which is "install".
    const run_step = b.step("run", "Run the app");
    run_step.dependOn(&run_cmd.step);

    // Creates a step for unit testing. This only builds the test executable
    // but does not run it.
    const unit_tests = b.addTest(.{
        .root_source_file = .{ .path = "src/main.zig" },
        .target = target,
        .optimize = optimize,
    });

    const run_unit_tests = b.addRunArtifact(unit_tests);

    // Similar to creating the run step earlier, this exposes a `test` step to
    // the `zig build --help` menu, providing a way for the user to request
    // running the unit tests.
    const test_step = b.step("test", "Run unit tests");
    test_step.dependOn(&run_unit_tests.step);
}

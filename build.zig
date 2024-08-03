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

    var env = std.process.getEnvMap(std.heap.page_allocator) catch |err| std.debug.panic("getEnvMap error: {any}", .{err});
    defer env.deinit();

    const imgui = b.addStaticLibrary(.{
        .name = "imgui",
        .target = target,
        .optimize = optimize,
    });
    imgui.addIncludePath(b.path("cimgui/imgui"));
    imgui.addIncludePath(b.path("raylib/src/external/glfw/include"));
    imgui.addIncludePath(b.path(env.get("INCLUDE_GL").?));
    imgui.addCSourceFiles(.{
        .files = &.{
            "cimgui/imgui/imgui.cpp",
            "cimgui/imgui/imgui_widgets.cpp",
            "cimgui/imgui/imgui_tables.cpp",
            "cimgui/imgui/imgui_draw.cpp",
            "cimgui/imgui/imgui_demo.cpp",
            "cimgui/imgui/backends/imgui_impl_glfw.cpp",
        },
        .flags = &.{},
    });
    imgui.linkLibCpp();

    const cimgui = b.addStaticLibrary(.{
        .name = "cimgui",
        .target = target,
        .optimize = optimize,
    });
    cimgui.addIncludePath(b.path("cimgui"));
    cimgui.addIncludePath(b.path("cimgui/imgui"));
    cimgui.addCSourceFiles(.{
        .files = &.{
            "cimgui/cimgui.cpp",
        },
        .flags = &.{},
    });
    cimgui.linkLibCpp();

    const raylib_build = @import("raylib/src/build.zig");
    const raylib_wayland = raylib_build.addRaylib(
        b,
        target,
        optimize,
        .{
            .raygui = false,
            .linux_display_backend = raylib_build.LinuxDisplayBackend.Wayland,
        },
    ) catch |err| std.debug.panic("addRaylib error: {any}", .{err});

    const raylib_x11 = raylib_build.addRaylib(
        b,
        target,
        optimize,
        .{
            .raygui = false,
            .linux_display_backend = raylib_build.LinuxDisplayBackend.X11,
        },
    ) catch |err| std.debug.panic("addRaylib error: {any}", .{err});

    const rl_imgui = b.addStaticLibrary(.{
        .name = "rl_imgui",
        .target = target,
        .optimize = optimize,
    });
    rl_imgui.addIncludePath(b.path("rlImGui"));
    rl_imgui.addIncludePath(b.path("raylib/src"));
    rl_imgui.addIncludePath(b.path("cimgui/imgui"));
    rl_imgui.addCSourceFiles(.{
        .files = &.{
            "rlImGui/rlImGui.cpp",
        },
        .flags = &.{},
    });
    // Cpp headers will be included from emsdk
    // for emscripten builds
    if (target.result.os.tag != .emscripten) {
        rl_imgui.linkLibCpp();
    }

    const box2c = b.addStaticLibrary(.{
        .name = "box2c",
        .target = target,
        .optimize = optimize,
    });
    box2c.addIncludePath(b.path("box2c/extern/glad/include"));
    box2c.addIncludePath(b.path("box2c/extern/jsmn"));
    box2c.addIncludePath(b.path("box2c/extern/simde"));
    box2c.addIncludePath(b.path("box2c/include"));
    box2c.addIncludePath(b.path("box2c/src"));

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

    const flecs = b.addStaticLibrary(.{
        .name = "flecs",
        .root_source_file = b.path("src/deps/flecs.zig"),
        .target = target,
        .optimize = optimize,
    });
    flecs.addIncludePath(b.path("flecs/include"));
    flecs.addCSourceFile(.{
        .file = b.path("flecs/flecs.c"),
        .flags = &.{
            "-fno-sanitize=undefined",
            "-DFLECS_NO_CPP",
            "-DFLECS_USE_OS_ALLOC",
            if (@import("builtin").mode == .Debug) "-DFLECS_SANITIZE" else "",
        },
    });
    flecs.linkLibC();

    // If compiled for wasm32-wasi, compile project as a static lib
    const artifact_emscripten = if (target.result.os.tag == .emscripten) blk: {
        const cache_include = std.fs.path.join(
            b.allocator,
            &.{
                b.sysroot.?,
                "cache",
                "sysroot",
                "include",
            },
        ) catch @panic("Out of memory");
        defer b.allocator.free(cache_include);

        const cpp_include = std.fs.path.join(
            b.allocator,
            &.{
                b.sysroot.?,
                "cache",
                "sysroot",
                "include",
                "c++",
                "v1",
            },
        ) catch @panic("Out of memory");
        defer b.allocator.free(cache_include);

        imgui.addIncludePath(b.path(cache_include));
        cimgui.addIncludePath(b.path(cache_include));

        // It is important to include cpp_include
        // before everything else
        rl_imgui.addIncludePath(b.path(cpp_include));
        rl_imgui.addIncludePath(b.path(cache_include));

        box2c.addIncludePath(b.path(cache_include));
        flecs.addIncludePath(b.path(cache_include));

        const lib = b.addStaticLibrary(.{
            .name = "slingshot",
            .root_source_file = b.path("src/main.zig"),
            .target = target,
            .optimize = optimize,
        });
        lib.addIncludePath(b.path(cache_include));

        lib.defineCMacro("CIMGUI_DEFINE_ENUMS_AND_STRUCTS", null);
        lib.addIncludePath(b.path("cimgui"));
        lib.addIncludePath(b.path("raylib/src"));
        lib.addIncludePath(b.path("rlImGui"));
        lib.addIncludePath(b.path("box2c/include"));
        lib.addIncludePath(b.path("flecs/include"));

        lib.linkLibC();

        break :blk lib;
    } else blk: {
        break :blk null;
    };

    const ARTIFACT_INCLUDES = struct {
        fn add_includes(_b: *std.Build, c: *std.Build.Step.Compile) void {
            c.defineCMacro("CIMGUI_DEFINE_ENUMS_AND_STRUCTS", null);
            c.addIncludePath(_b.path("cimgui"));
            c.addIncludePath(_b.path("raylib/src"));
            c.addIncludePath(_b.path("rlImGui"));
            c.addIncludePath(_b.path("box2c/include"));
            c.addIncludePath(_b.path("flecs/include"));
        }
    };

    const artifact_wayland = b.addExecutable(.{
        .name = "slingshot",
        .root_source_file = b.path("src/main.zig"),
        .target = target,
        .optimize = optimize,
    });
    ARTIFACT_INCLUDES.add_includes(b, artifact_wayland);
    artifact_wayland.linkLibrary(imgui);
    artifact_wayland.linkLibrary(cimgui);
    artifact_wayland.linkLibrary(rl_imgui);
    artifact_wayland.linkLibrary(box2c);
    artifact_wayland.linkLibrary(flecs);

    artifact_wayland.linkLibrary(raylib_wayland);

    const artifact_x11 = b.addExecutable(.{
        .name = "slingshot_x11",
        .root_source_file = b.path("src/main.zig"),
        .target = target,
        .optimize = optimize,
    });
    ARTIFACT_INCLUDES.add_includes(b, artifact_x11);
    artifact_x11.linkLibrary(imgui);
    artifact_x11.linkLibrary(cimgui);
    artifact_x11.linkLibrary(rl_imgui);
    artifact_x11.linkLibrary(box2c);
    artifact_x11.linkLibrary(flecs);

    artifact_x11.linkLibrary(raylib_x11);

    // This declares intent for the executable to be installed into the
    // standard location when the user invokes the "install" step (the default
    // step when running `zig build`).
    if (artifact_emscripten) |e| {
        b.installArtifact(e);

        b.installArtifact(imgui);
        b.installArtifact(cimgui);
        b.installArtifact(raylib_wayland);
        b.installArtifact(rl_imgui);
        b.installArtifact(box2c);
        b.installArtifact(flecs);
    } else {
        b.installArtifact(artifact_wayland);
        b.installArtifact(artifact_x11);
    }

    // This *creates* a Run step in the build graph, to be executed when another
    // step is evaluated that depends on it. The next line below will establish
    // such a dependency.
    const run_cmd = b.addRunArtifact(artifact_wayland);

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
        .root_source_file = b.path("src/main.zig"),
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

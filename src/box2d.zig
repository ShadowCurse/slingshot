const box2d = @cImport({
    @cInclude("box2c/include/box2d/api.h");
    @cInclude("box2c/include/box2d/box2d.h");
    @cInclude("box2c/include/box2d/callbacks.h");
    @cInclude("box2c/include/box2d/color.h");
    @cInclude("box2c/include/box2d/constants.h");
    @cInclude("box2c/include/box2d/debug_draw.h");
    @cInclude("box2c/include/box2d/distance.h");
    @cInclude("box2c/include/box2d/dynamic_tree.h");
    @cInclude("box2c/include/box2d/event_types.h");
    @cInclude("box2c/include/box2d/geometry.h");
    @cInclude("box2c/include/box2d/hull.h");
    @cInclude("box2c/include/box2d/id.h");
    @cInclude("box2c/include/box2d/joint_types.h");
    @cInclude("box2c/include/box2d/manifold.h");
    @cInclude("box2c/include/box2d/math.h");
    @cInclude("box2c/include/box2d/math_types.h");
    @cInclude("box2c/include/box2d/timer.h");
    @cInclude("box2c/include/box2d/types.h");
});

pub usingnamespace box2d;

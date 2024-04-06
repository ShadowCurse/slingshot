const std = @import("std");
const rl = @import("raylib.zig");
const b2 = @import("box2d.zig");

x: f32,
y: f32,

const Self = @This();

pub const ZERO = Self{
    .x = 0.0,
    .y = 0.0,
};

pub fn from_rl(vec: rl.Vector2) Self {
    return Self{
        .x = vec.x,
        .y = vec.y,
    };
}

pub fn from_rl_pos(vec: rl.Vector2) Self {
    return Self{
        .x = vec.x,
        .y = -vec.y,
    };
}

pub fn from_b2(vec: b2.b2Vec2) Self {
    return Self{
        .x = vec.x,
        .y = vec.y,
    };
}

pub fn to_rl(self: *const Self) rl.Vector2 {
    return rl.Vector2{
        .x = self.x,
        .y = self.y,
    };
}

pub fn to_rl_as_pos(self: *const Self) rl.Vector2 {
    return rl.Vector2{
        .x = self.x,
        .y = -self.y,
    };
}

pub fn to_b2(self: *const Self) b2.b2Vec2 {
    return b2.b2Vec2{
        .x = self.x,
        .y = self.y,
    };
}

pub fn add(self: *const Self, other: *const Self) Self {
    return Self{
        .x = self.x + other.x,
        .y = self.y + other.y,
    };
}

pub fn sub(self: *const Self, other: *const Self) Self {
    return Self{
        .x = self.x - other.x,
        .y = self.y - other.y,
    };
}

pub fn mul(self: *const Self, v: f32) Self {
    return Self{
        .x = self.x * v,
        .y = self.y * v,
    };
}

pub fn div(self: *const Self, v: f32) Self {
    return Self{
        .x = self.x / v,
        .y = self.y / v,
    };
}

pub fn orthogonal(self: *const Self) Self {
    return Self{
        .x = self.y,
        .y = -self.x,
    };
}

pub fn length(self: *const Self) f32 {
    return std.math.sqrt(self.x * self.x + self.y * self.y);
}

pub fn normalized(self: *const Self) Self {
    const l = self.length();
    return self.div(l);
}

pub fn angle(self: *const Self) f32 {
    return std.math.atan2(f32, self.y, self.x);
}

pub fn rotate(self: *const Self, rad: f32) Self {
    const sin = std.math.sin(rad);
    const cos = std.math.cos(rad);
    return Self{
        .x = cos * self.x - sin * self.y,
        .y = sin * self.x + cos * self.y,
    };
}

const std = @import("std");
const mem = std.mem;

const rl = @import("raylib");

const tex = @import("textures.zig");
const Textures = tex.Textures;
const Texture2D = tex.Texture2D;

pub const GameObject = struct 
{
    const Self = @This();
    
    x: i32 = 0,
    y: i32 = 0,
    texture: Texture2D,
    
    pub fn create(x: i32, y: i32, texture_path: [*c]const u8) GameObject
    {
    
        var t = Textures.load(texture_path);
        
        return .{
            .x = x,
            .y = y,
            .texture = t, 
        };
    }
    
    pub fn tex(self: *Self) Texture2D { return self.texture; }
    pub fn update(self: *Self) void { _ = self; }
    
    
    pub fn draw(self: *Self, src_rect: rl.Rectangle, dest_rect: rl.Rectangle, origin: rl.Vector2, rotation: f32, bg_color: rl.Color) void 
    {
        rl.DrawTexturePro(self.tex(), src_rect, dest_rect, origin, rotation, bg_color);
    }
};
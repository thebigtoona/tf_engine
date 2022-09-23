const std = @import("std");
const mem = std.mem;

const rl = @import("raylib");

const tex = @import("textures.zig");
const tf_math = @import("game_math.zig");

const Textures = tex.Textures;
const Texture2D = tex.Texture2D;

pub const GameObjectOpts = struct 
{
    position: tf_math.Vector2 = tf_math.Vector2{},
    texture_path: [*c]const u8 = "",
};

pub const GameObject = struct 
{
    const Self = @This();
    
    position: tf_math.Vector2,
    texture: Texture2D,
    
    pub fn create(opts: GameObjectOpts) GameObject
    {
        var t = Textures.load(opts.texture_path);
        
        return .{
            .position = opts.position,
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
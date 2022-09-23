pub const rl = @import("raylib");
pub const Texture2D = rl.Texture2D;
pub const Rectangle = rl.Rectangle;

pub const Textures = struct 
{
    pub fn load (asset_path: [*c]const u8) Texture2D 
    {
        return rl.LoadTexture(asset_path);
    }
    
    pub fn unload(texture: Texture2D) void 
    {
        rl.UnloadTexture(texture);
    }
    
    pub fn draw(texture: rl.Texture2D, src: rl.Rectangle, dest: rl.Rectangle, origin: rl.Vector2, rotation: f32, color: rl.Color) void
    {
        
        rl.DrawTexturePro(texture, src, dest, origin, rotation, color);
    }
    
    pub fn drawRec(texture: rl.Texture2D, rect: rl.Rectangle, position: rl.Vector2, tint: rl.Color) void 
    {   
        rl.DrawTextureRec(texture, rect, position, tint);
    }
};
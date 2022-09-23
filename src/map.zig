const std = @import("std");
const mem = std.mem;

const rl = @import("raylib");

const tex = @import("textures.zig");

const Textures = tex.Textures;

var level1: [20][25]i32 = .{
    [25]i32 {2,2,2,2,2, 2,1,1,1,1, 0,0,0,0,0, 0,0,0,0,0, 0,0,0,0,0},
    [25]i32 {2,2,2,2,2, 1,1,1,0,0, 0,0,0,0,0, 0,0,0,0,0, 0,0,0,0,0},
    [25]i32 {1,1,1,2,2, 1,1,1,0,0, 0,0,0,0,0, 0,0,0,0,0, 0,0,0,0,0},
    [25]i32 {1,1,1,1,1, 0,0,0,0,0, 0,0,0,0,0, 0,0,0,0,0, 0,0,0,0,0},
    [25]i32 {1,1,1,1,1, 0,0,0,0,0, 0,0,0,0,0, 0,0,0,0,0, 0,0,0,0,0},

    [25]i32 {1,1,1,1,1, 0,0,0,0,0, 0,0,0,0,0, 0,0,0,0,0, 0,0,0,0,0},
    [25]i32 {0,0,0,0,0, 0,0,0,0,0, 0,0,0,0,0, 0,0,0,0,0, 0,0,0,0,0},
    [25]i32 {0,0,0,0,0, 0,0,0,0,0, 0,0,0,0,0, 0,0,0,0,0, 0,0,0,0,0},
    [25]i32 {0,0,0,0,0, 0,0,0,0,0, 0,0,0,0,0, 0,0,0,0,0, 0,0,0,0,0},
    [25]i32 {0,0,0,0,0, 0,0,0,0,0, 0,0,0,0,0, 0,0,0,0,0, 0,0,0,0,0},

    [25]i32 {0,0,0,0,0, 0,0,0,0,0, 0,0,0,0,0, 0,0,0,0,0, 0,0,0,0,0},
    [25]i32 {0,0,0,0,0, 0,0,0,0,0, 0,0,0,0,0, 0,0,0,0,0, 0,0,0,0,0},
    [25]i32 {0,0,0,0,0, 0,0,0,0,0, 0,0,0,0,0, 0,0,0,0,0, 0,0,0,0,0},
    [25]i32 {0,0,0,0,0, 0,0,0,0,0, 0,0,0,0,0, 0,0,0,0,0, 0,0,0,0,0},
    [25]i32 {0,0,0,0,0, 0,0,0,0,0, 0,0,0,0,0, 0,0,0,0,0, 0,0,0,0,0},

    [25]i32 {0,0,0,0,0, 0,0,0,0,0, 0,0,0,0,0, 0,0,0,0,0, 0,0,0,0,0},
    [25]i32 {0,0,0,0,0, 0,0,0,0,0, 0,0,0,0,0, 0,0,0,0,0, 0,0,0,0,0},
    [25]i32 {0,0,0,0,0, 0,0,0,0,0, 0,0,0,0,0, 0,0,0,0,0, 0,0,0,0,0},
    [25]i32 {0,0,0,0,0, 0,0,0,0,0, 0,0,0,0,0, 0,0,0,0,0, 0,0,0,0,0},
    [25]i32 {0,0,0,0,0, 0,0,0,0,0, 0,0,0,0,0, 0,0,0,0,0, 0,0,0,0,0},
};

pub const Map = struct 
{
    const Self = @This();
    grass: rl.Texture2D,
    dirt: rl.Texture2D,
    water: rl.Texture2D,
    
    // 640 * 800 in 32 bit chunks (figure out what resolution to use for real when map serialization is handled)
    map: [20][25]i32,
    
    // for now this just loads lvl1 hardcoded map.  in the future serialize maps and pull from serialized 
    // data instead of this way.
    pub fn init() Map
    {
        var map = Map 
        {
            .grass = Textures.load("src/assets/grass.png"),
            .dirt = Textures.load("src/assets/dirt.png"),
            .water = Textures.load("src/assets/water.png"),      
            .map = level1,
        };
        
        return map;
    }
    
    // these will be more important when we serialize the maps
    pub fn load() void {}
    pub fn unload() void {}
    
    //TODO(T): fix this draw fn. the map tiles aren't going across the whole screen
    pub fn draw(self: *Self) void 
    {
        var rows = self.map[0..];
        for (rows) |row, row_idx|
        {
            var cols = row[0..];
            
            for (cols) |col, col_idx|
            {
                std.debug.print("\nx: {}, y: {}", .{col_idx * 32, row_idx * 32});
                
                var position = rl.Vector2
                {
                    .x = @intToFloat(f32, col_idx * 32),
                    .y = @intToFloat(f32, row_idx * 32),
                };                
               
               var rect = rl.Rectangle
               {
                   .x = 0,
                   .y = 0,
                   .width = 32,
                   .height = 32,
               };
               
               //NOTE: tried using a switch here but it's broken. when using switch the x value 
               // never changes. workaround with if branches. 
               if (col == 0) Textures.drawRec(self.water, rect, position, rl.WHITE)
               else if (col == 1) Textures.drawRec(self.dirt, rect, position, rl.WHITE)
               else if (col == 2) Textures.drawRec(self.grass, rect, position, rl.WHITE);
            }
        }
    }
};


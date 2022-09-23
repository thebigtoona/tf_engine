const std = @import("std");
const mem = std.mem;
const heap = std.heap;

const rl = @import("raylib");

const g = @import("game.zig");
const Game = g.Game;

const game_object = @import("game_object.zig");
const GameObject = game_object.GameObject;

const Textures = @import("textures.zig").Textures;

const Map = @import("map.zig").Map;

pub fn main() anyerror!void {
    var game: Game = Game.init(.{});
    game.log();
    
    var map = Map.init();
    
    var player: GameObject = GameObject.create(0, 0, "C:/Users/thebi/Projects/Zig/raylib-zig/2d_engine/src/assets/player.png");
    var frame_width: i32 = player.texture.width;
    var frame_height: i32 = player.texture.height;
    var src_rect: rl.Rectangle = rl.Rectangle {.x= 0.0, .y = 0.0, .width = @intToFloat(f32, frame_width), .height = @intToFloat(f32, frame_height)};
    var dest_rect: rl.Rectangle = rl.Rectangle {.x = 32.0, .y = 32.0, .width = @intToFloat(f32, frame_width), .height = @intToFloat(f32, frame_height)};
    var origin: rl.Vector2 = rl.Vector2 { .x = @intToFloat(f32, frame_width), .y = @intToFloat(f32, frame_height) };
    
    while (!rl.WindowShouldClose()) 
    { 
        rl.BeginDrawing();
        {
            Game.draw();
            map.draw();
            player.draw(src_rect, dest_rect, origin, 0.0, rl.WHITE);
        }
        rl.EndDrawing();
    }
    
    Textures.unload(player.tex());

    rl.CloseWindow(); // Close window and OpenGL context
    //--------------------------------------------------------------------------------------
}

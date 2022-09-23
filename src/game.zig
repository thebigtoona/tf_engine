const std = @import("std");
const rl = @import("raylib");

pub const DEFAULT_SCREEN_WIDTH: i32 = 640;
pub const DEFAULT_SCREEN_HEIGHT: i32 = 800;

pub const Game = struct 
{
    const Self = @This();
    is_running: bool = false,
    frame: usize = 0,
    
    pub const WindowOpts = struct
    {
        title: [*c]const u8 = "tf_engine v0.1",
        width: i32 = DEFAULT_SCREEN_WIDTH,
        height: i32 = DEFAULT_SCREEN_HEIGHT,
        fps: i32 = 60,
    };
    
    /// init game object and basic window. fps option will be 60 if left null.
    pub fn init(opts: WindowOpts) Game {
        var game: Self = .{};
        
        // init window
        rl.InitWindow(
            opts.width,
            opts.height, 
            opts.title
        );
        
        rl.SetTargetFPS(opts.fps);
        
        // set running state
        game.is_running = true;
        
        return game;
    }
    
    
    pub fn deinit(self: *Self) void {
        rl.CloseWindow();
        self.is_running = false;
    }
    
    pub fn events() void {}
    
    pub fn update(self: *Self) void {
        self.frame+=1;
        // run game object updates over here
    }
    pub fn draw() void {

    }
    
    // check running status of game
    pub fn isRunning(self: *Self) bool { return self.is_running; }
    
    /// log basic info about Game members
    pub fn log(self: Self) void {
        std.log.info("Game: is_running: {}, frame: {}", .{
            self.is_running,
            self.frame,
        });
    }
};

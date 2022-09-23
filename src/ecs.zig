const std = @import("std");

const ComponentId: type = usize;
const ComponentArray: type = std.Arraylist(*Component);
const ComponentBitSet: type = std.Arraylist(bool);

const MAX_ENTITIES: usize = 32;

pub fn Component(T: type)
{
    return struct
    {
        entities: std.ArrayList(*Entity),
    
        pub fn init() void
        {}
        
        pub fn update() void 
        {}
        
        pub fn draw() void 
        {}
    };
};

pub fn Entity(T: type) = 
{
    return struct
    {
        pub fn update()
        {}
        
        pub fn draw()
        {}
        
        pub fn destroy()
        {}
        
        pub fn isActive()
        {}
        
        pub fn hasComponent()
        {}
        
        pub fn addComponent()
        {}
        
        pub fn getComponent()
        {}
    };
};
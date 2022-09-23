const std = @import("std");

// ECS Notes:
// entity interface
// component interface 
// game will need to hold an array of all the entities 
// entities will need to hold an array of all their own components 
// entities can have different components (player has an input comp but a misc prop might not have an input comp)
// and compose components together for functionality
// components are for describing the data and focus around the data (physics component, input component, sprite component, etc)

const MAX_ENTITIES: u8 = 32;

// maybe use a union here instead of a fn type for holding type info on entities then I can easily switch on them the
// same as I would components. this would create more consisitency.
pub fn Entity(T: type) type
{
    return struct 
    {
        /// the entity id. made this a u8 since we're maxing out at 32 anyway for now.
        /// maybe use a larger integar in the future for this once I figure out how much 
        /// i can even keep in the scene at once. 
        id: u8,
        
        /// describes whether the entity is active or not. if !active then entity is destroyed via 
        /// deinit and messages are sent to the msg system to tell eveything that needs this entity
        /// hey I'm destroyed don't care about me anymore.
        active: bool,
        
        //TODO: don't forget the answer to the problem you're having is a union, tina.
        components: std.ArrayList(*Component),
        
        /// when the entity enters the scene
        pub fn init() void
        {}
         
        /// remove the entity and clean it up 
        pub fn deinit() void
        {}
           
        /// update the entity on tick
        pub fn update() void
        {}
    };
}

pub const PhysicsComponent = struct 
{
    position: tf_math.Vector2,
};

pub const RenderComponent = struct 
{};

pub const InputComponent = struct 
{};

pub const ComponentType = enum(u8)
{
    Physics,
    Input,
    Render,    
};

pub const Component = union(ComponentType)
{
    Physics: PhysicsComponent,
    Input: InputComponent,
    Render: RenderComponent,
};


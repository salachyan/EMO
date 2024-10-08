-- constants for collision flag
ground_flag = 0  -- the flag we set for the ground (sprite 005)
function _init()
  -- initialize player properties
  player1 = {
    x = 2,     -- starting x position
    y = 105,     -- starting y position
    sp = 33,     -- top-left corner of the 4x4 sprite (32x32 pixels)
    w = 2,     -- width of the sprite in pixels
    h = 2,     -- height of the sprite in pixels
    dx = 0,     -- horizontal movement speed
    dy = 0,     -- vertical movement speed (for jumping/falling)
    speed = 1.2,  -- movement speed
    frames = {32,34,0,36,38,0 },
    spz = 1,
    flip = false, -- direction of the sprite
    is_on_ground = false, -- player grounded state
    running=false,
    jumping=false,
    falling=false,
    sliding=false,
    landed=false
  }
  
  player2 = {
    x = 15,     -- starting x position
    y = 105,     -- starting y position
    sp = 3,     -- top-left corner of the 4x4 sprite (32x32 pixels)
    w = 2,     -- width of the sprite in pixels
    h = 2,     -- height of the sprite in pixels
    dx = 0,     -- horizontal movement speed
    dy = 0,     -- vertical movement speed (for jumping/falling)
    speed = 2,  -- movement speed
    frames = {40,42,4,44,46,4},
    spz = 1,

   -- gravity = 0.3, --  strength
    flip = false, -- direction of the sprite
    is_on_ground = false, -- player grounded state
    running=false,
    jumping=false,
    falling=false,
    sliding=false,
    landed=false
  }
  box = {
    x = 40,     -- starting x position
    y = 112,     -- starting y position
    sp = 211,     -- top-left corner of the 4x4 sprite (32x32 pixels)
    w = 1,     -- width of the sprite in pixels
    h = 1,     -- height of the sprite in pixels
    --dx = 0,     -- horizontal movement speed
    --dy = 0,     -- vertical movement speed (for jumping/falling)
    --speed = 2,  -- movement speed
   -- gravity = 0.3, --  strength
    flip = false -- direction of the sprite
    --is_on_ground = false -- player grounded state
  }
  
  gravity = 0.3
  friction=0.85
  
  --simple camera
  cam_x = 0
  
  map_start = 0
  map_end = 1024
end



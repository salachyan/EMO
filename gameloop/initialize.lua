-- constants for collision flag
ground_flag = 0  -- the flag we set for the ground (sprite 005)
function _init()
  -- initialize player properties
  player1 = {
    x = 2,     -- starting x position
    y = 104,     -- starting y position
    sp = 33,     -- top-left corner of the 4x4 sprite (32x32 pixels)
    w = 2,     -- width of the sprite in pixels
    h = 2,     -- height of the sprite in pixels
    dx = 0,     -- horizontal movement speed
    dy = 0,     -- vertical movement speed (for jumping/falling)
    max_dx=2,
    max_dy=3,
    speed = 1.2,  -- movement speed
    frames = {32,34,0,36,38,0 },
    spz = 1,
    flip = false, -- direction of the sprite
    is_on_ground = false, -- player grounded state
    running=false,
    jumping=false,
    falling=false,
    sliding=false,
    landed=false,
    is_on_side = false,
    is_on_bottom_ground = false
  }
  
  player2 = {
    x = 15,     -- starting x position
    y = 104,     -- starting y position
    sp = 3,     -- top-left corner of the 4x4 sprite (32x32 pixels)
    w = 2,     -- width of the sprite in pixels
    h = 2,     -- height of the sprite in pixels
    dx = 0,     -- horizontal movement speed
    dy = 0,     -- vertical movement speed (for jumping/falling)
    max_dx=2,
    max_dy=3,
    speed = 1.5,  -- movement speed
    frames = {40,42,8,44,46,8},
    spz = 1,
    flip = false, -- direction of the sprite
    is_on_ground = false, -- player grounded state
    running=false,
    jumping=false,
    falling=false,
    sliding=false,
    landed=false,
    is_on_side = false,
    is_on_bottom_ground = false
  }

  --Level 1 Setup -----------------------------------------------------------------------------------------------------
  box = {
    x = 40,     -- starting x position
    y = 112,     -- starting y position
    sp = 215,     
    w = 1,     -- width of the sprite in pixels
    h = 1,     -- height of the sprite in pixels
    dx = 0,     -- horizontal movement speed
    --dy = 0,     -- vertical movement speed (for jumping/falling)
    --speed = 2,  -- movement speed
   -- gravity = 0.3, --  strength
    flip = false -- direction of the sprite
    --is_on_ground = false -- player grounded state
  }

  switch1 = {
    x = 92,     -- starting x position
    y = 96,     -- starting y position
    sp = 212,     
    w = 1,     -- width of the sprite in pixels
    h = 1,     -- height of the sprite in pixels
    --dx = 0,     -- horizontal movement speed
    --dy = 0,     -- vertical movement speed (for jumping/falling)
    --speed = 2,  -- movement speed
    flip = false -- direction of the sprite
    --is_on_ground = false -- player grounded state
  }

  switch2 = {
    x = 32,     -- starting x position
    y = 64,     -- starting y position
    sp = 212,     
    w = 1,     -- width of the sprite in pixels
    h = 1,     -- height of the sprite in pixels
    dy=0,
    --dx = 0,     -- horizontal movement speed
    --dy = 0,     -- vertical movement speed (for jumping/falling)
    --speed = 2,  -- movement speed
    flip = true -- direction of the sprite
    --is_on_ground = false -- player grounded state
  }

  platform1 = {
    x = 24,     -- starting x position
    y = 72,     -- starting y position
    sp = 208,    
    w = 1,     -- width of the sprite in pixels
    h = 1,     -- height of the sprite in pixels
    dy=0
  }
  platform2 = {
    x = 32,     -- starting x position
    y = 72,     -- starting y position
    sp = 208,     
    w = 1,     -- width of the sprite in pixels
    h = 1,     -- height of the sprite in pixels
    dy=0
  }
  platform3 = {
    x = 40,     -- starting x position
    y = 72,     -- starting y position
    sp = 208,    
    w = 1,     -- width of the sprite in pixels
    h = 1,     -- height of the sprite in pixels
    dy=0
  }
  platform4 = {
    x = 48,     -- starting x position
    y = 72,     -- starting y position
    sp = 208,   
    w = 1,     -- width of the sprite in pixels
    h = 1,     -- height of the sprite in pixels
    dy=0
  }
  platform5 = {
    x = 56,     -- starting x position
    y = 72,     -- starting y position
    sp = 208,   
    w = 1,     -- width of the sprite in pixels
    h = 1,     -- height of the sprite in pixels
    dy=0
  }
  platform6 = {
    x = 16,     -- starting x position
    y = 72,     -- starting y position
    sp = 192,   
    w = 1,     -- width of the sprite in pixels
    h = 1,     -- height of the sprite in pixels
    dy=0
  }
  platform_mover = {
    x = 40,     -- starting x position
    y = 80,     -- starting y position
    sp = 213,   
    w = 1,     -- width of the sprite in pixels
    h = 1,     -- height of the sprite in pixels
    dy=0
  }
  
  gravity = 0.1
  friction=0.85
  
  --simple camera
  cam_x = 0
  
  map_start = 0
  map_end = 1024
end
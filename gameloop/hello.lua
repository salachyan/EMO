-- constants for collision flag
ground_flag = 0  -- the flag we set for the ground (sprite 005)
function _init()
  -- initialize player properties
  player = {
    x = 2,     -- starting x position
    y = 80,     -- starting y position
    sp = 1,     -- top-left corner of the 4x4 sprite (32x32 pixels)
    w = 2,     -- width of the sprite in pixels
    h = 2,     -- height of the sprite in pixels
    dx = 0,     -- horizontal movement speed
    dy = 0,     -- vertical movement speed (for jumping/falling)
    speed = 2,  -- movement speed
--    gravity = 0.3, --  strength
    flip = false, -- direction of the sprite
    is_on_ground = false -- player grounded state
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
   -- gravity = 0.3, --  strength
    flip = false, -- direction of the sprite
    is_on_ground = false -- player grounded state
  }
  
 	box = {
    x = 40,     -- starting x position
    y = 112,     -- starting y position
    sp = 7,     -- top-left corner of the 4x4 sprite (32x32 pixels)
    w = 1,     -- width of the sprite in pixels
    h = 1,     -- height of the sprite in pixels
    --dx = 0,     -- horizontal movement speed
    --dy = 0,     -- vertical movement speed (for jumping/falling)
    --speed = 2,  -- movement speed
   -- gravity = 0.3, --  strength
    flip = false, -- direction of the sprite
    --is_on_ground = false -- player grounded state
  }
  
  --simple camera
  cam_x = 0
  
  map_start = 0
  map_end = 1024
end



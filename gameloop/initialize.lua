function _init()
  -- initialize player properties
  player1 = {
    x = 2,     -- starting x position
    y = 12*8,     -- starting y position
    sp = 0,     
    w=16,
    h=16,
    flp=false,
    dx=0,
    dy=0,
    max_dx=2,
    max_dy=3,
    speed = 1.2,
    flip=false,
    running=false,
    jumping=false,
    falling=false,
    sliding=false,
    landed=false,
    anim_timer = 0,
    anim_timer2 = 0,
    anim_speed = 0.2,
    anim_frames = {0, 1, 2, 3, 4, 5, 6, 7},
    anim_frames_walking = {0, 2, 4, 6},
    anim_frames_punching = {4, 5, 6, 7},
    frames = {32,34,0,36,38,0 },
    spz = 1,
  }

  player2 = {
    x = 15,     -- starting x position
    y = 12*8,     -- starting y position
    sp = 3,     
    w=16,
    h=16,
    flp=false,
    dx=0,
    dy=0,
    max_dx=2,
    max_dy=3,
    speed = 1.2,
    flip=false,
    running=false,
    jumping=false,
    falling=false,
    sliding=false,
    landed=false,
    anim_timer = 0,
    anim_timer2 = 0,
    anim_speed = 0.2,
    anim_frames = {0, 1, 2, 3, 4, 5, 6, 7},
    anim_frames_walking = {0, 2, 4, 6},
    anim_frames_punching = {4, 5, 6, 7},
    frames = {40,42,8,44,46,8},
    spz = 1,
  }

  switch1 = {
    x = 14*8,     -- starting x position
    y = (29-19)*8,     -- starting y position
    sp = 212,    
    w = 1,     -- width of the sprite in pixels
    h = 1,     -- height of the sprite in pixels
    flip = false -- direction of the sprite
  }

  switch2 = {
    x = 12*8,     -- starting x position
    y = (29-19)*8,     -- starting y position
    sp = 212,    
    w = 1,     -- width of the sprite in pixels
    h = 1,     -- height of the sprite in pixels
    flip = false -- direction of the sprite
  }

  gravity = 0.08
  
  --simple camera
  cam_x = 0
  
  map_start = 0
  map_end=16*8

end
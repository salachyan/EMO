function _init()
  -- initialize player properties
  player1 = {
    x = 2,     -- starting x position
    y = 12*8,     -- starting y position
    sp = 0,     
    w=16,
    h=16,
    sprite_w=2,
    sprite_h=2,
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
    sprite_w=2,
    sprite_h=2,
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
  switches()
  boxes()
  platforms()
  seesaws()
  walls()

  gravity = 0.08
  
  --simple camera
  cam_x = 0
  
  map_start = 0
  map_end=16*8

end

function switches()
  --switches for Level 1
  -- if map_offset_y==19 and map_offset_x==0 then
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
  -- end
  -- if map_offset_y==19 and map_offset_x== 12 then
    switch3 = {
      x = (26-12)*8,     -- starting x position
      y = (26-19)*8,     -- starting y position
      sp = 212,    
      w = 1,     -- width of the sprite in pixels
      h = 1,     -- height of the sprite in pixels
      flip = false -- direction of the sprite
    }
    
    switch4 = {
      x = (24-12)*8,     -- starting x position
      y = (26-19)*8,     -- starting y position
      sp = 212,    
      w = 1,     -- width of the sprite in pixels
      h = 1,     -- height of the sprite in pixels
      flip = false -- direction of the sprite
    }
  -- end
  --switches for level 2
  switch1_2 = {
    x = (44-30)*8,     -- starting x position
    y = 96,     -- starting y position
    sp = 243,    
    w = 1,     -- width of the sprite in pixels
    h = 1,     -- height of the sprite in pixels
    flip = false -- direction of the sprite
  }
  
  switch2_2 = {
    x = 32,     -- starting x position
    y = 64,     -- starting y position
    sp = 243,    
    w = 1,     -- width of the sprite in pixels
    h = 1,     -- height of the sprite in pixels
    dy=0,
    flip = false -- direction of the sprite
  }
  
  switch3_2 = {
    x = (43-30)*8,     -- starting x position
    y = (20-12)*8,     -- starting y position
    sp = 212,    
    w = 1,     -- width of the sprite in pixels
    h = 1,     -- height of the sprite in pixels
    flip = false -- direction of the sprite
  }
  
  switch4_2 = {
    x = (41-30)*8,     -- starting x position
    y = (20-12)*8,     -- starting y position
    sp = 212,    
    w = 1,     -- width of the sprite in pixels
    h = 1,     -- height of the sprite in pixels
    dy=0,
    flip = false -- direction of the sprite
  }
end

function boxes()
  box1 = {
    x = 40,     -- starting x position
    y = 112,     -- starting y position
    sp = 215,    
    w = 8,     -- width of the sprite in pixels
    h = 8,     -- height of the sprite in pixels
    dx = 0,     -- horizontal movement speed
    --dy = 0,     -- vertical movement speed (for jumping/falling)
    --speed = 2,  -- movement speed
   -- gravity = 0.3, --  strength
    flip = false -- direction of the sprite
    --is_on_ground = false -- player grounded state
  }
  box2 = {
    x = (15-12)*8,     -- starting x position
    y = (29-19)*8,     -- starting y position
    sp = 215,    
    w = 8,     -- width of the sprite in pixels
    h = 8,     -- height of the sprite in pixels
    dx = 0,     -- horizontal movement speed
    --dy = 0,     -- vertical movement speed (for jumping/falling)
    --speed = 2,  -- movement speed
   -- gravity = 0.3, --  strength
    flip = false -- direction of the sprite
    --is_on_ground = false -- player grounded state
  }
end

  function platforms()
    -- if map_offset_x==30 and map_offset_y==12 then
    -- if map_offset_x==30 and map_offset_y==12 then
    platform1 = {
      x = 16,     -- starting x position
      y = 72,     -- starting y position
      sp = 208,    
      w = 8,     -- width of the sprite in pixels
      h = 8,     -- height of the sprite in pixels
      dy=0
    }
    platform2 = {
      x = 24,     -- starting x position
      y = 72,     -- starting y position
      sp = 208,    
      w = 8,     -- width of the sprite in pixels
      h = 8,     -- height of the sprite in pixels
      dy=0
    }
    platform3 = {
      x = 32,     -- starting x position
      y = 72,     -- starting y position
      sp = 208,    
      w = 8,     -- width of the sprite in pixels
      h = 8,     -- height of the sprite in pixels
      dy=0
    }
    platform4 = {
      x = 40,     -- starting x position
      y = 72,     -- starting y position
      sp = 208,  
      w = 8,     -- width of the sprite in pixels
      h = 8,     -- height of the sprite in pixels
      dy=0
    }
    platform5 = {
      x = 48,     -- starting x position
      y = 72,     -- starting y position
      sp = 208,  
      w = 8,     -- width of the sprite in pixels
      h = 8,     -- height of the sprite in pixels
      dy=0
    }
    platform6 = {
      x = 48,     -- starting x position
      y = 72,     -- starting y position
      sp = 208,  
      w = 8,     -- width of the sprite in pixels
      h = 8,     -- height of the sprite in pixels
      dy=0
    }
    platform_mover = {
      x = 32,     -- starting x position
      y = 80,     -- starting y position
      sp = 213,  
      w = 8,     -- width of the sprite in pixels
      h = 8,     -- height of the sprite in pixels
      dy=0
    }
  end

  function seesaws()
    seesaw_bottom1 = {
      x = (23-12)*8,     -- starting x position
      y = (29-19)*8,     -- starting y position
      sp = 152,  
      w = 8,     -- width of the sprite in pixels
      h = 8,     -- height of the sprite in pixels
      dy=0,
      flip=false
    }
    seesaw_arch1 = {
      x = (19-12)*8,     -- starting x position
      y = (28-19)*8,     -- starting y position
      sp = 155,  
      w = 8,     -- width of the sprite in pixels
      h = 8,     -- height of the sprite in pixels
      dy=0,
      flip=false
    }
    seesaw_arch2 = {
      x = (22-12)*8,     -- starting x position
      y = (29-19)*8,     -- starting y position
      sp = 155,  
      w = 8,     -- width of the sprite in pixels
      h = 8,     -- height of the sprite in pixels
      dy=0,
      flip=false
    }
    seesaw_arch3 = {
      x = (19-12)*8,     -- starting x position
      y = (29-19)*8,     -- starting y position
      sp = 138,  
      w = 8,     -- width of the sprite in pixels
      h = 8,     -- height of the sprite in pixels
      dy=0,
      flip=false
    }
    seesaw_arch4 = {
      x = (21-12)*8,     -- starting x position
      y = (29-19)*8,     -- starting y position
      sp = 138,  
      w = 8,     -- width of the sprite in pixels
      h = 8,     -- height of the sprite in pixels
      dy=0,
      flip=false
    }
    seesaw_top1 = {
      x = (18-12)*8,     -- starting x position
      y = (28-19)*8,     -- starting y position
      sp = 136,  
      w = 8,     -- width of the sprite in pixels
      h = 8,     -- height of the sprite in pixels
      dy=0,
      flip=false
    }
      -- seesaw_holder1 = {
    --   x = (19-12)*8,     -- starting x position
    --   y = (29-19)*8,     -- starting y position
    --   sp = 153,  
    --   w = 8,     -- width of the sprite in pixels
    --   h = 8,     -- height of the sprite in pixels
    --   dy=0,
    --   flip=false
    -- }
    -- seesaw_holder2 = {
    --   x = (20-12)*8,     -- starting x position
    --   y = (29-19)*8,     -- starting y position
    --   sp = 153,  
    --   w = 8,     -- width of the sprite in pixels
    --   h = 8,     -- height of the sprite in pixels
    --   dy=0,
    --   flip=true
    -- }
  end

  function walls()
    wall_player2 = {
      x = (42-30)*8,     -- starting x position
      y = (23-12)*8,     -- starting y position
      sp = 231,  
      w = 8,     -- width of the sprite in pixels
      h = 8,     -- height of the sprite in pixels
      dy=0
    }
    wall_level2 = {
      x = (39-30)*8,     -- starting x position
      y = (21-12)*8,     -- starting y position
      sp = 208,  
      w = 8,     -- width of the sprite in pixels
      h = 8,     -- height of the sprite in pixels
      dy=0
    }
  end
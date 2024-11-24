function _init()
  level = "climax"
  map_offset_x=60
  map_offset_y=0

  close_to_boulder=0

  player1 = {
    x = 0,    
    y = (12)*8,    
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
    x = 8,    
    y = (12)*8,    
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

  bridge()
  boulder()

  gravity = 0.08

  map_start = 0
  map_end=16*8
  --simple camera
  camera_x = 0
  camera_y = 0
  easing = 0.1
  
end

function boulder()
  boulder = {
    x = (76-60)*8,    
    y = (-5)*8,    
    -- x = (65-60)*8,    
    -- y = (15-15)*8,  
    sp = 140,     
    w=32,
    h=32,
    sprite_w=2,
    sprite_h=2,
    flp=false,
    dx=0,
    dy=0,
    max_dx=2,
    max_dy=3,
    speed = 1.2,
    flip=false,
    spz = 1,
  }

  boulder_blocker = {
    x = (76-60)*8,    
    y = (-5)*8,    
    -- x = (65-60)*8,    
    -- y = (15-15)*8,  
    sp = 140,     
    w=32,
    h=32,
    sprite_w=2,
    sprite_h=2,
    flp=false,
    dx=0,
    dy=0,
    max_dx=2,
    max_dy=3,
    speed = 1.2,
    flip=false,
    spz = 1,
  }

end

function bridge()
  bridge1 = {
    x = (65-60)*8,    
    y = (14)*8,    
    sp = 130,     
    w = 8,
    h = 8,
    dx = 0,
    dy = 0,
    flip = false
  }
  bridge2 = {
    x = (66-60)*8,    
    y = (14)*8,    
    sp = 130,     
    w = 8,
    h = 8,
    dx = 0,
    dy = 0,
    flip = false
  }
  bridge3 = {
    x = (67-60)*8,    
    y = (14)*8,    
    sp = 130,     
    w = 8,
    h = 8,
    dx = 0,
    dy = 0,
    flip = false
  }
  bridge4 = {
    x = (68-60)*8,    
    y = (14)*8,    
    sp = 130,     
    w = 8,
    h = 8,
    dx = 0,
    dy = 0,
    flip = false
  }
  
end
  
 
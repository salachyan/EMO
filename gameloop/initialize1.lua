function _init()
  reading=false
  question=true 
  correct=false
  
  level = "1a"
  map_offset_y=14
  map_offset_x=0

  player1 = {
    x = 2,    
    y = 13*8,    
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
    x = 15,    
    y = 13*8,    
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
  seesaws()

  gravity = 0.08

  map_start = 0
  map_end=16*8
end

function switches()
    switch1 = {
      x = 12*8,     
      y = (29-19)*8,   
      sp = 244,    
      w = 1,     
      h = 1,  
      flip = false,
    }
    
    switch2 = {
      x = 14*8,     
      y = (29-19)*8,    
      sp = 212,    
      w = 1,   
      h = 1,     
      flip = false
    }
    switch3 = {
      x = (24-12)*8, 
      y = (26-19)*8,  
      sp = 244,    
      w = 1,  
      h = 1,    
      flip = false
    }
    
    switch4 = {
      x = (26-12)*8, 
      y = (26-19)*8,  
      sp = 212,    
      w = 1, 
      h = 1,  
      flip = false 
    }
end

function boxes()
  box2 = {
      x = (16-12)*8,
      y = (29-19)*8,
      sp = 215,
      w = 8,
      h = 8,
      dx = 0,
      flip = false
  }
end

function seesaws()
  seesaw_bottom1 = {
    x = (23-12)*8,
    y = (29-19)*8,
    sp = 152,
    w = 8,
    h = 8,
    dy=0,
    flip=false
  }

  seesaw_arch1 = {
      x = (19-12)*8,
      y = (28-19)*8,
      sp = 155,
      w = 8,
      h = 8,
      dy=0,
      flip=false
  }

  seesaw_arch2 = {
      x = (22-12)*8,
      y = (29-19)*8,
      sp = 155,
      w = 8,
      h = 8,
      dy=0,
      flip=false
  }

  seesaw_arch3 = {
      x = (19-12)*8,
      y = (29-19)*8,
      sp = 138,
      w = 8,
      h = 8,
      dy=0,
      flip=false
  }

  seesaw_arch4 = {
      x = (21-12)*8,
      y = (29-19)*8,
      sp = 138,
      w = 8,
      h = 8,
      dy=0,
      flip=false
  }

  seesaw_top1 = {
      x = (18-12)*8,
      y = (28-19)*8,
      sp = 136,
      w = 8,
      h = 8,
      dy=0,
      flip=false
  }
  iquestion()
end
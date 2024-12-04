function _init()
    level = "1a"
    map_offset_y=0
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
  
    map_start = 0
    map_end=16*8
end
function _init()
    screen = "start"
    map_offset_y=0
    map_offset_x=17
    color_outline_start = 8
    color_outline_inst = 7
    color_outline_lvl = 7

    color_outline_menu=7
    time_start = time()
    lvl_condition=false
    inst_condition=false
    
    btn_count = 1
    last_btn_state_down = false 
    last_btn_state_up = false
  
    player1 = {
      x = 0.5*8,    
      y = 12*8,    
      sp = 4,     
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
      anim_timer = 0,
      anim_timer2 = 0,
      anim_speed = 0.2,
      anim_frames = {0, 1, 2, 3, 4, 5, 6, 7},
      anim_frames_walking = {0, 2, 4, 6},
      anim_frames_punching = {4, 5, 6, 7},
      frames = {32,34,0,36,38,0,4,6 },
      spz = 1,
    }
  
    player2 = {
      x = 2.5*8,    
      y = 12*8,    
      sp = 10,     
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
      anim_timer = 0,
      anim_timer2 = 0,
      anim_speed = 0.2,
      anim_frames = {0, 1, 2, 3, 4, 5, 6, 7},
      anim_frames_walking = {0, 2, 4, 6},
      anim_frames_punching = {4, 5, 6, 7},
      frames = {40,42,8,44,46,8},
      spz = 1,
    }

    e_title = {
      x = 5*8,    
      y = 0.5*8,    
      sp = 68,     
    }
    m_title = {
        x = 7*8,    
        y = 0.5*8,    
        sp = 70,     
    }
    o_title = {
        x = 9*8,    
        y = 0.5*8,    
        sp = 72,     
    }
    dot_title = {
        x = 11*8,    
        y = 2*8,    
        sp = 74,     
    }
  
    map_start = 0
    map_end=16*8
end
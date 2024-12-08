function _init()
    screen = "inst"
    map_offset_y=0
    map_offset_x=17
    color_outline_start = 7
    color_outline_inst = 7
    color_outline_lvl = 7

    color_outline_prologue = 7
    color_outline_lvl1 = 7
    color_outline_lvl2 = 7
    color_outline_lvl3 = 7
    color_outline_boulder = 7
    color_outline_menu_lvl=7

    color_outline_menu=7
    time_start = time()
    lvl_condition=false
    inst_condition=false
    menu_condition=false

    prologue_condition=false
    lvl1_condition=false
    lvl2_condition=false
    lvl3_condition=false
    boulder_condition=false
    
    btn_count = 1
    btn_count_lvl = 1
    last_btn_state_down = false 
    last_btn_state_up = false
    last_btn_state_down_lvl = false 
    last_btn_state_up_lvl = false
  
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

    exposition_line1 = {
        x = 2*8,    
        y = (28-17)*8,    
        sp = 168,     
    }
    conflict = {
        x = 4*8,    
        y = (29-17)*8,    
        sp = 186,     
    }
    rising1 = {
        x = 4*8,    
        y = (27-17)*8,    
        sp = 174,     
    }
    rising2 = {
        x = 5*8,    
        y = (25-17)*8,    
        sp = 142,     
    }
    rising3 = {
        x = 6*8,    
        y = (23-17)*8,    
        sp = 142,     
    }
    rising4 = {
        x = 7*8,    
        y = (21-17)*8,    
        sp = 172,     
    }
    falling1 = {
        x = 9*8,    
        y = (21-17)*8,    
        sp = 154,     
    }
    falling2 = {
        x = 10*8,    
        y = (23-17)*8,    
        sp = 136,     
    }
    falling3a = {
        x = 11*8,    
        y = (25-17)*8,    
        sp = 138,     
    }
    falling3b = {
        x = 12*8,    
        y = (26-17)*8,    
        sp = 138,     
    }
    falling3c = {
        x = 12*8,    
        y = (25-17)*8,    
        sp = 139,     
    }
    resolution = {
        x = 13*8,    
        y = (26-17)*8,    
        sp = 140,     
    }
  
    map_start = 0
    map_end=16*8
end
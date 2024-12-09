function _init()
    level = "3a"
    map_offset_x=60
    map_offset_y=15
    shake=false
    offset=1.5
    checker=0
    textbox ="A"
    part="1"
    p1jump=false
    p2jump=false
    reading=false
    movement=false
    player1 = {
      x = 0,    
      y = 12*8,    
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
      y = 12*8,    
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
    walls()
    floors()
  
    gravity = 0.08

    map_start = 0
    map_end=16*8
  
  end
  
  function switches()
    switch1_3 = {
        x = (61-49)*8,
        y = (24-11)*8,
        sp = 243,
        w = 1,
        h = 1,
        dy = 0,
        flip = false
    }
  
    switch2_3 = {
        x = (55-49)*8,
        y = (20-11)*8,
        sp = 243,
        w = 1,
        h = 1,
        dy = 0,
        flip = false
    }
  
    switch3_3 = {
        x = (61-49)*8,
        y = (20-11)*8,
        sp = 244,
        w = 1,
        h = 1,
        dy = 0,
        flip = false
    }
  
    switch4_3 = {
        x = (63-49)*8,
        y = (20-11)*8,
        sp = 212,
        w = 1,
        h = 1,
        dy = 0,
        flip = false
    }
  
    switch1_3b = {
        x = (81-74)*8,
        y = (24-13)*8,
        sp = 243,
        w = 1,
        h = 1,
        dy = 0,
        flip = false
    }
  
    -- switch2_3b = {
    --     x = (82-74)*8,
    --     y = (24-13)*8,
    --     sp = 243,
    --     w = 1,
    --     h = 1,
    --     dy = 0,
    --     flip = false
    -- }
  
    switch3_3b = {
      x = (83-74)*8,    
      y = (21-13)*8,   
      sp = 243,    
      w = 1,     
      h = 1,     
      dy=0,
      flip = false
    }
    switch4_3b = {
      x = (85-74)*8,     
      y = (21-13)*8,    
      sp = 243,    
      w = 1,    
      h = 1,     
      dy=0,
      flip = false 
    }
    switch5_3b = {
      x = (87-74)*8,    
      y = (21-13)*8,  
      sp = 244,    
      w = 1,    
      h = 1,   
      dy=0,
      flip = false 
    }
    switch6_3b = {
      x = (89-74)*8,   
      y = (21-13)*8,    
      sp = 212,    
      w = 1,    
      h = 1,   
      dy=0,
      flip = false 
    }
  end
  
  function boxes()
    box1_3 = {
        x = (76-74)*8,
        y = (24-13)*8,
        sp = 215,
        w = 8,
        h = 8,
        dx = 0,
        dy = 0,
        flip = false
    }
  
    box2_3 = {
        x = (77-74)*8,
        y = (24-13)*8,
        sp = 215,
        w = 8,
        h = 8,
        dx = 0,
        dy = 0,
        flip = false
    }
  
    box3_3 = {
        x = (77-74)*8,
        y = (23-13)*8,
        sp = 215,
        w = 8,
        h = 8,
        dx = 0,
        dy = 0,
        flip = false
    }
  
    box4_3 = {
        x = (76-74)*8,
        y = (23-13)*8,
        sp = 215,
        w = 8,
        h = 8,
        dx = 0,
        dy = 0,
        flip = false
    }
    --3a
    box5_3 = {
        x = (52-49)*8,
        y = (24-11)*8,
        sp = 215,
        w = 8,
        h = 8,
        dx = 0,
        dy = 0,
        flip = false
    }
  end
  
  function platforms()
    platform1_3 = {
        x = (54-49)*8,
        y = (21-11)*8,
        sp = 208,
        w = 8,
        h = 8,
        dy=0
    }
  
    platform2_3 = {
        x = (55-49)*8,
        y = (21-11)*8,
        sp = 208,
        w = 8,
        h = 8,
        dy=0
    }
  
    platform3_3 = {
        x = (56-49)*8,
        y = (21-11)*8,
        sp = 208,
        w = 8,
        h = 8,
        dy=0
    }
  
    platform4_3 = {
        x = (57-49)*8,
        y = (21-11)*8,
        sp = 208,
        w = 8,
        h = 8,
        dy=0
    }
  
    platform5_3 = {
        x = (58-49)*8,
        y = (21-11)*8,
        sp = 208,
        w = 8,
        h = 8,
        dy=0
    }
  
    platform_mover_3 = {
        x = (56-49)*8,
        y = (22-11)*8,
        sp = 213,
        w = 8,
        h = 8,
        dy=0
    }

    platform1_3b = {
      x = (83-74)*8,
      y = (22-13)*8,
      sp = 208,
      w = 8,
      h = 8,
      dy=0
    }

    platform2_3b = {
        x = (84-74)*8,
        y = (22-13)*8,
        sp = 208,
        w = 8,
        h = 8,
        dy=0
    }

    platform3_3b = {
        x = (85-74)*8,
        y = (22-13)*8,
        sp = 208,
        w = 8,
        h = 8,
        dy=0
    }

    platform_mover_3b = {
      x = (84-49)*8,
      y = (23-11)*8,
      sp = 213,
      w = 8,
      h = 8,
      dy=0
  }
  end
  
  function walls()
    wall_player2_3 = {
        x = (60-49)*8,
        y = (23-11)*8,
        sp = 231,
        w = 8,
        h = 8,
        dy=0
    }
  
    wall_level3 = {
        x = (59-30)*8,
        y = (21-12)*8,
        sp = 208,
        w = 8,
        h = 8,
        dy=0
    }
  
  end
  
  function floors()
    floor1_3 = {
      x = (54-49)*8,
      y = (26-11)*8,
      sp = 245,
      w = 8,
      h = 8,
      dy=0
    }
  
    floor2_3 = {
        x = (55-49)*8,
        y = (26-11)*8,
        sp = 245,
        w = 8,
        h = 8,
        dy=0
    }
  
    floor3_3 = {
        x = (56-49)*8,
        y = (26-11)*8,
        sp = 245,
        w = 8,
        h = 8,
        dy=0
    }
  
    floor4_3 = {
        x = (57-49)*8,
        y = (26-11)*8,
        sp = 245,
        w = 8,
        h = 8,
        dy=0
    }
  
    floor5_3 = {
        x = (58-49)*8,
        y = (26-11)*8,
        sp = 245,
        w = 8,
        h = 8,
        dy=0
    }
  
  end
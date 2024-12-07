function _init()
    level = "2a"
    
    map_offset_x=30
    map_offset_y=14
  
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
    platforms()
    walls()

    gravity = 0.08

    map_start = 0
    map_end=16*8
    --simple camera
    camera_x = 0
    camera_y = 0
    easing = 0.1
    
  end
  
  function switches()
      switch1_2 = {
        x = (44-30)*8,
        y = 96,
        sp = 243,
        w = 1,
        h = 1,
        flip = false
    }
  
    switch2_2 = {
        x = 32,
        y = 64,
        sp = 243,
        w = 1,
        h = 1,
        dy = 0,
        flip = false
    }
  
    switch3_2 = {
        x = (41-30)*8,
        y = (20-12)*8,
        sp = 244,
        w = 1,
        h = 1,
        flip = false
    }
  
    switch4_2 = {
        x = (43-30)*8,
        y = (20-12)*8,
        sp = 212,
        w = 1,
        h = 1,
        dy = 0,
        flip = false
    }
  
    switch1_2b = {
      x = (56-44)*8,
      y = (19-12)*8,
      sp = 244,
      w = 1,
      h = 1,
      flip = false
  }
  
  switch2_2b = {
      x = (58-44)*8,
      y = (19-12)*8,
      sp = 212,
      w = 1,
      h = 1,
      dy = 0,
      flip = false
  }
  end
  
  function boxes()
      box1 = {
        x = 40,
        y = 112,
        sp = 215,
        w = 8,
        h = 8,
        dx = 0,
        flip = false
    }
  end
  
  function platforms()
    --level 2
    platform1 = {
      x = 16,
      y = 72,
      sp = 208,
      w = 8,
      h = 8,
      dy=0
    }
  
    platform2 = {
        x = 24,
        y = 72,
        sp = 208,
        w = 8,
        h = 8,
        dy=0
    }
  
    platform3 = {
        x = 32,
        y = 72,
        sp = 208,
        w = 8,
        h = 8,
        dy=0
    }
  
    platform4 = {
        x = 40,
        y = 72,
        sp = 208,
        w = 8,
        h = 8,
        dy=0
    }
  
    platform5 = {
        x = 48,
        y = 72,
        sp = 208,
        w = 8,
        h = 8,
        dy=0
    }
  
    platform6 = {
        x = 48,
        y = 72,
        sp = 208,
        w = 8,
        h = 8,
        dy=0
    }
  
    platform_mover = {
        x = 32,
        y = 80,
        sp = 213,
        w = 8,
        h = 8,
        dy=0
    }

  end
  
  function walls()
    wall_player2 = {
      x = (42-30)*8,
      y = (23-12)*8,
      sp = 231,
      w = 8,
      h = 8,
      dy=0
    }
  
    wall_level2 = {
        x = (39-30)*8,
        y = (21-12)*8,
        sp = 208,
        w = 8,
        h = 8,
        dy=0
    }
  end
  
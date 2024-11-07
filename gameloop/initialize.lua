function _init()
  level = "level1a"
  map_offset_y=14
  map_offset_x=0
  map_offset_y1=14
  map_offset_x1=30
  map_offset_y2=44
  map_offset_x2=22

  player1 = {
    x = 2,    
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
    x = 15,    
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
  seesaws()
  walls()
  floors()

  gravity = 0.08
  
  --simple camera
  cam_x = 0
  
  map_start = 0
  map_end=16*8



end

function switches()
  --switches for Level 1
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
  -- end
  -- if map_offset_y==19 and map_offset_x== 12 then
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
  -- end
  --switches for level 2
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
      x = (60-49)*8,
      y = (20-11)*8,
      sp = 244,
      w = 1,
      h = 1,
      dy = 0,
      flip = false
  }

  switch4_3 = {
      x = (61-49)*8,
      y = (20-11)*8,
      sp = 212,
      w = 1,
      h = 1,
      dy = 0,
      flip = false
  }

  switch1_3b = {
      x = (80-73)*8,
      y = (24-13)*8,
      sp = 243,
      w = 1,
      h = 1,
      dy = 0,
      flip = true
  }

  switch2_3b = {
      x = (82-73)*8,
      y = (24-13)*8,
      sp = 243,
      w = 1,
      h = 1,
      dy = 0,
      flip = true
  }

  switch3_3b = {
    x = (83-73)*8,    
    y = (21-13)*8,   
    sp = 243,    
    w = 1,     
    h = 1,     
    dy=0,
    flip = true
  }
  switch4_3b = {
    x = (85-73)*8,     
    y = (21-13)*8,    
    sp = 243,    
    w = 1,    
    h = 1,     
    dy=0,
    flip = true 
  }
  switch5_3b = {
    x = (87-73)*8,    
    y = (21-13)*8,  
    sp = 244,    
    w = 1,    
    h = 1,   
    dy=0,
    flip = true 
  }
  switch6_3b = {
    x = (88-73)*8,   
    y = (21-13)*8,    
    sp = 212,    
    w = 1,    
    h = 1,   
    dy=0,
    flip = true 
  }
end

function boxes()
    --level2
    box1 = {
      x = 40,
      y = 112,
      sp = 215,
      w = 8,
      h = 8,
      dx = 0,
      flip = false
  }
  --level1b
  box2 = {
      x = (16-12)*8,
      y = (29-19)*8,
      sp = 215,
      w = 8,
      h = 8,
      dx = 0,
      flip = false
  }

  box3 = {
      x = (52-49)*8,
      y = (24-11)*8,
      sp = 215,
      w = 8,
      h = 8,
      dx = 0,
      flip = false
  }

  box1_3 = {
      x = (76-73)*8,
      y = (24-13)*8,
      sp = 215,
      w = 8,
      h = 8,
      dx = 0,
      dy = 0,
      flip = false
  }

  box2_3 = {
      x = (77-73)*8,
      y = (24-13)*8,
      sp = 215,
      w = 8,
      h = 8,
      dx = 0,
      dy = 0,
      flip = false
  }

  box3_3 = {
      x = (77-73)*8,
      y = (23-13)*8,
      sp = 215,
      w = 8,
      h = 8,
      dx = 0,
      dy = 0,
      flip = false
  }

  box4_3 = {
      x = (76-73)*8,
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

  -- level3
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
      x = (55-49)*8,
      y = (22-11)*8,
      sp = 213,
      w = 8,
      h = 8,
      dy=0
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

end

function walls()
  --level2
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

  --level3
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
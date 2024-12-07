function _init()
    reading=false
    movementp1=false
    movementp2=false
    storymovep1=false
    storymovep2=false
    storymovep3=false
    p2jump=false
    knock=1
    knock2=1
    doorstate="closed"
    -- question=true 
    part="1a"
    correct=false
    answernumber=0
    viewhint=false
    offset=1.5
    shake=false
    shake2=false
    checker=0
    conversation=1
    level = "1a"
    storylinestage="1a"
    goinside=false
    qn=1
    map_offset_y=14
    map_offset_x=0
    camera_x = 0
    camera_y = 0
    easing = 0.1
    pal(0,128,1) -- force disrupt
    pal()
    
    fading=0
    fadespeed=5
   
    for i=0,3 do
      for j=0,3 do
        rectfill(j*32,i*24,j*32+30,i*24+22,j+i*4)
      end
    end
    player1 = {
        x = 42,    
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
        frames = {0},
        spz = 1,
      }
    player2 = {
      x = 140,    
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
      frames = {8},
      spz = 1,
    }
    player3 = {
        x = 130,    
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
        frames = {4,6},
        spz = 1,
      }
    -- switches()
    -- boxes()
    -- seesaws()
  
    gravity = 0.08
  
    map_start = 0
    map_end=100*8
    iquestion()
  end
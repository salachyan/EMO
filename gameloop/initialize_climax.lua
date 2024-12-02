function _init()
  level = "climax"
  map_offset_x=60
  map_offset_y=0

  close_to_boulder=0
  players_fell = 0

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
    ladder_draw = false
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
    -- climbing_ability = false
  }

  percy = {
    x = 8,    
    y = (12)*8,    
    sp = 64,     
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
    -- climbing_ability = false
  }

  bridge()
  boulder()
  ground()

  ladderR1 = {
    x = (62-60)*8,    
    y = (15)*8,    
    sp = 176,     
    w = 8,
    h = 8,
  }
  ladderL1 = {
    x = (63-60)*8,    
    y = (15)*8,    
    sp = 177,     
    w = 8,
    h = 8,
  }
  ladderR2 = {
    x = (62-60)*8,    
    y = (14)*8,    
    sp = 144,     
    w = 8,
    h = 8,
  }
  ladderL2 = {
    x = (63-60)*8,    
    y = (14)*8,    
    sp = 145,     
    w = 8,
    h = 8,
  }

  gravity = 0.08

  map_start =0
  map_end=100*8
  --simple camera
  camera_x = 0
  camera_y = 0
  easing = 0.1
  
end

function boulder()
  boulder = {
    x = (78-60)*8,    
    y = (-6)*8,    
    -- x = (65-60)*8,    
    -- y = (15-15)*8,  
    sp = 68,     
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
    sp = 178,     
    w = 8,
    h = 8,
    dx = 0,
    dy = 0,
    flip = false
  }
  bridge2 = {
    x = (66-60)*8,    
    y = (14)*8,    
    sp = 178,     
    w = 8,
    h = 8,
    dx = 0,
    dy = 0,
    flip = false
  }
  bridge3 = {
    x = (67-60)*8,    
    y = (14)*8,    
    sp = 178,     
    w = 8,
    h = 8,
    dx = 0,
    dy = 0,
    flip = false
  }
  bridge4 = {
    x = (68-60)*8,    
    y = (14)*8,    
    sp = 178,     
    w = 8,
    h = 8,
    dx = 0,
    dy = 0,
    flip = false
  }
  
end

grounds = {}

function ground()
  --ground levels on right side
  FourR = {
    x = (61-60)*8,    
    y = (19)*8,    
    sp = 132,     
    w=32,
    h=32,
    flip=false,
  }
  ThreeR = {
    x = (61-60)*8,    
    y = (23)*8,    
    sp = 132,     
    w=32,
    h=32,
    flip=false,
  }
  TwoR = {
    x = (61-60)*8,    
    y = (27)*8,    
    sp = 132,     
    w=32,
    h=32,
    flip=false,
  }
  OneR = {
    x = (61-60)*8,    
    y = (31)*8,    
    sp = 132,     
    w=32,
    h=32,
    flip=false,
  }

  --ground levels on left side
  FourL = {
    x = (69-60)*8,    
    y = (19)*8,    
    sp = 132,     
    w=32,
    h=32,
    flip=false,
  }
  ThreeL = {
    x = (69-60)*8,    
    y = (23)*8,    
    sp = 132,     
    w=32,
    h=32,
    flip=false,
  }
  TwoL = {
    x = (69-60)*8,    
    y = (27)*8,    
    sp = 132,     
    w=32,
    h=32,
    flip=false,
  }
  OneL = {
    x = (69-60)*8,    
    y = (31)*8,    
    sp = 132,     
    w=32,
    h=32,
    flip=false,
  }

  --ground levels on far right side
  FourR2 = {
    x = (57-60)*8,    
    y = (19)*8,    
    sp = 132,     
    w=32,
    h=32,
    flip=false,
  }
  ThreeR2 = {
    x = (57-60)*8,    
    y = (23)*8,    
    sp = 132,     
    w=32,
    h=32,
    flip=false,
  }
  TwoR2 = {
    x = (57-60)*8,    
    y = (27)*8,    
    sp = 132,     
    w=32,
    h=32,
    flip=false,
  }
  OneR2 = {
    x = (57-60)*8,    
    y = (31)*8,    
    sp = 132,     
    w=32,
    h=32,
    flip=false,
  }

  --ground levels on far left side
  FourL2 = {
    x = (73-60)*8,    
    y = (19)*8,    
    sp = 132,     
    w=32,
    h=32,
    flip=false,
  }
  ThreeL2 = {
    x = (73-60)*8,    
    y = (23)*8,    
    sp = 132,     
    w=32,
    h=32,
    flip=false,
  }
  TwoL2 = {
    x = (73-60)*8,    
    y = (27)*8,    
    sp = 132,     
    w=32,
    h=32,
    flip=false,
  }
  OneL2 = {
    x = (73-60)*8,    
    y = (31)*8,    
    sp = 132,     
    w=32,
    h=32,
    flip=false,
  }

  --farthest right
  FourR3 = {
    x = (73-60)*8,    
    y = (19)*8,    
    sp = 132,     
    w=32,
    h=32,
    flip=false,
  }
  FourR4 = {
    x = (65-60)*8,    
    y = (19)*8,    
    sp = 132,     
    w=32,
    h=32,
    flip=false,
  }
  FourR5 = {
    x = (65-60)*8,    
    y = (19)*8,    
    sp = 132,     
    w=32,
    h=32,
    flip=false,
  }


  ThreeR3 = {
    x = (73-60)*8,    
    y = (23)*8,    
    sp = 132,     
    w=32,
    h=32,
    flip=false,
  }
  ThreeR4 = {
    x = (65-60)*8,    
    y = (23)*8,    
    sp = 132,     
    w=32,
    h=32,
    flip=false,
  }
  ThreeR5 = {
    x = (65-60)*8,    
    y = (23)*8,    
    sp = 132,     
    w=32,
    h=32,
    flip=false,
  }


  TwoR3 = {
    x = (73-60)*8,    
    y = (27)*8,    
    sp = 132,     
    w=32,
    h=32,
    flip=false,
  }
  TwoR4 = {
    x = (65-60)*8,    
    y = (27)*8,    
    sp = 132,     
    w=32,
    h=32,
    flip=false,
  }
  TwoR5 = {
    x = (65-60)*8,    
    y = (27)*8,    
    sp = 132,     
    w=32,
    h=32,
    flip=false,
  }
  OneR3 = {
    x = (73-60)*8,    
    y = (31)*8,    
    sp = 132,     
    w=32,
    h=32,
    flip=false,
  }
  OneR4 = {
    x = (57-60)*8,    
    y = (31)*8,    
    sp = 132,     
    w=32,
    h=32,
    flip=false,
  }

  --farthest left
  FourL3 = {
    x = (73-60)*8,    
    y = (19)*8,    
    sp = 132,     
    w=32,
    h=32,
    flip=false,
  }
  FourL4 = {
    x = (73-60)*8,    
    y = (19)*8,    
    sp = 132,     
    w=32,
    h=32,
    flip=false,
  }

  ThreeL3 = {
    x = (73-60)*8,    
    y = (23)*8,    
    sp = 132,     
    w=32,
    h=32,
    flip=false,
  }
  ThreeL4 = {
    x = (73-60)*8,    
    y = (23)*8,    
    sp = 132,     
    w=32,
    h=32,
    flip=false,
  }

  TwoL3 = {
    x = (73-60)*8,    
    y = (27)*8,    
    sp = 132,     
    w=32,
    h=32,
    flip=false,
  }
  TwoL4 = {
    x = (73-60)*8,    
    y = (27)*8,    
    sp = 132,     
    w=32,
    h=32,
    flip=false,
  }

  OneL3 = {
    x = (73-60)*8,    
    y = (31)*8,    
    sp = 132,     
    w=32,
    h=32,
    flip=false,
  }
  OneL4 = {
    x = (73-60)*8,    
    y = (31)*8,    
    sp = 132,     
    w=32,
    h=32,
    flip=false,
  }

  --lowest ground 
  Zero1 = {
    x = (57-60)*8,    
    y = (35)*8,    
    sp = 132,     
    w=32,
    h=32,
    flip=false,
  }
  Zero2 = {
    x = (61-60)*8,    
    y = (35)*8,    
    sp = 132,     
    w=32,
    h=32,
    flip=false,
  }
  Zero3 = {
    x = (65-60)*8,    
    y = (35)*8,    
    sp = 132,     
    w=32,
    h=32,
    flip=false,
  }
  Zero4 = {
    x = (69-60)*8,    
    y = (35)*8,    
    sp = 132,     
    w=32,
    h=32,
    flip=false,
  }
  Zero5 = {
    x = (73-60)*8,    
    y = (35)*8,    
    sp = 132,     
    w=32,
    h=32,
    flip=false,
  }
  Zero6 = {
    x = (77-60)*8,    
    y = (35)*8,    
    sp = 132,     
    w=32,
    h=32,
    flip=false,
  }

  circle = {
    x = (65-60)*8,    
    y = (19)*8,    
    sp = 136,     
    w=32,
    h=32,
    flip=false,
  }
  circle2 = {
    x = (65-60)*8,    
    y = (19)*8,    
    sp = 136,     
    w=32,
    h=32,
    flip=false,
  }

  add(grounds, ground1)
  add(grounds, ground2)
  add(grounds, ground3)
  add(grounds, ground4)
  add(grounds, ground5)
  add(grounds, ground6)
  add(grounds, ground7)
  add(grounds, ground8)
  add(grounds, ground9)
  add(grounds, ground10)
  add(grounds, ground11)
  add(grounds, ground12)

end
  
 
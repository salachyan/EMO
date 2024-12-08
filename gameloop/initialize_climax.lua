function _init()
  level = "climax"
  map_offset_x=60
  map_offset_y=0
  move_player1=false
  have_moved=false
  start_story = have_moved and player1.y>=7*8 and player2.y>=7*8 and player1.x>=(74-60)*8 and player2.x>=(74-60)*8

  checker=0

  pip_1 = "pip: percy, we've found you! are you okay? why is the cheetah standing next to you?"

  -- Track current message being displayed
  current_message_index = 1  -- Start from the first message (index 0)
  
  -- Define the dialogue messages
  dialogue_messages = {
      pip_1,  -- First message (should be displayed first)
      "percy: i should've told you the truth earlier... the boulder, it wasn't just an accident.",
      "pete: what do you mean? wasn't it just a part of the mountain?",
      "pip: yeah, why did it fall right when we were crossing the bridge?",
      "cheetah: percy and i set it up. it was supposed to stop you two from getting any further.",
      "percy: i've been working with the cheetah all along. you two were never supposed to make it this far.",
      "pip: all of this was a lie? why did you join him, percy? what did he promise you?",
      "percy: i did it because i felt left out. you two were always so close, always working together, and i was on the outside.",
      "percy: i thought if i teamed up with the cheetah, i could prove that i was just as strong, wise, and capable as you both.",
      "percy: i wanted to outsmart everyone and show that i didn't need you guys to feel powerful and important.",
      "pip: we never wanted to make you feel left out, percy. we should've been there for you when you needed us, instead of letting you feel alone.",
      "pete: yeah, you don't need to prove anything to us. we're a team, no matter what.",
      "pete: we want to work together as a family, no matter what.",
      "percy: i'm so sorry for lying to you guys this whole time. how can you guys forgive me so easily?",
      "pip: it's because you're sorry too for leaving you out. we should have known how leaving you out would make you feel.",
      "pete: yeah, i'm so sorry for percy. we forgive you and can you forgive us too? you're our brother and we care about you.",
      "percy: i forgive you guys and i'm really sorry for what i did. i'm glad we can work together again."
  }

  close_to_boulder=0
  players_fell = 0
  -- i=0
  -- tb_meet = tb_init(0,{"pip exclaims, ''percy, we've found you! are you okay? why is the cheetah standing next to you?''"
  --           , "percy says, ''the boulder you guys saw waasn't just an accident."
  --           , "pete says, ''what do you mean? wasn't it just a part of the mountain?''"
  --               , "pip says, ''yeah, why did it fall right when we were crossing the bridge?''"
  --               , "cheetah says, ''percy and i set it up. it was supposed to stop you two from getting any further.''"
  --               , "percy says, ''I've been working with the cheetah all along. you two were never supposed to make it this far.''"
  --               , "pip says, ''why did you join him, percy? what did he promise you?''"}) 

  
  meet_percy=false

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
    x = (81-60)*8,    
    y = (7)*8,    
    sp = 64,     
    w=16,
    h=16,
    sprite_w=2,
    sprite_h=2,
    speed = 1.2,
    flip=true,
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
  cheetah = {
    x = (83-60)*8,    
    y = (5)*8,    
    sp = 72,     
    w=32,
    h=32,
    sprite_w=2,
    sprite_h=2,
    speed = 1.2,
    flip=true,
    spz = 1,
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

  x=camera_x
  y=camera_y
  
end

function boulder()
  boulder = {
    x = (78-60)*8,    
    y = (-6)*8,    
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

end
  
 
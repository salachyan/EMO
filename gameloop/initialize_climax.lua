function _init()
  level = "climax"
  map_offset_x=60
  map_offset_y=0
  move_player1=false
  have_moved=false
  start_story = have_moved and player1.y>=7*8 and player2.y>=7*8 and player1.x>=(74-60)*8 and player2.x>=(74-60)*8

  pal(0,128,1) -- force disrupt
  pal()
  fading=0
  fadespeed=5

  btn_count_lvl=1
  local show_popup = false
  local popup_selection = 1
  yes_color=7
  no_color=7
  last_btn_state_down_lvl = false
  last_btn_state_up_lvl = false

  
  gameover_time=0
  gameover_condition=false
  ending_condition=false
  thanks_condition=false
  ending_condition2=false
  questions_condition=false
  gameover_time1=0
  gameover_time2=0
  gameover_time3=0

  checker=0
  sprite_loop_timer = 0 
  sprite_loop_timer2=0
  sprite_change_speed = 20  -- How fast to change the sprite (lower is faster)

  message2 ="pip: percy, we've found you! are you okay? why is the cheetah standing next to you?"
  message3="percy: the boulder you guys found, it wasn't just an accident."
  message4="pete: what do you mean? wasn't it just a part of the mountain?"
  message5="pip: yeah, why did it fall right when we were crossing the bridge?"
  message6="cheetah: percy and i set it up. it was supposed to stop you two from getting any further."
  message7="percy: i've been working with the cheetah all along. you two were never supposed to make it this far."
  message8="pip: this was all a lie? why did you join him, percy? what did he promise you?"
  message9="percy: i did it because i felt left out. you two were always so close, always working together, and i was on the outside."
  message10="percy: i thought if i teamed up with the cheetah, i could prove that i was just as strong, wise, and capable as you both."
  message11="percy: i wanted to outsmart everyone and show that i didn't need you guys to feel powerful and important."
  message12="pip: we never wanted to make you feel left out, percy. we should've been there for you when you needed us, instead of letting you feel alone."
  message13="pete: yeah, you don't need to prove anything to us. we're a team, no matter what."
  message14="pete: we want to work together as a family, no matter what."
  message15="percy: i'm so sorry for lying to you guys this whole time. how can you guys forgive me so easily?"
  message16="pip: it's because we're also sorry for leaving you out. we should have known how leaving you out would make you feel."
  message17="pete: yeah, i'm so sorry, percy. we forgive you and can you forgive us too? you're our brother and we care about you."
  message18="percy: i forgive you guys and i'm really sorry for what i did. i'm glad we can work together again."
  message19="cheetah: percy, i knew you felt left out. that's why i used you."
  message20="cheetah: i figured you'd be willing to help me take them down, just to feel like you finally mattered."
  message21="cheetah: but it's clear now... whatever you three have, it's not something I can break."
  message22="pip: it's over! the cheetah won't bother us anymore"
  message23="percy: i'm so happy we're brothers!" 
  message24="pete: we did it as a team! we're so happy to have you back percy!"
  -- Track current message being displayed
  current_message_index = 1  -- Start from the first message (index 0)
  
  -- Define the dialogue messages
  dialogue_messages = {
    message2,  
    message3,
    message4,
    message5,
    message6,
    message7,
    message8,
    message9,
    message10,
    message11,
    message12,
    message13,
    message14,
    message15,
    message16,
    message17,
    message18,
    message19,
    message20,
    message21,
    message22,
    message23,
    message24

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

    landed=false,

    spz = 1,
    ladder_draw = false
  }

  player2 = {
    x = 8,    
    y = (12)*8,    
    sp = 8,     
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

    landed=false,

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
  
 
function _update()

  if map_offset_x==60 and map_offset_y==15 then
    level = "3a"
  elseif map_offset_x==74 and map_offset_y==13 then
    level = "3b"
  end

  update_map_level3a_to_level3b()
  update_map_level3b_to_climax()
  
  if level == "3a" then
    level3a()
    collisions_for_switch3_3()
    collisions_for_switch4_3()
  elseif level == "3b" then
    level3b()
    collisions_for_switch5_3b()
    collisions_for_switch6_3b()
  end
    beginningtext()

  if reading then
  else
      player1_update()
      player2_update()
      if show_popup==true then
        btn_option()
      end
     
      if show_popup==false then
        yes_color=7
        no_color=7
      end
      if btnp(🅾️,0) then
        show_popup = true
      end

  end

end

function player1_update()
  player1.dy+=gravity
  player1.running=false
  --left
  if btn(⬅️, 0) then
    player1.dx = -player1.speed
    player1.flip = true 
    player1.running=true
    player1.flp=true
  --right
  elseif btn(➡️, 0) then
    player1.dx = player1.speed
    player1.flip = false
    player1.running=true
    player1.flp=false
  else
    player1.dx=0
    player1.sprite_id = player1.anim_frames[0]
  end

  -- jump
  if btn(❎, 0) and player1.landed then
    player1.dy-=player1.speed
    player1.landed=false
  end

  --from https://nerdyteachers.com/Explain/Platformer/
  --up down
  if player1.dy>0 then
    player1.falling=true
    player1.landed=false
    player1.jumping=false

    if map_collision(player1,"down",0,map_offset_y,map_offset_x) then
        player1.landed=true
        player1.falling=false
        player1.dy=0
        player1.y-=((player1.y+player1.h+1)%8)-1
    end
    elseif player1.dy<0 then
        player1.jumping=true
        if map_collision(player1,"up",1,map_offset_y,map_offset_x) then
        player1.dy=0
    end
  end

  --left right
  if player1.dx<0 then

    if map_collision(player1,"left",2,map_offset_y,map_offset_x) then
        player1.dx=0
    end
    elseif player1.dx>0 then


    if map_collision(player1,"right",3,map_offset_y,map_offset_x) then
        player1.dx=0
    end
  end

  walking_animationp1()

  player1.x+=player1.dx
  player1.y+=player1.dy

  --limit players to map
  if player1.x<map_start then
    player1.x=map_start
  end
  if player1.x>map_end-player1.w then
      player1.x=map_end-player1.w
  end
end

function player2_update()
  player2.dy+=gravity
  --left
  -- if btn(⬆️, 0) then
  player2.running=false
  if btn(⬅️, 1) then
    player2.dx = -player2.speed
    player2.flip = true 
    player2.running=true
    player2.flp=true

  -- right
-- elseif btn(⬇️, 0) then
elseif btn(➡️, 1) then
    player2.dx = player2.speed
    player2.flip = false 
    player2.running=true
    player2.flp=false
  else
    player2.dx=0
    player2.sprite_id = player2.anim_frames[0]
  end

  -- jump
  -- if btn(🅾️, 0) and player2.landed then
  if btn(❎, 1) and player2.landed then
    player2.dy-=player2.speed
    player2.landed=false
  end

  --from https://nerdyteachers.com/Explain/Platformer/
  --up down
  if player2.dy>0 then
    player2.falling=true
    player2.landed=false
    player2.jumping=false

    if map_collision(player2,"down",0,map_offset_y,map_offset_x) then
        player2.landed=true
        player2.falling=false
        player2.dy=0
        player2.y-=((player2.y+player2.h+1)%8)-1
    end
    elseif player2.dy<0 then
        player2.jumping=true
        if map_collision(player2,"up",1,map_offset_y,map_offset_x) then
        player2.dy=0
    end

  end
  if player2.x<map_start then
    player2.x=map_start
  end
  if player2.x>map_end-player2.w then
      player2.x=map_end-player2.w
  end

  --left right
  if player2.dx<0 then

    if map_collision(player2,"left",2,map_offset_y,map_offset_x) then
        player2.dx=0
    end
    elseif player2.dx>0 then

    if map_collision(player2,"right",3,map_offset_y,map_offset_x) then
        player2.dx=0
    end
  end

  --animation player2
  walking_animationp2()

  player2.x+=player2.dx
  player2.y+=player2.dy
end


function walking_animationp1()
  if player1.running then
      local num_frames = 6.9  -- Total frames in the animation
      if player1.spz < num_frames then
          player1.spz = player1.spz + 0.1
      else
          player1.spz = 1
      end
      player1.frames = {32,34,0,36,38,0}
  
  else
      -- Standing still
      local num_frames = 2.9  -- Total frames in the animation
      if player1.spz < num_frames then
          player1.spz = player1.spz + 0.05
      else
          player1.spz = 1
      end
      player1.frames = {0,2} -- Idle frame
  end
end

function walking_animationp2()
  if player2.running then
      local num_frames = 6.9  -- Total frames in the animation
      if player2.spz < num_frames then
          player2.spz = player2.spz + 0.1
      else
          player2.spz = 1
      end
      player2.frames = {40,42,8,44,46,8}
  else
      -- Standing still
      local num_frames = 2.9  -- Total frames in the animation
      if player2.spz < num_frames then
          player2.spz = player2.spz + 0.05
      else
          player2.spz = 1
      end
      player2.frames = {8,10} -- Idle frame
  end
end


function btn_option()
  if btn(⬇️, 0) and not last_btn_state_down_lvl then
  btn_count_lvl -= 1
  last_btn_state_down_lvl = true  --button is now pressed
  elseif not btn(⬇️, 0) and last_btn_state_down_lvl then
    last_btn_state_down_lvl = false  --button has been released
  end


  if btn(⬆️, 0) and not last_btn_state_up_lvl then
    btn_count_lvl += 1
    last_btn_state_up_lvl = true
  elseif not btn(⬆️, 0) and last_btn_state_up_lvl then
    last_btn_state_up_lvl = false
  end


  --cycle button selection with wraparound behavior
  if btn_count_lvl > 2 then
    btn_count_lvl = 1
  elseif btn_count_lvl < 1 then
    btn_count_lvl = 2
  end


  --set button outline colors based on button selection
  if btn_count_lvl == 1 then
    yes_color=7
    no_color=8
    
  elseif btn_count_lvl == 2 then
    yes_color=8
    no_color=7
  end
  if yes_color==8 and btn(❎, 0) then
    load("menu.p8")
  elseif no_color==8 and btn(❎, 0) then
    show_popup=false
  end
end

function beginningtext()
  beginningtalk()
  updatetocheetahtalk()
  cheetahyell()
  updatecheetah()
  pipandpetewhat()
  moveplayers()
end

function beginningtalk()
  --pip and pete knck on percy's door.
      if reading then -- if tb_init has been called, reading will be true and a text box is being displayed to the player. it is important to do this check here because that way you can easily separete normal game actions to text box inputs.
          tb_update() -- handle the text box on every frame update.
      else
              if textbox == "A" and checker==0 then

              tb_init(map_offset_x-60,map_offset_y,0,{"pip: dang that was really hard. the sun's already coming down... did percy really think that side was easier?", "pete: i'm not sure but i was really struggling too!", "pip: well i guess we have to keep ging. we definitely can't go back..."})
              checker+=1
              part="A"
      end
  end
end

function updatetocheetahtalk()
    if part =="A" and reading==false then
      textbox="1"
    end
end


function cheetahyell()
    --pip and pete knck on percy's door.
    if textbox == "1" and checker==1 then

        if reading then -- if tb_init has been called, reading will be true and a text box is being displayed to the player. it is important to do this check here because that way you can easily separete normal game actions to text box inputs.
            tb_update() -- handle the text box on every frame update.
        else

                tb_init(map_offset_x-60,map_offset_y,0,{"cheetah yelling: im on my way pip and pete!!"})
                checker+=1
                part="2"
                shake=true
                p1jump=true
                p2jump=true


        end
    end
end



function updatecheetah()
    if part =="2" and reading == false then
      if(p2jump==true) then
        player2.dy-=player2.speed
        player2.landed=false
        p2jump=false
        textbox="2"
      end
      if (p1jump==true) then
        player1.dy-=player1.speed
        player1.landed=false
        p1jump=false
      end
    end
end

function pipandpetewhat()
  --pip and pete knck on percy's door.
  if textbox == "2" and checker==2 then

    if reading then -- if tb_init has been called, reading will be true and a text box is being displayed to the player. it is important to do this check here because that way you can easily separete normal game actions to text box inputs.
          tb_update() -- handle the text box on every frame update.
      else

              tb_init(map_offset_x-60,map_offset_y,0,{"pip and pete: !!!! we have to go!!!"})
              shake=true
              p1jump=true
              p2jump=true
              part="3"
              checker+=1

      end
  end
end

function moveplayers()
  if part =="3" and reading==false then
    movement=true
    textbox="x"
  end
end

function screen_shake()
  local fade = 0.90
  local offset_x=8-rnd(5)
  local offset_y=0
  offset_x*=offset
  offset_y*=offset
  
  camera(map_offset_x -60+ offset_x,map_offset_y-15+offset_y)
  offset*=fade
  if offset<0.05 then
    offset=0
      shake=false
  end
end
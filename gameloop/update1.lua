function _update()


  if map_offset_x==0 and map_offset_y==14 then
    level = "1a"
  elseif map_offset_x==12 and map_offset_y==14 then
    level = "1b"
  end
  
  update_map_level1a_to_level1b()
  update_map_level1_to_level2()
  if question != "qx" then
    uquestion()
  end
  if level == "1a" then
    collisions_for_switch1()
    collisions_for_switch2()
    -- question="q1"
  if(currentQ==1 and question == "qx") then
    question = "q1"
  end
  if(currentQ==2 and question == "qx") then
    question = "q2"
  end
  if(currentQ==3 and question == "qx") then
    question = "q3"
  end
  if(currentQ==4 and question == "qx") then
    question = "q4"
  end

  elseif level == "1b" then
    level1b()
    collisions_for_switch3()
    collisions_for_switch4()
  end
  if reading or question!="qx" then
  else
      player1_update()
      player2_update()
      if btnp(🅾️,0) then
        btn_option()
        
      end
  end

  

end

function player1_update()
  player1.dy+=gravity
  --left
  player1.running=false
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
  if btn(❎, 1) and player2.landed then 
  -- if btn(🅾️, 0) and player2.landed then
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
  if show_popup then
    -- Navigate Yes/No options
    if btnp(⬆️, 0) then
        popup_selection = 1 -- Yes
    elseif btnp(⬇️, 0) then
        popup_selection = 2 -- No
    end

    -- Confirm selection
    if btnp(🅾️, 0) then
        if popup_selection == 1 then
            load("menu.p8") -- Load the main menu
        else
            show_popup = false -- Close popup, stay on current screen
        end
    end
else
    -- Your existing button logic to trigger the popup
    if btnp(🅾️, 0) then
        show_popup = true -- Show confirmation popup
    end
end
  -- --detect if the down button is pressed and released
  -- if btn(⬇️, 0) and not last_btn_state_down_lvl then
  --   btn_count_lvl -= 1
  --   last_btn_state_down_lvl = true  --button is now pressed
  -- elseif not btn(⬇️, 0) and last_btn_state_down_lvl then
  --     last_btn_state_down_lvl = false  --button has been released
  -- end

  -- if btn(⬆️, 0) and not last_btn_state_up_lvl then
  --     btn_count_lvl += 1
  --     last_btn_state_up_lvl = true 
  -- elseif not btn(⬆️, 0) and last_btn_state_up_lvl then
  --     last_btn_state_up_lvl = false 
  -- end

  -- --cycle button selection with wraparound behavior
  -- if btn_count_lvl > 7 then
  --     btn_count_lvl = 1
  -- elseif btn_count_lvl < 1 then
  --     btn_count_lvl = 7
  -- end

  -- --set button outline colors based on button selection
  -- if btn_count_lvl == 1 then
  --     color_outline_prologue = 7
  --     color_outline_lvl1 = 7
  --     color_outline_lvl2 = 7
  --     color_outline_lvl3 = 7
  --     color_outline_boulder = 7
  --     color_outline_menu_lvl=7
  -- elseif btn_count_lvl == 2 then
  --     color_outline_prologue = 8
  --     color_outline_lvl1 = 7
  --     color_outline_lvl2 = 7
  --     color_outline_lvl3 = 7
  --     color_outline_boulder = 7
  --     color_outline_menu_lvl=7
  -- end
end
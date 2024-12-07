function _update()

    -- storylinetext()
    if map_offset_x==0 and map_offset_y==14 then
      level = "1a"
    elseif map_offset_x==12 and map_offset_y==14 then
      level = "1b"
    end
    
    -- update_map_level1a_to_level1b()
    -- update_map_level1_to_level2()
    if question == true then
      uquestion()
    end

    player1_update()
    player2_update()
    player3_update()
    
    update_camera()
    -- move_player1right()
    prologue()
  end
  
  function update_camera()
    --midpoint between player1 and player2
    local target_x = (player1.x)  - 64  -- offset to keep midpoint centered horizontally
    local target_y = (player1.y) - 64  -- offset for vertical centering

    --move the camera toward the target position
    local vertical_offset = 32  
    target_y -= vertical_offset
  
    -- Smoothly move the camera toward the target position
    camera_x += (target_x - camera_x) * easing
    -- camera_y += (target_y - camera_y) * easing
  
    --set camera within map boundaries
    camera_x = mid(map_start, camera_x, map_end - 128)
    camera_y = mid(0, camera_y, 512-128)
  
    camera(camera_x, camera_y)
  end
  
  function player1_update()
    player1.dy+=gravity
    player1.running=false
    
      --left
      if btn(⬅️, 0) and movementp1 and reading!=true then
        player1.dx = -player1.speed
        player1.flip = true 
        player1.running=true
        player1.flp=true
      --right
      elseif btn(➡️, 0) and movementp1 and reading!=true then
        player1.dx = player1.speed
        player1.flip = false
        player1.running=true
        player1.flp=false
      else
        player1.dx=0
      end
      if not climbing_ability then
      -- jump
      if btn(❎, 0) and player1.landed and movementp1 and reading!=true then
        player1.dy-=player1.speed
        player1.landed=false
      end
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
          if map_collision(player1,"up",0,map_offset_y,map_offset_x) then
          player1.dy=0
      end
    end
  
    --left right
    if player1.dx<0 then
  
      if map_collision(player1,"left",0,map_offset_y,map_offset_x) then
          player1.dx=0
      end
      elseif player1.dx>0 then
  
  
      if map_collision(player1,"right",0,map_offset_y,map_offset_x) then
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

    player2.running=false
    --left
    if btn(⬆️, 0) and movementp2 then
    -- if btn(⬅️, 1) then
      player2.dx = -player2.speed
      player2.flip = true 
      player2.running=true
      player2.flp=true
  
    -- right
  elseif btn(⬇️, 0) and movementp2 then
-- elseif btn(➡️, 1) then
      player2.dx = player2.speed
      player2.flip = false 
      player2.running=true
      player2.flp=false
    else
      player2.dx=0      
    end
  
    -- jump
    if not climbing_ability2 then
    if btn(🅾️, 0) and player2.landed and movementp2 then
    -- if btn(❎, 1) and player2.landed then
      player2.dy-=player2.speed
      player2.landed=false
    end
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
          if map_collision(player2,"up",0,map_offset_y,map_offset_x) then
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
  
      if map_collision(player2,"left",0,map_offset_y,map_offset_x) then
          player2.dx=0
      end
      elseif player2.dx>0 then
  
      if map_collision(player2,"right",0,map_offset_y,map_offset_x) then
          player2.dx=0
      end
    end
  
    --animation player2

    walking_animationp2()

    player2.x+=player2.dx
    player2.y+=player2.dy
    
  end

  function player3_update()
    player3.dy+=gravity

    player3.running=false
 
    --from https://nerdyteachers.com/Explain/Platformer/
    --up down
    if player3.dy>0 then
      player3.falling=true
      player3.landed=false
      player3.jumping=false
  
      if map_collision(player3,"down",0,map_offset_y,map_offset_x) then
          player3.landed=true
          player3.falling=false
          player3.dy=0
          player3.y-=((player3.y+player3.h+1)%8)-1
      end
      elseif player3.dy<0 then
          player3.jumping=true
          if map_collision(player3,"up",0,map_offset_y,map_offset_x) then
          player3.dy=0
      end
  
    end
    if player3.x<map_start then
      player3.x=map_start
    end
    if player3.x>map_end-player3.w then
        player3.x=map_end-player3.w
    end
  
    --left right
    if player3.dx<0 then
  
      if map_collision(player3,"left",0,map_offset_y,map_offset_x) then
          player3.dx=0
      end
      elseif player3.dx>0 then
  
      if map_collision(player3,"right",0,map_offset_y,map_offset_x) then
          player3.dx=0
      end
    end
  
    --animation player2

    walking_animationp3()

    player3.x+=player3.dx
    player3.y+=player3.dy
    
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

    elseif storymovep1 then
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

    elseif storymovep2 then
        local num_frames = 6.9  -- Total frames in the animation
        if player2.spz < num_frames then
            player2.spz = player2.spz + 0.1
        else
            player2.spz = 1
        end
        player2.frames = {40,42,8,44,46,8}
    elseif (knock>=1 and knock<=4 and part=="3b") or (knock2>=1 and knock2<=4 and part=="3c") then
              -- Standing still
              local num_frames = 1.9  -- Total frames in the animation
              if player2.spz < num_frames then
                  player2.spz = player2.spz + 0.05
              else
                  player2.spz = 1
              end
              player2.frames = {6} -- Idle frame
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

function walking_animationp3()
    if storymovep3 then
        local num_frames = 2.9  -- Total frames in the animation
        if player3.spz < num_frames then
            player3.spz = player3.spz + 0.05
        else
            player3.spz = 1
        end
        player3.frames = {4,12}
    else
        local num_frames = 2.9  -- Total frames in the animation
        if player3.spz < num_frames then
            player3.spz = player3.spz + 0.05
        else
            player3.spz = 1
        end
        player3.frames = {4,14} -- Idle frame
    end

end
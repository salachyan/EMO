function _update()
  storylinetext()
  
  climax()

  if reading or question then
  else
      player1_update()
      player2_update()
  end
  update_camera()
  x=camera_x
  y=camera_y+12
  if meet_percy then
    y=camera_y+4
  end

end

local camera_panned = false

  function update_camera()
    --midpoint between player1 and player2
    local target_x = (player1.x + player2.x) / 2 - 64  -- offset to keep midpoint centered horizontally
    local target_y = (player1.y + player2.y) / 2 - 64  -- offset for vertical centering

    --move the camera toward the target position
    local vertical_offset = 32  
    target_y -= vertical_offset

    -- if player1.x >= (75 - 60) * 8 and player1.y <= 7 * 8 and player2.x >= (75 - 60) * 8 and player2.y <= 7 * 8 then
    --   target_x += 32  -- pan more to the right
    -- end

    -- Check if both players have surpassed the area to pan the camera further to the right
    if panned_threshold == nil and player1.x >= (75 - 60) * 8 and player1.y <= 7 * 8 and player2.x >= (75 - 60) * 8 and player2.y <= 7 * 8 then
      -- Pan the camera further to the right
      target_x += 38
      -- Set the threshold to prevent moving the camera back
      panned_threshold = target_x
      meet_percy=true
    end

    -- Prevent camera from moving back past the panned threshold
    if panned_threshold ~= nil and target_x < panned_threshold then
        target_x = panned_threshold
    end
  
    -- Smoothly move the camera toward the target position
    camera_x += (target_x - camera_x) * easing
    camera_y += (target_y - camera_y) * easing
  
    --set camera within map boundaries
    camera_x = mid(map_start, camera_x, map_end - 128)
    camera_y = mid(0, camera_y, 512-128)
  
    camera(camera_x, camera_y)
  end
  
  function player1_update()
    player1.dy+=gravity

    climbing_ability=false

    if player1.x>=((62-60)*8)-4 and player1.x<=(63-60)*8 and player1.y<=32*8 and player1.y>=12.5*8 then
        climbing_ability = true
    end

    if climbing_ability then
        if btn(❎, 0) then
          player1.y -= 0.8 
          player1.dy = 0 -- Prevent gravity from pulling the player down while climbing
          player1.landed = false 
        end
    end

    
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
      if not climbing_ability then
      -- jump
      if btn(❎, 0) and player1.landed then
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
  
    if player1.spz<4.9 then
      player1.spz = player1.spz + .08
    else
      player1.spz = 1
    end
  
    --limit players to map
    if player1.x<map_start then
      player1.x=map_start
    end
    if player1.x>map_end-player1.w then
        player1.x=map_end-player1.w
    end

    -- Prevent moving past the camera bounds
    if player1.x < camera_x then
      player1.x = camera_x
    elseif player1.x > camera_x + 128 - player1.w then
        player1.x = camera_x + 128 - player1.w
    end

    player1.x+=player1.dx
    player1.y+=player1.dy
  end
  
  function player2_update()
    player2.dy+=gravity

    climbing_ability2 = false
    if player2.x>=((62-60)*8)-4 and player2.x<=(63-60)*8 and player2.y<=32*8 and player2.y>=12.5*8 then
      climbing_ability2 = true
  end
  
  if climbing_ability2 then
      if btn(🅾️, 0) then
      -- if btn(❎, 1) then
        player2.y -= 0.8 
        player2.dy = 0 -- Prevent gravity from pulling the player down while climbing
        player2.landed = false 
      end
  end

    --left
    if btn(⬆️, 0) then
    -- if btn(⬅️, 1) then
      player2.dx = -player2.speed
      player2.flip = true 
      player2.running=true
      player2.flp=true
  
    -- right
  elseif btn(⬇️, 0) then
-- elseif btn(➡️, 1) then
      player2.dx = player2.speed
      player2.flip = false 
      player2.running=true
      player2.flp=false
    else
      player2.dx=0
      player2.sprite_id = player2.anim_frames[0]
    end
  
    -- jump
    if not climbing_ability2 then
    if btn(🅾️, 0) and player2.landed then
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
    if player2.spz<4.9 then
      player2.spz = player2.spz + .05
    else
      player2.spz = 1
    end

    -- Prevent moving past the camera bounds
    if player2.x < camera_x then
      player2.x = camera_x
    elseif player2.x > camera_x + 128 - player2.w then
        player2.x = camera_x + 128 - player2.w
    end
    
    player2.x+=player2.dx
    player2.y+=player2.dy
  end
  
  function update_camera()
    --midpoint between player1 and player2
    local target_x = (player1.x + player2.x) / 2 - 64  -- offset to keep midpoint centered horizontally
    local target_y = (player1.y + player2.y) / 2 - 64  -- offset for vertical centering

    --move the camera toward the target position
    local vertical_offset = 32  
    target_y -= vertical_offset
  
    -- Smoothly move the camera toward the target position
    camera_x += (target_x - camera_x) * easing
    camera_y += (target_y - camera_y) * easing
  
    --set camera within map boundaries
    camera_x = mid(map_start, camera_x, map_end - 128)
    camera_y = mid(0, camera_y, 512-128)
  
    camera(camera_x, camera_y)
  end
  
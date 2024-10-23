function _update()
  map_offset_y=19
  map_offset_x=0
  player1_update()
  player2_update()
  collisions_for_switch1()
  collisions_for_switch2()
  update_camera(player1)
  update_camera(player2)
  update_map_level1_to_level2()
  local lx1=player1.x --last x pos
	local ly1=player1.y --last y pos
end

function player1_update()
  player1.dy+=gravity
  -- move left
  if btn(⬅️) then
    player1.dx = -player1.speed
    player1.flip = true -- flip sprite to face left
    player1.running=true
    player1.flp=true
    -- animate_player1_walking()
  -- move right
  elseif btn(➡️) then
    player1.dx = player1.speed
    player1.flip = false -- face sprite to the right
    player1.running=true
    player1.flp=false
    -- animate_player1_walking()
  else
    player1.dx=0
    player1.sprite_id = player1.anim_frames[0]
  end

  -- jump
  if btn(❎) and player1.landed then
    player1.dy-=player1.speed
    player1.landed=false
  end

  -- this map collision functionalities are from https://nerdyteachers.com/Explain/Platformer/
  --check collision up and down
  if player1.dy>0 then
    player1.falling=true
    player1.landed=false
    player1.jumping=false

    --   player1.dy=limit_speed(player1.dy,player1.max_dy)

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

  --check collision left and right
  if player1.dx<0 then

  --   player1.dx=limit_speed(player1.dx,player1.max_dx)

    if map_collision(player1,"left",1,map_offset_y,map_offset_x) then
        player1.dx=0
    end
    elseif player1.dx>0 then

    --   player1.dx=limit_speed(player1.dx,player1.max_dx)

    if map_collision(player1,"right",1,map_offset_y,map_offset_x) then
        player1.dx=0
    end
  end

  if player1.spz<4.9 then
    player1.spz = player1.spz + .08
  else
    player1.spz = 1
  end

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
  -- move left
  if btn(⬆️) then
    player2.dx = -player2.speed
    player2.flip = true -- flip sprite to face left
    player2.running=true
    player2.flp=true
    -- animate_player2_walking()
  -- move right
  elseif btn(⬇️) then
    player2.dx = player2.speed
    player2.flip = false -- face sprite to the right
    player2.running=true
    player2.flp=false
    -- animate_player2_walking()
  else
    player2.dx=0
    player2.sprite_id = player2.anim_frames[0]
  end

  -- jump
  if btn(🅾️) and player2.landed then
    player2.dy-=player2.speed
    player2.landed=false
  end

  -- this map collision functionalities are from https://nerdyteachers.com/Explain/Platformer/
  --check collision up and down
  if player2.dy>0 then
    player2.falling=true
    player2.landed=false
    player2.jumping=false

    --   player2.dy=limit_speed(player2.dy,player2.max_dy)

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

    if player2.x<map_start then
      player2.x=map_start
    end
    if player2.x>map_end-player2.w then
        player2.x=map_end-player2.w
    end
  end

  --check collision left and right
  if player2.dx<0 then

  --   player2.dx=limit_speed(player2.dx,player2.max_dx)

    if map_collision(player2,"left",1,map_offset_y,map_offset_x) then
        player2.dx=0
    end
    elseif player2.dx>0 then

    --   player2.dx=limit_speed(player2.dx,player2.max_dx)

    if map_collision(player2,"right",1,map_offset_y,map_offset_x) then
        player2.dx=0
    end
  end

  --update animation with player2
  if player2.spz<4.9 then
    player2.spz = player2.spz + .05
  else
    player2.spz = 1
  end

  player2.x+=player2.dx
  player2.y+=player2.dy

  --limit players to map
  if player2.x<map_start then
    player2.x=map_start
  end
  if player2.x>map_end-player2.w then
      player2.x=map_end-player2.w
  end
end

function collisions_for_switch1()
  -- switch_toggle1 = switch1.flip == true and check_collision(player1, switch1)

  -- switch1_collision_count = 0
  -- -- Increment switch1_collision if collision occurs
  -- if check_collision(player1, switch1) then
  --   switch1_collision_count = switch1_collision_count + 1
  -- end
  -- -- Toggle switch based on odd/even check
  -- if (switch1_collision_count % 2 == 1) then -- Odd number
  --  switch1.flip = true
  -- end
  -- if (switch1_collision_count % 2 == 0) then -- Even number
  --  switch1.flip = false
  -- end
  if check_collision(player1, switch1) then
    switch1.flip = true
  end
end

function collisions_for_switch2()
  -- switch_toggle2 = switch2.flip == true and check_collision(player2, switch2)

  -- switch2_collision_count = 0
  -- -- Increment switch2_collision if collision occurs
  -- if check_collision(player2, switch2) then
  --   switch2_collision_count = switch2_collision_count + 1
  -- end
  -- -- Toggle switch based on odd/even check
  -- if (switch2_collision_count % 2 == 1) then -- Odd number
  -- switch2.flip = true
  -- end
  -- if (switch2_collision_count % 2 == 0) then -- Even number
  -- switch2.flip = false
  -- end

  if check_collision(player2, switch2) then
    switch2.flip = true
  end
end

function update_map_level1_to_level2()
  if switch1.flip==true and switch2.flip==true then
    if map_offset_x<12 then
      map_offset_x+=1
    end
    -- -- player1.x=2
    -- player1.y=10*8
    -- -- player2.x=14
    -- player2.y=10*8
  end
end

-- function animate_player1_walking()
--   player1.anim_timer += player1.anim_speed
--   if player1.anim_timer >= 1 then
--     player1.anim_timer = 0
--     player1.sp = (player1.sp + 1) % #player1.anim_frames_walking
--   end
-- end

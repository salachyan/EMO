function _update()
  -- Reset player horizontal movement speed
  player1.dx = 0
  player2.dx = 0

  platform1.dx = 0
  platform2.dx = 0
  platform3.dx = 0
  platform4.dx = 0
  platform5.dx = 0

  local lx1=player1.x --last x pos
	local ly1=player1.y --last y pos
  local lx2=player2.x --last x pos
	local ly2=player2.y --last y pos

  local lxb=box.x --last x pos
	local lyb=box.y --last y pos
  
  if player1.spz<4.9 then
    player1.spz = player1.spz + .08
  else
    player1.spz = 1
  end

  --update animation with player2
  if player2.spz<4.9 then
    player2.spz = player2.spz + .05
  else
    player2.spz = 1
  end
  
  player1.dy+=gravity
  player1.dx*=friction
  
  player2.dy+=gravity
  player2.dx*=friction
  --cam_x=player.x-64+(player.w/2)
	--	local lx=0.x --last x pos
		--local ly=0.y --last y pos

  -- p1 move left
  if btn(⬅️) then
    player1.dx = -player1.speed
    player1.flip = true -- flip sprite to face left
    player1.is_on_side=false
    player1.running=true
  end

  -- move right
  if btn(➡️) then
    player1.dx = player1.speed
    player1.flip = false -- face sprite to the right
    player1.is_on_side=false
    player1.running=true
  end
  
  -- p2 move left
  if btn(⬆️) then
    player2.dx = -player2.speed
    player2.flip = true -- flip sprite to face left
    player2.is_on_side=false
  end

  -- move right
  if btn(⬇️) then
    player2.dx = player2.speed
    player2.flip = false -- face sprite to the right
    player2.is_on_side=false
  end
 
 	--player 1 jump press x
 	if btn(❎) then
    player1.y -= player1.speed
    --player1.landed=false
    player1.is_on_ground = false
    player1.is_on_bottom_ground = false
  end
  
  --player 2 jump press c
  if btn(🅾️) then 
    player2.y -= player2.speed
    --player2.landed=false
    player2.is_on_ground = false
    player2.is_on_bottom_ground = false
  end

  local is_colliding_with_ground_player1 = collide_16x16sprite(player1)

  -- check for ground collision (using flag 0) for a 16x16 region
  if collide_8x8sprite(box) then
    box.x = 64
  end

  -- check for ground collision from underneath (using flag 0) for a 16x16 region
  if is_colliding_with_ground(player1.x, player1.y) then
    player1.y = ly1
    player1.x = lx1
    player1.is_on_ground = true
    -- player1.y = flr(player1.y / 8) * 8 --help with clipping to go back on ground tile
  else --no collision
    player1.is_on_ground = false
  end
  if is_colliding_with_ground(player2.x, player2.y) then
    player2.y = ly2
    player2.x = lx2
    player2.is_on_ground = true
    -- player1.y = flr(player1.y / 8) * 8 --help with clipping to go back on ground tile
  else --no collision
    player2.is_on_ground = false
  end

  -- check for ground collision from top and side to side (using flag 0) for a 16x16 region
  if is_colliding_with_ground(player1.x, player1.y + player1.h) then
    player1.dy = 0
    player1.is_on_ground = true
    player1.y = flr(player1.y / 8) * 8 --help with clipping to go back on ground tile
  else --no collision
    player1.is_on_ground = false
  end
  if is_colliding_with_ground(player2.x, player2.y + player2.h) then
    player2.dy = 0
    -- player2.y=ly2
    player2.is_on_ground = true
    player2.y = flr(player2.y / 8) * 8 --help with clipping to go back on ground tile
  else
    player2.is_on_ground = false
  end

  -- Check for side collisions
  local side_collision_player1 = is_colliding_with_side(player1, is_on_side)
  local side_colliding_with_side_box = is_colliding_with_side_box(box, is_on_side)

  if side_collision_player1 == "left" and player1.dx < 0 then
    player1.dx = 0 -- Stop left movement only if moving left
    player1.is_on_side = true
  elseif side_collision_player1 == "right" and player1.dx > 0 then
    player1.dx = 0 -- Stop right movement only if moving right
    player1.is_on_side = true
  else
    player1.is_on_side=false
  end

  local side_collision_player2 = is_colliding_with_side(player2, is_on_side)

  if side_collision_player2 == "left" and player2.dx < 0 then
    player2.dx = 0 -- Stop left movement only if moving left
  elseif side_collision_player2 == "right" and player2.dx > 0 then
    player2.dx = 0 -- Stop right movement only if moving right
  end

  -- Check for collisions with the box for player1
  if check_collision(player1, box) and player1.is_on_ground==true then
    -- Move player1 back based on the direction they are moving
    if player1.dx > 0 and (box.x > player1.x) then
      player1.x = box.x - player1.w * 8  -- Push player to the left
      box.x = box.x + player1.dx
    elseif player1.dx < 0 and (box.x < player1.x) then
      player1.x = box.x + box.w * 8  -- Push player to the right
      box.x = box.x + player1.dx
    end
  end

  -- Check for collisions with the box for player2
  if check_collision(player2, box) and player2.is_on_ground == true then
    -- Move player2 back based on the direction they are moving
    if player2.dx > 0 and (box.x > player2.x) then
      player2.x = box.x - player2.w * 8  -- Push player to the left
      box.x = box.x + player2.dx
    elseif player2.dx < 0 and (box.x < player2.x) then
      player2.x = box.x + box.w * 8  -- Push player to the right
      box.x = box.x + player2.dx
    end
  end

  -- Allow players to jump on top of the box
  if is_colliding_with_box(player1, box) then
    -- Check if the player is falling onto the box
    if player1.y + player1.h <= box.y + box.h * 8 and player1.dy > 0 then
      player1.y = box.y - player1.h * 8  -- Position player on top of the box
      player1.dy = 0  -- Reset vertical speed
      player1.is_on_ground = true -- Update grounded state
    end
  end

  if is_colliding_with_box(player2, box) then
    -- Check if the player is falling onto the box
    if player2.y + player2.h <= box.y + box.h * 8 and player2.dy > 0 then
      player2.y = box.y - player2.h * 8  -- Position player on top of the box
      player2.dy = 0  -- Reset vertical speed
      player2.is_on_ground = true -- Update grounded state
    end
  end

  -- Check for player1 and player2 collision with the switch1
  switch_toggle1 = switch1.flip == true and (check_collision(player1, switch1) or check_collision(player2, switch1))

    switch1_collision_count = 0

    -- Increment switch1_collision if collision occurs
    if (check_collision(player1, switch1) or check_collision(player2, switch1)) then
      switch1_collision_count = switch1_collision_count + 1
    end

    -- Toggle switch based on odd/even check
    if (switch1_collision_count % 2 == 1) then -- Odd number
        switch1.flip = true
    end

    -- if (switch1_collision_count % 2 == 0) then -- Even number
    --     switch1.flip = false
    -- end

  if (check_collision(player1, switch1) or check_collision(player2, switch1)) and platform6.y<95 then
    platform1.y += 1
    platform2.y += 1
    platform3.y += 1
    platform4.y += 1
    platform5.y += 1
    platform6.y += 1
    switch2.y +=1
    platform_mover.y += 1
  end

  if check_collision(player1, switch2) or check_collision(player2, switch2) then
    switch2.flip = false
  end

  if (check_collision(player1, switch2) or check_collision(player2, switch2)) and platform1.y>72 then
    platform1.y -= 1
    platform2.y -= 1
    platform3.y -= 1
    platform4.y -= 1
    platform5.y -= 1
    platform6.y -= 1
    switch2.y -=1
    platform_mover.y -= 1
  end

  -- Check for player1 and player2 collision with the platform
  if check_collision(player1, platform1) then
    if player1.y + player1.h <= platform1.y + platform1.h * 8 and player1.dy > 0 then
      player1.y = platform1.y - player1.h * 8  -- Position player on top of the platform1
      player1.dy = 0  -- Reset vertical speed
      player1.is_on_ground = true -- Update grounded state
    end
  end
  if check_collision(player1, platform2) then
    if player1.y + player1.h <= platform2.y + platform2.h * 8 and player1.dy > 0 then
      player1.y = platform2.y - player1.h * 8  -- Position player on top of the platform2
      player1.dy = 0  -- Reset vertical speed
      player1.is_on_ground = true -- Update grounded state
    end
  end
  if check_collision(player1, platform3) then
    if player1.y + player1.h <= platform3.y + platform3.h * 8 and player1.dy > 0 then
      player1.y = platform3.y - player1.h * 8  -- Position player on top of the platform3
      player1.dy = 0  -- Reset vertical speed
      player1.is_on_ground = true -- Update grounded state
    end
  end
  if check_collision(player1, platform4) then
    if player1.y + player1.h <= platform4.y + platform4.h * 8 and player1.dy > 0 then
      player1.y = platform4.y - player1.h * 8  -- Position player on top of the platform4
      player1.dy = 0  -- Reset vertical speed
      player1.is_on_ground = true -- Update grounded state
    end
  end
  if check_collision(player1, platform5) then
    if player1.y + player1.h <= platform5.y + platform5.h * 8 and player1.dy > 0 then
      player1.y = platform5.y - player1.h * 8  -- Position player on top of the platform5
      player1.dy = 0  -- Reset vertical speed
      player1.is_on_ground = true -- Update grounded state
    end
  end

  --platform collision for player2
  if check_collision(player2, platform1) then
    if player2.y + player2.h <= platform1.y + platform1.h * 8 and player2.dy > 0 then
      player2.y = platform1.y - player2.h * 8  -- Position player on top of the platform1
      player2.dy = 0  -- Reset vertical speed
      player2.is_on_ground = true -- Update grounded state
    end
    if player2.y + player2.h >= box.y and player2.y + player2.h < box.y + box.h * 8 and player2.dy < 0 then
      player2.y = box.y + box.h * 8  -- Position player just above the box
      player2.dy = 0  -- Reset vertical speed
      -- Optional: you may want to update is_on_ground here as needed
    end
  end
  if check_collision(player2, platform2) then
    if player2.y + player2.h <= platform2.y + platform2.h * 8 and player2.dy > 0 then
      player2.y = platform2.y - player2.h * 8  -- Position player on top of the platform2
      player2.dy = 0  -- Reset vertical speed
      player2.is_on_ground = true -- Update grounded state
    end
  end
  if check_collision(player2, platform3) then
    if player2.y + player2.h <= platform3.y + platform3.h * 8 and player2.dy > 0 then
      player2.y = platform3.y - player2.h * 8  -- Position player on top of the platform3
      player2.dy = 0  -- Reset vertical speed
      player2.is_on_ground = true -- Update grounded state
    end
  end
  if check_collision(player2, platform4) then
    if player2.y + player2.h <= platform4.y + platform4.h * 8 and player2.dy > 0 then
      player2.y = platform4.y - player2.h * 8  -- Position player on top of the platform4
      player2.dy = 0  -- Reset vertical speed
      player2.is_on_ground = true -- Update grounded state
    end
  end
  if check_collision(player2, platform5) then
    if player2.y + player2.h <= platform5.y + platform5.h * 8 and player2.dy > 0 then
      player2.y = platform5.y - player2.h * 8  -- Position player on top of the platform5
      player2.dy = 0  -- Reset vertical speed
      player2.is_on_ground = true -- Update grounded state
    end
  end

  --check if players are colliding from below platform
  if is_colliding_with_platform_from_below(player2, platform1) or is_colliding_with_platform_from_below(player2, platform2) or is_colliding_with_platform_from_below(player2, platform3) or is_colliding_with_platform_from_below(player2, platform4) or is_colliding_with_platform_from_below(player2, platform5) then
    -- Prevent player from going above the box
    player2.y = ly2
  end
  if is_colliding_with_platform_from_below(player1, platform1) or is_colliding_with_platform_from_below(player1, platform2) or is_colliding_with_platform_from_below(player1, platform3) or is_colliding_with_platform_from_below(player1, platform4) or is_colliding_with_platform_from_below(player1, platform5) then
    -- Prevent player from going above the box
    player1.y = ly1
  end

  -- update player position
  player1.x = player1.x + player1.dx
  player1.y = player1.y + player1.dy
    
  player2.x = player2.x + player2.dx
  player2.y = player2.y + player2.dy
  
  box.x += box.dx

end

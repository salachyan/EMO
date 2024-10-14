function _update()
  -- Reset player horizontal movement speed
  player1.dx = 0
  player2.dx = 0
  
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
    player1.is_colliding_with_side=false
  end

  -- move right
  if btn(➡️) then
    player1.dx = player1.speed
    player1.flip = false -- face sprite to the right
    player1.is_colliding_with_side=false
  end
  
  -- p2 move left
  if btn(⬆️) then
    player2.dx = -player2.speed
    player2.flip = true -- flip sprite to face left
    player2.is_colliding_with_side=false
  end

  -- move right
  if btn(⬇️) then
    player2.dx = player2.speed
    player2.flip = false -- face sprite to the right
    player2.is_colliding_with_side=false
  end
 
 	--player 1 jump press x
 	if btn(❎) then
    player1.y -= player1.speed
    --player1.landed=false
    player1.is_on_ground = false
  end
  
  --player 2 jump press c
  if btn(🅾️) then 
    player2.y -= player2.speed
    --player2.landed=false
    player2.is_on_ground = false
  end

  -- check for ground collision (using flag 0) for a 16x16 region
  if is_colliding_with_ground(player1.x, player1.y + player1.h) then
    player1.dy = 0
    player1.is_on_ground = true
    player1.y = flr(player1.y / 8) * 8 --help with clipping to go back on ground tile
  else --no collision
    player1.is_on_ground = false
  end

  if is_colliding_with_ground(player2.x, player2.y + player2.h) then
    player2.dy = 0
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
  elseif side_collision_player1 == "right" and player1.dx > 0 then
    player1.dx = 0 -- Stop right movement only if moving right
  end

  local side_collision_player2 = is_colliding_with_side(player2, is_on_side)

  if side_collision_player2 == "left" and player2.dx < 0 then
    player2.dx = 0 -- Stop left movement only if moving left
  elseif side_collision_player2 == "right" and player2.dx > 0 then
    player2.dx = 0 -- Stop right movement only if moving right
  end

  -- Check for collisions between the box and the side_sprite
  if box.x > (side_sprite.x-8) then
    box.x = (side_sprite.x-8)
    box.dx=0
  end

  -- Check for collisions with the box for player1
  if check_collision(player1, box) then
    if player1.is_on_ground then
      -- Move player1 back based on the direction they are moving
      if player1.dx > 0 and (box.x > player1.x) then
        player1.x = box.x - player1.w * 8  -- Push player to the left
        box.x = box.x + player1.dx
      elseif player1.dx < 0 and (box.x < player1.x) then
        player1.x = box.x + box.w * 8  -- Push player to the right
        box.x = box.x + player1.dx
      end
    end
  end

  -- Check for collisions with the box for player2
  if check_collision(player2, box) then
    --if player1.is_on_ground then
    -- Move player2 back based on the direction they are moving
      if player2.dx > 0 and (box.x > player2.x) then
        player2.x = box.x - player2.w * 8  -- Push player to the left
        box.x = box.x + player2.dx
      elseif player2.dx < 0 and (box.x < player2.x) then
        player2.x = box.x + box.w * 8  -- Push player to the right
        box.x = box.x + player2.dx
      end
    --end
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


  -- update player position
  player1.x = player1.x + player1.dx
  player1.y = player1.y + player1.dy
    
  player2.x = player2.x + player2.dx
  player2.y = player2.y + player2.dy
  
  box.x += box.dx

end

function _update()
  -- reset player horizontal movement speed
  --player.dx = 0
  --player2.dx = 0
  
  player1.dy+=gravity
  player1.dx*=friction
  
  player2.dy+=gravity
  player2.dx*=friction
  --cam_x=player.x-64+(player.w/2)
	--	local lx=0.x --last x pos
		--local ly=0.y --last y pos

  -- p1 move left
  if btn(⬅️) then
    player1.dx = -player.speed
    player1.flip = true -- flip sprite to face left
  end

  -- move right
  if btn(➡️) then
    player1.dx = player.speed
    player1.flip = false -- face sprite to the right
  end
  
  -- p2 move left
  if btn(⬆️) then
    player2.dx = -player2.speed
    player2.flip = true -- flip sprite to face left
  end

  -- move right
  if btn(⬇️) then
    player2.dx = player2.speed
    player2.flip = false -- face sprite to the right
  end
 
 	--player 1 up press x
 	if btn(❎) then
    player1.y -= player.speed
  end
  
  --player 2 up press c
  if btn(🅾️) then 
    player2.y -= player.speed
  end
 	
 	--if collide(box) then
 		--box.x = lx
 		--box.y = ly
 	--end
 	

  -- apply gravity
 -- player.dy = player.dy + player.gravity

  -- check for ground collision (using flag 0) for a 16x16 region
  if is_colliding_with_ground(player.x, player.y + player.h) then
    player1.dy = 0
    player1.is_on_ground = true
  else
    player1.is_on_ground = false
  end

  -- update player position
  player1.x = player1.x + player1.dx
  player1.y = player1.y + player1.dy
  
  player2.x = player2.x + player2.dx
  player2.y = player2.y + player2.dy

		

end
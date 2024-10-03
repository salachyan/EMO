function _update()
  --updating stuff with player1
  if player1.spz<4.9 then
    player1.spz = player1.spz + .1
  else
    player1.spz = 1
  end

    -- reset player horizontal movement speed
    player1.dx = 0
    player2.dx = 0
    --cam_x=player.x-64+(player.w/2)
  
    -- p1 move left
    if btn(⬅️) then
      player1.dx = -player1.speed
      player1.flip = true -- flip sprite to face left
    end
  
    -- move right
    if btn(➡️) then
      player1.dx = player1.speed
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
    
    if btn(❎) then
            player1.y -= 1
          end
        
       if btn(🅾️) then
      player1.y += 1
       end
       
  
    -- apply gravity
   -- player.dy = player.dy + player.gravity
  
    -- check for ground collision (using flag 0) for a 16x16 region
    if is_colliding_with_ground(player1.x, player1.y + player1.h) then
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
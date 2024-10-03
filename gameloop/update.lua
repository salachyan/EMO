function _update()
    -- reset player horizontal movement speed
    player.dx = 0
    player2.dx = 0
    --cam_x=player.x-64+(player.w/2)
  
    -- p1 move left
    if btn(⬅️) then
      player.dx = -player.speed
      player.flip = true -- flip sprite to face left
    end
  
    -- move right
    if btn(➡️) then
      player.dx = player.speed
      player.flip = false -- face sprite to the right
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
            player.y -= 1
          end
        
       if btn(🅾️) then
      player.y += 1
       end
       
  
    -- apply gravity
   -- player.dy = player.dy + player.gravity
  
    -- check for ground collision (using flag 0) for a 16x16 region
    if is_colliding_with_ground(player.x, player.y + player.h) then
      player.dy = 0
      player.is_on_ground = true
    else
      player.is_on_ground = false
    end
  
    -- update player position
    player.x = player.x + player.dx
    player.y = player.y + player.dy
    
    player2.x = player2.x + player2.dx
    player2.y = player2.y + player2.dy
  end
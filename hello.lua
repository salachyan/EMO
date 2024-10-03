-- constants for collision flag
ground_flag = 0  -- the flag we set for the ground (sprite 005)
function _init()
  -- initialize player properties
  player = {
    x = 2,     -- starting x position
    y = 105,     -- starting y position
    sp = 1,     -- top-left corner of the 4x4 sprite (32x32 pixels)
    w = 2,     -- width of the sprite in pixels
    h = 2,     -- height of the sprite in pixels
    dx = 0,     -- horizontal movement speed
    dy = 0,     -- vertical movement speed (for jumping/falling)
    speed = 2,  -- movement speed
--    gravity = 0.3, --  strength
    flip = false, -- direction of the sprite
    is_on_ground = false -- player grounded state
  }
  
  player2 = {
    x = 15,     -- starting x position
    y = 105,     -- starting y position
    sp = 3,     -- top-left corner of the 4x4 sprite (32x32 pixels)
    w = 2,     -- width of the sprite in pixels
    h = 2,     -- height of the sprite in pixels
    dx = 0,     -- horizontal movement speed
    dy = 0,     -- vertical movement speed (for jumping/falling)
    speed = 2,  -- movement speed
   -- gravity = 0.3, --  strength
    flip = false, -- direction of the sprite
    is_on_ground = false -- player grounded state
  }
  
 	box = {
    x = 40,     -- starting x position
    y = 112,     -- starting y position
    sp = 7,     -- top-left corner of the 4x4 sprite (32x32 pixels)
    w = 1,     -- width of the sprite in pixels
    h = 1,     -- height of the sprite in pixels
    --dx = 0,     -- horizontal movement speed
    --dy = 0,     -- vertical movement speed (for jumping/falling)
    --speed = 2,  -- movement speed
   -- gravity = 0.3, --  strength
    flip = false, -- direction of the sprite
    --is_on_ground = false -- player grounded state
  }
  
  --simple camera
  cam_x = 0
  
  map_start = 0
  map_end = 1024
end


-->8
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
 
 	if btn(5) then
    player.y -= 1
 	end
 	
 	--if btn(⬇️) then
    --player.y -= 1
 	--end
 	

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
-->8

function _draw()
  -- clear screen
  cls()

  -- define the size of the map in tiles
  local map_width = 16  -- number of tiles wide you want to draw
  local map_height = 60 -- number of tiles high you want to draw

  -- calculate the y position to draw the map at the bottom-left
  local screen_height = 300
  local map_y = screen_height - (map_height * 8)  -- position it above the bottom

  map(0, 0, 0, 0, map_width, map_height)

  -- draw the player sprite (32x32 pixels = 4 tiles by 4 tiles)
  spr(player.sp, player.x, player.y, player.w, player.h, player.flip)
		spr(player2.sp, player2.x, player2.y, player2.w, player2.h, player2.flip)
		--sspr(0, 0, 16, 16, player.x, player.y, 16, 16)
		--sspr(8, 0, 16, 16, player2.x, player2.y, 8, 8)
		spr(box.sp, box.x, box.y, box.w, box.h, box.flip)

end
-->8
-- function to check if a point collides with ground (sprite 005)
function is_colliding_with_ground(x, y)
  -- convert x and y to tile coordinates for a 16x16 region
  local tile_x1 = flr(x / 16) * 2
  local tile_y1 = flr(y / 16) * 2

  -- check collision for a 2x2 grid of 8x8 tiles (which forms a 16x16 area)
  for i = 0, 1 do
    for j = 0, 1 do
      local tile_x = tile_x1 + i
      local tile_y = tile_y1 + j
      local tile = mget(tile_x, tile_y)
      -- check if this tile has the ground_flag (for sprite 005)
      if fget(tile, ground_flag) then
        return true  -- ground collision detected
      end
    end
  end
  return false  -- no collision
end

-->8
function update_camera()
    cam_x = player.x - 64  -- assuming 128 is the screen width, adjust as necessary
    if cam_x < map_start then
        cam_x = map_start
    elseif cam_x > map_end - 128 then
        cam_x = map_end - 128
    end
end
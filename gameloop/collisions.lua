function is_colliding_with_ground1(x, y)
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

function is_colliding_with_ground2(x, y)
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
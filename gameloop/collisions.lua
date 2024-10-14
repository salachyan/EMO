function is_colliding_with_ground(x, y)
  -- Convert the player's position into tile coordinates (16x16 grid)
  local tile_x1 = flr(x / 8)  -- top-left corner (convert pixel to tile coordinate)
  local tile_y1 = flr(y / 8)  -- top-left corner
  local tile_x2 = flr((x + 14) / 8)  -- bottom-right corner (character width - 1)
  local tile_y2 = flr((y + 14) / 8)  -- bottom-right corner (character height - 1)

  -- Check the four corners of the 16x16 character
  local top_left = mget(tile_x1, tile_y1)
  local top_right = mget(tile_x2, tile_y1)
  local bottom_left = mget(tile_x1, tile_y2)
  local bottom_right = mget(tile_x2, tile_y2)

  -- Check if any of these tiles have the ground_flag
  if fget(top_left, is_on_ground) or fget(top_right, is_on_ground) or 
     fget(bottom_left, is_on_ground) or fget(bottom_right, is_on_ground) then
    return true  -- Ground collision detected
  end

  return false  -- No collision
end

-- Function to check if player is colliding with a side (left or right) based on flags
function is_colliding_with_side(player, flag)
  -- Convert player's position into tile coordinates (16x16 grid)
  local tile_x1 = flr(player.x / 8)  -- Left side of the player
  local tile_y1 = flr(player.y / 8)  -- Top side
  local tile_x2 = flr((player.x + 15) / 8)  -- Right side of the player
  local tile_y2 = flr((player.y + 15) / 8)  -- Bottom side
  
  -- Check left side collision
  if fget(mget(tile_x1, tile_y1), flag) or fget(mget(tile_x1, tile_y2), flag) then
    return "left"
  end

  -- Check right side collision
  if fget(mget(tile_x2, tile_y1), flag) or fget(mget(tile_x2, tile_y2), flag) then
    return "right"
  end

  return nil  -- No side collision
end

-- Function to check if box is colliding with a side (left or right) based on flags
function is_colliding_with_side_box(box, flag)
  -- Convert box's position into tile coordinates (16x16 grid)
  local tile_x1 = flr(box.x / 8)  -- Left side of the box
  local tile_y1 = flr(box.y / 8)  -- Top side
  local tile_x2 = flr((box.x + 7) / 8)  -- Right side of the box
  local tile_y2 = flr((box.y + 7) / 8)  -- Bottom side
  
  -- Check left side collision
  if fget(mget(tile_x1, tile_y1), flag) or fget(mget(tile_x1, tile_y2), flag) then
    return "left"
  end

  -- Check right side collision
  if fget(mget(tile_x2, tile_y1), flag) or fget(mget(tile_x2, tile_y2), flag) then
    return "right"
  end

  return nil  -- No side collision
end

-- Function to check collision between a player and the box
function check_collision(player, box)
  return player.x < box.x + box.w * 8 and
         player.x + player.w * 8 > box.x and
         player.y < box.y + box.h * 8 and
         player.y + player.h * 8 > box.y
end

-- Function to check if player is colliding with the box from above
function is_colliding_with_box(player, box)
  return player.x < box.x + box.w * 8 and
         player.x + player.w * 8 > box.x and
         player.y + player.h * 8 >= box.y and
         player.y < box.y + box.h * 8
end
function is_colliding_with_ground(x, y)
  -- Convert the player's position into tile coordinates (16x16 grid)
  local x1 = flr((x) / 8)  -- top-left corner (convert pixel to tile coordinate)
  local y1 = flr((y) / 8)  -- top-left corner
  
  local x2= flr((x+7)/8)
  local y2= flr((y+7)/8)

  local x3 = flr((x + 14) / 8)  -- bottom-right corner (character width - 1)
  local y3 = flr((y + 14) / 8)  -- bottom-right corner (character height - 1)
  
  local a=fget(mget(x1,y1),0)
  local b=fget(mget(x1,y2),0)
  local c=fget(mget(x2,y2),0)
  local d=fget(mget(x2,y1),0)

  local e=fget(mget(x3,y3),0)
  local f=fget(mget(x3,y2),0)
  local g=fget(mget(x2,y3),0)
  local h=fget(mget(x3,y1),0)
  local i=fget(mget(x1,y3),0)

  if a or b or c or d or e or f or g or h or i then
    return true
  else
    return false
  end

end

function collide_16x16sprite(o)
  local x1=(o.x)/8
  local y1=(o.y)/8
  local x2=(o.x+7)/8
  local y2=(o.y+7)/8
  
  local x3=(o.x+16)/8
  local y3=(o.y+16)/8


  local a=fget(mget(x1,y1),0)
  local b=fget(mget(x1,y2),0)
  local c=fget(mget(x2,y2),0)
  local d=fget(mget(x2,y1),0)
  
  local e=fget(mget(x3,y3),0)
  local f=fget(mget(x3,y2),0)
  local g=fget(mget(x2,y3),0)
  local h=fget(mget(x3,y1),0)
  local i=fget(mget(x1,y3),0)

  -- if a or d or h then
  --   return "top"
  if e or f or h then
      return "right"
  elseif a or b or i then
      return "left"
  -- elseif e or g or i then
  --     return "bottom"
  end
  return nil
end

function collide_8x8sprite(o)
  local x1=o.x/8
  local y1=o.y/8
  local x2=(o.x+7)/8
  local y2=(o.y+7)/8


  local a=fget(mget(x1,y1),0)
  local b=fget(mget(x1,y2),0)
  local c=fget(mget(x2,y2),0)
  local d=fget(mget(x2,y1),0)


  if a or b or c or d then
    return true
  else
    return false
  end
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

-- Function to check if object is colliding with a side (left or right) based on flags
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

-- Function to check if player is colliding with the platform from below
function is_colliding_with_platform_from_below(player, platform)
  return player.x < platform.x + platform.w * 8 and
         player.x + player.w * 8 > platform.x and
         player.y <= platform.y + platform.h * 8 and
         player.y + player.h * 8 > platform.y                           -- Ensure the player is moving upward
end
 
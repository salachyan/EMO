function map_collision(obj,aim,flag,map_offset_y,map_offset_x)

  -- if object == nil then
  --   return false
  -- end
  --obj = table needs x,y,w,h
  --aim = left,right,up,down
 
  local x=obj.x  local y=obj.y
  local w=obj.w  local h=obj.h
 
  local x1=0	 local y1=0
  local x2=0  local y2=0
 
  if aim=="left" then
    x1=x-1  y1=y
    x2=x    y2=y+h-1
 
  elseif aim=="right" then
    x1=x+w-1    y1=y
    x2=x+w  y2=y+h-1
 
  elseif aim=="up" then
    x1=x+2    y1=y-1
    x2=x+w-3  y2=y
 
  elseif aim=="down" then
    x1=x+2      y1=y+h
    x2=x+w-3    y2=y+h
  end
 
  --pixels to tiles
  x1/=8    y1/=8
  x2/=8    y2/=8
 
  --map_offsets
  x1 += map_offset_x
  x2 += map_offset_x
  y1 += map_offset_y
  y2 += map_offset_y
 
  if fget(mget(x1,y1), flag)
  or fget(mget(x1,y2), flag)
  or fget(mget(x2,y1), flag)
  or fget(mget(x2,y2), flag) then
    return true
  else
    return false
  end
 
 end

function check_collision(player, object)
  return player.x < object.x + object.w and
         player.x + player.w > object.x and
         player.y < object.y + object.h and
         player.y + player.h > object.y
end

 -- Function to check if player is colliding with the box from above
function is_colliding_with_box(player, box)
  return player.x < box.x + box.w * 8 and
         player.x + player.sprite_w * 8 > box.x and
         player.y + player.sprite_h * 8 >= box.y and
         player.y < box.y + box.h * 8
end

-- -- Function to check if player is colliding with the platform from below
-- function is_colliding_with_platform_from_below(player, platform)
--   return player.x < platform.x + platform.w * 8 and
--          player.x + player.sprite_w * 8 > platform.x and
--          player.y <= platform.y + platform.h * 8 and
--          player.y + player.sprite_h * 8 > platform.y                           -- Ensure the player is moving upward
-- end


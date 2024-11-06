function map_collision(obj,aim,flag,map_offset_y,map_offset_x)

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

function check_collision(player1, player2)
  if player1.x < player2.x + player2.w and
  player1.x + player1.w > player2.x and
  player1.y < player2.y + player2.h and
  player1.y + player1.h > player2.y then
  return true
  else
    return false
  end
end

function check_collision1(player1, player2)
  if player1.x < player2.x-7 + player2.w-7 and
  player1.x-7 + player1.w-7 > player2.x-7 and
  player1.y < player2.y + player2.h and
  player1.y + player1.h > player2.y then
  return true
  else
    return false
  end
end

function check_collision2(player1, player2)
  if player1.x-5 < player2.x-5 + player2.w-5 and
  player1.x-5 + player1.w-5 > player2.x-5 and
  player1.y < player2.y + player2.h and
  player1.y + player1.h > player2.y then
  return true
  else
    return false
  end
end



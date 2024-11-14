function _draw()
    cls()
    if level=="1a" or level=="1b" then
      map(map_offset_x, map_offset_y, 0, 0, 32, 32)
    elseif level=="2a" or level=="2b" then
      map(map_offset_x1, map_offset_y1, 0, 0, 32, 32)
    elseif level=="3a" or level=="3b" then
      map(map_offset_x2, map_offset_y2, 0, 0, 32, 32)
    end  
    level_num()
    spr(player1.frames[flr(player1.spz)], player1.x, player1.y, 2, 2, player1.flp)
    spr(player2.frames[flr(player2.spz)], player2.x, player2.y, 2, 2, player2.flip)
   
    if level == "1a" then
      spr(switch1.sp, switch1.x, switch1.y, 1, 1, switch1.flip)
      spr(switch2.sp, switch2.x, switch2.y, 1, 1, switch2.flip)

    elseif level == "1b" then
      spr(switch3.sp, switch3.x, switch3.y, 1, 1, switch3.flip)
      spr(switch4.sp, switch4.x, switch4.y, 1, 1, switch4.flip)
      spr(seesaw_bottom1.sp, seesaw_bottom1.x, seesaw_bottom1.y, 1, 1, seesaw_bottom1.flip)
      spr(seesaw_arch1.sp, seesaw_arch1.x, seesaw_arch1.y, 1, 1, seesaw_arch1.flip)
      spr(seesaw_arch2.sp, seesaw_arch2.x, seesaw_arch2.y, 1, 1, seesaw_arch2.flip)
      spr(seesaw_top1.sp, seesaw_top1.x, seesaw_top1.y, 1, 1, seesaw_top1.flip)
      spr(box2.sp, box2.x, box2.y, 1, 1, box2.flip)
      
    end

    -- print("1: "..tostring(player1.speed), 5, 30, 14)
    -- print("2: "..tostring(player1.speed), 5, 40, 14)
    
    
  end

function level_num()
  if level == "1a" or level == "1b" then
   print("level 1",50,2,14)
  --  level1_story()
  elseif level == "2a" or level=="2b" then
    print("level 2",50,2,14)
  elseif level == "3a" or level == "3b" then
    print("level 3",50,2,14)
  end
end


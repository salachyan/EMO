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

    elseif level == "2a" then
      spr(switch1_2.sp, switch1_2.x, switch1_2.y, 1, 1, switch1_2.flip)
      spr(switch2_2.sp, switch2_2.x, switch2_2.y, 1, 1, switch2_2.flip)
      spr(switch3_2.sp, switch3_2.x, switch3_2.y, 1, 1, switch3_2.flip)
      spr(switch4_2.sp, switch4_2.x, switch4_2.y, 1, 1, switch4_2.flip)
      spr(box1.sp, box1.x, box1.y, 1, 1, box1.flip)
      spr(platform1.sp, platform1.x, platform1.y, 1, 1)
      spr(platform2.sp, platform2.x, platform2.y, 1, 1)
      spr(platform3.sp, platform3.x, platform3.y, 1, 1)
      spr(platform4.sp, platform4.x, platform4.y, 1, 1)
      spr(platform5.sp, platform5.x, platform5.y, 1, 1)
      -- spr(platform6.sp, platform6.x, platform6.y, 1, 1)
      spr(platform_mover.sp, platform_mover.x, platform_mover.y, 1, 1)
      spr(wall_level2.sp, wall_level2.x, wall_level2.y, 1, 1)
      spr(wall_player2.sp, wall_player2.x, wall_player2.y, 1, 1)
    elseif level == "2b" then
      spr(switch1_2b.sp, switch1_2b.x, switch1_2b.y, 1, 1, switch1_2b.flip)
      spr(switch2_2b.sp, switch2_2b.x, switch2_2b.y, 1, 1, switch2_2b.flip)
    elseif level == "3a" then
      spr(switch1_3.sp, switch1_3.x, switch1_3.y, 1, 1, switch1_3.flip)
      spr(switch2_3.sp, switch2_3.x, switch2_3.y, 1, 1, switch2_3.flip)
      spr(switch3_3.sp, switch3_3.x, switch3_3.y, 1, 1, switch3_3.flip)
      spr(switch4_3.sp, switch4_3.x, switch4_3.y, 1, 1, switch4_3.flip)

      spr(platform1_3.sp, platform1_3.x, platform1_3.y, 1, 1)
      spr(platform2_3.sp, platform2_3.x, platform2_3.y, 1, 1)
      spr(platform3_3.sp, platform3_3.x, platform3_3.y, 1, 1)
      spr(platform4_3.sp, platform4_3.x, platform4_3.y, 1, 1)

      spr(platform_mover_3.sp, platform_mover_3.x, platform_mover_3.y, 1, 1)

      spr(wall_player2_3.sp, wall_player2_3.x, wall_player2_3.y, 1, 1)
      spr(wall_level3.sp, wall_level3.x, wall_level3.y, 1, 1)
      spr(box5_3.sp, box5_3.x, box5_3.y, 1, 1, box5_3.flip)
      
      spr(floor1_3.sp, floor1_3.x, floor1_3.y, 1, 1)
      spr(floor2_3.sp, floor2_3.x, floor2_3.y, 1, 1)
      spr(floor3_3.sp, floor3_3.x, floor3_3.y, 1, 1)
      spr(floor4_3.sp, floor4_3.x, floor4_3.y, 1, 1)
      spr(floor5_3.sp, floor5_3.x, floor5_3.y, 1, 1)

    elseif level == "3b" then
      spr(switch1_3b.sp, switch1_3b.x, switch1_3b.y, 1, 1, switch1_3b.flip)
      spr(switch2_3b.sp, switch2_3b.x, switch2_3b.y, 1, 1, switch2_3b.flip)
      spr(switch3_3b.sp, switch3_3b.x, switch3_3b.y, 1, 1, switch3_3b.flip)
      spr(switch4_3b.sp, switch4_3b.x, switch4_3b.y, 1, 1, switch4_3b.flip)
      spr(switch5_3b.sp, switch5_3b.x, switch5_3b.y, 1, 1, switch5_3b.flip)
      spr(switch6_3b.sp, switch6_3b.x, switch6_3b.y, 1, 1, switch6_3b.flip)

      spr(box1_3.sp, box1_3.x, box1_3.y, 1, 1, box1_3.flip)
      spr(box2_3.sp, box2_3.x, box2_3.y, 1, 1, box2_3.flip)
      spr(box3_3.sp, box3_3.x, box3_3.y, 1, 1, box3_3.flip)
      spr(box4_3.sp, box4_3.x, box4_3.y, 1, 1, box4_3.flip)
      
    end

    -- print("1: "..tostring(player1.x), 5, 30, 14)
    -- print("2: "..tostring(player1.y), 5, 40, 14)
    
    
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


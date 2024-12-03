function _draw()
    cls()
    map(map_offset_x, map_offset_y, 0, 0, 32, 64)  
    print("level 2",50,2,14)
    spr(player1.frames[flr(player1.spz)], player1.x, player1.y, 2, 2, player1.flp)
    spr(player2.frames[flr(player2.spz)], player2.x, player2.y, 2, 2, player2.flip)

    if level == "2a" then
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
    end

    -- print("x: "..tostring(map_offset_x), 5, 30, 14)
    -- print("y: "..tostring(map_offset_y), 5, 40, 14)
  
  end


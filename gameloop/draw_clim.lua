function _draw()
    cls()
    map(map_offset_x, map_offset_y, 0, 0, 32, 32)
    print("climax",50,2,14)
    spr(player1.frames[flr(player1.spz)], player1.x, player1.y, 2, 2, player1.flp)
    spr(player2.frames[flr(player2.spz)], player2.x, player2.y, 2, 2, player2.flip)

    if level == "3a" then
    --   spr(switch1_3.sp, switch1_3.x, switch1_3.y, 1, 1, switch1_3.flip)
    --   spr(switch2_3.sp, switch2_3.x, switch2_3.y, 1, 1, switch2_3.flip)
    --   spr(switch3_3.sp, switch3_3.x, switch3_3.y, 1, 1, switch3_3.flip)
    --   spr(switch4_3.sp, switch4_3.x, switch4_3.y, 1, 1, switch4_3.flip)

    --   spr(platform1_3.sp, platform1_3.x, platform1_3.y, 1, 1)
    --   spr(platform2_3.sp, platform2_3.x, platform2_3.y, 1, 1)
    --   spr(platform3_3.sp, platform3_3.x, platform3_3.y, 1, 1)
    --   spr(platform4_3.sp, platform4_3.x, platform4_3.y, 1, 1)

    --   spr(platform_mover_3.sp, platform_mover_3.x, platform_mover_3.y, 1, 1)

    --   spr(wall_player2_3.sp, wall_player2_3.x, wall_player2_3.y, 1, 1)
    --   spr(wall_level3.sp, wall_level3.x, wall_level3.y, 1, 1)
    --   spr(box5_3.sp, box5_3.x, box5_3.y, 1, 1, box5_3.flip)
      
    --   spr(floor1_3.sp, floor1_3.x, floor1_3.y, 1, 1)
    --   spr(floor2_3.sp, floor2_3.x, floor2_3.y, 1, 1)
    --   spr(floor3_3.sp, floor3_3.x, floor3_3.y, 1, 1)
    --   spr(floor4_3.sp, floor4_3.x, floor4_3.y, 1, 1)
    --   spr(floor5_3.sp, floor5_3.x, floor5_3.y, 1, 1)

    elseif level == "3b" then
    --   spr(switch1_3b.sp, switch1_3b.x, switch1_3b.y, 1, 1, switch1_3b.flip)
    --   -- spr(switch2_3b.sp, switch2_3b.x, switch2_3b.y, 1, 1, switch2_3b.flip)
    --   spr(switch3_3b.sp, switch3_3b.x, switch3_3b.y, 1, 1, switch3_3b.flip)
    --   spr(switch4_3b.sp, switch4_3b.x, switch4_3b.y, 1, 1, switch4_3b.flip)
    --   spr(switch5_3b.sp, switch5_3b.x, switch5_3b.y, 1, 1, switch5_3b.flip)
    --   spr(switch6_3b.sp, switch6_3b.x, switch6_3b.y, 1, 1, switch6_3b.flip)

    --   spr(platform1_3b.sp, platform1_3b.x, platform1_3b.y, 1, 1)
    --   spr(platform2_3b.sp, platform2_3b.x, platform2_3b.y, 1, 1)
    --   spr(platform3_3b.sp, platform3_3b.x, platform3_3b.y, 1, 1)

    --   spr(platform_mover_3b.sp, platform_mover_3b.x, platform_mover_3b.y, 1, 1)

    --   spr(box1_3.sp, box1_3.x, box1_3.y, 1, 1, box1_3.flip)
    --   spr(box2_3.sp, box2_3.x, box2_3.y, 1, 1, box2_3.flip)
    --   spr(box3_3.sp, box3_3.x, box3_3.y, 1, 1, box3_3.flip)
    --   spr(box4_3.sp, box4_3.x, box4_3.y, 1, 1, box4_3.flip)
      
    end    
    -- print("collision: "..tostring(check_collision2(player1, box3_3) and check_collision2(player2, box3_3)), 5, 20, 14)

  end



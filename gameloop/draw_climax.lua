function _draw()
    cls()
    map(map_offset_x, map_offset_y, 0, 0, 32, 32)
    print("climax",50,2,14)
    spr(player1.frames[flr(player1.spz)], player1.x, player1.y, 2, 2, player1.flp)
    spr(player2.frames[flr(player2.spz)], player2.x, player2.y, 2, 2, player2.flip)

    spr(boulder.sp, boulder.x, boulder.y, 4, 4, boulder.flip)

    spr(bridge1.sp, bridge1.x, bridge1.y, 1, 1, bridge1.flip)
    spr(bridge2.sp, bridge2.x, bridge2.y, 1, 1, bridge2.flip)
    spr(bridge3.sp, bridge3.x, bridge3.y, 1, 1, bridge3.flip)
    spr(bridge4.sp, bridge4.x, bridge4.y, 1, 1, bridge4.flip)
    
    -- print("close_to_boulder: "..tostring(close_to_boulder), 5, 20, 14)

  end



function _draw()
    -- clear screen
    cls()
  
    -- define the size of the map in tiles
    local map_width = 16  -- number of tiles wide you want to draw
    local map_height = 100 -- number of tiles high you want to draw
  
    -- calculate the y position to draw the map at the bottom-left
    local screen_height = 300
    local map_y = screen_height - (map_height * 8)  -- position it above the bottom
  
    map(0, 18, 0, 0, map_width, map_height)

    print("level 1",50,2,14)
    text1 = "pip and pete received a note"
    text2 = "from their brother, percy. the "
    text3 = "note reads, ''i've discovered  "
    text4 = "a safe shelter away from the "
    text5 = "swift-fast cheetah at the top   "
    text6 = "of the mountain! climb up this "
    text7 = "cliff! - percy''"
    box_x = 2
    box_y = 9
    box_w = 122
    box_h = 53
    rectfill(box_x, box_y, box_x + box_w, box_y + box_h, 7)  -- White background
    rect(box_x, box_y, box_x + box_w, box_y + box_h, 0)  -- Black border

    -- Draw the text inside the box
    print(text1, box_x + 2, box_y + 4, 0)
    print(text2, box_x + 2, box_y + 11, 0)
    print(text3, box_x + 2, box_y + 18, 0)
    print(text4, box_x + 2, box_y + 25, 0)
    print(text5, box_x + 2, box_y + 32, 0)
    print(text6, box_x + 2, box_y + 39, 0)
    print(text7, box_x + 2, box_y + 46, 0)
  
    -- draw the player sprite (32x32 pixels = 4 tiles by 4 tiles)
    spr(player1.frames[flr(player1.spz)], player1.x, player1.y, player1.w, player1.h, player1.flip)
    spr(player2.frames[flr(player2.spz)], player2.x, player2.y, player2.w, player2.h, player2.flip)
    --sspr(0, 0, 16, 16, player.x, player.y, 16, 16)
    --sspr(8, 0, 16, 16, player2.x, player2.y, 8, 8)
    spr(box.sp, box.x, box.y, box.w, box.h, box.flip)
    spr(switch1.sp, switch1.x, switch1.y, switch1.w, switch1.h, switch1.flip)
    spr(switch2.sp, switch2.x, switch2.y, switch2.w, switch2.h, switch2.flip)
    spr(platform1.sp, platform1.x, platform1.y, platform1.w, platform1.h)
    spr(platform2.sp, platform2.x, platform2.y, platform2.w, platform2.h)
    spr(platform3.sp, platform3.x, platform3.y, platform3.w, platform3.h)
    spr(platform4.sp, platform4.x, platform4.y, platform4.w, platform4.h)
    spr(platform5.sp, platform5.x, platform5.y, platform5.w, platform5.h)
    spr(platform6.sp, platform6.x, platform6.y, platform6.w, platform6.h)
    spr(platform_mover.sp, platform_mover.x, platform_mover.y, platform_mover.w, platform_mover.h)

    -- print("platform6.y: "..platform6.y, 50,30,14)
    -- print("player1.y: "..player1.y, 50,40,14)
    -- print("is_colliding_from_below: "..tostring(is_colliding_with_platform_from_below(player2, platform1)), 10, 50, 14)
    -- print("is_colliding_with_ground: "..tostring(is_colliding_with_ground(player1.x, player1.y)), 10, 60, 14)
    -- print("collide_16x16sprite: "..tostring(collide_16x16sprite(player1)), 10, 70, 14)
    -- print("collide_8x8sprite: "..tostring(collide_8x8sprite(box)), 10, 80, 14)
    -- print("switch1.flip: "..tostring(switch1.flip), 10, 90, 14)
    -- print("switch2.flip: "..tostring(switch2.flip), 10, 100, 14)
    -- print("switch_toggle1: "..tostring(switch_toggle1), 10, 110, 14)
    -- print("switch1_collision_count: "..switch1_collision_count, 10, 120, 14)
    
    
  end
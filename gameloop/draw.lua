function _draw()
    -- clear screen
    cls()
    map(map_offset_x, map_offset_y, 0, 0, 16, 16)
    -- map(128 - 16, 32 - 16, 0, 0, 16, 16)
    textbox_level1()
    -- draw the player sprite (32x32 pixels = 4 tiles by 4 tiles)
    -- if switch1.flip==false or switch2.flip==false then
    spr(player1.frames[flr(player1.spz)], player1.x, player1.y, 2, 2, player1.flp)
    -- elseif switch1.flip==true and switch2.flip==true then
    --   spr(player1.frames[flr(player1.spz)], 2, 9*8, 2, 2, player1.flp)
    -- end
    spr(player2.frames[flr(player2.spz)], player2.x, player2.y, 2, 2, player2.flip)
    spr(switch1.sp, switch1.x, switch1.y, switch1.w, switch1.h, switch1.flip)
    spr(switch2.sp, switch2.x, switch2.y, switch2.w, switch2.h, switch2.flip)

    -- print("check_collision: "..tostring(check_collision(player1, switch1)), 5, 50, 14)
    print("map_offset_x: "..map_offset_x, 5, 40, 14)
    print("player1.landed: "..tostring(player1.landed), 5, 50, 14)
    print("player1_touched_switch1_x: "..player1_touched_switch1_x, 5, 60, 14)
    
  end

function textbox_level1()
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
end
function _draw()
    -- clear screen
    cls()
    map(map_offset_x, map_offset_y, 0, 0, 16, 16)
    -- map(128 - 16, 32 - 16, 0, 0, 16, 16)
    textbox_level1()
    -- draw the player sprite (32x32 pixels = 4 tiles by 4 tiles)
    -- if switch1.flip==false or switch2.flip==false then
    if map_offset_x==30 and map_offset_y==12 then
      spr(wall_player2.sp, wall_player2.x, wall_player2.y, 1, 1)
    end
    spr(player1.frames[flr(player1.spz)], player1.x, player1.y, 2, 2, player1.flp)
    -- elseif switch1.flip==true and switch2.flip==true then
    --   spr(player1.frames[flr(player1.spz)], 2, 9*8, 2, 2, player1.flp)
    -- end
    spr(player2.frames[flr(player2.spz)], player2.x, player2.y, 2, 2, player2.flip)

    --level1a
    if map_offset_y==19 and map_offset_x==0 then
      spr(switch1.sp, switch1.x, switch1.y, 1, 1, switch1.flip)
      spr(switch2.sp, switch2.x, switch2.y, 1, 1, switch2.flip)
    end
    --level1b
    if map_offset_x==12 and map_offset_y==19 then
      spr(switch3.sp, switch3.x, switch3.y, 1, 1, switch3.flip)
      spr(switch4.sp, switch4.x, switch4.y, 1, 1, switch4.flip)
      spr(seesaw_bottom1.sp, seesaw_bottom1.x, seesaw_bottom1.y, 1, 1, seesaw_bottom1.flip)
      spr(seesaw_arch1.sp, seesaw_arch1.x, seesaw_arch1.y, 1, 1, seesaw_arch1.flip)
      -- spr(seesaw_holder1.sp, seesaw_holder1.x, seesaw_holder1.y, 1, 1, seesaw_holder1.flip)
      -- spr(seesaw_holder2.sp, seesaw_holder2.x, seesaw_holder2.y, 1, 1, seesaw_holder2.flip)
      spr(seesaw_arch2.sp, seesaw_arch2.x, seesaw_arch2.y, 1, 1, seesaw_arch2.flip)
      spr(seesaw_top1.sp, seesaw_top1.x, seesaw_top1.y, 1, 1, seesaw_top1.flip)
      spr(box2.sp, box2.x, box2.y, 1, 1, box2.flip)
    end

    --level2
    if map_offset_x==30 and map_offset_y==12 then
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
      -- spr(wall_player2.sp, wall_player2.x, wall_player2.y, 1, 1)
    end

    print("check_collision: "..tostring(check_collision(player1,platform5)), 5, 50, 14)
    print("map_offset_x: "..tostring(player2.x), 5, 40, 14)
    -- print("player1.landed: "..tostring(player1.landed), 5, 50, 14)
    -- print("player1_touched_switch1_x: "..player1_touched_switch1_x, 5, 60, 14)
    print("collision: "..tostring(check_collision(player1,platform1)), 5, 60, 14)
    -- print("collision: "..tostring(check_collision(player1, seesaw_bottom1)), 5, 60, 14)
    -- print("collision_top: "..tostring(check_collision(player1, seesaw_top1)), 5, 70, 14)
    -- print("level1b: "..tostring(player1.y), 5, 80, 14)
    
    
  end

function textbox_level1()
  if map_offset_y==19 then
   print("level 1",50,2,14)
  end
  if map_offset_x==30 then
    print("level 2",50,2,14)
  end
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
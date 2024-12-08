function _draw()
    cls()
    map(map_offset_x, map_offset_y, 0, 0, 32, 32)
    -- tb_draw()
    -- if question then
    --   dquestion(q2)
    --   checkquestion(q2)
    -- end
    
    spr(player1.frames[flr(player1.spz)], player1.x, player1.y, 2, 2, player1.flp)
    spr(player2.frames[flr(player2.spz)], player2.x, player2.y, 2, 2, player2.flip)
    print("level 1",50,2,14)
    if level == "1a" then
      spr(switch1.sp, switch1.x, switch1.y, 1, 1, switch1.flip)
      spr(switch2.sp, switch2.x, switch2.y, 1, 1, switch2.flip)
      if(question == true) then
        dquestion(q1)
        checkquestion(q1)
      end
    elseif level == "1b" then
      spr(switch3.sp, switch3.x, switch3.y, 1, 1, switch3.flip)
      spr(switch4.sp, switch4.x, switch4.y, 1, 1, switch4.flip)
      spr(seesaw_right.sp, seesaw_right.x, seesaw_right.y, 1, 1, seesaw_right.flip)
      spr(seesaw_arch1.sp, seesaw_arch1.x, seesaw_arch1.y, 1, 1, seesaw_arch1.flip)
      spr(seesaw_arch2.sp, seesaw_arch2.x, seesaw_arch2.y, 1, 1, seesaw_arch2.flip)
      spr(seesaw_left.sp, seesaw_left.x, seesaw_left.y, 1, 1, seesaw_left.flip)
      spr(box2.sp, box2.x, box2.y, 1, 1, box2.flip)
      -- dquestion(q2)
    end

    -- print("collision: "..tostring(both_player1_left), map_offset_x,  map_offset_y+10, 14)
    -- print("player1.y: "..tostring(player1.y), map_offset_x,  map_offset_y+20, 14)
    -- print("player1.x: "..tostring(player1.x), map_offset_x,  map_offset_y+30, 14)
    -- print("player2.y: "..tostring(player1.y), map_offset_x,  map_offset_y+40, 14)
    -- print("player2.x: "..tostring(player1.x), map_offset_x,  map_offset_y+50, 14)
    
  end



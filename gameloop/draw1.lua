function _draw()
    cls()
    map(map_offset_x, map_offset_y, 0, 0, 32, 32)
    tb_draw()

    local tb_x4 = 12.8*8
    local tb_y4 = (31.8-17)*8
    local tb_w4 = 3*8  
    local tb_h4 = 8.5
    rectfill(tb_x4, tb_y4, tb_x4 + tb_w4, tb_y4 + tb_h4, 11)
    rect(tb_x4, tb_y4, tb_x4 + tb_w4, tb_y4 + tb_h4, color_menu)
    print("menu",13.4*8,(32-17)*8,1)
    
    spr(player1.frames[flr(player1.spz)], player1.x, player1.y, 2, 2, player1.flp)
    spr(player2.frames[flr(player2.spz)], player2.x, player2.y, 2, 2, player2.flip)
    print("level 1",50,2,14)
    if level == "1a" then
      spr(switch1.sp, switch1.x, switch1.y, 1, 1, switch1.flip)
      spr(switch2.sp, switch2.x, switch2.y, 1, 1, switch2.flip)

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
    
    if question == "q1" then
      questionAns=1
      dquestion(q1)
      checkquestion(q1)
      if viewhint then
        dhint(q1)
        viewhintfalselogic(q1)
      end
    end
    if question == "q2" then
      questionAns=2
      dquestion(q2)
      checkquestion(q2)
      if viewhint then
        dhint(q2)
        viewhintfalselogic(q2)
      end
    end
    if question == "q3" then
      questionAns=1
      dquestion(q3)
      checkquestion(q3)
      if viewhint then
        dhint(q3)
        viewhintfalselogic(q3)
      end
    end
    if question == "q4" then
      questionAns=2
      dquestion(q4)
      checkquestion(q4)
      if viewhint then
        dhint(q4)
        viewhintfalselogic(q4)
      end
    end
    print("btn_count_lvl: "..tostring(btn_count_lvl), map_offset_x,  map_offset_y+70, 14)
    print("yes_color "..tostring(yes_color), map_offset_x,  map_offset_y+80, 14)
    print("no_color: "..tostring(no_color), map_offset_x,  map_offset_y+90, 14)
    print("cond: "..tostring(btn(⬇️, 0) and not last_btn_state_down_lvl), map_offset_x,  map_offset_y+100, 14)
    -- print("player2.x: "..tostring(player1.x), map_offset_x,  map_offset_y+50, 14)
    
    if show_popup then
      rectfill(17, 40, 116, 80, 0) 
      rect(17, 40, 116, 80, 7) 

      -- Popup text
      print("are you sure you want", 20, 45, 7)
      print("to go back to the menu?", 20, 53, 7)

      rectfill(40, 65, 60, 75, 7) 
      rect(40, 65, 60, 75, yes_color) 
      print("yes", 45, 68, 0) 

      rectfill(70, 65, 90, 75, 7) 
      rect(70, 65, 90, 75, no_color)
      print("no", 75, 68, 0)
    end
  end



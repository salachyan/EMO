function _draw()
    cls()
  
    map(map_offset_x, map_offset_y, 0, 0, 32, 64)  
    print("questions!",46,2,14)
    
    if question == "q5" then
      questionAns=3
      dquestion(q5)
      checkquestion(q5)
      if viewhint then
        dhint(q5)
        viewhintfalselogic(q5)
      end
    end
    if question == "q6" then
      questionAns=2
      dquestion(q6)
      checkquestion(q6)
      if viewhint then
        dhint(q6)
        viewhintfalselogic(q6)
      end
    end
    if question == "q7" then
      questionAns=1
      dquestion(q7)
      checkquestion(q7)
      if viewhint then
        dhint(q7)
        viewhintfalselogic(q7)
      end
    end
    if question == "q8" then
        questionAns=4
        dquestion(q8)
        checkquestion(q8)
        if viewhint then
          dhint(q8)
          viewhintfalselogic(q8)
        end
      end
    if question == "q9" then
        questionAns=2
        dquestion(q9)
        checkquestion(q9)
        if viewhint then
          dhint(q9)
          viewhintfalselogic(q9)
        end
      end
    if question == "q10" then
        questionAns=1
        finalquestion=true
        dquestion(q10)
        checkquestion(q10)
        if viewhint then
          dhint(q10)
          viewhintfalselogic(q10)
        end
        -- if()
      end
    if complete == true then
        rectfill(0, 0, 400, 400, 0)
    end
    -- print("player1.x: "..tostring(reading), map_offset_x,  map_offset_y+30, 14)
    tb_draw()

end
  
  
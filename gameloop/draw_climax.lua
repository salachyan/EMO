function _draw()
    cls()
    map(map_offset_x, map_offset_y, 0, 0, 32, 64)
    print("climax",50,5,14)

    if player1.x>=((62-60)*8)-4 and player1.x<=(63-60)*8 and player1.y<=32*8 and player1.y>=12.5*8 or player2.x>=((62-60)*8)-4 and player2.x<=(63-60)*8 and player2.y<=32*8 and player2.y>=22.5*8 then
      ladder_draw=true
    end

    if ladder_draw==true then
      spr(ladderL1.sp, ladderL1.x, ladderL1.y, 1, 1)
      spr(ladderR1.sp, ladderR1.x, ladderR1.y, 1, 1)
      spr(ladderL2.sp, ladderL2.x, ladderL2.y, 1, 1)
      spr(ladderR2.sp, ladderR2.x, ladderR2.y, 1, 1)
    end

    -- if gameover_condition==true then
    --   print("thanks for playing! "..tostring(current_message_index>=24), camera_x, camera_y+70, 14)
    -- end

    if (fading>0) fadeout()
    if fading<0 then
        rectfill(0,0,400,400,0)
    end

    if current_message_index<=24 and fading<0 then
      gameover_condition=true
    end
    
    if gameover_condition==false then
      spr(player1.sp, player1.x, player1.y, 2, 2, player1.flp)
      spr(player2.sp, player2.x, player2.y, 2, 2, player2.flip)
      spr(percy.sp, percy.x, percy.y, 2, 2, percy.flip)
      spr(cheetah.sp, cheetah.x, cheetah.y, 4, 4, cheetah.flip)  
    else
      if gameover_time<=17 then
        gameover_time+=0.1
        ending_condition=true
      else
        ending_condition=false
      end
      if gameover_time1<=17 and ending_condition==false then
        gameover_time1+=0.1
        ending_condition2=true
      else
        ending_condition2=false
      end
      if gameover_time2<=26 and ending_condition2==false then
        gameover_time2+=0.1
        thanks_condition=true
      else
        thanks_condition=false
      end
      if thanks_condition==false then
        -- gameover_time3+=0.1
        questions_condition=true
      else
        questions_condition=false
      end

      if questions_condition==true then
        if btn(❎, 0) then
          load("postclimax.p8")
        end
      end
      if ending_condition==true then
        print("the three brothers then headed", camera_x+1, camera_y+40, 7)
        print("back down the mountain together,", camera_x+1, camera_y+50, 7)
        print("starting a new adventure.", camera_x+1, camera_y+60, 7)
        -- print("together.", camera_x+1, camera_y+70, 7)
      elseif ending_condition2 then
        print("their relationship was soon ", camera_x+3, camera_y+40, 7)
        print("healed, and the brothers  ", camera_x+3, camera_y+50, 7)  
        print("couldn't be any happier.", camera_x+3, camera_y+60, 7)  
      elseif thanks_condition then
        print("thanks for playing!", camera_x+22, camera_y+50, 7)
      elseif questions_condition then
        print("please press ''a'' to answer", camera_x+1, camera_y+40, 7)
        print("the remaiming 6 questions.", camera_x+1, camera_y+50, 7)
        
      end
    end
    spr(boulder.sp, boulder.x, boulder.y, 4, 4, boulder.flip)

    spr(bridge1.sp, bridge1.x, bridge1.y, 1, 1, bridge1.flip)
    spr(bridge2.sp, bridge2.x, bridge2.y, 1, 1, bridge2.flip)
    spr(bridge3.sp, bridge3.x, bridge3.y, 1, 1, bridge3.flip)
    spr(bridge4.sp, bridge4.x, bridge4.y, 1, 1, bridge4.flip)

    
    draw_ground()
    tb_draw()

    if show_popup then
      -- Use camera_x and camera_y to position the popup dynamically
      local popup_x = camera_x + 12  -- Centered horizontally within the camera view
      local popup_y = camera_y + 32  -- Centered vertically within the camera view

      -- Draw popup background
      rectfill(popup_x, popup_y, popup_x + 100, popup_y + 40, 0) -- Black box
      rect(popup_x, popup_y, popup_x + 100, popup_y + 40, 7) -- White border

      -- Popup text
      print("are you sure you want", popup_x + 4, popup_y + 4, 7)
      print("to go back to the menu?", popup_x + 4, popup_y + 12, 7)

      local yes_x = popup_x + 27  -- Adjusted position for Yes
      rectfill(yes_x, popup_y + 24, yes_x + 20, popup_y + 34, 7)
      rect(yes_x, popup_y + 24, yes_x + 20, popup_y + 34, yes_color)
      print("yes", yes_x + 5, popup_y + 26, 0)

      -- No button (move to the right)
      local no_x = popup_x + 51  -- Adjusted position for No
      rectfill(no_x, popup_y + 24, no_x + 20, popup_y + 34, 7)
      rect(no_x, popup_y + 24, no_x + 20, popup_y + 34, no_color)
      print("no", no_x + 5, popup_y + 26, 0)
  end


    -- if player1.x>=(64-60)*8 and player1.x<=(68-60)*8 and player1.y<=33*8 and and player1.y>=30*8 then
      
    -- end 

    
    -- print("gameover_time: "..tostring(gameover_time ), camera_x,  camera_y+70, 14)
    -- print("gameover_time1: "..tostring(gameover_time1), camera_x, camera_y+80, 14)
    
    -- print("thanks_condition: "..tostring(thanks_condition), camera_x, camera_y+90, 14)
    -- -- print("gameover_condition==true "..tostring(gameover_condition==true), camera_x, camera_y+80, 14)
    -- print("ending_condition: "..tostring(ending_condition),camera_x, camera_y+100, 14)
    -- print("condition: "..tostring(current_message_index==2), camera_x, camera_y+70, 0)
    -- print("current_message_index : "..tostring(current_message_index), camera_x, camera_y + 80, 0)
    -- print("player1.y: "..tostring(player1.y), camera_x, camera_y + 90, 0)
    -- print("player2.y: "..tostring(player2.y), camera_x, camera_y + 100, 0)
    -- print("player1.x: "..tostring(player1.x), camera_x, camera_y + 110, 0)
    -- print("player2.x: "..tostring(player2.x), camera_x, camera_y + 120, 0)
  end

  function draw_ground()
    spr(OneR.sp, OneR.x, OneR.y, 4, 4, OneR.flip)
    spr(OneR2.sp, OneR2.x, OneR2.y, 4, 4, OneR2.flip)
    spr(OneR3.sp, OneR3.x, OneR3.y, 4, 4, OneR3.flip)
    spr(OneL.sp, OneL.x, OneL.y, 4, 4, OneL.flip)
    spr(OneL2.sp, OneL2.x, OneL2.y, 4, 4, OneL2.flip)
    spr(OneL3.sp, OneL3.x, OneL3.y, 4, 4, OneL3.flip)
    spr(OneL4.sp, OneL4.x, OneL4.y, 4, 4, OneL4.flip)

    spr(TwoR.sp, TwoR.x, TwoR.y, 4, 4, TwoR.flip)
    spr(TwoR2.sp, TwoR2.x, TwoR2.y, 4, 4, TwoR2.flip)
    spr(TwoR3.sp, TwoR3.x, TwoR3.y, 4, 4, TwoR3.flip)
    spr(TwoR4.sp, TwoR4.x, TwoR4.y, 4, 4, TwoR4.flip)
    spr(TwoL.sp, TwoL.x, TwoL.y, 4, 4, TwoL.flip)
    spr(TwoL2.sp, TwoL2.x, TwoL2.y, 4, 4, TwoL2.flip)
    spr(TwoL3.sp, TwoL3.x, TwoL3.y, 4, 4, TwoL3.flip)
    spr(TwoL4.sp, TwoL4.x, TwoL4.y, 4, 4, TwoL4.flip)

    spr(ThreeR.sp, ThreeR.x, ThreeR.y, 4, 4, ThreeR.flip)
    spr(ThreeR2.sp, ThreeR2.x, ThreeR2.y, 4, 4, ThreeR2.flip)
    spr(ThreeR3.sp, ThreeR3.x, ThreeR3.y, 4, 4, ThreeR3.flip)
    spr(ThreeR4.sp, ThreeR4.x, ThreeR4.y, 4, 4, ThreeR4.flip)
    spr(ThreeL.sp, ThreeL.x, ThreeL.y, 4, 4, ThreeL.flip)
    spr(ThreeL2.sp, ThreeL2.x, ThreeL2.y, 4, 4, ThreeL2.flip)
    spr(ThreeL3.sp, ThreeL3.x, ThreeL3.y, 4, 4, ThreeL3.flip)
    spr(ThreeL4.sp, ThreeL4.x, ThreeL4.y, 4, 4, ThreeL4.flip)

    spr(FourR.sp, FourR.x, FourR.y, 4, 4, FourR.flip)
    spr(FourR2.sp, FourR2.x, FourR2.y, 4, 4, FourR2.flip)
    spr(FourR3.sp, FourR3.x, FourR3.y, 4, 4, FourR3.flip)
    spr(FourR4.sp, FourR4.x, FourR4.y, 4, 4, FourR4.flip)
    spr(FourL.sp, FourL.x, FourL.y, 4, 4, FourL.flip)
    spr(FourL2.sp, FourL2.x, FourL2.y, 4, 4, FourL2.flip)
    spr(FourL3.sp, FourL3.x, FourL3.y, 4, 4, FourL3.flip)
    spr(FourL4.sp, FourL4.x, FourL4.y, 4, 4, FourL4.flip)

    spr(Zero1.sp, Zero1.x, Zero1.y, 4, 4, Zero1.flip)
    spr(Zero2.sp, Zero2.x, Zero2.y, 4, 4, Zero2.flip)
    spr(Zero3.sp, Zero3.x, Zero3.y, 4, 4, Zero3.flip)
    spr(Zero4.sp, Zero4.x, Zero4.y, 4, 4, Zero4.flip)
    spr(Zero5.sp, Zero5.x, Zero5.y, 4, 4, Zero5.flip)

    spr(circle.sp, circle.x, circle.y, 4, 4, circle.flip)
  end

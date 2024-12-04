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
    
    spr(player1.frames[flr(player1.spz)], player1.x, player1.y, 2, 2, player1.flp)
    spr(player2.frames[flr(player2.spz)], player2.x, player2.y, 2, 2, player2.flip)
    spr(percy.sp, percy.x, percy.y, 2, 2, percy.flip)
    spr(cheetah.sp, cheetah.x, cheetah.y, 4, 4, cheetah.flip)

    spr(boulder.sp, boulder.x, boulder.y, 4, 4, boulder.flip)

    spr(bridge1.sp, bridge1.x, bridge1.y, 1, 1, bridge1.flip)
    spr(bridge2.sp, bridge2.x, bridge2.y, 1, 1, bridge2.flip)
    spr(bridge3.sp, bridge3.x, bridge3.y, 1, 1, bridge3.flip)
    spr(bridge4.sp, bridge4.x, bridge4.y, 1, 1, bridge4.flip)

    
    draw_ground()
    tb_draw()

    -- if player1.x>=(64-60)*8 and player1.x<=(68-60)*8 and player1.y<=33*8 and and player1.y>=30*8 then
      
    -- end 

    
    -- print("storyline condition: "..tostring(level == "climax" and checker==0 ), 5, 20, 10)
    -- print("climax condition: "..tostring(level == "climax"), 5, 30, 10)
    
    print("player1.y: "..tostring(player1.y), 5, 40, 10)
    print("players_fell "..tostring(players_fell), 5, 20, 10)
    print("y: "..tostring(y), 5, 30, 10)
    -- print("condition: "..tostring(player1.y ), 5, 200, 14)
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

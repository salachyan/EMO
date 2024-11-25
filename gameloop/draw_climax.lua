function _draw()
    cls()
    map(map_offset_x, map_offset_y, 0, 0, 32, 64)
    print("climax",50,5,14)
    
    spr(player1.frames[flr(player1.spz)], player1.x, player1.y, 2, 2, player1.flp)
    spr(player2.frames[flr(player2.spz)], player2.x, player2.y, 2, 2, player2.flip)
    
    spr(boulder.sp, boulder.x, boulder.y, 4, 4, boulder.flip)

    spr(bridge1.sp, bridge1.x, bridge1.y, 1, 1, bridge1.flip)
    spr(bridge2.sp, bridge2.x, bridge2.y, 1, 1, bridge2.flip)
    spr(bridge3.sp, bridge3.x, bridge3.y, 1, 1, bridge3.flip)
    spr(bridge4.sp, bridge4.x, bridge4.y, 1, 1, bridge4.flip)

    draw_ground()

    
    print("collision: "..tostring(TwoR4.x), 5, 180, 10)
    print("player1: "..tostring(TwoR4.y), 5, 190, 10)
    print("condition: "..tostring(TwoR3.x), 5, 200, 10)

    -- print("collision: "..tostring(btn(❎, 0) and player1.landed and player1.climbing_ability==false), 5, 180, 14)
    -- print("player1: "..tostring(player1.climbing_ability), 5, 190, 14)
    -- print("condition: "..tostring(player1.x>=(62-60)*8 and player1.x<=(63-60)*8 and player1.y<=29*8 and player1.y>=15*8 ), 5, 200, 14)
  end

  function draw_ground()
    -- Ground levels on right side
    spr(FourR.sp, FourR.x, FourR.y, 4, 4, FourR.flip)
    spr(ThreeR.sp, ThreeR.x, ThreeR.y, 4, 4, ThreeR.flip)
    spr(TwoR.sp, TwoR.x, TwoR.y, 4, 4, TwoR.flip)
    spr(OneR.sp, OneR.x, OneR.y, 4, 4, OneR.flip)

    -- Ground levels on left side
    spr(FourL.sp, FourL.x, FourL.y, 4, 4, FourL.flip)
    spr(ThreeL.sp, ThreeL.x, ThreeL.y, 4, 4, ThreeL.flip)
    spr(TwoL.sp, TwoL.x, TwoL.y, 4, 4, TwoL.flip)
    spr(OneL.sp, OneL.x, OneL.y, 4, 4, OneL.flip)

    -- Ground levels on far right side
    spr(FourR2.sp, FourR2.x, FourR2.y, 4, 4, FourR2.flip)
    spr(ThreeR2.sp, ThreeR2.x, ThreeR2.y, 4, 4, ThreeR2.flip)
    spr(TwoR2.sp, TwoR2.x, TwoR2.y, 4, 4, TwoR2.flip)
    spr(OneR2.sp, OneR2.x, OneR2.y, 4, 4, OneR2.flip)

    -- Ground levels on far left side
    spr(FourL2.sp, FourL2.x, FourL2.y, 4, 4, FourL2.flip)
    spr(ThreeL2.sp, ThreeL2.x, ThreeL2.y, 4, 4, ThreeL2.flip)
    spr(TwoL2.sp, TwoL2.x, TwoL2.y, 4, 4, TwoL2.flip)
    spr(OneL2.sp, OneL2.x, OneL2.y, 4, 4, OneL2.flip)

    spr(OneR3.sp, OneR3.x, OneR3.y, 4, 4, OneR3.flip)
    spr(OneR4.sp, OneR4.x, OneR4.y, 4, 4, OneR4.flip)
    spr(OneL3.sp, OneL3.x, OneL3.y, 4, 4, OneL3.flip)
    spr(OneL4.sp, OneL4.x, OneL4.y, 4, 4, OneL4.flip)
    spr(TwoR3.sp, TwoR3.x, TwoR3.y, 4, 4, TwoR3.flip)
    spr(TwoR4.sp, TwoR4.x, TwoR4.y, 4, 4, TwoR4.flip)
    spr(TwoL3.sp, TwoL3.x, TwoL3.y, 4, 4, TwoL3.flip)
    spr(TwoL4.sp, TwoL4.x, TwoL4.y, 4, 4, TwoL4.flip)

    -- Zero levels
    spr(Zero1.sp, Zero1.x, Zero1.y, 4, 4, Zero1.flip)
    spr(Zero2.sp, Zero2.x, Zero2.y, 4, 4, Zero2.flip)
    spr(Zero3.sp, Zero3.x, Zero3.y, 4, 4, Zero3.flip)
    spr(Zero4.sp, Zero4.x, Zero4.y, 4, 4, Zero4.flip)
    spr(Zero5.sp, Zero5.x, Zero5.y, 4, 4, Zero5.flip)
    spr(Zero6.sp, Zero6.x, Zero6.y, 4, 4, Zero6.flip)


    spr(circle1.sp, circle1.x, circle1.y, 4, 4, circle1.flip)
    -- spr(circle2.sp, circle2.x, circle2.y, 4, 4, circle2.flip)
  end

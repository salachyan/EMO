function climax()
    -- jump on top of the bridge
    if check_collision2(player1, bridge1) then
        if player1.y + player1.sprite_h <= bridge1.y + bridge1.h * 8 and player1.dy > 0 then
        player1.y = bridge1.y - player1.sprite_h * 8 
        player1.dy = 0  
        player1.landed = true 
        end
    end
    if check_collision2(player2, bridge1) then
        if player2.y + player2.sprite_h <= bridge1.y + bridge1.h * 8 and player2.dy > 0 then
        player2.y = bridge1.y - player2.sprite_h * 8  
        player2.dy = 0  
        player2.landed = true 
        end
    end
    if check_collision2(player1, bridge2) then
        if player1.y + player1.sprite_h <= bridge2.y + bridge2.h * 8 and player1.dy > 0 then
        player1.y = bridge2.y - player1.sprite_h * 8 
        player1.dy = 0  
        player1.landed = true 
        end
    end
    if check_collision2(player2, bridge2) then
        if player2.y + player2.sprite_h <= bridge2.y + bridge2.h * 8 and player2.dy > 0 then
        player2.y = bridge2.y - player2.sprite_h * 8  
        player2.dy = 0  
        player2.landed = true 
        end
    end
    if check_collision2(player1, bridge3) then
        if player1.y + player1.sprite_h <= bridge3.y + bridge3.h * 8 and player1.dy > 0 then
        player1.y = bridge3.y - player1.sprite_h * 8 
        player1.dy = 0  
        player1.landed = true 
        end
    end
    if check_collision2(player2, bridge3) then
        if player2.y + player2.sprite_h <= bridge3.y + bridge3.h * 8 and player2.dy > 0 then
        player2.y = bridge3.y - player2.sprite_h * 8  
        player2.dy = 0  
        player2.landed = true 
        end
    end
    if check_collision2(player1, bridge4) then
        if player1.y + player1.sprite_h <= bridge4.y + bridge4.h * 8 and player1.dy > 0 then
        player1.y = bridge4.y - player1.sprite_h * 8 
        player1.dy = 0  
        player1.landed = true 
        end
    end
    if check_collision2(player2, bridge4) then
        if player2.y + player2.sprite_h <= bridge4.y + bridge4.h * 8 and player2.dy > 0 then
        player2.y = bridge4.y - player2.sprite_h * 8  
        player2.dy = 0  
        player2.landed = true 
        end
    end

    boulder.dy+=1
    boulder.x+=boulder.dx
    boulder.y+=boulder.dy
    --check boulder collision up and down
    if boulder.dy>0 then
        boulder.falling=true
        boulder.landed=false
        boulder.jumping=false

        if map_collision(boulder,"down",0,map_offset_y,map_offset_x) or map_collision(boulder,"down",1,map_offset_y,map_offset_x) then
            boulder.landed=true
            boulder.falling=false
            boulder.dy=0
            boulder.y-=((boulder.y+boulder.h+1)%8)-1
        end
        elseif boulder.dy<0 then
            boulder.jumping=true
            if map_collision(boulder,"up",0,map_offset_y,map_offset_x) then
            boulder.dy=0
        end

        if boulder.x<map_start then
            boulder.x=map_start
        end
        if boulder.x>map_end-boulder.w then
            boulder.x=map_end-boulder.w
        end
    end

    --check collision left and right
    if boulder.dx<0 then

    if map_collision(boulder,"left",0,map_offset_y,map_offset_x) then
        boulder.dx=0
    end
    elseif boulder.dx>0 then
    if map_collision(boulder,"right",0,map_offset_y,map_offset_x) then
        boulder.dx=0
    end
  end

if (player1.x>=70 and player2.x>=70) then
    close_to_boulder=1
end

if close_to_boulder>=1 and boulder.x>=40 then
    boulder.x-=1
end

--boulder breaking bridge
if check_collision(boulder, bridge1) or check_collision(boulder, bridge2) or check_collision(boulder, bridge3) or check_collision(boulder, bridge4) then
    bridge1.sp=146
    bridge1.x=(64-60)*8
    bridge1.y=(14)*8

    bridge2.sp=146
    bridge2.x=(64-60)*8
    bridge2.y=(15)*8

    bridge3.sp=146
    bridge3.x=(69-60)*8
    bridge3.y=(14)*8

    bridge4.sp=146
    bridge4.x=(69-60)*8
    bridge4.y=(15)*8
end 

--collision with boulder and players
if check_collision2(boulder, player1) and boulder.x>=40 then
    player1.x =boulder.x-3
end
if check_collision2(boulder, player2) and boulder.x>=40 then
    player2.x =boulder.x-3

end
if close_to_boulder==1 then
    if player1.x<=(65-60)*8 then
        player1.x=(65-60)*8
    end
    if player2.x<=(65-60)*8 then
        player2.x=(65-60)*8
    end
end
--players are no longer close to the boulder
if player1.y==32*8 and player2.y==32*8 then
    close_to_boulder=0
end

    if player1.x<=(65-60)*8 and player1.y>=19*8 and player2.x<=(65-60)*8 and player2.y>=19*8 then
        players_fell=1
    end
    if (players_fell==1) then
        -- Update circle to follow player1
        circle.x = player1.x - 8  
        circle.y = player1.y - 8  
        if circle.y <= 19*8 then
            circle.y=19*8
            players_fell=2
        end
    end

    --flashlight logic
    if player1.y<= (33*8)+32 and player1.y>=20*8 then
      
        OneR.x=circle.x- 4*8
        OneR2.x=OneR.x - 4*8
        OneR3.x=OneR2.x - 4*8
        OneR.y=circle.y
        OneR2.y=OneR.y 
        OneR3.y=OneR2.y 
        OneL.x=circle.x +4*8
        OneL2.x=OneL.x +4*8
        OneL3.x=OneL2.x +4*8
        OneL4.x=OneL3.x +4*8
        OneL.y=circle.y
        OneL2.y=circle.y
        OneL3.y=circle.y 
        OneL4.y=circle.y 

        TwoR4.x=circle.x
        TwoR.x=circle.x-4*8
        TwoR2.x=TwoR.x - 4*8
        TwoR3.x=TwoR2.x - 4*8
        TwoR.y=circle.y-4*8
        TwoR2.y=TwoR.y 
        TwoR3.y=TwoR2.y 
        TwoR4.y=TwoR3.y
        TwoL.x=circle.x +4*8
        TwoL2.x=TwoL.x +4*8
        TwoL3.x=TwoL2.x +4*8
        TwoL4.x=TwoL3.x +4*8
        TwoL.y=circle.y-4*8
        TwoL2.y=circle.y-4*8
        TwoL3.y=circle.y-4*8
        TwoL4.y=circle.y-4*8
        
        ThreeR4.x=circle.x
        ThreeR.x=circle.x-4*8
        ThreeR2.x=ThreeR.x - 4*8
        ThreeR3.x=ThreeR2.x - 4*8
        ThreeR.y=circle.y-8*8
        ThreeR2.y=ThreeR.y 
        ThreeR3.y=ThreeR2.y 
        ThreeR4.y=ThreeR3.y
        ThreeL.x=circle.x +4*8
        ThreeL2.x=ThreeL.x +4*8
        ThreeL3.x=ThreeL2.x +4*8
        ThreeL4.x=ThreeL3.x +4*8
        ThreeL.y=circle.y-8*8
        ThreeL2.y=circle.y-8*8
        ThreeL3.y=circle.y-8*8
        ThreeL4.y=circle.y-8*8

        FourR4.x=circle.x
        FourR.x=circle.x-4*8
        FourR2.x=FourR.x - 4*8
        FourR3.x=FourR2.x - 4*8
        FourR.y=circle.y-12*8
        FourR2.y=FourR.y 
        FourR3.y=FourR2.y 
        FourR4.y=FourR3.y
        FourL.x=circle.x +4*8
        FourL2.x=FourL.x +4*8
        FourL3.x=FourL2.x +4*8
        FourL4.x=FourL3.x +4*8
        FourL.y=circle.y-12*8
        FourL2.y=circle.y-12*8
        FourL3.y=circle.y-12*8
        FourL4.y=circle.y-12*8

        Zero1.y=circle.y +4*8
        Zero2.y=circle.y +4*8
        Zero3.y=circle.y +4*8
        Zero4.y=circle.y +4*8
        Zero5.y=circle.y +4*8
        Zero6.y=circle.y +4*8

        if circle.y<=(220)  then
            FourR.y=circle.y+8*8
            FourR2.y=circle.y +8*8
            FourR3.y=circle.y +8*8 
            FourR4.y=circle.y +8*8
            FourL.y=circle.y +8*8
            FourL2.y=circle.y +8*8
            FourL3.y=circle.y +8*8
            FourL4.y=circle.y +8*8
    
        end

        if circle.y<=(27.5-4)*8  then
            ThreeR.y=circle.y+12*8
            ThreeR2.y=circle.y +12*8
            ThreeR3.y=circle.y +12*8 
            ThreeR4.y=circle.y +12*8
            ThreeL.y=circle.y +12*8
            ThreeL2.y=circle.y +12*8
            ThreeL3.y=circle.y +12*8
            ThreeL4.y=circle.y +12*8
        end

        if circle.y<=(27.5-8)*8  then
            TwoR.y=circle.y+16*8
            TwoR2.y=circle.y +16*8
            TwoR3.y=circle.y +16*8 
            TwoR4.y=circle.y +16*8
            TwoL.y=circle.y +16*8
            TwoL2.y=circle.y +16*8
            TwoL3.y=circle.y +16*8
            TwoL4.y=circle.y +16*8
        end

    end

    --jump on top of boulder
if check_collision2(player1, boulder) and players_fell==2 then
    if player1.y + player1.sprite_h <= boulder.y + boulder.h * 8 and player1.dy > 0 then
    player1.y = boulder.y - player1.sprite_h * 8 
    player1.dy = 0  
    player1.landed = true 
    end
end
if check_collision2(player2, boulder) and players_fell==2 then
    if player2.y + player2.sprite_h <= boulder.y + boulder.h * 8 and player2.dy > 0 then
    player2.y = boulder.y - player2.sprite_h * 8  
    player2.dy = 0  
    player2.landed = true 
    end
end

end


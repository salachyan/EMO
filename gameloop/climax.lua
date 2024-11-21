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

if (player1.x>=70 and player2.x>=70) and boulder.x>=40 then
    boulder.x-=1;
end

--boulder breaking bridge

--jump on top of boulder
-- if check_collision2(player1, boulder) then
--     if player1.y + player1.sprite_h <= boulder.y + boulder.h * 8 and player1.dy > 0 then
--     player1.y = boulder.y - player1.sprite_h * 8 
--     player1.dy = 0  
--     player1.landed = true 
--     end
-- end
-- if check_collision2(player2, boulder) then
--     if player2.y + player2.sprite_h <= boulder.y + boulder.h * 8 and player2.dy > 0 then
--     player2.y = boulder.y - player2.sprite_h * 8  
--     player2.dy = 0  
--     player2.landed = true 
--     end
-- end

end
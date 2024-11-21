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
end
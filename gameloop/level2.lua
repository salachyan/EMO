function level2()
    condition1 = player1.dx < 0 and ((box1.x+8) < player1.x)
    if check_collision(player1, box1) and player1.landed==true then
        if player1.dx > 0 and (box1.x > player1.x) then
            player1.x = box1.x - 1.8 * 8
        end
        if player1.dx < 0 and (box1.x < player1.x) then
            player1.x = box1.x + 7
        end
    end

    if check_collision(player2, box1) and player2.landed == true then
        if player2.dx > 0 and (box1.x > player2.x) then
            player2.x = box1.x - 1.8 * 8  
            box1.x = box1.x + player2.dx
                if box1.x>8*8 then
                    box1.x=8*8
                end
        end
        if player2.dx < 0 and (box1.x < player2.x) then
            player2.x = box1.x + 7
        end
    end

    -- jump on top of the box1
    if check_collision2(player1, box1) then
        if player1.y + player1.sprite_h <= box1.y + box1.h * 8 and player1.dy > 0 then
        player1.y = box1.y - player1.sprite_h * 8 
        player1.dy = 0  
        player1.landed = true 
        end
    end

    if check_collision2(player2, box1) then
        if player2.y + player2.sprite_h <= box1.y + box1.h * 8 and player2.dy > 0 then
        player2.y = box1.y - player2.sprite_h * 8 
        player2.dy = 0  
        player2.landed = true 
        end
    end

    switch1_2_collision_count = 0
    if (check_collision2(player1, switch1_2) or check_collision2(player2, switch1_2)) then
        switch1_2_collision_count = switch1_2_collision_count + 1
    end
    -- Toggle switch based on odd/even check
    if (switch1_2_collision_count % 2 == 1) then 
        switch1_2.flip = true
    end
    if (switch1_2_collision_count % 2 == 0) then 
        switch1_2.flip = false
    end


    if (check_collision2(player1, switch1_2) or check_collision2(player2, switch1_2)) and platform6.y<95 then
        platform1.y += 1
        platform2.y += 1
        platform3.y += 1
        platform4.y += 1
        platform5.y += 1
        platform6.y += 1
        switch2_2.y +=1
        platform_mover.y += 1
    end

    switch2_2_collision_count = 0
    if (check_collision2(player1, switch2_2) or check_collision2(player2, switch2_2)) then
        switch2_2_collision_count = switch2_2_collision_count + 1
    end
    if (switch2_2_collision_count % 2 == 1) then 
        switch2_2.flip = true
    end
    if (switch2_2_collision_count % 2 == 0) then 
        switch2_2.flip = false
    end

    if (check_collision2(player1, switch2_2) or check_collision2(player2, switch2_2)) and platform1.y>72 then
        platform1.y -= 1
        platform2.y -= 1
        platform3.y -= 1
        platform4.y -= 1
        platform5.y -= 1
        platform6.y -= 1
        switch2_2.y -=1
        platform_mover.y -= 1
    end
    
    if((check_collision(player1,sign) ==true or check_collision(player2,sign) == true) and btnp(5)) then
        hoversign=true
    end
    if check_collision1(player1, platform1) then
        if player1.y + player1.h <= platform1.y + platform1.h and player1.dy > 0 then
        player1.y = platform1.y - player1.h 
        player1.dy = 0 
        player1.landed = true 
        elseif player1.y >= platform1.y + platform1.h and player1.dy < 0 then
            player1.y = platform1.y + platform1.h  
            player1.dy = 0  
        end
    end
    if check_collision(player1, platform2) then
        if player1.y + player1.h <= platform2.y + platform2.h and player1.dy > 0 then
        player1.y = platform2.y - player1.h  
        player1.dy = 0  
        player1.landed = true 
        elseif player1.y >= platform2.y + platform2.h and player1.dy < 0 then
            player1.y = platform2.y + platform2.h 
            player1.dy = 0  
        end
    end
    if check_collision(player1, platform3) then
        if player1.y + player1.h <= platform3.y + platform3.h and player1.dy > 0 then
        player1.y = platform3.y - player1.h 
        player1.dy = 0  
        player1.landed = true 
        elseif player1.y >= platform3.y + platform3.h and player1.dy < 0 then
            player1.y = platform3.y + platform3.h  
            player1.dy = 0  
        end
    end
    if check_collision(player1, platform4) then
        if player1.y + player1.h <= platform4.y + platform4.h and player1.dy > 0 then
        player1.y = platform4.y - player1.h  
        player1.dy = 0  
        player1.landed = true
        elseif player1.y >= platform4.y + platform4.h and player1.dy < 0 then
            player1.y = platform4.y + platform4.h 
            player1.dy = 0 
        end
    end
    if check_collision1(player1, platform5) then
        if player1.y + player1.h <= platform5.y + platform5.h and player1.dy > 0 then
        player1.y = platform5.y - player1.h  
        player1.dy = 0  
        player1.landed = true 

        elseif player1.y >= platform5.y + platform5.h and player1.dy < 0 then
            player1.y = platform5.y + platform5.h 
            player1.dy = 0  
        end
    end

    --platform collision for player2
    if check_collision1(player2, platform1) then
        if player2.y + player2.h <= platform1.y + platform1.h and player2.dy > 0 then
        player2.y = platform1.y - player2.h  
        player2.dy = 0 
        player2.landed = true 
        end
    end
    if check_collision(player2, platform2) then
        if player2.y + player2.h <= platform2.y + platform2.h and player2.dy > 0 then
        player2.y = platform2.y - player2.h 
        player2.dy = 0  
        player2.landed = true
        end
    end
    if check_collision(player2, platform3) then
        if player2.y + player2.h <= platform3.y + platform3.h and player2.dy > 0 then
        player2.y = platform3.y - player2.h 
        player2.dy = 0  
        player2.landed = true 
        end
    end
    if check_collision(player2, platform4) then
        if player2.y + player2.h <= platform4.y + platform4.h and player2.dy > 0 then
        player2.y = platform4.y - player2.h 
        player2.dy = 0 
        player2.landed = true
        end
    end
    if check_collision1(player2, platform5) then
        if player2.y + player2.h <= platform5.y + platform5.h and player2.dy > 0 then
        player2.y = platform5.y - player2.h  
        player2.dy = 0 
        player2.landed = true 
        end
    end

    if check_collision1(player1, wall_level2) then
        if player1.y + player1.h <= wall_level2.y + wall_level2.h and player1.dy > 0 then
        player1.y = wall_level2.y - player1.h 
        player1.dy = 0 
        player1.landed = true 
        end
    end
    if check_collision1(player2, wall_level2) then
        if player2.y + player2.h <= wall_level2.y + wall_level2.h and player2.dy > 0 then
        player2.y = wall_level2.y - player2.h 
        player2.dy = 0 
        player2.landed = true 
        end
    end
    --player2 cannot touch the switch
    if check_collision(player2, wall_player2) then
        if player2.dx > 0 then
            player2.x = wall_player2.x - 1.7 * 8
        end
    end
end

player1_touched_switch3_2_x = 0
player1_touched_switch3_2_y = 0
function collisions_for_switch3_2()
    if check_collision2(player1, switch3_2) then
        switch3_2.flip = true
        player1_touched_switch3_2_x = 1
        player1_touched_switch3_2_y = 1
    end
end

player2_touched_switch4_2_x = 0
player2_touched_switch4_2_y = 0
function collisions_for_switch4_2()
    if check_collision2(player2, switch4_2) then
        switch4_2.flip = true
        player2_touched_switch4_2_x=1
        player2_touched_switch4_2_y=1
    end
end

function update_map_level2a_to_level2b()
    if switch3_2.flip == true and switch4_2.flip == true then
      if map_offset_x < 44 then
        map_offset_x += 0.2
        if map_offset_x > 44 then
          map_offset_x = 44
        end
      end
  
      if map_offset_y < 12 then
        map_offset_y += 0.2
        if map_offset_y > 12 then
          map_offset_y = 12
        end
      elseif map_offset_y > 12 then
        map_offset_y -= 0.2
        if map_offset_y < 12 then
          map_offset_y = 12
        end
      end
  
      if map_offset_x == 44 and map_offset_y == 12 then
        player1.speed = 1.2
        player2.speed = 1.2
        gravity = 0.08
      else
        player1.speed = 0
        player2.speed = 0
        gravity = 0
        switch1_2.y=100 * 8
        switch2_2.y=100 * 8
        switch3_2.y = 100 * 8
        switch4_2.y = 100 * 8
        box1.y=100 * 8
        platform1.y = 100*8
        platform2.y = 100*8
        platform3.y=100 * 8
        platform4.y=100 * 8
        platform5.y=100 * 8
        platform_mover.y=100*8
        wall_level2.y=100*8
        wall_player2.y=100*8
        player1.x -= 1.5
        player2.x -= 1.5
        player1.y = 9 * 8
        player2.y = 9 * 8
      end
    else
      player1.speed = 1.2
      player2.speed = 1.2
      gravity = 0.08
    end
  
    if player1_touched_switch3_2_x == 1 then
      player1_touched_switch3_2_x = 0
    end
  
    if player1_touched_switch3_2_y == 1 then
      player1_touched_switch3_2_y = 0
    end
  
    if player2_touched_switch4_2_x == 1 then
      player2_touched_switch4_2_x = 0
    end
    if player2_touched_switch4_2_y == 1 then
      player2_touched_switch4_2_y = 0
    end
  end

  --spring
function level2b()
    if (player1.x>=59.599 and player1.x<=73 and player1.y==(24-12)*8 and btn(❎, 0) and player1.landed) then
        player1.speed=3
    else
        player1.speed = 1.2
    end
    -- if (player2.x>=59.599 and player2.x<=73 and player2.y==(24-12)*8 and btn(❎, 0) and player2.landed) then
     if   (player2.x>=59.599 and player2.x<=73 and player2.y==(24-12)*8 and btn(❎, 1) and player2.landed) then
        player2.speed=3
    else 
        player2.speed = 1.2
    end
 
end

player1_touched_switch1_2b_x = 0
player1_touched_switch1_2b_y = 0
function collisions_for_switch1_2b()
    if check_collision2(player1, switch1_2b) then
        switch1_2b.flip = true
        player1_touched_switch1_2b_x = 1
        player1_touched_switch1_2b_y = 1
    end
end

player2_touched_switch2_2b_x = 0
player2_touched_switch2_2b_y = 0
function collisions_for_switch2_2b()
    if check_collision2(player2, switch2_2b) then
        switch2_2b.flip = true
        player2_touched_switch2_2b_x=1
        player2_touched_switch2_2b_y=1
    end
end

function update_map_level2b_to_level3a()
    if switch1_2b.flip==true and switch2_2b.flip==true then
        map_offset_x2=60
        map_offset_y2=15
        map_offset_x=60
        map_offset_y=15

        if player1_touched_switch1_2b_x==1 then
        player1.x=2
        player1_touched_switch1_2b_x=0
        end


        if player1_touched_switch1_2b_y==1 then
        player1.y=7*8
        player1_touched_switch1_2b_y=0
        end
       
        if player2_touched_switch2_2b_x==1 then
        player2.x=14
        player2_touched_switch2_2b_x=0
        end
        if player2_touched_switch2_2b_y==1 then
        player2.y=7*8
        player2_touched_switch2_2b_y=0
        end
        load("level3.p8")
    end
end


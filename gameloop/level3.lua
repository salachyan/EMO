function level3a()
    -- Check for collisions with the box5_3 for player1
    box5_3.dy+=gravity
    if check_collision(player1, box5_3) and player1.landed==true then
        if player1.dx > 0 and (box5_3.x > player1.x) then
            player1.x = box5_3.x - 1.8 * 8
        end
        if player1.dx < 0 and (box5_3.x < player1.x) then
            player1.x = box5_3.x + 7
        end
    end

    -- Check for collisions with the box5_3 for player2
    if check_collision(player2, box5_3) and player2.landed == true then
        -- Move player2 back based on the direction they are moving
        if player2.dx > 0 and (box5_3.x > player2.x) then
            player2.x = box5_3.x - 1.8 * 8  
            box5_3.x = box5_3.x + player2.dx
                if box5_3.x>(69-60)*8 then
                    box5_3.x=(69-60)*8
                end
        end
        if player2.dx < 0 and (box5_3.x < player2.x) then
            player2.x = box5_3.x + 7
        end
    end

    box5_3.x+=box5_3.dx
    box5_3.y+=box5_3.dy

    -- jump on top of the box5_3
    if check_collision2(player1, box5_3) then
        if player1.y + player1.sprite_h <= box5_3.y + box5_3.h * 8 and player1.dy > 0 then
        player1.y = box5_3.y - player1.sprite_h * 8 
        player1.dy = 0  
        player1.landed = true 
        end
    end

    if check_collision2(player2, box5_3) then
        if player2.y + player2.sprite_h <= box5_3.y + box5_3.h * 8 and player2.dy > 0 then
        player2.y = box5_3.y - player2.sprite_h * 8  
        player2.dy = 0  
        player2.landed = true 
        end
    end

    --check collision up and down
if box5_3.dy>0 then
    box5_3.falling=true
    box5_3.landed=false
    box5_3.jumping=false

    --   box5_3.dy=limit_speed(box5_3.dy,box5_3.max_dy)

    if map_collision(box5_3,"down",0,map_offset_y,map_offset_x) then
        box5_3.landed=true
        box5_3.falling=false
        box5_3.dy=0
        box5_3.y-=((box5_3.y+box5_3.h+1)%8)-1
    end
    elseif box5_3.dy<0 then
        box5_3.jumping=true
        if map_collision(box5_3,"up",1,map_offset_y,map_offset_x) then
        box5_3.dy=0
    end

    if box5_3.x<map_start then
      box5_3.x=map_start
    end
    if box5_3.x>map_end-box5_3.w then
        box5_3.x=map_end-box5_3.w
    end
  end

  --check collision left and right
  if box5_3.dx<0 then

  --   box5_3.dx=limit_speed(box5_3.dx,box5_3.max_dx)

    if map_collision(box5_3,"left",2,map_offset_y,map_offset_x) then
        box5_3.dx=0
    end
    elseif box5_3.dx>0 then

    --   box5_3.dx=limit_speed(box5_3.dx,box5_3.max_dx)

    if map_collision(box5_3,"right",3,map_offset_y,map_offset_x) then
        box5_3.dx=0
    end
  end

  -- Check for player1 and player2 collision with the switch1
    switch1_3_collision_count = 0
    if (check_collision2(player1, switch1_3) or check_collision2(player2, switch1_3)) then
        switch1_3_collision_count = switch1_3_collision_count + 1
    end
    if (switch1_3_collision_count % 2 == 1) then 
        switch1_3.flip = true
    end
    if (switch1_3_collision_count % 2 == 0) then 
        switch1_3.flip = false
    end


    if (check_collision2(player1, switch1_3) or check_collision2(player2, switch1_3)) and platform4_3.y<(24-11)*8 then
        platform1_3.y += 1
        platform2_3.y += 1
        platform3_3.y += 1
        platform4_3.y += 1
        platform5_3.y += 1
        -- platform6_3.y += 1
        switch2_3.y +=1
        platform_mover_3.y += 1
    end

    switch2_3_collision_count = 0
    -- Increment switch1_collision if collision occurs
    if (check_collision2(player1, switch2_3) or check_collision2(player2, switch2_3)) then
        switch2_3_collision_count = switch2_3_collision_count + 1
    end
    -- Toggle switch based on odd/even check
    if (switch2_3_collision_count % 2 == 1) then 
        switch2_3.flip = true
    end
    if (switch2_3_collision_count % 2 == 0) then 
        switch2_3.flip = false
    end


    if (check_collision2(player1, switch2_3) or check_collision2(player2, switch2_3)) and platform5_3.y>(21-11)*8 then
        platform1_3.y -= 1
        platform2_3.y -= 1
        platform3_3.y -= 1
        platform4_3.y -= 1
        platform5_3.y -= 1
        -- platform6_3.y -= 1
        switch2_3.y -=1
        platform_mover_3.y -= 1
    end
    -- if (player1.x==(38-30)*8 and player.y==(21-12)*8) or (player1.x==(32-30)*8 and player.y==(21-12)*8) then
    --     playerdx=0.8
    -- end
    -- Check for player1 and player2 collision with the platform
    if check_collision1(player1, platform1_3) then
        if player1.y + player1.h <= platform1_3.y + platform1_3.h and player1.dy > 0 then
        player1.y = platform1_3.y - player1.h  
        player1.dy = 0  
        player1.landed = true 
        elseif player1.y >= platform1_3.y + platform1_3.h and player1.dy < 0 then
            player1.y = platform1_3.y + platform1_3.h  
            player1.dy = 0  
        end
    end
    if check_collision(player1, platform2_3) then
        if player1.y + player1.h <= platform2_3.y + platform2_3.h and player1.dy > 0 then
        player1.y = platform2_3.y - player1.h  
        player1.dy = 0  
        player1.landed = true 
        elseif player1.y >= platform2_3.y + platform2_3.h and player1.dy < 0 then
            player1.y = platform2_3.y + platform2_3.h 
            player1.dy = 0  
        end
    end
    if check_collision(player1, platform3_3) then
        if player1.y + player1.h <= platform3_3.y + platform3_3.h and player1.dy > 0 then
        player1.y = platform3_3.y - player1.h  
        player1.dy = 0  
        player1.landed = true 
        elseif player1.y >= platform3_3.y + platform3_3.h and player1.dy < 0 then
            player1.y = platform3_3.y + platform3_3.h  
            player1.dy = 0  
        end
    end
    if check_collision1(player1, platform4_3) then
        if player1.y + player1.h <= platform4_3.y + platform4_3.h and player1.dy > 0 then
        player1.y = platform4_3.y - player1.h  
        player1.dy = 0  
        player1.landed = true 
        elseif player1.y >= platform4_3.y + platform4_3.h and player1.dy < 0 then
            player1.y = platform4_3.y + platform4_3.h 
            player1.dy = 0 
        end
    end

    --platform collision for player2
    if check_collision1(player2, platform1_3) then
        if player2.y + player2.h <= platform1_3.y + platform1_3.h and player2.dy > 0 then
        player2.y = platform1_3.y - player2.h  
        player2.dy = 0  
        player2.landed = true 
        end
    end
    if check_collision(player2, platform2_3) then
        if player2.y + player2.h <= platform2_3.y + platform2_3.h and player2.dy > 0 then
        player2.y = platform2_3.y - player2.h  
        player2.dy = 0  
        player2.landed = true 
        end
    end
    if check_collision(player2, platform3_3) then
        if player2.y + player2.h <= platform3_3.y + platform3_3.h and player2.dy > 0 then
        player2.y = platform3_3.y - player2.h  
        player2.dy = 0  
        player2.landed = true 
        end
    end
    if check_collision1(player2, platform4_3) then
        if player2.y + player2.h <= platform4_3.y + platform4_3.h and player2.dy > 0 then
        player2.y = platform4_3.y - player2.h 
        player2.dy = 0  
        player2.landed = true 
        end
    end
    -- if check_collision1(player2, platform5_3) then
    --     if player2.y + player2.h <= platform5_3.y + platform5_3.h and player2.dy > 0 then
    --     player2.y = platform5_3.y - player2.h  -- Position player on top of the platform5_3
    --     player2.dy = 0  -- Reset vertical speed
    --     player2.landed = true -- Update grounded state
    --     end
    -- end

    if check_collision1(player1, wall_level3) then
        if player1.y + player1.h <= wall_level3.y + wall_level3.h and player1.dy > 0 then
        player1.y = wall_level3.y - player1.h  
        player1.dy = 0  
        player1.landed = true 
        end
    end
    if check_collision1(player2, wall_level3) then
        if player2.y + player2.h <= wall_level3.y + wall_level3.h and player2.dy > 0 then
        player2.y = wall_level3.y - player2.h  
        player2.dy = 0 
        player2.landed = true 
        end
    end
    --player2 cannot touch the switch
    if check_collision(player2, wall_player2_3) then
        if player2.dx > 0 then
            player2.x = wall_player2_3.x - 1.7 * 8
        end
    end
    
end

player1_touched_switch3_3_x = 0
player1_touched_switch3_3_y = 0
function collisions_for_switch3_3()
  if check_collision2(player1, switch3_3) then
    switch3_3.flip = true
    player1_touched_switch3_3_x = 1
    player1_touched_switch3_3_y = 1
  end
end

player2_touched_switch4_3_x = 0
player2_touched_switch4_3_y = 0
function collisions_for_switch4_3()
  if check_collision2(player2, switch4_3) then
    switch4_3.flip = true
    player2_touched_switch4_3_x=1
    player2_touched_switch4_3_y=1
  end
end
function update_map_level3a_to_level3b()
    if switch3_3.flip == true and switch4_3.flip == true then
      if map_offset_x < 74 then
        map_offset_x += 0.2
        if map_offset_x > 74 then
          map_offset_x = 74
        end
      end
  
      if map_offset_y < 13 then
        map_offset_y += 0.2
        if map_offset_y > 13 then
          map_offset_y = 13
        end
      elseif map_offset_y > 13 then
        map_offset_y -= 0.2
        if map_offset_y < 13 then
          map_offset_y = 13
        end
      end
  
      if map_offset_x == 74 and map_offset_y == 13 then
        player1.speed = 1.2
        player2.speed = 1.2
        gravity = 0.08
      else
        player1.speed = 0
        player2.speed = 0
        gravity = 0
        switch1_3.y=100 * 8
        switch2_3.y=100 * 8
        switch3_3.y = 100 * 8
        switch4_3.y = 100 * 8
        platform1_3.y=100 * 8
        platform2_3.y = 100*8
        platform3_3.y = 100*8
        platform4_3.y=100 * 8
        platform_mover_3.y=100 * 8
        wall_player2_3.y=100 * 8
        wall_level3.y=100*8
        box5_3.y=100*8
        floor1_3.y=100*8
        floor2_3.y =100*8
        floor3_3.y =100*8
        floor4_3.y = 100*8
        floor5_3.y = 100*8
        player1.x -= 1.5
        player2.x -= 1.5
        player1.y = 10 * 8
        player2.y = 10 * 8
      end
    else
      player1.speed = 1.2
      player2.speed = 1.2
      gravity = 0.08
    end
  
    if player1_touched_switch3_3_x == 1 then
      player1_touched_switch3_3_x = 0
    end
  
    if player1_touched_switch3_3_y == 1 then
      player1_touched_switch3_3_y = 0
    end
  
    if player2_touched_switch4_3_x == 1 then
      player2_touched_switch4_3_x = 0
    end
    if player2_touched_switch4_3_y == 1 then
      player2_touched_switch4_3_y = 0
    end
  end


function level3b()
    if check_collision(player1, box1_3) and player1.landed==true then
        if player1.dx > 0 and (box1_3.x > player1.x) then
            player1.x = box1_3.x - 1.8 * 8
        end
        if player1.dx < 0 and (box1_3.x < player1.x) then
          player1.x = box1_3.x + 7
        end
    end

    if check_collision(player2, box1_3) and player2.landed==true then
        if player2.dx > 0 and (box1_3.x > player2.x) then
            player2.x = box1_3.x - 1.8 * 8
        end
        if player2.dx < 0 and (box1_3.x < player2.x) then
          player2.x = box1_3.x + 7
        end
    end

    -- Check for collisions with the box1_3 for player2
    if check_collision(player2, box1_3) and check_collision(player1, box1_3) and player1.landed == true and player2.landed == true and box1_3.y<(26-13)*8 then
        -- Move player2 back based on the direction they are moving
        if player2.dx > 0 and (box1_3.x > player2.x) and box1_3.x<(78-74)*8 then
            player2.x = box1_3.x - 1.8 * 8  
            box1_3.x += player2.dx
            box2_3.x += player2.dx
            box3_3.x += player2.dx
            box4_3.x += player2.dx
            
        end
        if player2.dx < 0 and (box1_3.x < player2.x) then
          player2.x = box1_3.x + 7
        end
    end
    if box1_3.x>=(78-74)*8 and box1_3.y<(26-13)*8 then
        box1_3.y += 1
        box2_3.y += 1
        box3_3.y += 1
        box4_3.y += 1
        box1_3.x = (78-74)*8
        box2_3.x = (79-74)*8
        box3_3.x = (79-74)*8
        box4_3.x = (78-74)*8
    end
    --stand on top of box
    if check_collision2(player1, box3_3) then
        if (player1.y + player1.sprite_h <= box3_3.y + box3_3.h * 8 and player1.dy > 0) then
        player1.y = box3_3.y - player1.sprite_h * 8 
        player1.dy = 0  
        player1.landed = true 
        end
    end
    if check_collision2(player1, box4_3) then
        if player1.y + player1.sprite_h <= box4_3.y + box4_3.h * 8 and player1.dy > 0 then
        player1.y = box4_3.y - player1.sprite_h * 8 
        player1.dy = 0  
        player1.landed = true 
        end
    end
    if check_collision2(player2, box3_3) then
        if (player2.y + player2.sprite_h <= box3_3.y + box3_3.h * 8 and player2.dy > 0) then
        player2.y = box3_3.y - player2.sprite_h * 8 
        player2.dy = 0  
        player2.landed = true 
        end
    end
    if check_collision2(player2, box4_3) then
        if player2.y + player2.sprite_h <= box4_3.y + box4_3.h * 8 and player2.dy > 0 then
        player2.y = box4_3.y - player2.sprite_h * 8 
        player2.dy = 0  
        player2.landed = true 
        end
    end

    -- Check for collision with the switch3
    switch1_3b_collision_count = 0
    if (check_collision2(player1, switch1_3b) or check_collision2(player2, switch1_3b)) then
        switch1_3b_collision_count = switch1_3b_collision_count + 1
    end
    if (switch1_3b_collision_count % 2 == 1) then 
        switch1_3b.flip = true
    end
    if (switch1_3b_collision_count % 2 == 0) then 
        switch1_3b.flip = false
    end

    if (check_collision2(player1, switch1_3b) or check_collision2(player2, switch1_3b)) and platform1_3b.y<(28-13)*8 then
        platform1_3b.y += 1
        platform2_3b.y += 1
        platform3_3b.y += 1
        switch3_3b.y +=1
        switch4_3b.y +=1
        platform_mover_3b.y += 1
    end

    switch3_3b_collision_count = 0
    if (check_collision2(player1, switch3_3b) or check_collision2(player2, switch3_3b)) then
        switch3_3b_collision_count = switch3_3b_collision_count + 1
    end
    if (switch3_3b_collision_count % 2 == 1) then 
        switch3_3b.flip = true
    end
    if (switch3_3b_collision_count % 2 == 0) then 
        switch3_3b.flip = false
    end

    switch4_3b_collision_count = 0
    if (check_collision2(player1, switch4_3b) or check_collision2(player2, switch4_3b)) then
        switch4_3b_collision_count = switch4_3b_collision_count + 1
    end
    if (switch4_3b_collision_count % 2 == 1) then 
        switch4_3b.flip = true
    end
    if (switch4_3b_collision_count % 2 == 0) then 
        switch4_3b.flip = false
    end

    if (check_collision2(player1, switch3_3b) or check_collision2(player2, switch3_3b)) and (check_collision2(player1, switch4_3b) or check_collision2(player2, switch4_3b)) and platform_mover_3b.y>=(25-13)*8 then
        platform1_3b.y -= 1
        platform2_3b.y -= 1
        platform3_3b.y -= 1
        switch3_3b.y -= 1
        switch4_3b.y -= 1
        platform_mover_3b.y -= 1
    end

    --stand on top of box
    if check_collision2(player1, platform1_3b) then
        if (player1.y + player1.sprite_h <= platform1_3b.y + platform1_3b.h * 8 and player1.dy > 0) then
        player1.y = platform1_3b.y - player1.sprite_h * 8 
        player1.dy = 0  
        player1.landed = true 
        end
    end
    if check_collision2(player2, platform1_3b) then
        if (player2.y + player2.sprite_h <= platform1_3b.y + platform1_3b.h * 8 and player2.dy > 0) then
        player2.y = platform1_3b.y - player2.sprite_h * 8 
        player2.dy = 0  
        player2.landed = true 
        end
    end
    if check_collision2(player1, platform2_3b) then
        if player1.y + player1.sprite_h <= platform2_3b.y + platform2_3b.h * 8 and player1.dy > 0 then
        player1.y = platform2_3b.y - player1.sprite_h * 8 
        player1.dy = 0  
        player1.landed = true 
        end
    end
    if check_collision2(player2, platform2_3b) then
        if player2.y + player2.sprite_h <= platform2_3b.y + platform2_3b.h * 8 and player2.dy > 0 then
        player2.y = platform2_3b.y - player2.sprite_h * 8 
        player2.dy = 0  
        player2.landed = true 
        end
    end
    if check_collision2(player1, platform3_3b) then
        if (player1.y + player1.sprite_h <= platform3_3b.y + platform3_3b.h * 8 and player1.dy > 0) then
        player1.y = platform3_3b.y - player1.sprite_h * 8 
        player1.dy = 0  
        player1.landed = true 
        end
      end
    if check_collision2(player2, platform3_3b) then
        if (player2.y + player2.sprite_h <= platform3_3b.y + platform3_3b.h * 8 and player2.dy > 0) then
        player2.y = platform3_3b.y - player2.sprite_h * 8 
        player2.dy = 0  
        player2.landed = true 
        end
    end    

end

player1_touched_switch5_3b_x = 0
player1_touched_switch5_3b_y = 0
function collisions_for_switch5_3b()
  if check_collision2(player1, switch5_3b) then
    switch5_3b.flip = true
    player1_touched_switch5_3b_x = 1
    player1_touched_switch5_3b_y = 1
  end
end

player2_touched_switch6_3b_x = 0
player2_touched_switch6_3b_y = 0
function collisions_for_switch6_3b()
  if check_collision2(player2, switch6_3b) then
    switch6_3b.flip = true
    player2_touched_switch6_3b_x=1
    player2_touched_switch6_3b_y=1
  end
end

function update_map_level3b_to_climax()
    if switch5_3b.flip==true and switch6_3b.flip==true then
        map_offset_x2=60
        map_offset_y2=15
        map_offset_x=60
        map_offset_y=15

        if player1_touched_switch5_3b_x==1 then
        player1.x=2
        player1_touched_switch5_3b_x=0
        end


        if player1_touched_switch5_3b_y==1 then
        player1.y=7*8
        player1_touched_switch5_3b_y=0
        end
       
        if player2_touched_switch6_3b_x==1 then
        player2.x=14
        player2_touched_switch6_3b_x=0
        end
        if player2_touched_switch6_3b_y==1 then
        player2.y=7*8
        player2_touched_switch6_3b_y=0
        end
        load("climax.p8")
    end
end
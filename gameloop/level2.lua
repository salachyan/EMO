  function level2()
    -- Check for collisions with the box for player1
    condition1 = player1.dx < 0 and ((box.x+8) < player1.x)
    if check_collision(player1, box) and player1.landed==true then
        -- Move player1 back based on the direction they are moving
        if player1.dx > 0 and (box.x > player1.x) then
        player1.x = box.x - 1.50 * 8  -- Push player to the left
        box.x = box.x + player1.dx
            if box.x>8*8 then
                box.x=8*8
            end
        elseif player1.dx < 0 and (box.x < player1.x) then
            player1.x = box.x + 3  -- Push player to the right
            box.x = box.x + player1.dx
        end
    end


    -- Check for collisions with the box for player2
    if check_collision(player2, box) and player2.landed == true then
        -- Move player2 back based on the direction they are moving
        if player2.dx > 0 and (box.x > player2.x) then
            player2.x = box.x - 2 * 8  -- Push player to the left
            box.x = box.x + player2.dx
                if box.x>8*8 then
                    box.x=8*8
                end
        elseif player2.dx < 0 and (box.x < player2.x) then
            player2.x = box.x + 3  -- Push player to the right
            box.x = box.x + player2.dx
        end
    end
    -- box.x += box.dx

    -- Allow players to jump on top of the box
    if is_colliding_with_box(player1, box) then
        -- Check if the player is falling onto the box
        if player1.y + player1.sprite_h <= box.y + box.h * 8 and player1.dy > 0 then
        player1.y = box.y - player1.sprite_h * 8  -- Position player on top of the box
        player1.dy = 0  -- Reset vertical speed
        player1.landed = true -- Update grounded state
        end
    end

    if is_colliding_with_box(player2, box) then
        -- Check if the player is falling onto the box
        if player2.y + player2.sprite_h <= box.y + box.h * 8 and player2.dy > 0 then
        player2.y = box.y - player2.sprite_h * 8  -- Position player on top of the box
        player2.dy = 0  -- Reset vertical speed
        player2.landed = true -- Update grounded state
        end
    end

    -- Check for player1 and player2 collision with the switch1
    switch1_2_collision_count = 0
    -- Increment switch1_collision if collision occurs
    if (check_collision(player1, switch1_2) or check_collision(player2, switch1_2)) then
        switch1_2_collision_count = switch1_2_collision_count + 1
    end
    -- Toggle switch based on odd/even check
    if (switch1_2_collision_count % 2 == 1) then -- Odd number
        switch1_2.flip = true
    end
    if (switch1_2_collision_count % 2 == 0) then -- Even number
        switch1_2.flip = false
    end


    if (check_collision(player1, switch1_2) or check_collision(player2, switch1_2)) and platform6.y<95 then
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
    -- Increment switch1_collision if collision occurs
    if (check_collision(player1, switch2_2) or check_collision(player2, switch2_2)) then
        switch2_2_collision_count = switch2_2_collision_count + 1
    end
    -- Toggle switch based on odd/even check
    if (switch2_2_collision_count % 2 == 1) then -- Odd number
        switch2_2.flip = true
    end
    if (switch2_2_collision_count % 2 == 0) then -- Even number
        switch2_2.flip = false
    end


    if (check_collision(player1, switch2_2) or check_collision(player2, switch2_2)) and platform1.y>72 then
        platform1.y -= 1
        platform2.y -= 1
        platform3.y -= 1
        platform4.y -= 1
        platform5.y -= 1
        platform6.y -= 1
        switch2_2.y -=1
        platform_mover.y -= 1
    end

    -- Check for player1 and player2 collision with the platform
    if check_collision(player1, platform1) then
        if player1.y + player1.sprite_h <= platform1.y + platform1.h * 8 and player1.dy > 0 then
        player1.y = platform1.y - player1.sprite_h * 8  -- Position player on top of the platform1
        player1.dy = 0  -- Reset vertical speed
        player1.landed = true -- Update grounded state
        end
    end
    if check_collision(player1, platform2) then
        if player1.y + player1.sprite_h <= platform2.y + platform2.h * 8 and player1.dy > 0 then
        player1.y = platform2.y - player1.sprite_h * 8  -- Position player on top of the platform2
        player1.dy = 0  -- Reset vertical speed
        player1.landed = true -- Update grounded state
        end
    end
    if check_collision(player1, platform3) then
        if player1.y + player1.sprite_h <= platform3.y + platform3.h * 8 and player1.dy > 0 then
        player1.y = platform3.y - player1.sprite_h * 8  -- Position player on top of the platform3
        player1.dy = 0  -- Reset vertical speed
        player1.landed = true -- Update grounded state
        end
    end
    if check_collision(player1, platform4) then
        if player1.y + player1.sprite_h <= platform4.y + platform4.h * 8 and player1.dy > 0 then
        player1.y = platform4.y - player1.sprite_h * 8  -- Position player on top of the platform4
        player1.dy = 0  -- Reset vertical speed
        player1.landed = true -- Update grounded state
        end
    end
    if check_collision(player1, platform5) then
        if player1.y + player1.sprite_h <= platform5.y + platform5.h * 8 and player1.dy > 0 then
        player1.y = platform5.y - player1.sprite_h * 8  -- Position player on top of the platform5
        player1.dy = 0  -- Reset vertical speed
        player1.landed = true -- Update grounded state
        end
    end

    --platform collision for player2
    if check_collision(player2, platform1) then
        if player2.y + player2.sprite_h <= platform1.y + platform1.h * 8 and player2.dy > 0 then
        player2.y = platform1.y - player2.sprite_h * 8  -- Position player on top of the platform1
        player2.dy = 0  -- Reset vertical speed
        player2.landed = true -- Update grounded state
        end
    end
    if check_collision(player2, platform2) then
        if player2.y + player2.sprite_h <= platform2.y + platform2.h * 8 and player2.dy > 0 then
        player2.y = platform2.y - player2.sprite_h * 8  -- Position player on top of the platform2
        player2.dy = 0  -- Reset vertical speed
        player2.landed = true -- Update grounded state
        end
    end
    if check_collision(player2, platform3) then
        if player2.y + player2.sprite_h <= platform3.y + platform3.h * 8 and player2.dy > 0 then
        player2.y = platform3.y - player2.sprite_h * 8  -- Position player on top of the platform3
        player2.dy = 0  -- Reset vertical speed
        player2.landed = true -- Update grounded state
        end
    end
    if check_collision(player2, platform4) then
        if player2.y + player2.sprite_h <= platform4.y + platform4.h * 8 and player2.dy > 0 then
        player2.y = platform4.y - player2.sprite_h * 8  -- Position player on top of the platform4
        player2.dy = 0  -- Reset vertical speed
        player2.landed = true -- Update grounded state
        end
    end
    if check_collision(player2, platform5) then
        if player2.y + player2.sprite_h <= platform5.y + platform5.h * 8 and player2.dy > 0 then
        player2.y = platform5.y - player2.sprite_h * 8  -- Position player on top of the platform5
        player2.dy = 0  -- Reset vertical speed
        player2.landed = true -- Update grounded state
        end
    end


    -- --check if players are colliding from below platform
    -- if is_colliding_with_platform_from_below(player2, platform1) or is_colliding_with_platform_from_below(player2, platform2) or is_colliding_with_platform_from_below(player2, platform3) or is_colliding_with_platform_from_below(player2, platform4) or is_colliding_with_platform_from_below(player2, platform5) then
    --     -- Prevent player from going above the box
    --     player2.y = ly2
    -- end
    -- if is_colliding_with_platform_from_below(player1, platform1) or is_colliding_with_platform_from_below(player1, platform2) or is_colliding_with_platform_from_below(player1, platform3) or is_colliding_with_platform_from_below(player1, platform4) or is_colliding_with_platform_from_below(player1, platform5) then
    --     -- Prevent player from going above the box
    --     player1.y = ly1
    -- end

end
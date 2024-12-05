function _update()
    if screen=="menu" then
        map_offset_x=0
        map_offset_t=0
    end
    
    --detect if the down button is pressed and released
    if btn(⬇️, 0) and not last_btn_state_down then
        btn_count += 1
        last_btn_state_down = true  --button is now pressed
    elseif not btn(⬇️, 0) and last_btn_state_down then
        last_btn_state_down = false  --button has been released
    end

    if btn(⬆️, 0) and not last_btn_state_up then
        btn_count -= 1
        last_btn_state_up = true 
    elseif not btn(⬆️, 0) and last_btn_state_up then
        last_btn_state_up = false 
    end

    --cycle button selection with wraparound behavior
    if btn_count > 3 then
        btn_count = 1
    elseif btn_count < 1 then
        btn_count = 3
    end
    
    --set button outline colors based on button selection
    if btn_count == 1 then
        color_outline_start = 8
        color_outline_inst = 7
        color_outline_lvl = 7
    elseif btn_count == 2 then
        color_outline_start = 7
        color_outline_inst = 8
        color_outline_lvl = 7
    elseif btn_count == 3 then
        color_outline_start = 7
        color_outline_inst = 7
        color_outline_lvl = 8
    end

    if color_outline_start==8 and btn(❎, 0) then
        load("level1.p8")
    end
    if lvl_condition then
        map_offset_x=0
        map_offset_y=17
    end
    if inst_condition then
        map_offset_x=17
        map_offset_y=17
    end

    if map_offset_x==0 and map_offset_y==17 then
        screen = "level"
    elseif map_offset_x==0 and map_offset_y==0 then
        screen = "menu"
    elseif map_offset_x==17 and map_offset_y==17 then
        screen = "inst"
    end

    if player1.spz<4.9 then
        player1.spz = player1.spz + .08
    else
    player1.spz = 1
    end

    player1.x+=player1.dx
    player1.y+=player1.dy
    --animation player2
    if player2.spz<4.9 then
        player2.spz = player2.spz + .05
    else
        player2.spz = 1
    end

    player2.x+=player2.dx
    player2.y+=player2.dy
end
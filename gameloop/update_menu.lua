function _update()
    if map_offset_x==0 and map_offset_t==0 then
        screen="menu"
    end
    
    if screen=="menu" then
        menu() 
        color_outline_menu_lvl = 7
        if color_outline_lvl == 8 and btnp(❎, 0) then
            lvl_condition=true
            menu_condition = false
            
        end
    elseif screen == "level" then
        level()
        color_outline_lvl = 7
        if color_outline_menu_lvl==8 and btnp(❎, 0) then
            menu_condition=true
            lvl_condition = false
        end
    end
    

    if lvl_condition then
        map_offset_x=0
        map_offset_y=16
        -- btn_count_lvl = 1
    elseif inst_condition then
        map_offset_x=17
        map_offset_y=17
    elseif menu_condition then
        map_offset_x=0
        map_offset_y=0
        screen = "menu"
    end
    

    if map_offset_x==0 and map_offset_y==16 then
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

function menu() 
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
        load("prologue.p8")
    end
end

function level()
    --detect if the down button is pressed and released
    if btn(⬇️, 0) and not last_btn_state_down_lvl then
        btn_count_lvl -= 1
        last_btn_state_down_lvl = true  --button is now pressed
    elseif not btn(⬇️, 0) and last_btn_state_down_lvl then
        last_btn_state_down_lvl = false  --button has been released
    end

    if btn(⬆️, 0) and not last_btn_state_up_lvl then
        btn_count_lvl += 1
        last_btn_state_up_lvl = true 
    elseif not btn(⬆️, 0) and last_btn_state_up_lvl then
        last_btn_state_up_lvl = false 
    end

    --cycle button selection with wraparound behavior
    if btn_count_lvl > 7 then
        btn_count_lvl = 1
    elseif btn_count_lvl < 1 then
        btn_count_lvl = 7
    end
    
    --set button outline colors based on button selection
    if btn_count_lvl == 1 then
        color_outline_prologue = 7
        color_outline_lvl1 = 7
        color_outline_lvl2 = 7
        color_outline_lvl3 = 7
        color_outline_boulder = 7
        color_outline_menu_lvl=7
    elseif btn_count_lvl == 2 then
        color_outline_prologue = 8
        color_outline_lvl1 = 7
        color_outline_lvl2 = 7
        color_outline_lvl3 = 7
        color_outline_boulder = 7
        color_outline_menu_lvl=7
    elseif btn_count_lvl == 3 then
        color_outline_prologue = 7
        color_outline_lvl1 = 8
        color_outline_lvl2 = 7
        color_outline_lvl3 = 7
        color_outline_boulder = 7
        color_outline_menu_lvl=7
    elseif btn_count_lvl == 4 then
        color_outline_prologue = 7
        color_outline_lvl1 = 7
        color_outline_lvl2 = 8
        color_outline_lvl3 = 7
        color_outline_boulder = 7
        color_outline_menu_lvl=7
    elseif btn_count_lvl == 5 then
        color_outline_prologue = 7
        color_outline_lvl1 = 7
        color_outline_lvl2 = 7
        color_outline_lvl3 = 8
        color_outline_boulder = 7
        color_outline_menu_lvl=7
    elseif btn_count_lvl == 6 then
        color_outline_prologue = 7
        color_outline_lvl1 = 7
        color_outline_lvl2 = 7
        color_outline_lvl3 = 7
        color_outline_boulder = 8
        color_outline_menu_lvl=7
    elseif btn_count_lvl == 7 then
        color_outline_prologue = 7
        color_outline_lvl1 = 7
        color_outline_lvl2 = 7
        color_outline_lvl3 = 7
        color_outline_boulder = 7
        color_outline_menu_lvl=8
    end

    if color_outline_prologue==8 and btn(❎, 0) then
        load("prologue.p8")
    
    elseif color_outline_lvl1==8 and btn(❎, 0) then
        load("level1.p8")
    elseif color_outline_lvl2==8 and btn(❎, 0) then
        load("level2.p8")
    elseif color_outline_lvl3==8 and btn(❎, 0) then
        load("level3.p8")
    elseif color_outline_boulder==8 and btn(❎, 0) then
        load("climax.p8")
    -- elseif color_outline_menu_lvl==8 and btn(❎, 0) then
    --     map_offset_x=0
    --     map_offset_y=0
    --     menu_condition=true
    --     -- lvl_condition = false
    end
end
function _draw()
    cls()
    map(map_offset_x, map_offset_y, 0, 0, 32, 32)

    if screen=="start" then
    elseif screen=="menu" then
        spr(player1.frames[flr(player1.spz)], player1.x, player1.y, 2, 2, player1.flp)
        spr(player2.frames[flr(player2.spz)], player2.x, player2.y, 2, 2, player2.flip)
        title_page() 
        buttons_menu()
    elseif screen=="inst" then
    elseif screen=="level" then
        title_lvl() 
        -- buttons_lvl()
        plot_diagram() 
    end

    if (time() - time_start) > 1 then
        map_offset_x=34+(17)
    end
    if (time() - time_start) > 2 then
        map_offset_x=34
    end

    if color_outline_lvl == 8 and btn(❎, 0) then
        lvl_condition=true
    end
    if color_outline_inst == 8 and btn(❎, 0) then
        inst_condition=true
    end

    if (time() - time_start) > 3.5 and lvl_condition==false and inst_condition==false then
        screen="menu"
    end
    

    -- print("screen: "..tostring(color_outline_inst==8), map_offset_x,  map_offset_y+30, 14)
    -- print("map_offset_x: "..tostring(map_offset_x), map_offset_x,  map_offset_y+40, 14)
    -- print("map_offset_y: "..tostring(map_offset_y), map_offset_x,  map_offset_y+50, 14)
    -- print("screen: "..tostring(screen), map_offset_x,  map_offset_y+60, 14)
    -- print("inst_condition: "..tostring(inst_condition), map_offset_x,  map_offset_y+70, 14)
    
    
end

--main menu functions
function title_page() 
    local tb_main_x = 31
    local tb_main_y = 1
    local tb_main_width = 66  
    local tb_main_height = 3*8  

    rectfill(tb_main_x, tb_main_y, tb_main_x + tb_main_width, tb_main_y + tb_main_height, 15)

    spr(e_title.sp, e_title.x, e_title.y, 2, 2)
    spr(m_title.sp, m_title.x, m_title.y, 2, 2)
    spr(o_title.sp, o_title.x, o_title.y, 2, 2)
    spr(dot_title.sp, dot_title.x, dot_title.y, 1, 1)

    local tb_x = 0
    local tb_y = 22
    local tb_width = 160  
    local tb_height = 8  

    rectfill(tb_x, tb_y, tb_x + tb_width, tb_y + tb_height, 15)
    print("(educational multiplayer game)",3,24,3)
end

function buttons_menu()
    --play game button
    local tb_x = 29
    local tb_y = 35
    local tb_w = 70  
    local tb_h = 2*8  

    rectfill(tb_x, tb_y, tb_x + tb_w, tb_y + tb_h, 9)
    --border
    rect(tb_x, tb_y, tb_x + tb_w, tb_y + tb_h, color_outline_start)
    print("start game",45,tb_y+6,1)

    --instructions button
    local tb_x = 29
    local tb_y = 55
    local tb_w = 70  
    local tb_h = 2*8  

    rectfill(tb_x, tb_y, tb_x + tb_w, tb_y + tb_h, 9)
    --border
    rect(tb_x, tb_y, tb_x + tb_w, tb_y + tb_h, color_outline_inst)
    print("instructions",42,tb_y+6,1)

    --level selection
    local tb_x = 29
    local tb_y = 75
    local tb_w = 70  
    local tb_h = 2*8  

    rectfill(tb_x, tb_y, tb_x + tb_w, tb_y + tb_h, 9)
    --border
    rect(tb_x, tb_y, tb_x + tb_w, tb_y + tb_h, color_outline_lvl)
    print("level selection",35,tb_y+6,1)
end

--lvl functions
function title_lvl() 
    local tb_x = 30
    local tb_y = 5
    local tb_width = 70  
    local tb_height = 12  

    rectfill(tb_x, tb_y, tb_x + tb_width, tb_y + tb_height, 15)
    print("level selection",36,9,3)
end

function buttons_lvl()
    --level1
    local tb_x = 29
    local tb_y = 35
    local tb_w = 70  
    local tb_h = 2*8  

    rectfill(tb_x, tb_y, tb_x + tb_w, tb_y + tb_h, 9)
    --border
    rect(tb_x, tb_y, tb_x + tb_w, tb_y + tb_h, color_outline_start)
    print("level 1",47,tb_y+6,1)

    --level2
    local tb_x = 29
    local tb_y = 55
    local tb_w = 70  
    local tb_h = 2*8  

    rectfill(tb_x, tb_y, tb_x + tb_w, tb_y + tb_h, 9)
    --border
    rect(tb_x, tb_y, tb_x + tb_w, tb_y + tb_h, color_outline_inst)
    print("level 2",47,tb_y+6,1)

    --level3
    local tb_x = 29
    local tb_y = 75
    local tb_w = 70  
    local tb_h = 2*8  

    rectfill(tb_x, tb_y, tb_x + tb_w, tb_y + tb_h, 9)
    --border
    rect(tb_x, tb_y, tb_x + tb_w, tb_y + tb_h, color_outline_lvl)
    print("level 3",47,tb_y+6,1)

    -- --menu
    -- local tb_x = 29
    -- local tb_y = 95
    -- local tb_w = 70  
    -- local tb_h = 2*8  

    -- rectfill(tb_x, tb_y, tb_x + tb_w, tb_y + tb_h, 9)
    -- --border
    -- rect(tb_x, tb_y, tb_x + tb_w, tb_y + tb_h, color_outline_lvl)
    -- print("menu",47,tb_y+6,1)
end

--plot diagram
function plot_diagram() 
    spr(exposition_line1.sp, exposition_line1.x, exposition_line1.y, 2, 2)
    spr(exposition_line2.sp, exposition_line2.x, exposition_line2.y, 2, 2)
end

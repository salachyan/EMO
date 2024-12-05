function _draw()
    cls()
    map(map_offset_x, map_offset_y, 0, 0, 32, 32)

    
    title_page() 
    buttons()
    
end

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

function buttons()
    --play game button
    local tb_x = 29
    local tb_y = 35
    local tb_w = 70  
    local tb_h = 2*8  

    rectfill(tb_x, tb_y, tb_x + tb_w, tb_y + tb_h, 9)
    --border
    rect(tb_x, tb_y, tb_x + tb_w, tb_y + tb_h, 7)
    print("start game",45,tb_y+6,1)

    --instructions button
    local tb_x = 29
    local tb_y = 55
    local tb_w = 70  
    local tb_h = 2*8  

    rectfill(tb_x, tb_y, tb_x + tb_w, tb_y + tb_h, 9)
    --border
    rect(tb_x, tb_y, tb_x + tb_w, tb_y + tb_h, 7)
    print("instructions",42,tb_y+6,1)

    --level selection
    local tb_x = 29
    local tb_y = 75
    local tb_w = 70  
    local tb_h = 2*8  

    rectfill(tb_x, tb_y, tb_x + tb_w, tb_y + tb_h, 9)
    --border
    rect(tb_x, tb_y, tb_x + tb_w, tb_y + tb_h, 7)
    print("level selection",36,tb_y+6,1)

end


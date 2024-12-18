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
        instructions_print() 
    elseif screen=="level" then
        title_lvl() 
        plot_diagram() 
    end

    if (time() - time_start) > 1 and screen~="level" then
        map_offset_x=34+(17)
    end
    if (time() - time_start) > 2 and screen~="level" then
        map_offset_x=34
    end
    if (time() - time_start) > 3.5 and screen~="level" then
        map_offset_x=0
        map_offset_y=0
    end

    if (time() - time_start) > 3.5 and lvl_condition==false and inst_condition==false then
        map_offset_x=0
        map_offset_y=0
    end
    

    -- print("screen: "..tostring(screen), map_offset_x,  map_offset_y+30, 10)
    -- print("btnp(❎, 0): "..tostring(btnp(❎, 0)), map_offset_x,  map_offset_y+40, 10)
    -- print("menu_condition: "..tostring(menu_condition), map_offset_x,  map_offset_y+50, 10)
    -- print("inst_condition: "..tostring(inst_condition), map_offset_x,  map_offset_y+60, 10)
    -- print("menu_cond: "..tostring(color_outline_menu_lvl==8 and btn(❎, 0)), map_offset_x,  map_offset_y+70, 10)
    
    
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
    print("(educational multiplayer outlet)",0.9,24,3)
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
    rect(tb_x, tb_y, tb_x + tb_width, tb_y + tb_height, 3)
    print("level selection",36,9,3)
end

--plot diagram
function plot_diagram() 
    spr(exposition_line1.sp, exposition_line1.x, exposition_line1.y, 2, 2)
    spr(conflict.sp, conflict.x, conflict.y, 1, 1)
    spr(rising1.sp, rising1.x, rising1.y, 2, 2)
    spr(rising2.sp, rising2.x, rising2.y, 2, 2)
    spr(rising3.sp, rising3.x, rising3.y, 2, 2)
    spr(rising4.sp, rising4.x, rising4.y, 2, 2)
    spr(falling1.sp, falling1.x, falling1.y, 2, 2)
    spr(falling2.sp, falling2.x, falling2.y, 2, 2)
    spr(falling3a.sp, falling3a.x, falling3a.y, 1, 1)
    spr(falling3b.sp, falling3b.x, falling3b.y, 1, 1)
    spr(falling3c.sp, falling3c.x, falling3c.y, 1, 1)
    spr(resolution.sp, resolution.x, resolution.y, 2, 2)

    print("exposition",0.5*8,(30-17)*8,7)
    print("conflict",5*8,95,0)
    print("rising",3*8,(23-17)*8,0)
    print("action",3*8,(24-17)*8,0)
    print("climax",58,(20-17)*8,0)
    print("falling",12*8,(23-17)*8,0)
    print("action",12*8,(24-17)*8,0)
    print("resolution",11*8,(27-17)*8,0)

    --level selection
    local tb_x = 0*8
    local tb_y = (27.8-17)*8
    local tb_w = 4.4*8  
    local tb_h = 8.5

    rectfill(tb_x, tb_y, tb_x + tb_w, tb_y + tb_h, 9)
    rect(tb_x, tb_y, tb_x + tb_w, tb_y + tb_h, color_outline_prologue)
    print("prologue",0.3*8,(28-17)*8,1)


    local tb_x1 = 0.4*8
    local tb_y1 = (26.5-17)*8
    local tb_w1 = 4.3*8  
    local tb_h1 = 8.5
    rectfill(tb_x1, tb_y1, tb_x1 + tb_w1, tb_y1 + tb_h1, 9)
    rect(tb_x1, tb_y1, tb_x1 + tb_w1, tb_y1 + tb_h1, color_outline_lvl1)
    print("level 1",0.9*8,(26.8-17)*8,1)

    local tb_x2 = 10.5
    local tb_y2 = (25.2-17)*8
    local tb_w2 = 4.3*8  
    local tb_h2 = 8.5
    rectfill(tb_x2, tb_y2, tb_x2 + tb_w2, tb_y2 + tb_h2, 9)
    rect(tb_x2, tb_y2, tb_x2 + tb_w2, tb_y2 + tb_h2, color_outline_lvl2)
    print("level 2",14,(25.5-17)*8,1)
    
    local tb_x3 = 18.9
    local tb_y3 = (21.4-17)*8
    local tb_w3 = 4.3*8  
    local tb_h3 = 8.5
    rectfill(tb_x3, tb_y3, tb_x3 + tb_w3, tb_y3 + tb_h3, 9)
    rect(tb_x3, tb_y3, tb_x3 + tb_w3, tb_y3 + tb_h3, color_outline_lvl3)
    print("level 3",22,(21.7-17)*8,1)
    
    local tb_x4 = 10.5*8
    local tb_y4 = (20.2-17)*8
    local tb_w4 = 4.3*8  
    local tb_h4 = 8.5*2
    rectfill(tb_x4, tb_y4, tb_x4 + tb_w4, tb_y4 + tb_h4, 9)
    rect(tb_x4, tb_y4, tb_x4 + tb_w4, tb_y4 + tb_h4, color_outline_boulder)
    print("boulder",11*8,(20.5-17)*8,1)
    print("stage",11*8,(21.5-17)*8,1)

    local tb_x4 = 9.5*8
    local tb_y4 = (29-17)*8
    local tb_w4 = 3*8*2  
    local tb_h4 = 8.5*2
    rectfill(tb_x4, tb_y4, tb_x4 + tb_w4, tb_y4 + tb_h4, 9)
    rect(tb_x4, tb_y4, tb_x4 + tb_w4, tb_y4 + tb_h4, color_outline_menu_lvl)
    print("post-game",10.2*8,(29.3-17)*8,1)
    print("questions",10.2*8,((29.3-17)*8)+8,1)
end

function instructions_print() 
    --title instructions
    local tb_x = 30
    local tb_y = 5
    local tb_width = 70  
    local tb_height = 12  

    rectfill(tb_x, tb_y, tb_x + tb_width, tb_y + tb_height, 15)
    rect(tb_x, tb_y, tb_x + tb_width, tb_y + tb_height, 3)
    print("basic controls",36,9,3)

    local tb_x1 = (19-17)*8
    local tb_y1 = (19-16)*8
    local tb_w1 = 3*8  
    local tb_h1 = 8.5*2
    rectfill(tb_x1, tb_y1, tb_x1 + tb_w1, tb_y1 + tb_h1, 15)
    print("move",tb_x1+4,tb_y1+2,0)
    print("left",tb_x1+4,tb_y1+10,0)

    local tb_x2 = (28-17)*8
    local tb_y2 = (19-16)*8
    local tb_w2 = 3*8  
    local tb_h2 = 8.5*2
    rectfill(tb_x2, tb_y2, tb_x2 + tb_w2, tb_y2 + tb_h2, 15)
    print("move",tb_x2+3,tb_y2+2,0)
    print("right",tb_x2+3,tb_y2+10,0)

    print("a",(19.1-17)*8,(22.7-16)*8,0)
    print("b",(19.1-17)*8,(26.7-16)*8,0)

    local tb_x3 = (22-17)*8
    local tb_y3 = (22.5-16)*8
    local tb_w3 = 9*8  
    local tb_h3 = 8.5*3
    rectfill(tb_x3, tb_y3, tb_x3 + tb_w3, tb_y3 + tb_h3, 15)
    print("jump, continue",tb_x3+3,tb_y3+2,0)
    print("dialogue, or",tb_x3+2,tb_y3+10,0)
    print("select answers",tb_x3+2,tb_y3+18,0)

    local tb_x4 = (22-17)*8
    local tb_y4 = (26.5-16)*8
    local tb_w4 = 9.8*8  
    local tb_h4 = 8.5*4
    rectfill(tb_x4, tb_y4, tb_x4 + tb_w4, tb_y4 + tb_h4, 15)
    print("acknowledge ",tb_x4+2,tb_y4+2,0)
    print("feedback",tb_x4+2,tb_y4+10,0)
    print("from questions, or",tb_x4+2,tb_y4+18,0)
    print("return to menu page",tb_x4+2,tb_y4+26,0)

    -- local tb_x4 = 11.8*8
    -- local tb_y4 = (31.8-17)*8
    -- local tb_w4 = 3*8  
    -- local tb_h4 = 8.5
    -- rectfill(tb_x4, tb_y4, tb_x4 + tb_w4, tb_y4 + tb_h4, 15)
    -- rect(tb_x4, tb_y4, tb_x4 + tb_w4, tb_y4 + tb_h4, 8)
    -- print("post-game",12.4*8,(32-17)*8,color_menu)
    -- print("questions",12.4*8,(32-17)*8,color_menu)
end

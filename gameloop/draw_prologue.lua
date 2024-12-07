function _draw()
    cls()
    map(map_offset_x, map_offset_y, 0, 0, 64, 64)
    -- if question then
    --   dquestion(q2)
    --   checkquestion(q2)
    -- end
    tb_draw()
    spr(player1.frames[flr(player1.spz)], player1.x, player1.y, 2, 2, player1.flp)
    spr(player2.frames[flr(player2.spz)], player2.x, player2.y, 2, 2, player2.flip)
    spr(player3.frames[flr(player3.spz)],player3.x,player3.y,2,2,player3.flip)
    -- print("level 1",50,2,14)
    doorstate_draw()
    if(question == true) then
    -- dquestion(q1)
    -- checkquestion(q1)
    end
end

function doorstate_draw()
    if doorstate == "closed" then
        spr(196,38*8,22*8,3,3)
    end
    if doorstate=="cracked" then
        spr(199,38*8,22*8,3,3)
    end
end



function _draw()
    cls()
    map(map_offset_x, map_offset_y, 0, 0, 64, 64)
    if (fading>0) fadeout()
    if fading<0 then
        rectfill(0,0,400,400,0)
    end
    tb_draw()
    doorstate_draw()
    if(shake==true)then
        screen_shake()
    end

    if(goinside==false) then
        spr(player1.frames[flr(player1.spz)], player1.x, player1.y, 2, 2, player1.flp)
        spr(player2.frames[flr(player2.spz)], player2.x, player2.y, 2, 2, player2.flip)
        spr(player3.frames[flr(player3.spz)],player3.x,player3.y,2,2,player3.flip)
    end
    if show_popup then
        -- Use camera_x and camera_y to position the popup dynamically
        local popup_x = camera_x + 12  -- Centered horizontally within the camera view
        local popup_y = camera_y + 32  -- Centered vertically within the camera view
  
        -- Draw popup background
        rectfill(popup_x, popup_y, popup_x + 100, popup_y + 40, 0) -- Black box
        rect(popup_x, popup_y, popup_x + 100, popup_y + 40, 7) -- White border
  
        -- Popup text
        print("are you sure you want", popup_x + 4, popup_y + 4, 7)
        print("to go back to the menu?", popup_x + 4, popup_y + 12, 7)
  
        local yes_x = popup_x + 27  -- Adjusted position for Yes
        rectfill(yes_x, popup_y + 24, yes_x + 20, popup_y + 34, 7)
        rect(yes_x, popup_y + 24, yes_x + 20, popup_y + 34, yes_color)
        print("yes", yes_x + 5, popup_y + 26, 0)
  
        -- No button (move to the right)
        local no_x = popup_x + 51  -- Adjusted position for No
        rectfill(no_x, popup_y + 24, no_x + 20, popup_y + 34, 7)
        rect(no_x, popup_y + 24, no_x + 20, popup_y + 34, no_color)
        print("no", no_x + 5, popup_y + 26, 0)
    end
end

function doorstate_draw()
    if doorstate == "closed" then
        spr(196,38*8,(26-14)*8,3,3)
    end
    if doorstate=="cracked" then
        spr(199,38*8,(26-14)*8,3,3)
    end
end



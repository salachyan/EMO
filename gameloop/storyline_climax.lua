

function tb_init(voice,string) -- this function starts and defines a text box.
    reading=true -- sets reading to true when a text box has been called.
    tb={ -- table containing all properties of a text box. i like to work with tables, but you could use global variables if you preffer.
    str=string, -- the strings. remember: this is the table of strings you passed to this function when you called on _update()
    voice=voice, -- the voice. again, this was passed to this function when you called it on _update()
    i=1, -- index used to tell what string from tb.str to read.
    cur=0, -- buffer used to progressively show characters on the text box.
    char=0, -- current character to be drawn on the text box.
    -- x=0, -- x coordinate
    -- y=(2+20)*8, -- y coordginate
    w=127, -- text box width
    h=35, -- text box height
    col1=7, -- background color
    col2=0, -- border color
    col3=0, -- text color
    }
  end
 
function tb_update()  -- this function handles the text box on every frame update.
    if tb.char<#tb.str[tb.i] then -- if the message has not been processed until it's last character:
        tb.cur+=0.5 -- increase the buffer. 0.5 is already max speed for this setup. if you want messages to show slower, set this to a lower number. this should not be lower than 0.1 and also should not be higher than 0.9
        if tb.cur>0.9 then -- if the buffer is larger than 0.9:
            tb.char+=1 -- set next character to be drawn.
            tb.cur=0    -- reset the buffer.
            if (ord(tb.str[tb.i],tb.char)!=32) sfx(tb.voice) -- play the voice sound effect.
        end
        if (btnp(5)) tb.char=#tb.str[tb.i] -- advance to the last character, to speed up the message.
    elseif btnp(5) then -- if already on the last message character and button ❎/x is pressed:
        if #tb.str>tb.i then -- if the number of strings to disay is larger than the current index (this means that there's another message to display next):
            tb.i+=1 -- increase the index, to display the next message on tb.str
            tb.cur=0 -- reset the buffer.
            tb.char=0 -- reset the character position.
        else -- if there are no more messages to display:
            reading=false -- set reading to false. this makes sure the text box isn't drawn on screen and can be used to resume normal gameplay.
        end
    end
end
 
function tb_draw()
    if reading then
        -- Draw text box background and border
        rectfill(x, y, x + tb.w, y + tb.h, tb.col1)
        rect(x, y, x + tb.w, y + tb.h, tb.col2)


        -- Initialize variables for text rendering
        local max_chars_per_line = 30
        local num_lines = 5
        local x_offset = x + 2
        local y_offset = y + 2
        local text = sub(tb.str[tb.i], 1, tb.char)
        local current_line = ""
        local line_count = 0


        -- Split text by spaces to handle word-wrapping
        for word in all(split(text, " ")) do
            if #current_line + #word <= max_chars_per_line then
                current_line = current_line .. word .. " "
            else
                print(current_line, x_offset, y_offset + (line_count * 6), tb.col3)
                line_count += 1
                current_line = word .. " "
                if line_count >= num_lines then break end
            end
        end


        -- Print the last line if there's remaining text
        if line_count < num_lines then
            print(current_line, x_offset, y_offset + (line_count * 6), tb.col3)
        end


    -- Draw the triangle indicator if all characters in the current string have been displayed
        if tb.char >= #tb.str[tb.i] and #tb.str > tb.i then
            local sprite_id =206 -- Replace with the ID of your sprite
            local tri_x = x + tb.w - 10 -- X position of the sprite
            local tri_y_base = y + tb.h - 10 -- Base Y position of the sprite


            -- Create an animation effect: move the sprite up and down
            local offset_y = flr(sin(time() ) * 2) -- Up/down offset using a sine wave
            local tri_y = tri_y_base + offset_y -- Adjust Y position with the offset


            -- Draw the sprite
            spr(sprite_id, tri_x, tri_y)
        end
    end
end




function storylinetext()
    if reading then -- if tb_init has been called, reading will be true and a text box is being displayed to the player. it is important to do this check here because that way you can easily separete normal game actions to text box inputs.
        tb_update() -- handle the text box on every frame update.
    else
        if player1.y==32*8 and player2.y==32*8 and checker==0 and camera_y>= 159 then 
            tb_init(0,{"pip: we're trapped! we're never getting out of here! "
            , "pete: it's okay, we just have to figure out how to climb back up."}) 
            checker+=1
            -- player1.x+=(1)*8
       
        elseif player1.y==12*8 and player2.y==12*8 and players_fell==2 and checker==1 then
            tb_init(0,{"pete: we did it! let's cross that boulder."}) 
            checker+=1
            player1.x-=(1)*8

        elseif meet_percy==true and player1.landed and player2.landed and  player1.x >= (75 - 60) * 8 and player2.x >= (75 - 60) * 8 and (checker==2 or checker==1) then
            tb_meet = tb_init(0,{"pip: percy, we've found you! are you okay? why is the cheetah standing next to you?"
            , "percy: i should've told you the truth earlier... the boulder, it wasn't just an accident."
            , "pete: what do you mean? wasn't it just a part of the mountain?"
            , "pip: yeah, why did it fall right when we were crossing the bridge?"
            , "cheetah: percy and i set it up. it was supposed to stop you two from getting any further."
            , "percy: i've been working with the cheetah all along. you two were never supposed to make it this far."
            , "pip: all of this was lie? why did you join him, percy? what did he promise you?"
            , "percy: i did it because i felt left out. you two were always so close, always working together, and i was on the outside"
            , "percy: i thought if i teamed up with the cheetah, i could prove that i was just as strong, wise, and capable as you both."
            , "percy: i wanted to outsmart everyone and show that i didn't need you guys to feel powerful and important."
            , "pip: we never wanted to make you feel left out, percy. we should've been there for you when you needed us, instead of letting you feel alone."
            , "pete: yeah, you don't need to prove anything to us. we're a team, no matter what."
            , "pete: we want to work together as a family, no matter what."
            , "percy: i'm so sorry for lying to you guys this whole time. how can you guys forgive me so easily?"
            , "pip: it's because you we're sorry too for leaving you out. we should have known how leaving you out would make you feel."
            , "pete: year, i'm so sorry for percy. we forgive you and can you forgive us too? you're our brother and we care about you."
            , "percy: i forgive you guys and i'm really sorry for what i did. i'm glad we can work together again."}) 

            if check_collision1(player1,player2) then
                player1.x+=1.5*8
            end
            checker+=1
            -- if tb.i==1 then
            --     player1.y-=5
            -- end
        elseif checker==3 then
            tb_meet = tb_init(0,{"pete: we never wanted to make you feel left out, percy. we should've been there for you, instead of letting you feel alone.",""})  
                player2.x=(76-60)*8
                player1.x=(77.5-60)*8
                checker+=1
                player1.y+=1
        elseif checker==4 then
            tb_meet = tb_init(0,{"cheetah: i knew you felt left out. that's why i used you. i figured you'd be willing to help me take them down, just to feel like you finally mattered. pip: we're a team now. you can't break us apart.",""})  
            player2.x=(76-60)*8
            player1.x=(77.5-60)*8
            percy.x=(79-60)*8
            percy.flip=false
            player1.y+=1
                checker+=1
        elseif checker==5 then
            tb_meet = tb_init(0,{"pete: we did it together! the cheetah is not going to bother us anymore.",""})  
                cheetah.flip=false
                player2.x=(76-60)*8
            player1.x=(77.5-60)*8
            percy.x=(79-60)*8
                cheetah.x+=3*8
                player1.y+=1
                checker+=1
        end

    end
end








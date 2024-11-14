
function tb_init(voice,string) -- this function starts and defines a text box.
    reading=true -- sets reading to true when a text box has been called.
    tb={ -- table containing all properties of a text box. i like to work with tables, but you could use global variables if you preffer.
    str=string, -- the strings. remember: this is the table of strings you passed to this function when you called on _update()
    voice=voice, -- the voice. again, this was passed to this function when you called it on _update()
    i=1, -- index used to tell what string from tb.str to read.
    cur=0, -- buffer used to progressively show characters on the text box.
    char=0, -- current character to be drawn on the text box.
    x=0, -- x coordinate
    y=14, -- y coordginate
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
        rectfill(tb.x, tb.y, tb.x + tb.w, tb.y + tb.h, tb.col1)
        rect(tb.x, tb.y, tb.x + tb.w, tb.y + tb.h, tb.col2)
  
        -- Initialize variables for text rendering
        local max_chars_per_line = 30
        local num_lines = 5
        local x_offset = tb.x + 2
        local y_offset = tb.y + 2
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
        local tri_x = tb.x + tb.w - 6
        local tri_y = tb.y + tb.h - 6
  
        -- Draw a small downward-pointing triangle
        line(tri_x, tri_y, tri_x + 4, tri_y)           -- top side
        line(tri_x + 4, tri_y, tri_x + 2, tri_y + 4)   -- right side
        line(tri_x + 2, tri_y + 4, tri_x, tri_y)       -- left side
      end
    end
  end

  --[[  if reading then -- if tb_init has been called, reading will be true and a text box is being displayed to the player. it is important to do this check here because that way you can easily separete normal game actions to text box inputs.
    tb_update() -- handle the text box on every frame update.
  else
  -- if reading is false, then a text box is not being displayed. here you would put your normal game code. also, calls to brande new text boxes must be made only when reading is false, to avoid errors and conflicts.
      if (btnp(5))then tb_init(0,{"long ago, there were three brothers: pip, pete, and percy."})
      end
  -- if (btnp(5))then tb_init(0,{"long ago, there were three brothers: pip, pete, and percy. they lived happily at the bottom of the mountain.","but one day, rumors spread around that there was a swift fast cheetah approaching their village to attack the three brothers!",
      --                             "pip heard this from another monkey in the village and ran over to see his brothers.","pip sees his brother pete first and talks to him."}) -- when calling for a new text box, you must pass two arguments to it: voice (the sfx played) and a table containing the strings to be printed. this table can have any number of strings separated with a comma.
      -- end
      if (btnp(4)) tb_init(1,{"this is a higher pitch voice because i can speak in different voices!","pretty cool, huh? this system is simple, but it can be put to great use!","i bet you are impressed! ♥"})
  end
]]--


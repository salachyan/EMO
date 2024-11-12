-- text box example
-- by profpatonildo

--[[
**if you have trouble reading
this on pico 8's tiny screen,
select all the code and copy
it to a text editor**

how it works:

reading must be set to false
on _init(). this variable is
used to check when a text box
is currently being displayed
and is useful for diferentiating
game states.

tb_init(voice,string)
creates the text box and it's
properties. this is the function
you should call in your game
when you want to start a text
box. "voice" is a sfx number
and "string" is a table with
the messages you want to display
there is no automatic parsing
of the messages, so you will 
have to manually position empty
spaces with \n and check if the
message fits the box. check the
examples to have an idea of
how much text fits on the box.

tb_update() must be called on
_update() when reading is true.
this handles the text box behavior,
like advancing messages and
progressively displaying them,
in a typewriter effect.

tb_draw() draws the text box.
you can just put this on _draw()
and forget about it. no need
to do anything special with it,
since it is self contained.
--]]

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

function _update()
  if reading then -- if tb_init has been called, reading will be true and a text box is being displayed to the player. it is important to do this check here because that way you can easily separete normal game actions to text box inputs.
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

    --  // if you're in the main game...
  if(gamestate == 'a') then
    answerA() 

  --  // if you're in the main game...   
  elseif(gamestate == 'b')then
  answerB() 

  --  // if you're in the main game...
  elseif(gamestate == 'c')then
  answerC() 

  --  // if you're in the main game... 
  elseif(gamestate == 'd')then
  answerD()

  map_offset_y=19
  map_offset_x=0

  local lx1=player1.x --last x pos
  local ly1=player1.y --last y pos
  local lx2=player2.x --last x pos
  local ly2=player2.y --last y pos

  --functions from level1.lua
  
  --level1a
  update_map_level1a_to_level1b()
  update_map_level1_to_level2()
  update_map_level2_to_level3a()
  update_map_level3a_to_level3b()
  if map_offset_x==0 and map_offset_y==19 then
    collisions_for_switch1()
    collisions_for_switch2()
  elseif map_offset_x==12 and map_offset_y==19 then
    box_collisions()
    seesaw_collisions()
    collisions_for_switch3()
    collisions_for_switch4()
  elseif map_offset_x==30 and map_offset_y==12 then
    level2()
    collisions_for_switch3_2()
    collisions_for_switch4_2()
  elseif map_offset_x==49 and map_offset_y==11 then
    level3a()
    collisions_for_switch3_3()
    collisions_for_switch4_3()
  elseif map_offset_x==62 and map_offset_y==11 then
    level3b()
  end

  --functions from level2.lua

  if(reading != true) then
    player1_update()
    player2_update()
  end

  -- box.dx=0

end

function player1_update()
  player1.dy+=gravity
  -- move left
  if btn(⬅️, 0) then
    player1.dx = -player1.speed
    player1.flip = true -- flip sprite to face left
    player1.running=true
    player1.flp=true
    -- animate_player1_walking()
  -- move right
  elseif btn(➡️, 0) then
    player1.dx = player1.speed
    player1.flip = false -- face sprite to the right
    player1.running=true
    player1.flp=false
    -- animate_player1_walking()
  else
    player1.dx=0
    player1.sprite_id = player1.anim_frames[0]
  end

  -- jump
  if btn(❎, 0) and player1.landed then
    player1.dy-=player1.speed
    player1.landed=false
  end

  -- this map collision functionalities are from https://nerdyteachers.com/Explain/Platformer/
  --check collision up and down
  if player1.dy>0 then
    player1.falling=true
    player1.landed=false
    player1.jumping=false

    --   player1.dy=limit_speed(player1.dy,player1.max_dy)

    if map_collision(player1,"down",0,map_offset_y,map_offset_x) then
        player1.landed=true
        player1.falling=false
        player1.dy=0
        player1.y-=((player1.y+player1.h+1)%8)-1
    end
    elseif player1.dy<0 then
        player1.jumping=true
        if map_collision(player1,"up",1,map_offset_y,map_offset_x) then
        player1.dy=0
    end
  end

  --check collision left and right
  if player1.dx<0 then

  --   player1.dx=limit_speed(player1.dx,player1.max_dx)

    if map_collision(player1,"left",2,map_offset_y,map_offset_x) then
        player1.dx=0
    end
    elseif player1.dx>0 then

    --   player1.dx=limit_speed(player1.dx,player1.max_dx)

    if map_collision(player1,"right",3,map_offset_y,map_offset_x) then
        player1.dx=0
    end
  end

  if player1.spz<4.9 then
    player1.spz = player1.spz + .08
  else
    player1.spz = 1
  end

  player1.x+=player1.dx
  player1.y+=player1.dy

  --limit players to map
  if player1.x<map_start then
    player1.x=map_start
  end
  if player1.x>map_end-player1.w then
      player1.x=map_end-player1.w
  end
end

function player2_update()
  player2.dy+=gravity
  -- move left
  -- if btn(⬆️, 1) then
  if btn(⬆️, 0) then
    player2.dx = -player2.speed
    player2.flip = true -- flip sprite to face left
    player2.running=true
    player2.flp=true
    -- animate_player2_walking()
  -- move right
  -- elseif btn(⬇️, 1) then
elseif btn(⬇️, 0) then
    player2.dx = player2.speed
    player2.flip = false -- face sprite to the right
    player2.running=true
    player2.flp=false
    -- animate_player2_walking()
  else
    player2.dx=0
    player2.sprite_id = player2.anim_frames[0]
  end

  -- jump
  -- if btn(🅾️, 1) and player2.landed then
  if btn(🅾️, 0) and player2.landed then
    player2.dy-=player2.speed
    player2.landed=false
  end

  -- this map collision functionalities are from https://nerdyteachers.com/Explain/Platformer/
  --check collision up and down
  if player2.dy>0 then
    player2.falling=true
    player2.landed=false
    player2.jumping=false

    --   player2.dy=limit_speed(player2.dy,player2.max_dy)

    if map_collision(player2,"down",0,map_offset_y,map_offset_x) then
        player2.landed=true
        player2.falling=false
        player2.dy=0
        player2.y-=((player2.y+player2.h+1)%8)-1
    end
    elseif player2.dy<0 then
        player2.jumping=true
        if map_collision(player2,"up",1,map_offset_y,map_offset_x) then
        player2.dy=0
    end

    if player2.x<map_start then
      player2.x=map_start
    end
    if player2.x>map_end-player2.w then
        player2.x=map_end-player2.w
    end
  end

  --check collision left and right
  if player2.dx<0 then

    if map_collision(player2,"left",2,map_offset_y,map_offset_x) then
        player2.dx=0
    end
    elseif player2.dx>0 then

    if map_collision(player2,"right",3,map_offset_y,map_offset_x) then
        player2.dx=0
    end
  end

  --update animation with player2
  if player2.spz<4.9 then
    player2.spz = player2.spz + .05
  else
    player2.spz = 1
  end

  player2.x+=player2.dx
  player2.y+=player2.dy

  --limit players to map
  if player2.x<map_start then
    player2.x=map_start
  end
  if player2.x>map_end-player2.w then
      player2.x=map_end-player2.w
  end



end
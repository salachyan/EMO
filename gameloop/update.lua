dialog = {
  x = 8,
  y = 97,
  color = 7,
  max_chars_per_line = 27,
  max_lines = 4,
  dialog_queue = {},
  blinking_counter = 0,
  init = function(self)
  end,
  queue = function(self, message, autoplay)
    -- default autoplay to false
    autoplay = type(autoplay) == "nil" and false or autoplay
    add(self.dialog_queue, {
      message = message,
      autoplay = autoplay
    })

    if (#self.dialog_queue == 1) then
      self:trigger(self.dialog_queue[1].message, self.dialog_queue[1].autoplay)
    end
  end,
  trigger = function(self, message, autoplay)
    self.autoplay = autoplay
    self.current_message = ''
    self.messages_by_line = nil
    self.animation_loop = nil
    self.current_line_in_table = 1
    self.current_line_count = 1
    self.pause_dialog = false
    self:format_message(message)
    self.animation_loop = cocreate(self.animate_text)
  end,
  format_message = function(self, message)
    local total_msg = {}
    local word = ''
    local letter = ''
    local current_line_msg = ''

    for i = 1, #message do
      -- get the current letter add
      letter = sub(message, i, i)

      -- keep track of the current word
      word ..= letter

      -- if it's a space or the end of the message,
      -- determine whether we need to continue the current message
      -- or start it on a new line
      if letter == ' ' or i == #message then
        -- get the potential line length if this word were to be added
        local line_length = #current_line_msg + #word
        -- if this would overflow the dialog width
        if line_length > self.max_chars_per_line then
          -- add our current line to the total message table
          add(total_msg, current_line_msg)
          -- and start a new line with this word
          current_line_msg = word
        else
          -- otherwise, continue adding to the current line
          current_line_msg ..= word
        end

        -- if this is the last letter and it didn't overflow
        -- the dialog width, then go ahead and add it
        if i == #message then
          add(total_msg, current_line_msg)
        end

        -- reset the word since we've written
        -- a full word to the current message
        word = ''
      end
    end

    self.messages_by_line = total_msg
  end,
  animate_text = function(self)
    -- for each line, write it out letter by letter
    -- if we each the max lines, pause the coroutine
    -- wait for input in update before proceeding
    for k, line in pairs(self.messages_by_line) do
      self.current_line_in_table = k
      for i = 1, #line do
        self.current_message ..= sub(line, i, i)

        -- press btn 5 to skip to the end of the current passage
        -- otherwise, print 1 character per frame
        -- with sfx about every 5 frames
        if (not btnp(5)) then
          if (i % 5 == 0) sfx(0)
          yield()
        end
      end
      self.current_message ..= '\n'
      self.current_line_count += 1
      if ((self.current_line_count > self.max_lines) or (self.current_line_in_table == #self.messages_by_line and not self.autoplay)) then
        self.pause_dialog = true
        yield()
      end
    end

    if (self.autoplay) then
      self.delay(30)
    end
  end,
  shift = function (t)
    local n=#t
    for i = 1, n do
      if i < n then
        t[i] = t[i + 1]
      else
        t[i] = nil
      end
    end
  end,
  -- helper function to add delay in coroutines
  delay = function(frames)
    for i = 1, frames do
      yield()
    end
  end,
  update = function(self)
    if (self.animation_loop and costatus(self.animation_loop) != 'dead') then
      if (not self.pause_dialog) then
        coresume(self.animation_loop, self)
      else
        if btnp(4) then
          self.pause_dialog = false
          self.current_line_count = 1
          self.current_message = ''
        end
      end
    elseif (self.animation_loop and self.current_message) then
      if (self.autoplay) self.current_message = ''
      self.animation_loop = nil
    end

    if (not self.animation_loop and #self.dialog_queue > 0) then
      self.shift(self.dialog_queue, 1)
      if (#self.dialog_queue > 0) then
        self:trigger(self.dialog_queue[1].message, self.dialog_queue[1].autoplay)
        coresume(self.animation_loop, self)
      end
    end

    if (not self.autoplay) then
      self.blinking_counter += 1
      if self.blinking_counter > 30 then self.blinking_counter = 0 end
    end
  end,
  draw = function(self)
    local screen_width = 128

    -- display message
    if (self.current_message) then
      print(self.current_message, self.x, self.y, self.color)
    end

    -- draw blinking cursor at the bottom right
    if (not self.autoplay and self.pause_dialog) then
      if self.blinking_counter > 15 then
        if (self.current_line_in_table == #self.messages_by_line) then
          -- draw square
          rectfill(
            screen_width - 11,
            screen_width - 10,
            screen_width - 11 + 3,
            screen_width - 10 + 3,
            7
          )
        else
          -- draw arrow
          line(screen_width - 12, screen_width - 9, screen_width - 8,screen_width - 9)
          line(screen_width - 11, screen_width - 8, screen_width - 9,screen_width - 8)
          line(screen_width - 10, screen_width - 7, screen_width - 10,screen_width - 7)
        end
      end
    end
  end
}

function _update()
  dialog:update()
  if (#dialog.dialog_queue == 0) then
    _init()
  end

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

  player1_update()
  player2_update()

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
  -- -- if btn(🅾️, 1) and player2.landed then
  -- if btn(🅾️, 0) and player2.landed then
  --   player2.dy-=player2.speed
  --   player2.landed=false
  -- end

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
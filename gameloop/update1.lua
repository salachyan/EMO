function _update()

  storylinetext()
  if map_offset_x==0 and map_offset_y==14 then
    level = "1a"
  elseif map_offset_x==12 and map_offset_y==14 then
    level = "1b"
  end
  
  update_map_level1a_to_level1b()
  update_map_level1_to_level2()
  if question == true then
    uquestion()
  end
  if level == "1a" then
    collisions_for_switch1()
    collisions_for_switch2()
  elseif level == "1b" then
    level1b()
    collisions_for_switch3()
    collisions_for_switch4()
  end
  if reading or question then
  else
      player1_update()
      player2_update()
  end


end

function player1_update()
  player1.dy+=gravity
  --left
  if btn(⬅️, 0) then
    player1.dx = -player1.speed
    player1.flip = true 
    player1.running=true
    player1.flp=true
  --right
  elseif btn(➡️, 0) then
    player1.dx = player1.speed
    player1.flip = false
    player1.running=true
    player1.flp=false
  else
    player1.dx=0
    player1.sprite_id = player1.anim_frames[0]
  end

  -- jump
  if btn(❎, 0) and player1.landed then
    player1.dy-=player1.speed
    player1.landed=false
  end

  --from https://nerdyteachers.com/Explain/Platformer/
  --up down
  if player1.dy>0 then
    player1.falling=true
    player1.landed=false
    player1.jumping=false

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

  --left right
  if player1.dx<0 then

    if map_collision(player1,"left",2,map_offset_y,map_offset_x) then
        player1.dx=0
    end
    elseif player1.dx>0 then


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
  --left
  -- if btn(⬆️, 0) then
  if btn(⬅️, 1) then
    player2.dx = -player2.speed
    player2.flip = true 
    player2.running=true
    player2.flp=true

  -- right
-- elseif btn(⬇️, 0) then
elseif btn(➡️, 1) then
    player2.dx = player2.speed
    player2.flip = false 
    player2.running=true
    player2.flp=false
  else
    player2.dx=0
    player2.sprite_id = player2.anim_frames[0]
  end

  -- jump
  if btn(❎, 1) and player2.landed then 
  -- if btn(🅾️, 0) and player2.landed then
    player2.dy-=player2.speed
    player2.landed=false
  end

  --from https://nerdyteachers.com/Explain/Platformer/
  --up down
  if player2.dy>0 then
    player2.falling=true
    player2.landed=false
    player2.jumping=false

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

  end
  if player2.x<map_start then
    player2.x=map_start
  end
  if player2.x>map_end-player2.w then
      player2.x=map_end-player2.w
  end

  --left right
  if player2.dx<0 then

    if map_collision(player2,"left",2,map_offset_y,map_offset_x) then
        player2.dx=0
    end
    elseif player2.dx>0 then

    if map_collision(player2,"right",3,map_offset_y,map_offset_x) then
        player2.dx=0
    end
  end

  --animation player2
  if player2.spz<4.9 then
    player2.spz = player2.spz + .05
  else
    player2.spz = 1
  end

  player2.x+=player2.dx
  player2.y+=player2.dy

end


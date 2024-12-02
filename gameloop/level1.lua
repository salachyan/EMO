player1_touched_switch1_x = 0
player1_touched_switch1_y = 0
function collisions_for_switch1()
  if check_collision2(player1, switch1) then
    switch1.flip = true
    player1_touched_switch1_x = 1
    player1_touched_switch1_y = 1
  end
end

player2_touched_switch2_x = 0
player2_touched_switch2_y = 0
function collisions_for_switch2()
  if check_collision2(player2, switch2) then
    switch2.flip = true
    player2_touched_switch2_x=1
    player2_touched_switch2_y=1
  end
end

function update_map_level1a_to_level1b()
  if switch1.flip==true and switch2.flip==true then
    if map_offset_x<12 then
      map_offset_x+=0.2
      if map_offset_x>12 then
        map_offset_x=12
      end
      player1.speed=0
      player2.speed=0
      gravity=0
      switch1.y=100*8
      switch2.y=100*8
      player1.x-=1.5
      player2.x-=1.5
      player1.y=9*8
      player2.y=9*8
    else
      player1.speed = 1.2
      player2.speed = 1.2
      gravity = 0.08
    end

    if player1_touched_switch1_x==1 then
      player1_touched_switch1_x=0
    end

    if player1_touched_switch1_y==1 then
      player1_touched_switch1_y=0
    end
    
    if player2_touched_switch2_x==1 then
      player2_touched_switch2_x=0
    end
    if player2_touched_switch2_y==1 then
      player2_touched_switch2_y=0
    end
  end
end

function level1b()
  --box collisions
  -- Check for collisions with the box2 for player1
  -- dquestion(q2)

  if check_collision(player1, box2) and player1.landed==true then
      if player1.dx > 0 and (box2.x > player1.x) then
          player1.x = box2.x - 1.8 * 8
      end
      if player1.dx < 0 and (box2.x < player1.x) then
        player1.x = box2.x + 7
      end
  end

  if check_collision(player2, box2) and player2.landed == true then
      if player2.dx > 0 and (box2.x > player2.x) then
          player2.x = box2.x - 1.8 * 8  
          box2.x = box2.x + player2.dx
              if seesaw_top1.sp~=152 and box2.x>(((18-1)-12)*8)-2 then
                box2.x=(((18-1)-12)*8)-2 
              elseif box2.x>(18-12)*8 then
                box2.x=(18-12)*8
                box2.y=((29-19)*8) - 1
              end
      end
      if player2.dx < 0 and (box2.x < player2.x) then
        player2.x = box2.x + 7
      end
  end
  -- jump on top of the box2
  if check_collision2(player1, box2) then
    if player1.y + player1.sprite_h <= box2.y + box2.h * 8 and player1.dy > 0 then
    player1.y = box2.y - player1.sprite_h * 8  
    player1.dy = 0 
    player1.landed = true 
    end
  end
  if check_collision2(player2, box2) then
    if player2.y + player2.sprite_h <= box2.y + box2.h * 8 and player2.dy > 0 then
    player2.y = box2.y - player2.sprite_h * 8 
    player2.dy = 0 
    player2.landed = true 
    end
  end

  --seesaw collisions
  -- Check for player1 and player2 collision with the seesaw
  --left side
  if check_collision(player1, seesaw_bottom1) and box2.x ~=(18-12)*8 then
    if player1.y + player1.h <= seesaw_bottom1.y + seesaw_bottom1.h and player1.dy > 0 then
    player1.y = seesaw_bottom1.y - player1.h +5
    player1.dy = 0 
    player1.landed = true
      if check_collision(player2, seesaw_top1) then
        player1.y-=5
      end
      if seesaw_top1.sp == 152 and
      seesaw_arch1.sp== 138 and
      seesaw_top1.y==((28+1)-19)*8 and
      seesaw_arch1.y==((28+1)-19)*8 and
  
      seesaw_bottom1.sp== 136 and
      seesaw_arch2.sp== 138 and
      seesaw_bottom1.y==((28)-19)*8 and
      seesaw_arch2.y==((28)-19)*8 and not check_collision(player2, seesaw_top1) then
        seesaw_top1.sp= 136
        seesaw_arch1.sp= 155
        seesaw_top1.y=((28)-19)*8
        seesaw_arch1.y=((28)-19)*8

        seesaw_bottom1.sp= 152
        seesaw_arch2.sp= 155
        seesaw_bottom1.y=((28+1)-19)*8
        seesaw_arch2.y=((28+1)-19)*8
      end
    end
  end
  --box collides with left side and keep right side up
  if check_collision(player1, seesaw_bottom1) and box2.x ==(18-12)*8 then
    if player1.y + player1.h <= seesaw_bottom1.y + seesaw_bottom1.h and player1.dy > 0 then
      player1.y = seesaw_bottom1.y - player1.h 
      player1.dy = 0 
      player1.landed = true
    end
  end
  if check_collision(player2, seesaw_bottom1) and box2.x ==(18-12)*8 then
    if player2.y + player2.h <= seesaw_bottom1.y + seesaw_bottom1.h and player2.dy > 0 then
      player2.y = seesaw_bottom1.y - player2.h 
      player2.dy = 0 
      player2.landed = true
    end
  end
  -- left side
  if check_collision(player1, seesaw_top1) and box2.x ~=(18-12)*8 then
    if player1.y + player1.h <= seesaw_top1.y + seesaw_top1.h and player1.dy > 0 then
      player1.y = seesaw_top1.y - player1.h +5
      player1.dy = 0 
      player1.landed = true
    if check_collision(player2, seesaw_bottom1) then
      player1.y -=5
    end
      if not check_collision(player2, seesaw_bottom1) then
        seesaw_top1.sp= 152
        seesaw_arch1.sp= 138
        seesaw_top1.y=((28+1)-19)*8
        seesaw_arch1.y=((28+1)-19)*8

        seesaw_bottom1.sp= 136
        seesaw_arch2.sp= 138
        seesaw_bottom1.y=((28)-19)*8
        seesaw_arch2.y=((28)-19)*8
      end
    end
  end
  --right side
  if check_collision(player2, seesaw_bottom1) and box2.x ~=(18-12)*8 then
    if check_collision(player1, seesaw_top1) then
      player1.y=(26-19)*8
    end
    if player2.y + player2.h <= seesaw_bottom1.y + seesaw_bottom1.h and player2.dy > 0 then
      player2.y = seesaw_bottom1.y - player2.h +5
      player2.dy = 0 
      player2.landed = true 
      if seesaw_top1.sp == 152 and
      seesaw_arch1.sp== 138 and
      seesaw_top1.y==((28+1)-19)*8 and
      seesaw_arch1.y==((28+1)-19)*8 and
  
      seesaw_bottom1.sp== 136 and
      seesaw_arch2.sp== 138 and
      seesaw_bottom1.y==((28)-19)*8 and
      seesaw_arch2.y==((28)-19)*8 then
        seesaw_top1.sp= 136
        seesaw_arch1.sp= 155
        seesaw_top1.y=((28)-19)*8
        seesaw_arch1.y=((28)-19)*8

        seesaw_bottom1.sp= 152
        seesaw_arch2.sp= 155
        seesaw_bottom1.y=((28+1)-19)*8
        seesaw_arch2.y=((28+1)-19)*8
      end
    end
  end
  --left side
  if check_collision(player2, seesaw_top1) and box2.x ~=(18-12)*8 then
    if check_collision(player1, seesaw_bottom1) then
      player1.y=(26-19)*8
    end
    if player2.y + player2.h <= seesaw_top1.y + seesaw_top1.h and player2.dy > 0 then
      player2.y = seesaw_top1.y - player2.h  +5
      player2.dy = 0 
      player2.landed = true 

      seesaw_top1.sp= 152
      seesaw_arch1.sp= 138
      seesaw_top1.y=((28+1)-19)*8
      seesaw_arch1.y=((28+1)-19)*8

      seesaw_bottom1.sp= 136
      seesaw_arch2.sp= 138
      seesaw_bottom1.y=((28)-19)*8
      seesaw_arch2.y=((28)-19)*8
    end
  end
  if check_collision(player1, seesaw_arch1) and player1.dx<0 and not check_collision(player1, seesaw_top1) then
    player1.x=seesaw_arch1.x+5
  end
  if check_collision(player2, seesaw_arch1) and player2.dx<0 and not check_collision(player2, seesaw_top1) then
    player2.x=seesaw_arch1.x+5
  end
  if check_collision(player1, seesaw_arch2) and player1.dx>0 and not check_collision(player1, seesaw_bottom1) then
    player1.x=seesaw_arch2.x-13
  end
  if check_collision(player2, seesaw_arch2) and player2.dx>0 and not check_collision(player2, seesaw_bottom1) then
    player2.x=seesaw_arch2.x-13
  end

end


player1_touched_switch3_x = 0
player1_touched_switch3_y = 0
function collisions_for_switch3()  
  if check_collision2(player1, switch3) then
    switch3.flip = true
    player1_touched_switch3_x = 1
    player1_touched_switch3_y = 1
  end
end

player2_touched_switch4_x = 0
player2_touched_switch4_y = 0
function collisions_for_switch4()
  if check_collision2(player2, switch4) then
    switch4.flip = true
    player2_touched_switch4_x=1
    player2_touched_switch4_y=1
  end
end

function update_map_level1_to_level2()
  if switch3.flip==true and switch4.flip==true then
    map_offset_x=30

    switch3.y=32*8
    switch4.y=32*8
    if player1_touched_switch3_x==1 then
      player1.x=2
      player1_touched_switch3_x=0
    end

    if player1_touched_switch3_y==1 then
      player1.y=12*8
      player1_touched_switch3_y=0
    end
    
    if player2_touched_switch4_x==1 then
      player2.x=14
      player2_touched_switch4_x=0
    end
    if player2_touched_switch4_y==1 then
      player2.y=12*8
      player2_touched_switch4_y=0
    end
    load("level2.p8")
  end
end


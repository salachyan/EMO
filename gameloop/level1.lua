player1_touched_switch1_x = 0
player1_touched_switch1_y = 0
function collisions_for_switch1()
  if check_collision(player1, switch1) then
    switch1.flip = true
    player1_touched_switch1_x = 1
    player1_touched_switch1_y = 1
  end
end

player2_touched_switch2_x = 0
player2_touched_switch2_y = 0
function collisions_for_switch2()
  if check_collision(player2, switch2) then
    switch2.flip = true
    player2_touched_switch2_x=1
    player2_touched_switch2_y=1
  end
end

function update_map_level1a_to_level1b()
  if switch1.flip==true and switch2.flip==true then
    if map_offset_x<12 then
      map_offset_x+=12
    end
    switch1.y=32*8
    switch2.y=32*8
    if player1_touched_switch1_x==1 then
      player1.x=2
      player1_touched_switch1_x=0
    end

    if player1_touched_switch1_y==1 then
      player1.y=9*8
      player1_touched_switch1_y=0
    end
    
    if player2_touched_switch2_x==1 then
      player2.x=14
      player2_touched_switch2_x=0
    end
    if player2_touched_switch2_y==1 then
      player2.y=9*8
      player2_touched_switch2_y=0
    end
  end
end

player1_touched_switch3_x = 0
player1_touched_switch3_y = 0
function collisions_for_switch3()  
  if check_collision(player1, switch3) then
    switch3.flip = true
    player1_touched_switch3_x = 1
    player1_touched_switch3_y = 1
  end
end

player2_touched_switch4_x = 0
player2_touched_switch4_y = 0
function collisions_for_switch4()
  if check_collision(player2, switch4) then
    switch4.flip = true
    player2_touched_switch4_x=1
    player2_touched_switch4_y=1
  end
end

function update_map_level1_to_level2()
  if switch3.flip==true and switch4.flip==true then
    map_offset_x=30
    map_offset_y=12

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
  end
end
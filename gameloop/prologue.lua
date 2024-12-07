function prologue()
    level1a()
    part1b()
    level1b()
    part1c()
    level1c()
    part2a()
    level2a()
    part2a()
    part2b()
    level2b()
    part2c()
    level2c()
    part3a()
    level3a()
    part3ab_knock()
    level3ab()
    part3ab()
    level3b()
    part3c_knock()
    level3c()
    part3d()
    level3d()
    part3e()
    level3e()
    loadlevel1()
end





function level1a()
    --monologue at the beginning
        if reading then -- if tb_init has been called, reading will be true and a text box is being displayed to the player. it is important to do this check here because that way you can easily separete normal game actions to text box inputs.
            tb_update() -- handle the text box on every frame update.
        else
            if level == "1a" and checker==0 then
                tb_init(0,14,0,{"long ago, there were three brothers: pip, pete, and percy. they lived happily at the bottom of the mountain.","but one day, rumors spread around that there was a mean tricky cheetah approaching their village to attack the three brothers!"})
                -- reading=false
            -- elseif level == "1b" and checker==1 then
            --     tb_init(0,{"hi."}) -- when calling for a new text box, you must pass two arguments to it: voice (the sfx played) and a table containing the strings to be printed. this table can have any number of strings separated with a comma.
            --     -- reading=false
                checker+=1
                part="1b"
            end
        end
        -- conversation+=1
    -- end
end


function part1b()
    --Miguel approaches Pip
    if part == "1b" and reading==false then
        if(player3.x>=57) then
            storymovep3=true
            player3.x-=1
        else
            level="1b"
            storymovep3=false
        end
    end
end

function level1b()
    --pip and miguel talk about the cheetah thats coming!
    if level == "1b" and checker==1 then
        if reading then -- if tb_init has been called, reading will be true and a text box is being displayed to the player. it is important to do this check here because that way you can easily separete normal game actions to text box inputs.
            tb_update() -- handle the text box on every frame update.
        else
                tb_init(0,14,0,{"miguel: hey! the mean tricky cheetah is coming!!!", "pip: what!!!! that's terrible.", "miguel:  yeah, i have to leave now because im scared but i wanted to let you know."})
                part="1c"
                checker+=1

        end
    end
end

function part1c()
    --move miguel out of frame and make it dissapear
    if part =="1c" and reading==false then
        if(player3.x<=300)then
            if (player3.x==125) then
                level="1c"
                storymovep3=false
                player3.x=500
            end
            storymove3=true
            player3.x+=1
            
        else
            storymovep3=false
        end
    end
end

function level1c()
    --Pip talks to himself to find his brothers
    if level == "1c" and checker==2 then
        if reading then -- if tb_init has been called, reading will be true and a text box is being displayed to the player. it is important to do this check here because that way you can easily separete normal game actions to text box inputs.
            tb_update() -- handle the text box on every frame update.
        else
                
                tb_init(0,14,0,{"pip: dang.. this is bad. i need to go find my brothers pete and percy and tell them!"})
                part="2a"
                checker+=1

        end
    end
end

function part2a()
    --move pip to walk to pete
    if part=="2a" and reading==false then
        if player1.x <=125 then
            if player1.x <= 110 then
                player1.x +=1
            else 
                player1.x +=0.5
            end
            if player1.x >= 124 then
                storymovep1=false
                level="2a"
            end
        end
        if player2.x <= 170 then
            storymovep2=true
            player2.x += 0.3
        else
            storymovep2=false
        end
    

    end
end

function level2a()
    --pip calls for pete!
    if level == "2a" and checker==3 then
        if reading then -- if tb_init has been called, reading will be true and a text box is being displayed to the player. it is important to do this check here because that way you can easily separete normal game actions to text box inputs.
            tb_update() -- handle the text box on every frame update.
        else
                
                tb_init(59,14,0,{"pip: wait up pete!"})
                storymovep1=false
                part="2b"
                checker+=1
        end
    end
end

function part2b()
    --pete turns around
    if part=="2b" and reading==false then
        player2.flip=true
        if player2.x >= 140 then
            player2.x-=0.4
        end
        if player2.x < 141 then
            level="2b"
            storymovep2=false
        end
    end
end

function level2b()
    --pip calls for pete!
    if level == "2b" and checker==4 then
        if reading then -- if tb_init has been called, reading will be true and a text box is being displayed to the player. it is important to do this check here because that way you can easily separete normal game actions to text box inputs.
            tb_update() -- handle the text box on every frame update.
        else
                
                tb_init(59,14,0,{"pete: what's up pip? i'm about to head over to percy's to play some chess", "pip: it's not time for chess!! the mean tricky cheetah found us!!!!"})
                part="2c"
                checker+=1
                p2jump=true
        end
    end
end

function part2c()
    --have pete jump as a reaction
    if part =="2c" and reading==false then
        if(p2jump==true) then
        player2.dy-=player2.speed
        player2.landed=false
        -- end
        p2jump=false
        level="2c"
        end
    end
end

function level2c()
    --pip talks to pete about the impeding doom.
    if level == "2c" and checker==5 then
        if reading then -- if tb_init has been called, reading will be true and a text box is being displayed to the player. it is important to do this check here because that way you can easily separete normal game actions to text box inputs.
            tb_update() -- handle the text box on every frame update.
        else
                
                tb_init(59,14,0,{"pete: what!!!!!!!!!", "pete: the cheetah we ran away from months ago?", "pip: yeah, i don't know how he heard we were hiding here. we need to talk to percy about it!", "pete: okay, let's go to percy's house and talk to him about what we should do."})
                part="3a"
                checker+=1
        end
    end
end

function part3a()
    --pip and pete walk over to percy's house
    if part=="3a" and reading==false then
        player2.flip=false
        if player1.x <= 305 then
            storymovep1=true
            player1.x +=1
        end
        if player2.x <= 315 then
            storymovep2=true
            player2.x+=1
        end
        if player2.x >= 315 then
            player2.flip=true
            level="3a"
            storymovep1=false
            storymovep2=false
        end
    end
end
function level3a()
    --pip and pete knck on percy's door.
    if level == "3a" and checker==6 then
        if reading then -- if tb_init has been called, reading will be true and a text box is being displayed to the player. it is important to do this check here because that way you can easily separete normal game actions to text box inputs.
            tb_update() -- handle the text box on every frame update.
        else
                
                tb_init(234,14,0,{"*KNOCK KNOCK*", "...", "...", "pip: huh... "})
                part="3ab"
                checker+=1

        end
    end
end
function part3ab_knock()
    --knocking animation part 1
    if part=="3ab" then
        level="3ab"
        if knock==1 or knock==3 then
            if(player2.x>310) then
                player2.x-=0.5
            end
            if player2.x<=310 then
                knock+=1
            end
        end
        if knock==2 or knock==4 then
            if(player2.x<315) then
                player2.x+=0.5
            end
            if(player2.x>=315)then
                knock+=1
            end
        end
    end
end

function level3ab()
    --pip and pete knck on percy's door.
    if level == "3ab" and checker==7 then
        if reading then -- if tb_init has been called, reading will be true and a text box is being displayed to the player. it is important to do this check here because that way you can easily separete normal game actions to text box inputs.
            tb_update() -- handle the text box on every frame update.
        else
                
                tb_init(234,14,0,{"pete: bro! open the door!! we have something important to tell you!!!"})
                shake=true
                part="3b"
                checker+=1

        end
    end
end
function part3ab()
    if part =="3b" and reading==false and shake==false then
        level = "3b"
    end
end


function level3b()
    --pip and pete knock on percy's door for a second time. the door slowly opens.
    if level == "3b" and checker==8 then
        if reading then -- if tb_init has been called, reading will be true and a text box is being displayed to the player. it is important to do this check here because that way you can easily separete normal game actions to text box inputs.
            tb_update() -- handle the text box on every frame update.
        else
                tb_init(234,14,0,{"*knock knock!*", "... the door slowly opens from the hard knocks."})
                -- doorstate="cracked"
                -- -- if(btnp(5))then
                --     if (time() - start_time)> 2 then
                    doorstate="cracked"
                --     end

                -- end
                part="3c"
                checker+=1

        end
    end
end

function part3c_knock()
    --knocking animation part 1
    if part=="3c" then
        level="3c"
        if knock2==1 or knock2==3 then
            if(player2.x>310) then
                player2.x-=0.5
            end
            if player2.x<=310 then
                knock2+=1
            end
        end
        if knock2==2 or knock2==4 then
            if(player2.x<315) then
                player2.x+=0.5
            end
            if(player2.x>=315)then
                knock2+=1
            end
        end
    end
end


function level3c()
    --pip and pete question the door being unlocked...
    if level == "3c" and checker==9 then
        if reading then -- if tb_init has been called, reading will be true and a text box is being displayed to the player. it is important to do this check here because that way you can easily separete normal game actions to text box inputs.
            tb_update() -- handle the text box on every frame update.
        else
                tb_init(234,14,0,{"pip: oh... the door was unlocked?", "pete: weird, he never leaves his door unlocked..."})
                part="3d"
                checker+=1

        end
    end
end

function part3d()
    if part =="3d" and reading==false then
        level = "3d"
    end
end

function level3d()
    --pip and pete go inside and find a note. THEY GO
    if level == "3d" and checker==10 then
        if reading then -- if tb_init has been called, reading will be true and a text box is being displayed to the player. it is important to do this check here because that way you can easily separete normal game actions to text box inputs.
            tb_update() -- handle the text box on every frame update.
        else
                
                tb_init(234,14,0,{"hey bro! we're coming in!!"})
                doorstate="open"
                part="3e"
                checker+=1

        end
    end
end


function part3e()
    if part =="3e" and reading==false then
        if player1.x <= 310 then
            player1.x+=0.5
        end
        if player2.x >= 310 then
            player2.x-=0.5
        end
        if(player2.x <=310) then
            goinside=true
            if(fading==0)then 
                fadeout()
            end
            if fading < 0 then
                level = "3e"
            end
        end
        -- if fade == 0 then
        -- end
    end
end




function level3e()
    --pip and pete go inside and find a note. THEY GO
    if level == "3e" and checker==11 then
        if reading then -- if tb_init has been called, reading will be true and a text box is being displayed to the player. it is important to do this check here because that way you can easily separete normal game actions to text box inputs.
            tb_update() -- handle the text box on every frame update.
        else
                
                tb_init(245,14,0,{'the two of them open the door and see a note on the table.',"the note reads: ``i found  a safe shelter away from the mean tricky cheetah at the top of the mountain! work together and follow my path! -percy``", 'reading the note, they both exclaim "we have to go!"'})
                part="loadlevel1"
                checker+=1

        end
    end
end
function loadlevel1()
    if part =="loadlevel1" and reading==false then
        load("level1.p8")
    end
end

function screen_shake()
    --midpoint between player1 and player2
    local target_x = (player1.x)  - 64  -- offset to keep midpoint centered horizontally
    local target_y = (player1.y) - 64  -- offset for vertical centering

    --move the camera toward the target position
    local vertical_offset = 32  
    target_y -= vertical_offset
    
    -- Smoothly move the camera toward the target position
    camera_x += (target_x - camera_x) * easing
    -- camera_y += (target_y - camera_y) * easing
    
    --set camera within map boundaries
    camera_x = mid(map_start, camera_x, map_end - 128)
    camera_y = mid(0, camera_y, 512-128)
    
    local fade = 0.90
    local offset_x=8-rnd(5)
    local offset_y=0
    offset_x*=offset
    offset_y*=offset
    
    camera(camera_x + offset_x,camera_y+offset_y)
    offset*=fade
    if offset<0.05 then
      offset=0
        shake=false
    end
  end

function fadeout()
local fade,c,p={[0]=0,17,18,19,20,16,22,6,24,25,9,27,28,29,29,31,0,0,16,17,16,16,5,0,2,4,0,3,1,18,2,4}
    fading+=1
    if fading%fadespeed==1 then
        for i=0,15 do
            c=peek(24336+i)
            if (c>=128) c-=112
            p=fade[c]
            if (p>=16) p+=112
            pal(i,p,1)
        end
        if fading==7*fadespeed+1 then
            cls()
            pal()
            fading=-1
        end
    end
end
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
    part3b_knock()
    level3b()
end





function level1a()
    --monologue at the beginning
        if reading then -- if tb_init has been called, reading will be true and a text box is being displayed to the player. it is important to do this check here because that way you can easily separete normal game actions to text box inputs.
            tb_update() -- handle the text box on every frame update.
        else
            if level == "1a" and checker==0 then
                tb_init(0,14,0,{"long ago, there were three brothers: pip, pete, and percy. they lived happily at the bottom of the mountain.","but one day, rumors spread around that there was a swift fast cheetah approaching their village to attack the three brothers!"})
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
                tb_init(0,14,0,{"miguel: hey! the swift fast cheetah is coming!!!", "pip: what!!!! that's terrible.", "miguel:  yeah, i have to leave now because im scared but i wanted to let you know."})
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
                movementp1=true
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
            if player1.x == 124 then
                level="2a"
            end
            movementp1=false
        else
            movementp1=false
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
                
                tb_init(60,14,0,{"pip: wait up pete!"})
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
        end
    end
end

function level2b()
    --pip calls for pete!
    if level == "2b" and checker==4 then
        if reading then -- if tb_init has been called, reading will be true and a text box is being displayed to the player. it is important to do this check here because that way you can easily separete normal game actions to text box inputs.
            tb_update() -- handle the text box on every frame update.
        else
                
                tb_init(60,14,0,{"pete: what's up pip? i'm about to head over to percy's to play some chess", "pip: it's not time for chess!! the swift fast cheetah found us!!!!"})
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
                
                tb_init(60,14,0,{"pete: what!!!!!!!!!", "pete: the cheetah we ran away from months ago?", "pip: yeah, i don't know how he heard we were hiding here. we need to talk to percy about it!", "pete: okay, let's go to Percy's house and talk to him about what we should do."})
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
                
                tb_init(234,14,0,{"*KNOCK KNOCK*", "...", "...", "pip: huh... ", "pete: bro! open the door!! we have something important to tell you!!!"})
                part="3b"
                checker+=1

        end
    end
end

function part3b_knock()
    --knocking animation part 1
    if part=="3b" then
        level="3b"
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



function level3b()
    --pip and pete knock on percy's door for a second time. the door slowly opens.
    if level == "3b" and checker==7 then
        if reading then -- if tb_init has been called, reading will be true and a text box is being displayed to the player. it is important to do this check here because that way you can easily separete normal game actions to text box inputs.
            tb_update() -- handle the text box on every frame update.
        else
                
                tb_init(234,14,0,{"*knock knock!*", "... the door slowly opens from the hard knocks."})
                part="3c"
                checker+=1

        end
    end
end
function part3c_knock()
    --knocking animation part 1
    if part=="3c" then
        -- level="3c"
        if knock==1 or knock==3 then
            doorstate="cracked"
            if(player2.x>310) then
                player2.x-=0.5
            end
            if player2.x<=310 then
                knock+=1
            end
        end
        if knock==2 or knock==4 then
            doorstate="cracked"
            if(player2.x<315) then
                player2.x+=0.5
            end
            if(player2.x>=315)then
                knock+=1
            end
        end
    end
end


function level3c()
    --pip and pete question the door being unlocked...
    if level == "3c" and checker==8 then
        if reading then -- if tb_init has been called, reading will be true and a text box is being displayed to the player. it is important to do this check here because that way you can easily separete normal game actions to text box inputs.
            tb_update() -- handle the text box on every frame update.
        else
                
                tb_init(234,14,0,{"pip: oh... the door was unlocked?", "pete: weird, he never leaves his door unlocked..."})
                part="3c"
                checker+=1

        end
    end
end
function level3d()
    --pip and pete go inside and find a note. THEY GO
    if level == "3d" and checker==9 then
        if reading then -- if tb_init has been called, reading will be true and a text box is being displayed to the player. it is important to do this check here because that way you can easily separete normal game actions to text box inputs.
            tb_update() -- handle the text box on every frame update.
        else
                
                tb_init(234,14,0,{'the two of them open the door and see a note on the table.','reading the node, the both exlaim "we have to go".'})
                part="3d"
                checker+=1

        end
    end
end
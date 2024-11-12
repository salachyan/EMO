
--[[ 
this is just a basic demo that 
i've thrown together for people
that want to add a menu to a
game but they don't know how

it's a very absic system so i
don't know how many people will
want this, but i hope its useful
to someone...

there are ways to make this more efficicient,
variables should have simpler names too,
but i've made this so it's very simple
to understand, rather than being slightly
more effective

--]]



-- // add one string here for each
-- // menu item you want
tiles = {"a","b","c","d"}

-- // set this to the number of menu
-- // items that you've add to tiles
numberoftiles = 4

-- // stores which menu item is currently selected
selectedtile = 1 

-- // gamestate is used to store a string
-- // this string says what menu or part of the game
-- // is currently being run
gamestate = 'a'

function _update()
 cls()
 
--  // if you're in the main game...
 if(gamestate == 'main') then
     maingame() // run the main game
 
--  // if you're in the main game...   
 elseif(gamestate == 'menu')then
  menu() // show the main menu
  
--  // if you're in the main game...
 elseif(gamestate == 'controls')then
  controlsmenu() // show the controls menu
 
--  // if you're in the main game... 
 elseif(gamestate == 'other')then
  someothermenu() // show this other menu
 end 
 
 
--  // this is just for degbugging
--  // prints the current gamestate
--  // and menu selection to the screen
--  print('gamestate: '..gamestate,10,107,7)
--  print('selection: '..selectedtile,10,117,7)
-- end

-- // one possible gamestate
-- // called when gamestate is 'menu'
function question()

--  // press up to move up the menu
    if(btnp(2)) then
        selectedtile-=1
    
    --  // press down to move down the menu
    elseif(btnp(3)) then
        selectedtile+=1   
    
    --  // press 🅾️ to select the menu item
    --  // this changes the gamestate strings
    --  // so now, the update runs that section instead
    elseif(btnp(4)) then
    if(selectedtile==1)then
    gamestate = 'a'
    
    elseif(selectedtile==2)then
    gamestate = 'b'
    
    elseif(selectedtile==3)then
    gamestate = 'c'
    elseif(selectedtile==4)then
    gamestate = 'd'
    end
end
    
    --  // this little section just makes sure
    --  // that your selection doesn't go
    --  // above or below the max/min 
    if(selectedtile < 1) then
            selectedtile = 1
    elseif(selectedtile > numberoftiles) then
        selectedtile = numberoftiles
    end
    
        -- // write out each bit of menu text 
    for i=1,numberoftiles do
            print(tiles[i],12,20+(12*i),7)
        end
    
        -- // places a sprite next to the
        -- // selected menu item
        spr(0,60,19+(12*selectedtile))
        
        
        -- // placeholder example graphics
        -- // just a title and screen border
    rect(0,0,127,127,6)
    rect(0,0,127,20,6)
    print('main menu',10,9,6)
end

-- // one possible gamestate
-- // called when gamestate is 'main'
function answerA()
 cls()
 rect(0,0,127,127,8)
 print('this is the main game!',20,63,8)
 
--  // return to the main menu
--  // if you press ❎
 print('press ❎ to go back',20,73,8)
 if(btnp(5))then
  gamestate = 'menu'
 end
end

-- // one possible gamestate
-- // called when gamestate is 'controls'
function answerB()
 cls()
 
--  // placeholder example graphics
    -- // just a title and screen border
 rect(0,0,127,127,12)
 rect(0,0,127,20,12)
 print('controls',10,9,12)
 
--  // return to the main menu
--  // if you press ❎
 print('press ❎ to go back',20,73,12)
 if(btnp(5))then
  gamestate = 'menu'
 end
end

-- // one possible gamestate
-- // called when gamestate is 'other'
function answerC()
 cls()
 
--  // placeholder example graphics
    -- // just a title and screen border
 rect(0,0,127,127,11)
 rect(0,0,127,20,11)
 print('some other menu',10,9,11)
 
--  // return to the main menu
--  // if you press ❎
 print('press ❎ to go back',20,73,11)
 if(btnp(5))then
  gamestate = 'menu'
 end
end
function answerD()
    cls()
    
   --  // placeholder example graphics
       -- // just a title and screen border
    rect(0,0,127,127,12)
    rect(0,0,127,20,12)
    print('controls',10,9,12)
    
   --  // return to the main menu
   --  // if you press ❎
    print('press ❎ to go back',20,73,12)
    if(btnp(5))then
     gamestate = 'menu'
    end
   end
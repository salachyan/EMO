function _update()
    if map_offset_x==30 and map_offset_y==14 then
      level = "2a"
    end
    if question != "qx" then
      uquestion()
    end
    if level == "2a" then
      if(currentQ==5 and question == "qx") then
        question = "q5"
      end
      if(currentQ==6 and question == "qx") then
        question = "q6"
      end
      if(currentQ==7 and question == "qx") then
        question = "q7"
      end
      if(currentQ==8 and question == "qx") then
        question = "q8"
      end
      if(currentQ==9 and question == "qx") then
        question = "q9"
      end
      if(currentQ==10 and question == "qx") then
        question = "q10"
      end
    end
    if complete == true then
        if reading then -- if tb_init has been called, reading will be true and a text box is being displayed to the player. it is important to do this check here because that way you can easily separete normal game actions to text box inputs.
            tb_update() -- handle the text box on every frame update.
        else
            tb_init(map_offset_x-30,map_offset_y,0,{"you have completed the game. click ''a'' to return to the main menu! thank you for playing!"})
        end
        if reading == false then
            if btnp(5) then
                load("menu.p8")
            end
        end
    end
end
  
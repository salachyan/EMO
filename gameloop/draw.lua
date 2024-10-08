function _draw()
    -- clear screen
    cls()
  
    -- define the size of the map in tiles
    local map_width = 16  -- number of tiles wide you want to draw
    local map_height = 60 -- number of tiles high you want to draw
  
    -- calculate the y position to draw the map at the bottom-left
    local screen_height = 300
    local map_y = screen_height - (map_height * 8)  -- position it above the bottom
  
    map(0, 0, 0, 0, map_width, map_height)
  
    -- draw the player sprite (32x32 pixels = 4 tiles by 4 tiles)
    spr(player1.sp, player1.x, player1.y, player1.w, player1.h, player1.flip)
          spr(player2.sp, player2.x, player2.y, player2.w, player2.h, player2.flip)
          --sspr(0, 0, 16, 16, player.x, player.y, 16, 16)
          --sspr(8, 0, 16, 16, player2.x, player2.y, 8, 8)
          spr(box.sp, box.x, box.y, box.w, box.h, box.flip)
  
  end
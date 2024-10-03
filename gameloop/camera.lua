function update_camera()
    cam_x = player.x - 64  -- assuming 128 is the screen width, adjust as necessary
    if cam_x < map_start then
        cam_x = map_start
    elseif cam_x > map_end - 128 then
        cam_x = map_end - 128
    end
end
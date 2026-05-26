if (In_progress && place_meeting(x, y, Player))
{
	
    // Only set up camera once
    if (!camera_initialized)
    {
        view_camera[0] = camera_create_view(
            camera_get_view_x(view_camera[0]),
            camera_get_view_y(view_camera[0]),
            camera_get_view_width(view_camera[0]),
            camera_get_view_height(view_camera[0])
        );
        camera_initialized = true;
    }

    // Move camera smoothly
    mvCam(view_camera[0], 300, 20, 0.05); // replace with your desired position

    // Start the cutscene once camera is in place and cutscene not yet started
    if (!cutscene_started && camera_in_position(view_camera[0], 300, 20, 4))
    {
        cutscene_started = true;

        // Start the cutscene
        instance_create_layer(x, y, "Instances", obj_cutscene_controller_bossroom);
    }

    // When cutscene finishes (textbox disappears or controller is destroyed)
    if (cutscene_started && !instance_exists(obj_cutscene_controller_bossroom))
    {
        In_progress = false;
        camera_initialized = false;
		
    }
}
else
{
    // Reattach camera to player
    camera_set_view_target(view_camera[0], Player);
    camera_set_view_border(view_camera[0], 800, 800);
	
}

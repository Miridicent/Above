if (In_progress && place_meeting(x, y, Player))
{
	
    

    // Start the cutscene once camera is in place and cutscene not yet started
    if (!cutscene_started)
    {
        cutscene_started = true;

        // Start the cutscene
        instance_create_layer(x, y, "Instances", obj_cutscene_controller_classexit);
    }

    // When cutscene finishes (textbox disappears or controller is destroyed)
    if (cutscene_started && !instance_exists(obj_cutscene_controller_2))
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

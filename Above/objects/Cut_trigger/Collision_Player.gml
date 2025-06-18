//Player collision

if (In_progress)
{
    var _s = id;

    // Only set the camera once; don't recreate it every frame
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
    mvCam(view_camera[0], 70, 20, 0.05);

    // Create textbox once
    if (textbox_once)
    {
        create_textbox(text_id);
        textbox_once = false;
    }

    // Check if the textbox is gone
    if (!instance_exists(obj_textbox))
    {
        In_progress = false;
        camera_initialized = false;
         
    }
}
else
{
    // Reattach camera to follow the player
	camera_set_view_target(view_camera[0], Player);
	camera_set_view_border(view_camera[0], 800, 800);
	instance_create_layer(416, 786, "Instances", Cut2_trigger );
	instance_destroy(); // Only destroy if this object is no longer needed
}
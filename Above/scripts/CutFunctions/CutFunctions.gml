/// @function start_camera_move_from_player(cam_id, target_x, target_y, speed)
/// @desc Unassigns object follow and starts moving camera to a point
/// @param cam_id      Camera to move
/// @param target_x    Destination X position (top-left of view)
/// @param target_y    Destination Y position
/// @param speed       Lerp smoothing factor (e.g., 0.1)

function mvCam(cam_id, target_x, target_y, speed) {
    var cam_x = camera_get_view_x(cam_id);
    var cam_y = camera_get_view_y(cam_id);

    var new_x = lerp(cam_x, target_x, speed);
    var new_y = lerp(cam_y, target_y, speed);

    camera_set_view_pos(cam_id, new_x, new_y);
}

function mvCamtoPlayer(cam_id, player_obj, camspd){
	var target_x = player_obj.x - camera_get_view_width(cam_id) / 2;
	var target_y = player_obj.y - camera_get_view_height(cam_id) / 2;
	
	var new_x = lerp(cam_x, target_x, speed);
    var new_y = lerp(cam_y, target_y, speed);
	
	//mvCam(cam_id, target_x, target_y, camspd);
	
	view_camera[0] = player_obj;
}

function cutscene_add_step(step_struct)
{
	array_push(cutscene_steps, step_struct);
}

function move_object_to(inst, x_target, y_target, duration, new_sprite)
{
    inst.cutscene_moving = true;
    inst.move_start_x = inst.x;
    inst.move_start_y = inst.y;
    inst.move_target_x = x_target;
    inst.move_target_y = y_target;
    inst.move_timer = 0;
    inst.move_duration = duration;
	

    // Optional sprite change
    if (argument_count > 4 && !is_undefined(new_sprite))
    {
        inst.original_sprite = inst.sprite_index; // Save original sprite
        inst.sprite_index = new_sprite;
        inst.revert_sprite_after_move = true;
    }
    else
    {
        inst.revert_sprite_after_move = false;
    }
}

function camera_in_position(cam, target_x, target_y, threshold)
{
    var cx = camera_get_view_x(cam);
    var cy = camera_get_view_y(cam);
    return (abs(cx - target_x) < threshold && abs(cy - target_y) < threshold);
}

function switch_sprites(inst, new_sprite)
{
	inst.sprite_index = new_sprite;
	
}

function destroy_instance(inst)
{
	instance_destroy(inst);
}

if (global.cam_move_active) {
    var cam = global.cam_id;
    var cx = camera_get_view_x(cam);
    var cy = camera_get_view_y(cam);

    var tx = global.cam_move_target_x;
    var ty = global.cam_move_target_y;
    var spd = global.cam_move_speed;

    var new_x = lerp(cx, tx, spd);
    var new_y = lerp(cy, ty, spd);

    camera_set_view_pos(cam, new_x, new_y);

    // Stop moving if close enough
    if (point_distance(new_x, new_y, tx, ty) < 1) {
        global.cam_move_active = false;
    }
}

if (Puzzle_progress == 3)
{
	if (two == true && four == true && five == true)
	{
		if (instance_exists(Puzzle_gate_obj))
		{
			instance_destroy(Puzzle_gate_obj);
			show_debug_message("Gate opened");
		}
	}
	
	else
	{
		Puzzle_progress = 0;
		
		one = false;
		two = false;
		three = false;
		four = false;
		five = false;
		six = false;
		
		show_debug_message("Not correct");
	}
}

if classbattle = true {instance_activate_object(Cup)}
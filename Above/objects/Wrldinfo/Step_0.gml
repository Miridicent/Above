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
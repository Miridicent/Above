var _s = id;

if (cutscene_moving) {
    move_timer++;
    var t = move_timer / move_duration;
    if (t >= 1) {
        t = 1;
        cutscene_moving = false;
    }
    x = lerp(move_start_x, move_target_x, t);
    y = lerp(move_start_y, move_target_y, t);
}

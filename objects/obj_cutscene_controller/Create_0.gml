
cutscene_steps = [];
current_step = 0;
step_timer = 0;
is_cutscene_active = true;

/* Example: add steps manually (this can be loaded from a script or file)
cutscene_add_step({
    time: 60,
    action: function () {
        obj_npc.x += 32;
    }
});
cutscene_add_step({
    time: 90,
    action: function () {
        show_message("Welcome to the game!");
    }
});*/
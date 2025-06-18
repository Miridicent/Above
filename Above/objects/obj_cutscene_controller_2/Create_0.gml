


with (all) {
    if (variable_instance_exists(id, "tag") && tag == "npc1") {
        global.npc1 = id;
    }
}


// Start the cutscene
is_cutscene_active = true;
global.cutscene_active = true;
cutscene_steps = [];
current_step = 0;
step_timer = 0;

// Only edit this part
//------------------------------------------------

array_push(cutscene_steps, {
    time: 0,
	wait_for_textbox: true,
    action: function () {
        create_textbox("Class2");
    }
});


array_push(cutscene_steps, {
    time: 60,
	wait_for_textbox: false,
    action: function () {
        move_object_to(global.npc1, global.npc1.x + 400, global.npc1.y, 60, Teacher_move_spr);
    }
});


array_push(cutscene_steps, {
    time: 0,
	wait_for_textbox: true,
    action: function () {
        create_textbox("Class2.5");
    }
});


array_push(cutscene_steps, {
    time: 60,
	wait_for_textbox: false,
    action: function () {
        move_object_to(global.npc1, global.npc1.x - 300, global.npc1.y, 60, Teacher_move_spr);
    }
});
//----------------------------------------------------
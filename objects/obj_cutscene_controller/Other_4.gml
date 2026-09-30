//Room Start

is_cutscene_active = true;
current_step = 0;
step_timer = 0;

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
// Step 1: Move NPC right
array_push(cutscene_steps, {
    time: 60,
	wait_for_textbox: false,
    action: function () {
        move_object_to(global.npc1, global.npc1.x + 94, global.npc1.y, 60);
    }
});

// Step 2: Show a message
array_push(cutscene_steps, {
    time: 0,
	wait_for_textbox: true,
    action: function () {
        create_textbox("npc 2");
    }
});

// Step 3: Move NPC down
array_push(cutscene_steps, {
    time: 60,
	wait_for_textbox: false,
    action: function () {
        move_object_to(global.npc1, global.npc1.x, global.npc1.y +164, 60);
    }
});
//----------------------------------------------------


with (all) {
    if (variable_instance_exists(id, "tag") && tag == "tut1") {
        global.tut1 = id;
    }
	
}

// Start the cutscene
is_cutscene_active = true;
global.cutscene_active = true;
cutscene_steps = [];
current_step = 0;
step_timer = 0;
var self_Id = id;

// Only edit this part
//------------------------------------------------

array_push(cutscene_steps, {
    time: 0,
	wait_for_textbox: false,
	wait_for_battle: true,
    action: function () {
        NewEncounterCut([global.enemies.Pshade], Test_background_spr);
    }
});

array_push(cutscene_steps, {
    time: 0,
	wait_for_textbox: true,
	wait_for_battle: false,
    action: function () {
        create_textbox("Class4");
		instance_create_layer(384, 736, "Instances", Cut3_trigger );
    }
});



//----------------------------------------------------
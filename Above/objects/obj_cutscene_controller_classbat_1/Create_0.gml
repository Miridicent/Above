

with (all) {
    if (variable_instance_exists(id, "tag") && tag == "mc") {
        global.mc = id;
    }
	
	else if (variable_instance_exits(id, "tag") && tag == "boss1"){
		global.boss1 = id;
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
    time: 60,
	wait_for_textbox: false,
    action: function () {
        move_object_to(global.mc, global.mc.x, global.npc1.y + 400, 60, MC_BackM);
    }
});

array_push(cutscene_steps, {
    time: 0,
	wait_for_textbox: true,
	wait_for_battle: false,
    action: function () {
        create_textbox("Boss1");
    }
});

array_push(cutscene_steps, {
    time: 60,
	wait_for_textbox: false,
    action: function () {
        move_object_to(global.mc, global.mc.x, global.npc1.y + 100, 60, MC_BackM);
		// Shake Camera
    }
});

array_push(cutscene_steps, {
    time: 60,
	wait_for_textbox: false,
    action: function () {
        move_object_to(global.boss1, global.boss1.x, global.boss1.y - 400, 60, MC_BackM);
		//Smash sound 
		//Camera Shake
    }
});

array_push(cutscene_steps, {
	time: 0,
	wait_for_textbox: false,
	wait_for_battle: true,
	action: function () {
		NewEncounterCut([global.enemies.Ruin_boss], Test_background_spr);
}

/*array_push(cutscene_steps, {
    time: 60,
	wait_for_textbox: false,
    action: function () {
        Play Door open animation.
		End Cutscene
    }*/
});


//----------------------------------------------------
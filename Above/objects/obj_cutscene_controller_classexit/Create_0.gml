

with (all) {
    if (variable_instance_exists(id, "tag") && tag == "npc1") {
        global.npc1 = id;
    }
	else if (variable_instance_exists(id, "tag") && tag == "npc2")
	{
		global.npc2 = id;
	}
	else if (variable_instance_exists(id, "tag") && tag == "npc3")
	{
		global.npc3 = id;
	}
	else if (variable_instance_exists(id, "tag") && tag == "npc4")
	{
		global.npc4 = id;
	}
	else if (variable_instance_exists(id, "tag") && tag == "npc5")
	{
		global.npc5 = id;
	}
	else if (variable_instance_exists(id, "tag") && tag == "npc6")
	{
		global.npc6 = id;
	}
	else if (variable_instance_exists(id, "tag") && tag == "Enpc")
	{
		global.Enpc = id;
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
	wait_for_textbox: true,
	wait_for_battle: false,
    action: function () {
        create_textbox("Class5");
    }
});

//array_push(cutscene_steps, {
//    time: 0,
//	wait_for_textbox: false,
//	wait_for_battle: false,
//    action: function () {
//        //PlaySound
//		//Shake camera
//    }
//});

array_push(cutscene_steps, {
    time: 0,
	wait_for_textbox: true,
	wait_for_battle: false,
    action: function () {
        create_textbox("Class6");
    }
});

array_push(cutscene_steps, {
    time: 30,
	wait_for_textbox: false,
	wait_for_battle: false,
    action: function () {
        move_object_to(global.npc3, global.npc3.x,  global.npc3.y + 50, 10);
    }
});

array_push(cutscene_steps, {
    time: 30,
	wait_for_textbox: false,
	wait_for_battle: false,
    action: function () {
        move_object_to(global.npc3, global.npc3.x - 200,  global.npc3.y, 10);
    }
});

array_push(cutscene_steps, {
    time: 30,
	wait_for_textbox: false,
	wait_for_battle: false,
    action: function () {
        move_object_to(global.npc3, global.npc3.x,  global.npc3.y + 600, 10);
    }
});

array_push(cutscene_steps, {
    time: 30,
	wait_for_textbox: false,
	wait_for_battle: false,
    action: function () {
        destroy_instance(global.npc3);
    }
});

array_push(cutscene_steps, {
    time: 0,
	wait_for_textbox: true,
	wait_for_battle: false,
    action: function () {
        create_textbox("Class7");
    }
});

array_push(cutscene_steps, {
    time: 10,
	wait_for_textbox: false,
	wait_for_battle: false,
    action: function () {
        move_object_to(global.npc2, global.npc2.x,  global.npc2.y + 600, 10);
    }
});

array_push(cutscene_steps, {
    time: 30,
	wait_for_textbox: false,
	wait_for_battle: false,
    action: function () {
        destroy_instance(global.npc2);
    }
});

array_push(cutscene_steps, {
    time: 30,
	wait_for_textbox: false,
	wait_for_battle: false,
    action: function () {
        //Fade out funtion
		room_goto(Abyss_Ruins_battle)
    }
});







//----------------------------------------------------
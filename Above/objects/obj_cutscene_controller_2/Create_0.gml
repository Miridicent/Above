


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

// Only edit this part
//------------------------------------------------
array_push(cutscene_steps, {
    time: 0,
	wait_for_textbox: true,
    action: function () {
        switch_sprites(global.npc2, RedGirl_back_spr);
		switch_sprites(global.npc3, BlueBoy_back_spr);
		switch_sprites(global.npc4, DogGirl_back_spr);
		switch_sprites(global.npc5, CatBoy_back_spr);
		switch_sprites(global.npc6, PurpleGirl_back_spr);
    }
});

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
        move_object_to(global.npc1, global.npc1.x + 400, global.npc1.y, 60, Teacher_move2_spr);
    }
});

array_push(cutscene_steps, {
    time: 0,
	wait_for_textbox: true,
    action: function () {
        switch_sprites(global.npc1, Teacher_teach2_spr_)
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
        move_object_to(global.npc1, global.npc1.x - 400, global.npc1.y, 60, Teacher_move_spr);
    }
});

array_push(cutscene_steps, {
    time: 0,
	wait_for_textbox: true,
    action: function () {
        switch_sprites(global.npc1, Teacher_teach_spr);
    }
});

array_push(cutscene_steps, {
    time: 0,
	wait_for_textbox: true,
    action: function () {
        create_textbox("Student1");
    }
});

array_push(cutscene_steps, {
    time: 30,
	wait_for_textbox: false,
    action: function () {
        move_object_to(global.Enpc, global.Enpc.x, global.Enpc.y + 370, 60);
    }
});

array_push(cutscene_steps, {
    time: 0,
	wait_for_textbox: true,
    action: function () {
        create_textbox("Class3");
    }
});

//----------------------------------------------------
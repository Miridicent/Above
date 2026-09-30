with (all) {
    if (variable_instance_exists(id, "tag") && tag == "mc") {
        global.mc = id;
    }
	else if (variable_instance_exists(id, "tag") && tag == "npc1")
	{
		global.npc1 = id;
	}
	
}

array_push(cutscene_steps, {
	time: 30,
	wait_for_text: false,
	wait_for_battle: false,
	action: function () {
		 move_object_to(global.mc, global.mc.x, global.mc.y + 400, 30, MC_FrontM);
	}

})

array_push(cutscene_steps, {
	time: 30,
	wait_for_text: false,
	wait_for_battle: false,
	action: function () {
		 move_object_to(global.mc, global.mc.x + 100, global.mc.y, 30, MC_SideM);
	}

})

array_push(cutscene_steps, {
	time: 30,
	wait_for_text: false,
	wait_for_battle: false,
	action: function () {
		 switch_sprites(global.mc, MC_Side);
	}

})

array_push(cutscene_steps, {
    time: 0,
	wait_for_textbox: true,
	wait_for_battle: false,
    action: function () {
        create_textbox("Class8");
    }
})

array_push(cutscene_steps, {
    time: 0,
	wait_for_textbox: false,
	wait_for_battle: true,
    action: function () {
        NewEncounterCut([global.enemies.Shade_construct, global.enemies.Shade_construct], Test_background_spr);
    }
})

array_push(cutscene_steps, {
    time: 0,
	wait_for_textbox: true,
	wait_for_battle: false,
    action: function () {
        create_textbox("Class9");
    }
})

array_push(cutscene_steps, {
    time: 0,
	wait_for_textbox: true,
	wait_for_battle: false,
    action: function () {
        create_textbox("Class10");
    }
})

array_push(cutscene_steps, {
    time: 0,
	wait_for_textbox: true,
	wait_for_battle: false,
    action: function () {
        create_textbox("Class11");
    }
})

array_push(cutscene_steps, {
	time: 30,
	wait_for_text: false,
	wait_for_battle: false,
	action: function () {
		//instance_create_layer(195, 17, "Instances", Teacher_obj);
		move_object_to(global.npc1, global.npc1.x, global.npc1.y + 200, 30, Teacher_move2_spr);
	}

})

array_push(cutscene_steps, {
	time: 30,
	wait_for_text: false,
	wait_for_battle: false,
	action: function () {
		 switch_sprites(global.npc1, Teacher_teach_spr);
	}

})

array_push(cutscene_steps, {
    time: 0,
	wait_for_textbox: true,
	wait_for_battle: false,
    action: function () {
        create_textbox("Class12");
    }
})

array_push(cutscene_steps, {
    time: 0,
	wait_for_textbox: true,
	wait_for_battle: false,
    action: function () {
		Wrldinfo.classbattle = true;
        room_goto(Abyss_Ruins_classroom);
    }
})






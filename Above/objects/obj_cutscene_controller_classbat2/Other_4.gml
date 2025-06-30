array_push(cutscene_steps, {
	time: 30,
	wait_for_text: false,
	wait_for_battle: false,
	action: function () {
		 move_object_to(global.mc, global.mc.x, global.npc1.y + 400, 30, MC_FrontM);
	}

})

array_push(cutscene_steps, {
	time: 30,
	wait_for_text: false,
	wait_for_battle: false,
	action: function () {
		 move_object_to(global.mc, global.mc.x + 100, global.npc1.y, 30, MC_SideM);
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
});

array_push(cutscene_steps, {
    time: 0,
	wait_for_textbox: false,
	wait_for_battle: true,
    action: function () {
        NewEncounterCut([global.enemies.Shade_construct, global.enemies.Shade_construct], Test_background_spr);
    }
});

array_push(cutscene_steps, {
    time: 0,
	wait_for_textbox: true,
	wait_for_battle: false,
    action: function () {
        create_textbox("Class9");
    }
});

array_push(cutscene_steps, {
    time: 0,
	wait_for_textbox: true,
	wait_for_battle: false,
    action: function () {
        create_textbox("Class10");
    }
});

array_push(cutscene_steps, {
    time: 0,
	wait_for_textbox: true,
	wait_for_battle: false,
    action: function () {
        room_goto(Abyss_Ruins_classroom);
    }
});

array_push(cutscene_steps, {
    time: 0,
	wait_for_textbox: true,
	wait_for_battle: false,
    action: function () {
        create_textbox("Class11");
    }
});




//@param text_id
function scr_game_text(_text_id){

	switch(_text_id)
	{
		case "npc 1":
			scr_text("I'm npc 1");
			scr_text("Have you met npc 2?");
			scr_text("adj asjkndjlasbbj");
				scr_option("uh Hello?", "npc 1 - Hello?");
				scr_option("adsdbguiagd to you too...", "npc 1 - Stuff");
			break;
			case "npc 1 - Hello?":
				scr_text("Oh? I haven't scared you off?");
				break;
			case "npc 1 - Stuff":
				scr_text("Ahhh, a fellow wordsmith eh?");
				break;
			
		case "npc 2":
			scr_text("Oh. Hello I'm npc 2");
			scr_text("Have you met npc 1? Excitable one arn't they?");
			break;
	}

}
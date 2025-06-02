//game text

//@param text_id
function scr_game_text(_text_id){

	switch(_text_id)
	{
		// Test Room --------------------------------------------------------------------
		case "npc 1":
			scr_text("I'm Vee. What's your name? Conor? That's a good name.", "Mc");
			scr_text("Have you met npc 2?", "Mc-conf");
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
		
		case "cuptest":
			scr_text("It's a cup, (add to inventory)");
			break
		//--------------------------------------------------------------------------------
			
			
		// Abyss Mouth----------------------------------------------------------------------------------------------------------------------------------------
		case "sign1":
			scr_text("It's an old, worn sign. It reads...");
			scr_text("'Beware all! This is the Abyss Mouth. Be warned that any mannaer of monstrosity could rise from the depths and attack at any moment!'");
			scr_text("...It's a little rude...");
			break;
		//----------------------------------------------------------------------------------------------------------------------------------------------------
		
		// Abyss Ruins---------------------------------------------------------------------------------------------
		case "flower1":
			if (Wrldinfo.K_shade == false)
				{
				scr_text("A gooey monster is bearing a gloomy expression as it gazes upon the wilted flower.");
				scr_text("...It dosen't seem to register your presence.");
				scr_text("(Maybe I could find something to help the flower grow?) ", "Mc");
				break;
				}
			
			else if (Wrldinfo.K_shade == true)
				{
				scr_text("A shade is bearing a gloomy expression as it gazes upon the wilted flower.");
				scr_text("...It dosen't seem to register your presence.");
				scr_text("(Maybe I could find something to help the flower grow?) ", "Mc");
				break;
				}
			
		case "crack1":
			scr_text("A crack has formed across the stone of this wall.");
			scr_text("It could indicate the age of this structure... or that someone really big bumped into it.");
			break;
		
		case "cup1":
			scr_text("It's a cup left by one of the students.");
			scr_text("Maybe it can be used for something...");
			scr_text("(Cup added to inventory)");
			break;
		
		case "Class1":
			scr_text("Hmmm? What's going on in here?");
			scr_text("Some kind of classroom?");
			//Cut_trigger.textdone = true;
			break;
			
	}

}
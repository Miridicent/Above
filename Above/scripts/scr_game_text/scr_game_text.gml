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
			
		//Abyss_classroom--------------------------------------------------------------------------------------------
		
		case "cup1":
			scr_text("It's a cup left by one of the students.");
			scr_text("Maybe it can be used for something...");
			scr_text("(Cup added to inventory)");
			break;
		
		case "Class1":
			scr_text("Hmmm? What's going on in here?");
			scr_text("Some kind of classroom?");
			scr_text("Is that one of the students? I don't recognise you...", "Teach");
			scr_text("...", "Mc")
				scr_option("'Uh, yes! I'm a new student'", "Class1 - Newstudent");
				scr_option("'U-um, well I...'", "Class1 - Sure?");
				scr_option("'...'", "Class1 - Slience");
			//Cut_trigger.textdone = true;
			break;
		case "Class1 - Newstudent":
			scr_text("Huh? Well sit down and don't make a ruckes", "Teach");
			break;
		case "Class1 - Sure?":
			scr_text("Oh whatever! One of the kids is out anyway... use his desk.", "Teach");
			break;
		case "Class1 - Slience":
			scr_text("...What? Not a talker? Suits me just fine, this lot is noisy enough as it is, go use the empry desk.", "Teach");
			break;
			
		//Optional students dialougue 
		case "Red1":
		scr_text("Oh! I don't recognise you... Did you transfer from above?", "Red");
		scr_text("Well nice to meet you. we don't normally have lessons in a ruin so you picked and interesting day to join.", "Red");
		break;
		
		case "Blue1":
		scr_text("Having a lesson in this place is awsome!", "Blue");
		scr_text("There's always reports of creepy sludge monsters and whatever in the depths.", "Blue");
		scr_text("if I can fight beat one, I'll become the coolest kid in class!", "Blue-hapy");
		break;
		
		case "Dog&cat1":
		scr_text("Psst, hey...");
		scr_text("...");
		scr_text("I said HEY!");
		scr_text("...what?");
		scr_text("I'm bored! We should do something before the teacher makes us fight a ghoul or something.");
		scr_text("Heh, what I would give to see that match up... You'd get flattend.");
		scr_text("Oi!");
		break;
		
		case "Purple1":
		scr_text("...");
		scr_text("...");
		scr_text("...Hi");
		break;
		
		//Classroom Cutscene 	
		case "Class2":
			scr_text("Alright now where was I?", "Teach");
			scr_text("Oh! That's right we were discussing the life forms that can be found in this ruin.", "Teach");
			scr_text("As your teacher it's important that I make you understand just how dangerouse these creatures are!", "Teach-angy");
			break;
			
		case "Class2.5":
			scr_text("So I thought it would be best if we got a live demonstration");
			break;
		
			
		case "Student1":
			scr_text("...Wait, what?", "Red-exap");
			scr_text("Woah! Really! I wanna be the one to fight it!", "Blue-hapy");
			scr_text("You hear various murmurs of excitment and hesitation among the students...");
			scr_text("You get the impression that this isn't what a normal day in class look like...");
			break;
			
		case "Class3":
			scr_text("Just then the room falls silent as a creature falls from the roof");
			scr_text("This is a Shade! A premature one of course... any higher than that and the school board will give hell...", "Teach");
			scr_text("Now, I think it would be best if we got a volunteer to fight this one, in order to demostrate it's propaties to the class.");
			scr_text("(The class has fallen silent)", "Mc");
				scr_option("Raise your hand", "Class3 - Me");
				scr_option("Remain seated", "Class3 - NotMe");
				scr_option("Glance over at the blue haired boy" , "Class3 - Thee");
			break;
			
		case "Class3 - Me":
			scr_text("Oh? You're actually volunteering? That's a first... well get up here then.", "Teach");
			break;
		case "CLass3 - NotMe":
			scr_text("No volunteers? Alright then new kid! Your time to shine! Get up here", "Teach");
			break;
		case "Class3 - Thee":
			scr_text("Well I-I know what I said... But I think the new kid should get a chance to shine" , "Blue");
			break;
			
			
	}

}
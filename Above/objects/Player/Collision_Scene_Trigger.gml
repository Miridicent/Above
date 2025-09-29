/// @description The first trigger to be used when moving between rooms

// AbyssMouth/Runis room transition triggers
if (room == Abyss_Mouth)
{
	room_goto(Abyss_Ruins_1);
	x = 703;
	y = 3700;
}

else if (room == Abyss_Ruins_1)
{
	room_goto(Abyss_Ruins_classroom);
	x = 760;
	y = 1490;
}

else if (room == Abyss_Ruins_classroom)
{
	room_goto(Abyss_Ruins_2);
	x = 172;
	y = 150;
}

else if (room == Abyss_Ruins_2)
{
	room_goto(Abyss_Puzzle_room);
	x = 218;
	y = 417;
}

else if (room == Abyss_Puzzle_room)
{
	room_goto(Abyss_Ruins_3);
	x = 224;
	y = 657;
}

else if (room == Abyss_Ruins_3)
{
	room_goto(Abyss_Ruins_final_room);
	x = 212;
	y = 1782;
}
/// @description The first trigger to be used when moving between rooms... Used for going back
// You can write your code in this editor

if (room == Abyss_Ruins_1)
{
	room_goto(Abyss_Mouth);
	x = 1052;
	y = 814;
}

else if (room == Abyss_Ruins_classroom)
{
	room_goto(Abyss_Ruins_1);
	x = 388;
	y = 281;
}

else if (room == Abyss_Ruins_2)
{
	room_goto(Abyss_Ruins_classroom);
	x = 1358;
	y = 236;
}

else if (room == Abyss_Puzzle_room)
{
	room_goto(Abyss_Ruins_2);
	x = 2988;
	y = 534;
}

else if (room == Abyss_Ruins_final_room)
{
	room_goto(Abyss_Ruins_3);
	x = 3776;
	y = 3673;
	
}
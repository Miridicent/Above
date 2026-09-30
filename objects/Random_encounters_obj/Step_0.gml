RandomChance = random(100);

if (RandomChance <= 50)
{
	NewEncounter([global.enemies.Pshade], Test_background_spr);
}

else if (RandomChance >= 51 && random(100) <= 90)
{
	NewEncounter([global.enemies.Pshade, global.enemies.Pshade], Test_background_spr);
}

else if (RandomChance >= 91)
{
	NewEncounter(global.enemies.Pshade, Test_background_spr);
}
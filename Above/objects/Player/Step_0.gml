/// @description Insert description here
// You can write your code in this editor

//Movement Code

var right_key = keyboard_check(ord("D"));
var left_key = keyboard_check(ord("A"));
var up_key = keyboard_check(ord("W"));
var down_key = keyboard_check(ord("S"));

//Get xspd and yspd
xspd = (right_key - left_key) * move_spd;
yspd = (down_key - up_key) * move_spd;

if place_meeting(x + xspd , y, tilecollide)
{
	xspd = 0;
}
if place_meeting(x, y + yspd, tilecollide)
{
	yspd = 0;
}

//move_player
x += xspd;
y += yspd;


//Collisions 



//Set Sprite
if yspd == 0{
	if xspd > 0 {face = RIGHT};
	if xspd < 0 {face = LEFT};
}

if xspd == 0{
	if yspd > 0 {face = DOWN};
	if yspd < 0 {face = UP};
}

if (face = RIGHT && xspd == 0 && yspd == 0){face = RIGHTS};
if (face = UP && xspd == 0 && yspd == 0){face = UPS};
if (face = LEFT && xspd == 0 && yspd == 0){face = LEFTS};
if (face = DOWN && xspd == 0 && yspd == 0){face = DOWNS};


sprite_index = sprite[face];

//Stop Player when text is on screen
if instance_exists(obj_textbox)
{
	move_spd = 0;
}
else
{
	move_spd = 5;
	
	//Sprint
if keyboard_check(vk_shift)
	{
		move_spd = 10;
		sprite_set_speed(sprite_index, 4, spritespeed_framespersecond);
	}
	
else
	{
		move_spd = 5;
		sprite_set_speed(sprite_index, 2, spritespeed_framespersecond);
	}
}


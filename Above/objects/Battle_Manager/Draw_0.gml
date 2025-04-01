
//draw background
draw_sprite(background, 0, x, y);

//Draw units in depth order
var _unitWithCurrentTurn = unitTurnOrder[turn].id;
for (var i = 0; i < array_length(unitRenderOrder); i++)
{
	with (unitRenderOrder[i])
	{
		draw_self();
	}
}

//draw UI
draw_sprite_stretched(Border_spr, 0, x+275, y+640, 845,125);
draw_sprite_stretched(Border_spr, 0, x+25, y+640, 245,125);

//Positions
#macro COLUM_ENEMY 50
#macro COLUM_NAME 360
#macro COLUM_HP 550
#macro COLUM_MP 740

//Draw headings 
draw_set_font(Dogica);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_color(c_yellow);
draw_text(x+COLUM_ENEMY, y+650, "ENEMY");
draw_text(x+COLUM_NAME, y+650, "NAME");
draw_text(x+COLUM_HP, y+650, "HP");
draw_text(x+COLUM_MP, y+650, "MP");

//Draw enemy names
draw_set_font(Dogica);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_color(c_white);

var _drawLimit = 3;
var _drawn = 0;
for (var i = 0; (i < array_length(enemyUnits)) && (_drawn < _drawLimit); i++)
{
	var _char = enemyUnits[i];
	if (_char.hp > 0)
	{
		_drawn++;
		draw_set_color(c_white);
		if (_char.id == _unitWithCurrentTurn) draw_set_color(c_blue);
		draw_text(x+COLUM_ENEMY, y+670+(i*12),_char.name);
	}
}

//draw chaacter info
for (var i = 0; i < array_length(PlayerU); i++)
{
	draw_set_halign(fa_left);
	draw_set_color(c_white);
	var _char = PlayerU[i];
	if (_char.id == _unitWithCurrentTurn) draw_set_colour(c_blue);
	if (_char.hp <= 0) draw_set_color(c_red);
	draw_text(x+COLUM_NAME,y+670+(i*12),_char.name);
	draw_set_halign(fa_right);
	
	draw_set_color(c_white);
	if (_char.hp < (_char.hpMax * 0.5)) draw_set_color(c_orange);
	if (_char.hp <= 0) draw_set_color(c_red);
	draw_text(x+COLUM_HP+50, y+670+(i*12),string(_char.hp) + "/" + string(_char.hpMax));
	
	draw_set_color(c_white);
	if(_char.mp < (_char.mpMax * 0.5)) draw_set_color(c_orange);
	if (_char.hp <= 0) draw_set_color(c_red);
	draw_text(x+COLUM_MP+50, y+670+(i*12),string(_char.hp) + "/" + string(_char.mpMax));
	
	draw_set_color(c_white)
}

if (cursor.active)
{
	with (cursor)
	{
		if (activeTarget != noone)
		{
			if (!is_array(activeTarget))
			{
				draw_sprite(sPointer, 0, activeTarget.x, activeTarget.y);
			}
			else
			{
				draw_set_alpha(sin(get_timer()/50000)+1);
				for (var i = 0; i < array_length(activeTarget); i++)
				{
					draw_sprite(sPointer, 0, activeTarget[i].x, activeTarget[i].y);
				}
				draw_set_alpha(1.0);
			}
		}
	}
}
/// @description Insert description here
// You can write your code in this editor

draw_sprite_stretched(Border_spr, 0, x, y, widthFull, heightFull);
draw_set_color(c_white);
draw_set_font(Dogica);
draw_set_halign(fa_left);
draw_set_valign(fa_top);

var _desc = !(description == -1);
var _scrollPush = max(0, hover - (visibleOptionsMax-1));

for(l = 0; l < (visibleOptionsMax + _desc); l++)
{
	if (l >= array_length(options)) break;
	draw_set_color(c_white);
	if (l == 0) && (_desc)
	{
		draw_text(x + xmargin, y + ymargin, description);
	}
	else
	{
		var _optionsToShow = l - _desc + _scrollPush;
		var _str = options[_optionsToShow][0];
		if (hover == _optionsToShow - _desc)
		{
			draw_set_color(c_yellow);
		}
		if (options[_optionsToShow][3] == false) draw_set_color(c_gray);
		draw_text(x + xmargin, y + ymargin -20 + l * heightLine *2, _str);
	}
}

draw_sprite(sPointer, 0, x + xmargin + 8, y + ymargin + ((hover - _scrollPush) * heightLine) + 1);
if (visibleOptionsMax < array_length(options)) && (hover < array_length(options)-1)
{
	draw_sprite(Down_pointer, 0, x + widthFull * 0.5, y + heightFull - 7);
}


draw_set_font(global.font);

for (var i = 0; i < array_length(inv); i++)
	{
		var _xx = screen_bord;
		var _yy = screen_bord;
		var _sep = sep;
		var _col = c_white;
	
		
		
		if selected_item == i { _col = c_yellow; }
		draw_set_color(_col)
		
		draw_text(_xx, _yy + _sep*i, global.item_list.Cup.name);
		
		
		if selected_item == i
		{
		draw_text_ext(_xx + 16, _yy + _sep*array_length(inv), inv[i]. description, 20, 80)
		}
		
		draw_set_color(c_white);
	}

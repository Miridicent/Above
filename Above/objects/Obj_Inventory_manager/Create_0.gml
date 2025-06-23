depth = -9999;

global.font = global.font_main;

//item constructor 
function create_item(_name, _desc) constructor
	{
		name = _name;
		description = _desc;
	}

//create the item 
global.item_list = 
	{
		
	Cup : new create_item
		(
		"Cup",
		"A cup, maybe it can be used to hold something"
		),
		
	}
	
//create the inventory 
inv = array_create(0);

selected_item = -1;	


//for drawing and mouse positions
screen_bord = 30;
sep = 30;

//Pickup Item 


function item_add(_item)
	{
		array_push(Obj_Inventory_manager.inv, _item);
	}
	
function item_remove(_item)
	{
		array_delete(Obj_Inventory_manager.inv, _item, 1);
	}
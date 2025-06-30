/// @description Insert description here
// You can write your code in this editor
var _contains = array_contains(Obj_Inventory_manager.inv, Cup)

if (keyboard_check_pressed(vk_enter && _contains))
{
	item_remove(Cup);
	item_add(FCup);
}
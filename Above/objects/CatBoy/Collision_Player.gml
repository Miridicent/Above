/// @description Insert description here
// You can write your code in this editor

if keyboard_check_pressed(vk_enter) && !instance_exists(obj_textbox)
	{
		create_textbox(text_id);
	}
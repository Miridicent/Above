/// @description Insert description here
// You can write your code in this editor
//Player.move_spd = 0;

view_camera[0] = camera_create_view(camera_get_view_x(view_camera[0]), camera_get_view_y(view_camera[0]), camera_get_view_width(view_camera[0]), camera_get_view_height(view_camera[0]))

mvCam(view_camera[0], 70, 20, 0.05)


create_textbox(text_id);

if (keyboard_check_pressed(vk_space))
{
	spress++;
}




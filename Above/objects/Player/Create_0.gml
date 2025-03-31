/// @description Insert description here
// You can write your code in this editor

xspd = 0;
yspd = 0;

move_spd = 5;

sprite[RIGHT] = MC_SideM;
sprite[UP] = MC_BackM;
sprite[LEFT] = MC_Side2M;
sprite[DOWN] = MC_FrontM;
sprite[RIGHTS] = MC_Side;
sprite[UPS] = MC_Back;
sprite[LEFTS] = MC_Side2;
sprite[DOWNS] = MC_Front

face = DOWNS;

tilecollide = layer_tilemap_get_id("Wall");

mask_index = MC_Front;
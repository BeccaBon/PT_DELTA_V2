function scr_player_door()
{
	hsp = 0;
	mach2 = 0;
	jumpAnim = true;
	dashAnim = 1;
	landAnim = false;
	moveAnim = true;
	stopAnim = true;
	crouchslideAnim = 1;
	crouchAnim = 1;
	machhitAnim = 0;
	image_speed = 0.35;

	if (floor(image_index) == (image_number - 1))
	{
		image_speed = 0;
		image_index = image_number - 1;
	}

	if (floor(image_index) == (image_number - 1) && !instance_exists(obj_fadeout) && (sprite_index == spr_downpizzabox || sprite_index == spr_uppizzabox))
	{
		instance_create(x, y, obj_fadeout);
	}
}

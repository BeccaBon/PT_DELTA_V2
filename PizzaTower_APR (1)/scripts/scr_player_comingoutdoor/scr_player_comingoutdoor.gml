function scr_player_comingoutdoor()
{
	mach2 = 0;
	jumpAnim = true;
	dashAnim = 1;
	landAnim = false;
	moveAnim = true;
	stopAnim = true;
	crouchslideAnim = 1;
	crouchAnim = 1;
	machhitAnim = 0;
	hsp = 0;

	if (c < 255)
	{
		c += 5;
	}

	image_blend = make_colour_hsv(0, 0, c);

	if (floor(image_index) == (image_number - 1))
	{
		start_running = 1;
		movespeed = 0;
		state = states.normal;
		image_alpha = 1;
		c = 0;
		image_blend = make_colour_hsv(0, 0, 255);
	}

	if (sprite_index != spr_Timesup)
	{
		sprite_index = spr_walkfront;
	}

	image_speed = 0.35;
}

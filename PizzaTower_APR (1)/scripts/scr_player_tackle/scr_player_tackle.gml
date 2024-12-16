function scr_player_tackle()
{
	combo = 0;
	mach2 = 0;
	hsp = -xscale * movespeed;

	if (movespeed > 0)
	{
		movespeed -= 0.5;
	}

	start_running = 1;
	jumpAnim = true;
	dashAnim = 1;
	landAnim = false;
	moveAnim = true;
	stopAnim = true;
	crouchslideAnim = 1;
	crouchAnim = 1;

	if (floor(image_index) == (image_number - 1))
	{
		state = states.normal;
	}

	image_speed = 0.35;
}

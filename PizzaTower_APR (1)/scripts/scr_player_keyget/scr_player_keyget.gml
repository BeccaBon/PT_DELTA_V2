function scr_player_keyget()
{
	hsp = 0;
	vsp = 0;
	image_speed = 0.35;
	movespeed = 0;
	mach2 = 0;
	jumpAnim = true;
	dashAnim = 1;
	landAnim = false;
	moveAnim = true;
	stopAnim = true;
	crouchslideAnim = 1;
	crouchAnim = 1;
	machhitAnim = 0;
	sprite_index = spr_keyget;

	if (floor(image_index) == (image_number - 1))
	{
		global.keyget = false;
		state = states.normal;
		image_index = 0;
	}
}

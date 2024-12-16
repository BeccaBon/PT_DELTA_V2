with (obj_player)
{
	if (place_meeting(x, y, other))
	{
		if (state == states.bombpep && hurted == false)
		{
			scr_soundeffect(sfx_bombpep2);
			image_index = 0;
			hurted = true;
			vsp = -4;
			sprite_index = spr_bombpepend;
			state = states.bombpep;
			bombpeptimer = 0;
			instance_create(x, y, obj_bombexplosion);
		}
	}
}

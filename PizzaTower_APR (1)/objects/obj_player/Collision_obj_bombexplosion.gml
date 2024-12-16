if (character == "V")
{
	scr_hurtplayer(object_index);
}
else if (scr_transformationcheck())
{
	if (hurted == false && cutscene == false && (state != states.bombpep && sprite_index != spr_bombpep_end) && state != states.Sjump && state != states.Sjumpprep)
	{
		scr_losepoints();
		image_index = 0;
		hurted = true;
		vsp = -4;
		sprite_index = spr_bombpepend;
		state = states.bombpep;
		bombpeptimer = 0;
	}
}

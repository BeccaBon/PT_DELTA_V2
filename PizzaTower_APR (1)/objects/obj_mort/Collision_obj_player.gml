if (sprite_index != spr_mortspawn && sprite_index != spr_mortfall)
{
	with (other)
	{
		repeat (6)
		{
			create_debris(x, y, spr_feather);
		}

		mort = true;
		instance_create_unique(x, y, 12);
         state = states.mort
		tv_push_prompt_once(tv_create_prompt("This is the mort powerup text", tvprompt.transfo, spr_tv_mort, 3), "mort");
	}

	instance_destroy();
}

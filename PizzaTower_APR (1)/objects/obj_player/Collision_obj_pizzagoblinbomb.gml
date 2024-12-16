if (character == "V")
{
	scr_hurtplayer(object_index);
}

var b = 1;

for (i = 0; i < array_length(transformation); i += 1)
{
	if (state == transformation[i])
	{
		b = 0;
	}
}

if (b == 1)
{
	if (cutscene == false && other.grounded == true && state != states.bombpep && (state == states.handstandjump || state == states.punch || character == "S"))
	{
		bombpeptimer = 100;
		state = states.bombpep;
		image_index = 0;
		sprite_index = spr_bombpepintro;
		instance_destroy(other);
		tv_push_prompt_once(tv_create_prompt("This is the bomb transformation text", tvprompt.transfo, spr_tv_bombpep, 3), "bombpep");
	}
}

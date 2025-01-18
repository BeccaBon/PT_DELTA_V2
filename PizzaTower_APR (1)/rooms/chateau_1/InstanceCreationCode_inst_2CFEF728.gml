prompt_condition = function()
{
	with (obj_player)
	{
		if (((sprite_index == spr_Timesup && floor(image_index) == (image_number - 2)) || state == states.normal) && place_meeting(x, y, obj_exitgate))
		{
			return 1;
		}
	}

	return 0;
};

prompt_array[0] = tv_create_prompt(
	"PTV seems to have catched on camera a glimpse of the strange cult again, we still cannot tell whether or not they are wearing robes are bathrobes, with the fact still being irrelevant.",
	tvprompt.normal,
	spr_tv_idleanim1,
	3
);

image_speed = 0;

if (sprite_get_number(sprite_index) < 2 && global.autotile == true)
{
	with (object_index)
	{
		image_index = scr_autotile();
	}
}

if (room != rm_editor)
{
	alarm[0] = 5;
}

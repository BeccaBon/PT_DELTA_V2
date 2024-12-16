with (instance_place(x - 1, y, obj_player))
{
	if (global.mort == true && other.eaten == 0)
	{
		other.eaten = 1;
		other.x = -100;
		other.y = -100;
		other.sprite_index = spr_corneaten;
		grav = 0.5;
		global.mort = false;
	}
}

with (instance_place(x + 1, y, obj_player))
{
	if (global.mort == true && other.eaten == 0)
	{
		other.eaten = 1;
		other.x = -100;
		other.y = -100;
		other.sprite_index = spr_corneaten;
		grav = 0.5;
		global.mort = false;
	}
}

if (instance_exists(obj_mort) && eaten == 1)
{
	x = xstart;
	y = ystart;
	eaten = 0;
	sprite_index = spr_corn;
}

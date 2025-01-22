if (!instance_exists(ID) && room != custom_lvl_room)
{
	instance_destroy();
}

if (instance_exists(ID))
{
	x = ID.x;
	y = ID.y;
	image_xscale = ID.image_xscale;
	image_index = ID.image_index;

	with (ID)
	{
		if (object_index == obj_coolpineapple || object_index == obj_forknight || object_index == obj_ghostknight || object_index == obj_noisey || object_index == obj_smokingpizzaslice)
		{
			if (state != states.walk && state != states.rage)
			{
				hitboxcreate = false;
				instance_destroy(other);
			}
		}

		if (object_index == obj_robot)
		{
			if (state != states.mach2 && state != states.slap && state != states.tackle)
			{
				hitboxcreate = false;
				instance_destroy(other);
			}
			else if (state == states.slap)
			{
				other.x = x + (image_xscale * 32);
			}
		}

		if (object_index == obj_soldier)
		{
			other.x = x + (image_xscale * 24);

			if (state != states.rage)
			{
				instance_destroy(other);
			}
		}

		if (object_index == obj_indiancheese)
		{
			if (state != states.walk && sprite_index != spr_indiancheese_howl)
			{
				hitboxcreate = false;
				instance_destroy(other);
			}
		}

		if (object_index == obj_thug_red || object_index == obj_thug_blue || object_index == obj_thug_green)
		{
			if (state != states.punch)
			{
				instance_destroy(other);
				punchinst = noone;
			}
		}

		if (object_index == obj_weeniesquire)
		{
			if (stun == 1)
			{
				hitboxcreate = false;
				instance_destroy(other);
			}
		}

		if (object_index == obj_minijohn)
		{
			if (state != states.rage)
			{
				instance_destroy(other);
			}
		}

		if (object_index == obj_ninja)
		{
			if (state != states.charge && state != states.punch)
			{
				instance_destroy(other);
			}

			if (state == states.punch)
			{
				if (image_index > 14)
				{
					instance_destroy(other);
				}

				other.x = x + (image_xscale * 24);
			}
		}

		if (object_index == obj_boulder)
		{
			if (hitwall == 0)
			{
				instance_destroy(other);
			}
		}

		if (object_index == obj_snickexe)
		{
			if (obj_player1.instakillmove == true || obj_player1.state == states.handstandjump)
			{
				instance_destroy(other);
				hitboxcreate = false;
			}
		}

		if (object_index == obj_pickle)
		{
			if (state != states.pizzagoblin_throw)
			{
				instance_destroy(other);
			}
		}

		if (object_index == obj_noisecrusher)
		{
			if (state != states.bounce)
			{
				hitboxcreate = false;
				instance_destroy(other);
			}
		}

		if (object_index == obj_peasanto || object_index == obj_fencer || object_index == obj_pizzice || object_index == obj_ancho)
		{
			if (state != states.charge && state != states.rage)
			{
				hitboxcreate = false;
				instance_destroy(other);
			}
		}
	}
}

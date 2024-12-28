with (obj_player)
{
    if (place_meeting(x + hsp, y, other.id) && state == states.handstandjump && other.hp != 0)
    {
	repeat (4)
	{
		with (create_debris((x + random_range(0, 64)), (y + random_range(0, 64)), spr_deadjohndebris))
		{
			hsp = random_range(-5, 5)
			vsp = random_range(-10, 10)
		}
	}
	repeat (3)
	{
		with (instance_create((x + random_range(0, 64)), (y + random_range(0, 64)), obj_parryeffect))
		{
			sprite_index = spr_deadjohnsmoke
			image_speed = 0.35
		}
	}
        other.hp -= 1;
		scr_pummel();
		hurtfx = 1;
		alarm[0] = 30;
}
if (flash == 1 && alarm[1] <= 0)
	alarm[1] = (0.15 * room_speed)
if (hurted == 1)
	hurtx = random_range(2, -2)
}
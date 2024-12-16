if (global.levelreset)
{
	scr_playerreset();
	global.levelreset = false;
}
if (state == states.comingoutdoor && global.coop == true && !place_meeting(x, y, obj_exitgate))
{
	if (object_index == obj_player1 && obj_player1.spotlight == false)
	{
		visible = false;
	}

	if (object_index == obj_player2 && obj_player1.spotlight == true)
	{
		visible = false;
	}
}

if (global.coop == true)
{
	scr_changetoppings();

	if (!instance_exists(obj_cooppointer))
	{
		instance_create(x, y, obj_cooppointer);
	}

	if (!instance_exists(obj_coopflag))
	{
		instance_create(x, y, obj_coopflag);
	}
}

if (state == states.grab)
{
	state = states.normal;
}

if (place_meeting(x, y, obj_boxofpizza) || place_meeting(x, y - 1, obj_boxofpizza))
{
	box = true;
	hallway = false;
	state = states.crouch;
}

if (object_index != obj_player2 || global.coop == true)
{
	if (targetDoor == "A" && instance_exists(obj_doorA))
	{
		if (hallway == true)
		{
			x = obj_doorA.x + (hallwaydirection * 100);
		}
		else if (box == true)
		{
			x = obj_doorA.x + 32;
		}
		else
		{
			x = obj_doorA.x + 16;
		}

		y = obj_doorA.y - 14;
	}

	if (targetDoor == "B" && instance_exists(obj_doorB))
	{
		if (hallway == true)
		{
			x = obj_doorB.x + (hallwaydirection * 100);
		}
		else if (box == true)
		{
			x = obj_doorB.x + 32;
		}
		else
		{
			x = obj_doorB.x + 16;
		}

		y = obj_doorB.y - 14;
	}

	if (targetDoor == "C" && instance_exists(obj_doorC))
	{
		if (hallway == true)
		{
			x = obj_doorC.x + (hallwaydirection * 100);
		}
		else if (box == true)
		{
			x = obj_doorC.x + 32;
		}
		else
		{
			x = obj_doorC.x + 16;
		}

		y = obj_doorC.y - 14;
	}

	if (targetDoor == "D" && instance_exists(obj_doorD))
	{
		if (hallway == true)
		{
			x = obj_doorD.x + (hallwaydirection * 100);
		}
		else if (box == true)
		{
			x = obj_doorD.x + 32;
		}
		else
		{
			x = obj_doorD.x + 16;
		}

		y = obj_doorD.y - 14;
	}

	if (targetDoor == "E" && instance_exists(obj_doorE))
	{
		if (hallway == true)
		{
			x = obj_doorE.x + (hallwaydirection * 100);
		}
		else if (box == true)
		{
			x = obj_doorE.x + 32;
		}
		else
		{
			x = obj_doorE.x + 16;
		}

		y = obj_doorE.y - 14;
	}
}

if (verticalhallway)
{
	y += vhallwaydirection * 50;
}

if (character == "M" && place_meeting(x, y, obj_boxofpizza))
{
	while (place_meeting(x, y, obj_boxofpizza))
	{
		var _inst = instance_place(x, y, obj_boxofpizza);
		y -= _inst.image_yscale;
	}
}

hallway = false;
verticalhallway = false;
box = false;
roomstartx = x;
roomstarty = y;

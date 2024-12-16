if (state == states.policetaxi)
{
	exit;
}

if (other.state != states.backbreaker || other.parry_inst == noone)
{
	with (obj_player)
	{
		targetRoom = other.targetRoom;
		lastroom = room;
		targetDoor = other.targetDoor;
		visible = false;

		if (state != states.gotoplayer)
		{
			state = states.policetaxi;
		}

		cutscene = true;
		hsp = 0;
		vsp = 0;
	}

	grav = 0;
	state = states.policetaxi;
	hsp = 10;
	image_xscale = 1;
	vsp = 0;
}
else
{
	with (other.parry_inst)
	{
		if (!collisioned)
		{
			event_user(0);
		}
	}

	instance_destroy();
}

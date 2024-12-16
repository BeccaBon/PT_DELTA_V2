state = states.normal;
hub_array[0] = [hub_room1, "WORLD 1"];
hub_array[1] = [hub_room2, "WORLD 2"];
playerid = noone;
selected = 0;

switch (room)
{
	case hub_room1:
		selected = 0;
		break;

	case hub_room2:
		selected = 1;
		break;
}

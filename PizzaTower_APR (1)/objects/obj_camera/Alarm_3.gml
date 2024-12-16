if (room == rank_room)
{
	exit;
}

if (!global.panic)
{
	exit;
}

if (instance_exists(obj_treasure))
{
	exit;
}

var _foundtoppin = false;

if (!ds_list_empty(global.followerlist))
{
	var _inst = noone;

	for (var i = 0; i < ds_list_size(global.followerlist); i++)
	{
		var b = ds_list_find_value(global.followerlist, i);
		var _temp_inst = obj_pizzakinparent;

		if (instance_exists(b) && object_get_parent(b.object_index) == _temp_inst)
		{
			_inst = b;
		}
	}

	if (_inst != noone)
	{
		switch (_inst.object_index)
		{
			case obj_pizzakinshroom:
				global.shroomfollow = false;
				break;

			case obj_pizzakinpineapple:
				global.pineapplefollow = false;
				break;

			case obj_pizzakinsausage:
				global.sausagefollow = false;
				break;

			case obj_pizzakintomato:
				global.tomatofollow = false;
				break;

			case obj_pizzakincheese:
				global.cheesefollow = false;
				break;
		}

		instance_destroy(_inst);
		_foundtoppin = true;
		create_particle(_inst.x, _inst.y, particle.genericpoofeffect, 0);
	}
}

if (!_foundtoppin)
{
	var playerid = obj_player1.spotlight ? obj_player1.id : obj_player2.id;

	with (playerid)
	{
		instance_destroy(obj_fadeout);

		if (state != states.gottreasure)
		{
			targetDoor = "A";
			room = timesuproom;
			state = states.timesup;
			sprite_index = spr_Timesup;
			image_index = 0;
			audio_stop_all();
			scr_soundeffect(mu_timesup);
		}
		else
		{
			other.alarm[3] = 15;
		}
	}
}
else
{
	alarm[3] = 150;
}

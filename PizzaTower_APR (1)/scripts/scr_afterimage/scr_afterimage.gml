function create_afterimage(argument0, argument1, argument2, argument3)
{
	var q;

	//var dep = depth + 1;
	var pid = obj_player1.image_xscale;

	q = {
		x: argument0,
		y: argument1,
		sprite_index: argument2,
		image_index: argument3,
		alarm: [15, 6, -1],
		image_blend: choose(global.afterimage_color1, global.afterimage_color2),
		image_xscale: obj_player1.image_xscale,
		identifier: afterimage.simple,
		visible: true,
		//depth : dep,,
	};
	ds_list_add(global.afterimage_list, q);

	return q;
}

function create_mach3effect(argument0, argument1, argument2, argument3)
{
	var q;

	//var dep = depth + 1;
	var pid = obj_player1.image_xscale;

	q = {
		x: argument0,
		y: argument1,
		sprite_index: argument2,
		image_index: argument3,
		alarm: [15, 3, -1],
		image_blend: choose(global.mach_color1, global.mach_color2),
		image_xscale: pid,
		visible: true,
		identifier: afterimage.mach3effect,
		playerid: obj_player1,
	};
	ds_list_add(global.afterimage_list, q);

	return q;
}

function create_heatattack_afterimage(argument0, argument1, argument2, argument3, argument4)
{
	var _velocity;

	_velocity = 6;

	with (create_afterimage(argument0, argument1, argument2, argument3))
	{
		identifier = afterimage.heatattack;
		alarm[1] = -1;
		alarm[2] = -1;
		alarm[0] = 8;
		image_xscale = argument4;
		hsp = _velocity;
		vsp = 0;
	}

	with (create_afterimage(argument0, argument1, argument2, argument3))
	{
		identifier = afterimage.heatattack;
		alarm[1] = -1;
		alarm[2] = -1;
		alarm[0] = 8;
		image_xscale = argument4;
		hsp = -_velocity;
		vsp = 0;
	}

	with (create_afterimage(argument0, argument1, argument2, argument3))
	{
		identifier = afterimage.heatattack;
		alarm[1] = -1;
		alarm[2] = -1;
		alarm[0] = 8;
		image_xscale = argument4;
		hsp = 0;
		vsp = _velocity;
	}

	with (create_afterimage(argument0, argument1, argument2, argument3))
	{
		identifier = afterimage.heatattack;
		alarm[1] = -1;
		alarm[2] = -1;
		alarm[0] = 8;
		image_xscale = argument4;
		hsp = 0;
		vsp = -_velocity;
	}
}

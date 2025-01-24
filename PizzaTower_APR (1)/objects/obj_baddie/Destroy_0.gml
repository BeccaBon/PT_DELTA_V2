if (room == rm_editor)
{
	exit;
}

trace("destroy");

if (ds_list_find_index(global.baddieroom, id) == -1 && important == false)
{
	var i = random_range(0, 100)
    if (i >= 75)
        scr_soundeffect(sfx_scream10, sfx_scream1, sfx_scream2, sfx_scream3, sfx_scream4, sfx_scream5, sfx_scream6, sfx_scream7, sfx_scream8, sfx_scream9, sfx_scream11, sfx_scream12, sfx_scream13, sfx_scream14, sfx_scream15, sfx_scream16)
	trace("destroy important");

	if (instance_exists(obj_hardmode))
	{
		global.heatmeter_count++;
	}

	var combototal = 10 * (global.stylethreshold + 1);
	global.collect += combototal;

	with (instance_create(x, y, obj_smallnumber))
	{
		number = string(combototal);
	}

	scr_soundeffect(sfx_killenemy);

	repeat (3)
	{
		with (create_debris(x, y, spr_slapstar))
		{
			hsp = random_range(-5, 5);
			vsp = random_range(-10, 10);
		}
	}

	instance_create(x, y, obj_bangeffect);

	with (obj_camera)
	{
		shake_mag = 3;
		shake_mag_acc = 3 / room_speed;
	}

    with (instance_create(x, y, obj_sausageman_dead))
    {
        sprite_index = other.spr_dead
        spr_palette = other.spr_palette
        paletteselect = global.stylethreshold >= 3
    }

	if (object_index == obj_tank)
	{
		repeat (3)
		{
			with (instance_create(x, y, obj_sausageman_dead))
			{
				sprite_index = other.spr_content_dead;
			}
		}
	}

	if (object_index != obj_miniufo || global.stylethreshold < 3)
	{
		ds_list_add(global.baddieroom, id);
	}
	else
	{
		with (instance_create(x, y, obj_miniufo_grounded))
		{
			stored_id = other.id;
		}
	}

	if (object_index == obj_miniufo_grounded && stored_id != noone)
	{
		ds_list_add(global.baddieroom, stored_id);
	}
}
else if (ds_list_find_index(global.baddieroom, id) == -1 && important == true)
{
	trace("destroy unimportant");
	instance_create(x, y, obj_slapstar);
	instance_create(x, y, obj_slapstar);
	instance_create(x, y, obj_slapstar);
	instance_create(x, y, obj_baddiegibs);
	instance_create(x, y, obj_baddiegibs);
	instance_create(x, y, obj_baddiegibs);
	scr_soundeffect(sfx_killenemy);

	with (obj_camera)
	{
		shake_mag = 3;
		shake_mag_acc = 3 / room_speed;
	}

	ds_list_add(global.baddieroom, id);

	with (instance_create(x, y, obj_sausageman_dead))
	{
		sprite_index = other.spr_dead;
		spr_palette = other.spr_palette;
		paletteselect = other.paletteselect;
	}
}

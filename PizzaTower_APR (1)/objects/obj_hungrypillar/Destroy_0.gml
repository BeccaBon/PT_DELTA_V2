if (room == rm_editor)
{
	exit;
}

if (ds_list_find_index(global.saveroom, id) == -1 && global.snickchallenge == false)
{
	instance_activate_object(obj_baddie);

	with (obj_baddie)
	{
		if (escape == true)
		{
			visible = true;
			instance_create(x, y, obj_genericpoofeffect);
		}
	}

	instance_activate_object(obj_collectescape);

	with (obj_collectescape)
	{
		image_alpha = 1;
		instance_create(x, y, obj_genericpoofeffect);
	}
	scr_soundeffect(sfx_escaperumble);
	obj_camera.alarm[1] = 60;
	instance_create(x, y, obj_bangeffect);
	instance_create(x, y, obj_slapstar);
	instance_create(x, y, obj_slapstar);
	instance_create(x, y, obj_slapstar);
	instance_create(x, y, obj_baddiegibs);
	instance_create(x, y, obj_baddiegibs);
	instance_create(x, y, obj_baddiegibs);

	if (global.coop == true)
	{
		obj_player1.x = x;
		obj_player2.x = x;
		obj_player1.y = y;
		obj_player2.y = y;
	}

	with (obj_camera)
	{
		shake_mag = 3;
		shake_mag_acc = 3 / room_speed;
	}

	instance_destroy();

	with (instance_create(x, y, obj_sausageman_dead))
	{
		sprite_index = spr_hungrypillar_dead;
	}

	scr_soundeffect(sfx_killenemy);
	instance_create(x, y + 600, obj_itspizzatime);
	scr_soundeffect(sfx_scream10, sfx_scream1, sfx_scream2, sfx_scream3, sfx_scream4, sfx_scream5, sfx_scream6, sfx_scream7, sfx_scream8, sfx_scream9, sfx_scream11, sfx_scream12, sfx_scream13)
	global.panic = true;

	switch (room)
	{
		case entrance_10:
            global.fill = 1860;
			break;

		case medieval_10:
            global.fill = 2040;
			break;

		case ruin_11:
            global.fill = 2160;
			break;

		case dungeon_10:
            global.fill = 2460;
			break;

		case chateau_6:
			global.minutes = 3;
			global.seconds = 59;
			break;

		case strongcold_1:
			global.minutes = 4;
			global.seconds = 0;
			break;

		case dragonlair_1:
			global.minutes = 0;
			global.seconds = 59;
			break;

		case desert_16:
            global.fill = 2556;
			break;

		case graveyard_6:
            global.fill = 2640;
			break;

		case farm_11:
            global.fill = 1920;
			break;

		case ufo_12:
            global.fill = 2100;
			break;

		case beach_13:
            global.fill = 2220
			break;

		case forest_5:
            global.fill = 2520;
			break;

		case kungfu_10:
            global.fill = 4056;
			break;

		case minigolf_8:
            global.fill = 3240;
			break;

		case space_9:
            global.fill = 2220;
			break;

		case sewer_8:
            global.fill = 3300;
			break;

		case city_11:
            global.fill = 2280;
			break;

		case mansion_7:
			global.fill = 4000;
			break;

		case factory_10:
			global.fill = 4000;
			break;

		case freezer_3:
			global.fill = 4000;
			break;

		case war_1:
			global.fill = 4500;
			break;

		case exit_1:
			global.fill = 5000;
			break;

		case kidsparty_lastroom:
            global.fill = 2460;
			break;

		case custom_lvl_room:
			global.minutes = 2;
			global.seconds = 15;
			break;
	}

	ds_list_add(global.saveroom, id);
}

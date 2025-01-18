if (!global.panic && global.combo < 50 && !global.snickchallenge && !instance_exists(obj_hungrypillar))
{
	if (instance_exists(obj_pepperman))
	{
		audio_stop_all();
		scr_sound(mu_pepperman);
	}
	if (instance_exists(obj_vigilanteboss))
	{
		audio_stop_all();
		scr_sound(mu_vigilante);
	}
	if (instance_exists(obj_noiseboss))
	{
		audio_stop_all();
		scr_sound(mu_miniboss);
	}
	if (instance_exists(obj_mrstickboss))
	{
		audio_stop_all();
		scr_sound(mu_nakedstick);
	}

	roomname = room_get_name(room);
	global.mu = noone;
	var trackposition = 1;

	switch (string_letters(roomname))
	{
		case "rmlevelselect":
			global.mu = noone;
			trackposition = 0;
			break;

		case "characterselect":
			global.mu = mu_characterselect;
			trackposition = 0;
			break;

		case "Realtitlescreen":
			global.mu = mu_title;
			trackposition = 0;
			break;

		case "hubroom":
		case "Titlescreen":
		case "halloweenentrance":
			global.mu = mu_hub;
			trackposition = 0;
			break;

		case "PProom":
			global.mu = mu_tutorial;
			trackposition = 0;
			break;

		case "entrance":
			global.mu = (obj_player1.character == "P") ? mu_entrance : mu_noiseentrance;
			break;

		case "dungeon":
			for (var i = 0; i < 20; i++)
			{
				if (roomname == ("dungeon_" + string(i)) && i <= 8)
				{
					global.mu = mu_dungeon;
				}
				else if (roomname == ("dungeon_" + string(i)) && i > 8)
				{
					global.mu = mu_dungeondepth;
				}
			}

			break;

		case "strongcold":
			if (roomname == "strongcold_1")
			{
				global.mu = mu_chateau;
			}
			else
			{
				for (var i = 0; i < 20; i++)
				{
					if (roomname == ("strongcold_" + string(i)) && i <= 8 && i > 1)
					{
						global.mu = mu_strongcold;
					}
					else if (roomname == ("strongcold_" + string(i)) && i > 8)
					{
						global.mu = mu_dungeondepth;
					}
				}
			}

			break;

		case "medieval":
			for (var i = 0; i < 20; i++)
			{
				if (roomname == ("medieval_" + string(i)) && i <= 2)
				{
					global.mu = mu_medievalentrance;
				}
				else if (roomname == ("medieval_" + string(i)) && i > 2 && i <= 5)
				{
					global.mu = mu_medievalremix;
				}
				else if (roomname == ("medieval_" + string(i)) && i > 5)
				{
					global.mu = mu_medieval;
				}
			}

			break;

		case "ruin":
			for (var i = 0; i < 20; i++)
			{
				if (roomname == ("ruin_" + string(i)) && i <= 6)
				{
					global.mu = mu_ruin;
				}
				else if (roomname == ("ruin_" + string(i)) && i > 6)
				{
					global.mu = mu_ruinremix;
				}
			}

			break;

		case "floorroom":
			for (var i = 0; i < 20; i++)
			{
				if (roomname == ("floor1_room" + string(i)) && i <= 9)
				{
					global.mu = mu_desert;
				}
				else if (roomname == ("floor1_room" + string(i)) && i > 9)
				{
					global.mu = mu_ufo;
				}
			}

			break;

		case "forest":
			for (var i = 0; i < 20; i++)
			{
				if (roomname == ("forest_" + string(i)) && i <= 3)
				{
					global.mu = mu_forest;
				}
				else if (roomname == ("forest_" + string(i)) && i > 3 && i <= 5)
				{
					global.mu = mu_gustavo;
				}
				else if (roomname == ("forest_" + string(i)) && i > 5)
				{
					global.mu = mu_forestb;
				}
			}

			break;


		case "chateau":
			global.mu = mu_chateau;
			break;

		case "farm":
			global.mu = mu_farm;
			break;

		case "graveyard":
			global.mu = mu_graveyard;
			break;

		case "ufo":
			global.mu = mu_pinball;
			break;

		case "beach":
			global.mu = mu_beach;
			break;

		case "entrancesecret":
		case "kungfusecret":
		case "mansionsecret":
		case "citysecret":
			global.mu = mu_secret;
			break;
			
		case "chateausecret":
		case "medievalsecret":
			global.mu = mu_medievalsecret;
			break;

		case "ruinsecret":
			global.mu = mu_ruinsecret;
			break;

		case "dungeonsecret":
		case "strongcoldsecret":
			global.mu = mu_dungeonsecret;
			break;

		case "dragonlair":
			global.mu = mu_dragonlair;
			break;

		case "floorsecret":
			global.mu = mu_desertsecret;
			break;

		case "ufosecret":
			global.mu = mu_pinballsecret;
			break;

		case "graveyardsecret":
			global.mu = mu_graveyardsecret;
			break;

		case "forestsecret":
			global.mu = mu_forestsecret;
			break;

		case "farmsecret":
			global.mu = mu_farmsecret;
			break;
			
		case "sewersecret":
			global.mu = mu_sewersecret;
			break;
			
		case "minigolfsecret":
			global.mu = mu_minigolfsecret;
			break;
			
		case "kidspartysecret":
			global.mu = mu_kidspartysecret;
			break;
			
		case "factorysecret":
			global.mu = mu_factorysecret;
			break;
			
		case "beachsecret":
			global.mu = mu_beachsecret;
			break;
			
        case "freezer":
            for (i = 0; i < 20; i++)
            {
                if (roomname == ("freezer_" + string(i)) && i <= 13)
                    global.mu = mu_freezer
                else if (roomname == ("freezer_" + string(i)) && i > 13)
                    global.mu = mu_freezerb
            }
            break
        case "sewer":
            for (i = 0; i < 20; i++)
            {
                if (roomname == ("sewer_" + string(i)) && i <= 4)
                    global.mu = mu_sewer
                else if (roomname == ("sewer_" + string(i)) && i > 4)
                    global.mu = mu_sewerb
            }
            break
        case "factory":
            global.mu = mu_factory
            break
        case "minigolf":
            global.mu = mu_minigolf
            break
        case "space":
            global.mu = mu_space
            break
        case "war":
            global.mu = mu_war
            break
        case "mansion":
            global.mu = mu_mansion
            break
        case "kungfu":
            global.mu = mu_kungfu
            break
		case "city":
			for (var i = 0; i < 20; i++)
			{
				if (roomname == ("city_" + string(i)) && i <= 7)
				{
					global.mu = mu_city;
				}
				else if (roomname == ("city_" + string(i)) && i > 7)
				{
					global.mu = mu_cityb;
				}
			}

			break;

        case "kidsparty":
            global.mu = mu_kidsparty
            break
	}

	if (global.mu != noone && !audio_is_playing(global.mu))
	{
		audio_stop_all();
		scr_sound(global.mu);
		pausedmusic = global.mu;

		if (trackposition)
		{
			audio_sound_set_track_position(global.music, fadeoff);
		}
	}
	else if (global.mu == noone)
	{
		if (room == rm_levelselect)
		{
			audio_stop_all();
		}
	}
}

if (room == custom_lvl_room)
{
	alarm[0] = 4;
}

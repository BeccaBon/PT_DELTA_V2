with (obj_player1)
{
	var _state = state;

	if (state == states.backbreaker || state == states.hit || state == states.chainsaw)
	{
		_state = tauntstoredstate;
	}

	switch (_state)
	{
		case states.knightpep:
			audio_sound_pitch(global.mu, 0.9);
			break;

		case states.knightpepslopes:
			audio_sound_pitch(global.mu, 1.2);
			break;
			
		case states.cheeseball:
			audio_sound_pitch(global.mu, 1.2);
			break;

		case states.cheesepep:
			audio_sound_pitch(global.mu, 0.9);
			break;
			
		case states.cheesepepstick:
			audio_sound_pitch(global.mu, 0.9);
			break;
			
		case states.cheesepepstickside:
			audio_sound_pitch(global.mu, 0.9);
			break;
			
		case states.cheesepepstickup:
			audio_sound_pitch(global.mu, 0.9);
			break;
			
		case states.tumble:
			audio_sound_pitch(global.mu, 1.2);
			break;

		case states.rocket:
			audio_sound_pitch(global.mu, 1.2);
			break;

		case states.barrel:
			audio_sound_pitch(global.mu, 1.2);
			break;

		case states.rideweenie:
			audio_sound_pitch(global.mu, 1.2);
			break;

		case states.firemouth:
			audio_sound_pitch(global.mu, 1.2);
			break;

		case states.skateboard:
			audio_sound_pitch(global.mu, 1.2);
			break;

		default:
			audio_sound_pitch(global.mu, 1);
	}
}

if (
	!audio_is_playing(mu_pizzatime)
	&& !audio_is_playing(mu_chase)
	&& !audio_is_playing(mu_noiseescape)
	&& !audio_is_playing(mu_noisechase)
	&& !audio_is_playing(mu_finalescape)
	&& !audio_is_playing(mu_noisefinalescape)
	&& string_letters(roomname) != "dragonlair"
	&& global.panic == true
	&& obj_pause.pause == 0
	&& obj_camera.ded == 0
)
{
	audio_stop_all();
    if (global.gerome == true)
    {
		if (obj_player1.character == "N" || obj_player1.ispeppino == 0)
		{
			scr_sound(mu_noisechase)
			pausedmusic = mu_noisechase
		}
		else
		{
			scr_sound(mu_chase)
			pausedmusic = mu_chase
		}
    }
	else if (string_letters(room_get_name(room)) == "exit")
    {
		if (obj_player1.character == "N" || obj_player1.ispeppino == 0)
		{
			scr_sound(mu_noisefinalescape)
			pausedmusic = mu_noisefinalescape
		}
		else
		{
			scr_sound(mu_finalescape)
			pausedmusic = mu_finalescape
		}
    }
	else if (obj_player1.character == "N" || obj_player1.ispeppino == 0)
	{
		scr_sound(mu_noiseescape);
		pausedmusic = mu_noiseescape;
	}
	else
	{
		scr_sound(mu_pizzatime);
		pausedmusic = mu_pizzatime;
	}
}

if (arena == 1 && !audio_is_playing(mu_miniboss) && obj_pause.pause == 0)
{
	audio_stop_all();
	scr_sound(mu_miniboss);
	pausedmusic = mu_miniboss;
}

if (instance_exists(obj_hungrypillar) && !audio_is_playing(mu_dungeondepth) && obj_pause.pause == 0)
{
	audio_stop_all();
	scr_sound(mu_dungeondepth);
	pausedmusic = mu_dungeondepth;
}
if (global.miniboss == false && arena == 0 && audio_is_playing(mu_miniboss))
{
	audio_stop_sound(mu_miniboss);
}

if (!audio_is_playing(mu_snickchallenge) && global.snickchallenge == true && obj_pause.pause == 0 && global.minutes >= 2 && obj_camera.ded == 0)
{
	audio_stop_all();
	scr_sound(mu_snickchallenge);
	pausedmusic = mu_snickchallenge;
}
else if (!audio_is_playing(mu_snickchallengeend) && global.snickchallenge == true && obj_pause.pause == 0 && global.minutes < 2 && obj_camera.ded == 0)
{
	audio_stop_all();
	scr_sound(mu_snickchallengeend);
	pausedmusic = mu_snickchallenge;
}

if (room != hub_room1)
{
	fadeoff = audio_sound_get_track_position(global.music);
}
else
{
	fadeoff = 0;
}

if (room == strongcold_miniboss && global.miniboss == true)
{
	if (!audio_is_playing(mu_miniboss))
	{
		audio_stop_all();
		scr_sound(mu_miniboss);
		scr_soundeffect(sfx_scream5);
		pausedmusic = mu_miniboss;
	}
}
else if (room == strongcold_endscreen)
{
	if (!audio_is_playing(mu_entrance))
	{
		audio_stop_all();
		scr_sound(mu_entrance);
		pausedmusic = mu_entrance;
	}
}

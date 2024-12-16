switch (state)
{
	case states.idle:
		scr_enemy_idle();
		break;

	case states.turn:
		scr_enemy_turn();
		break;

	case states.walk:
		scr_enemy_walk();
		break;

	case states.land:
		scr_enemy_land();
		break;

	case states.hit:
		scr_enemy_hit();
		break;

	case states.stun:
		scr_enemy_stun();
		break;

	case states.grabbed:
		scr_enemy_grabbed();
		break;
}

if (!instance_exists(obj_slaphitbox))
{
	slapped = false;
}

stunned = 100;

if (cigar == false)
{
	landspr = 36;
	idlespr = spr_noisesatellite;
	fallspr = spr_noisesatellite;
	hitceillingspr = 36;
	stunfalltransspr = 36;
	hitwallspr = 36;
	stunfallspr = spr_noisesatellitestun;
	rollingspr = 36;
	walkspr = spr_noisesatellite;
	turnspr = spr_noisesatellite;
	flyingspr = 36;
	hitspr = 36;
	stunlandspr = 36;
	stunspr = 36;
	recoveryspr = spr_noisesatellite;
	stompedspr = 36;
	grabbedspr = spr_noisesatellitestun;
}

if (state != states.grabbed)
{
	depth = 0;
}

if (state != states.stun)
{
	thrown = false;
}

if (flash == true && alarm[2] <= 0)
{
	alarm[2] = 0.15 * room_speed;
}

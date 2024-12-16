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

if (state == states.stun && stunned > 40 && birdcreated == false)
{
	birdcreated = true;

	with (instance_create(x, y, obj_enemybird))
	{
		ID = other.id;
	}
}

if (state != states.stun)
{
	birdcreated = false;
}

if (hp <= 0)
{
	instance_destroy();
}

if (cigar == true)
{
	landspr = 145;
	idlespr = spr_sausageman_idle;
	fallspr = spr_sausageman_fall;
	hitceillingspr = 139;
	stunfalltransspr = 137;
	hitwallspr = 131;
	stunfallspr = spr_sausageman_stunfall;
	rollingspr = 125;
	walkspr = spr_sausageman_walk;
	turnspr = spr_sausageman_turn;
	flyingspr = 141;
	hitspr = 143;
	stunlandspr = 129;
	stunspr = 127;
	recoveryspr = spr_sausageman_recovery;
	stompedspr = 133;
	grabbedspr = spr_sausageman_grabbed;
}

if (cigar == false)
{
	landspr = 144;
	idlespr = spr_sausagemannocigar_idle;
	fallspr = spr_sausagemannocigar_fall;
	hitceillingspr = 138;
	stunfalltransspr = 136;
	hitwallspr = 130;
	stunfallspr = spr_sausagemannocigar_stunfall;
	rollingspr = 124;
	walkspr = spr_sausagemannocigar_walk;
	turnspr = spr_sausagemannocigar_turn;
	flyingspr = 140;
	hitspr = 142;
	stunlandspr = 128;
	stunspr = 126;
	recoveryspr = spr_sausagemannocigar_recovery;
	stompedspr = 132;
	grabbedspr = spr_sausagemannocigar_grabbed;
}

if (cigar == true && cigarcreate == 0 && (state == states.idle || state == states.walk || state == states.turn || state == states.land))
{
	cigarcreate = 1;

	with (instance_create(x, y, obj_sausagemancigar))
	{
		ID = other.id;
	}
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

switch (state)
{
	case states.idle:
		scr_enemy_idle();
		break;

	case states.bounce:
		scr_enemy_bounce();
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

if (state == states.idle && obj_player.x != x)
{
	image_xscale = sign(obj_player.x - x);
}

if (state == states.idle)
{
	attack--;
}

if (attack <= 0 && state == states.idle)
{
	sprite_index = jumpprepspr;
	image_index = 0;
	state = states.bounce;
}

if (global.bosshealth == 5)
{
	helmet = 1;
}

if (helmet == 0)
{
	idlespr = spr_noisecrusher_bounce;
	stunfallspr = spr_noisecrusher_stun;
	walkspr = spr_noisecrusher_bounce;
	grabbedspr = spr_noisecrusher_stun;
	jumpprepspr = 30;
	jumpspr = 28;
	landspr = 26;
	airspr = 21;
}
else
{
	idlespr = spr_noisecrusherhelmet_bounce;
	stunfallspr = spr_noisecrusherhelmet_stun;
	walkspr = spr_noisecrusherhelmet_bounce;
	grabbedspr = spr_noisecrusherhelmet_stun;
	jumpprepspr = 29;
	jumpspr = 27;
	landspr = 25;
	airspr = 20;
}

if (global.bosshealth <= 0)
{
	instance_destroy();
}

if (caughtplayer == 1 && !grounded)
{
	obj_player.state = states.bump;
	obj_player.image_index = 0;
	obj_player.x = x;
	obj_player.y = y;
}

if (caughtplayer == 1 && grounded)
{
	obj_player.state = states.boxxedpep;

	if (obj_player.sprite_index != spr_boxxedpep_intro)
	{
		obj_player.sprite_index = spr_boxxedpep_intro;
	}

	obj_player.image_index = 0;
	obj_player.hsp = 0;
	obj_player.vsp = 0;
	obj_player.x = x;
	obj_player.y = y - 20;
	caughtplayer = 0;
}

if (flash == true && alarm[2] <= 0)
{
	alarm[2] = 0.15 * room_speed;
}

if (state != states.grabbed)
{
	depth = 0;
}

scr_collide();

if (state != states.stun)
{
	thrown = false;
}

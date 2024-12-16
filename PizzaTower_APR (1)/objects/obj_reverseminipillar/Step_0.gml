if ((global.panic == false || global.gerome == true) && global.treasure == 0)
{
	x = xstart;
	y = ystart;
	sprite_index = spr_minipillarwoke;
	mask_index = spr_minipillarwoke;
}
else
{
	x = -100;
	y = -100;
	sprite_index = spr_minipillarsleep;
}

if (global.panic == true)
{
	image_speed = 0.5;
}

if (global.miniboss == true && global.minutes == 0 && global.seconds < 33)
{
	image_speed = 0.5;
}
else
{
	image_speed = 0;
	image_index = 0;
}

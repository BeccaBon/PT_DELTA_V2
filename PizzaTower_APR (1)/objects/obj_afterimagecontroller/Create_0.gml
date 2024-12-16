enum afterimage
{
	simple,
	mach3effect,
	heatattack,
	enum_length,
}

depth = 1;
global.afterimage_list = ds_list_create();
alpha = array_create(afterimage.enum_length, 1);
alpha[afterimage.heatattack] = 0.5;

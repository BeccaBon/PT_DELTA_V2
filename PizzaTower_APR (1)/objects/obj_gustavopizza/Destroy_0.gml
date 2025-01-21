	repeat (6)
	{
		instance_create(x, y, obj_slimedebris);
	}
scr_soundeffect(sfx_collecttopping);

ds_list_add(global.saveroom, id);




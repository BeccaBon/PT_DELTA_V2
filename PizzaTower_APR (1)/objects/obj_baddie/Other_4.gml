if (ds_list_find_index(global.baddieroom, id) != -1)
{
	instance_destroy();
}

if (escape == true && global.panic == false)
{
	instance_deactivate_object(id);
}

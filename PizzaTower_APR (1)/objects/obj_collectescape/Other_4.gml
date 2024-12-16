if (room == rm_editor)
{
	exit;
}

if (global.timeattack == true)
{
	instance_destroy();
}

if (ds_list_find_index(global.saveroom, id) != -1)
{
	instance_destroy();
}

if (global.panic == false)
{
	instance_deactivate_object(id);
	visible = true;
}

if (global.snickchallenge == true)
{
	instance_destroy();
}

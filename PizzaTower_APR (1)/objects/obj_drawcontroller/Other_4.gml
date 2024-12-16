if (room != kidsparty_entrance1)
{
	var roomname = room_get_name(room);
	roomname = string_letters(roomname);

	if (roomname == "kidsparty" || roomname == "kidspartyentrance")
	{
		use_lighting = true;
	}
	else
	{
		use_lighting = false;
	}
}
else
{
	use_lighting = false;
}

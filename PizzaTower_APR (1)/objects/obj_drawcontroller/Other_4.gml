if (room != kidsparty_entrance1)
{
	var roomname = room_get_name(room);
	roomname = string_letters(roomname);

	if (roomname == "kidsparty" || roomname == "kidspartyentrance" or room == chateau_3 or room = chateau_3b or room == chateau_4 or room == chateau_5 or room == chateau_6 or room == chateau_7 or room == chateau_8 or room == chateau_9 or room == chateau_9b or room == chateau_10)
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

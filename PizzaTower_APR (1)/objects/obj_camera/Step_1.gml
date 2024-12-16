/*if (check_online())
{
	var time = 50 / 60; //60 = game fps
	chat_dottimer += 1 / 60;

	if (chat_dottimer >= time)
	{
		chat_dottimer = 0;
		global.chat_dot = (global.chat_dot + 1) % 4;
	}
}
else
{
	global.chat_dot = 1;
	chat_dottimer = 0;
}

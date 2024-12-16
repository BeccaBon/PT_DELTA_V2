if (obj_player1.spotlight == true)
{
	playerid = obj_player1;
}
else
{
	playerid = obj_player2;
}

visible = playerid.visible;

if (set == 0)
{
	switch (toppinwarrior)
	{
		case 1:
			depth = 10;
			spr_idle = spr_twarrior1_idle;
			spr_pose = 1946;
			spr_run = spr_twarrior1_run;
			spr_attack = 1949;
			spr_hurt = spr_twarrior1_hurt;
			global.toppinwarriorid1 = id;
			set = 1;
			break;

		case 2:
			depth = 11;
			spr_idle = spr_twarrior2_idle;
			spr_pose = 1952;
			spr_run = spr_twarrior2_run;
			spr_attack = 1954;
			spr_hurt = spr_twarrior2_hurt;
			global.toppinwarriorid2 = id;
			set = 1;
			break;

		case 3:
			depth = 12;
			spr_idle = spr_twarrior3_idle;
			spr_pose = 1957;
			spr_run = spr_twarrior3_run;
			spr_attack = 1959;
			spr_hurt = spr_twarrior3_hurt;
			global.toppinwarriorid3 = id;
			set = 1;
			break;

		case 4:
			depth = 13;
			spr_idle = spr_twarrior4_idle;
			spr_pose = 1962;
			spr_run = spr_twarrior4_run;
			spr_attack = 1964;
			spr_hurt = spr_twarrior4_hurt;
			global.toppinwarriorid4 = id;
			set = 1;
			break;

		case 5:
			depth = 14;
			spr_idle = spr_twarrior5_idle;
			spr_pose = 1967;
			spr_run = spr_twarrior5_run;
			spr_attack = 1970;
			spr_hurt = spr_twarrior5_hurt;
			global.toppinwarriorid5 = id;
			set = 1;
			break;
	}
}

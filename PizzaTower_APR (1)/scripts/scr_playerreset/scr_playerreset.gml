function scr_playerreset()
{
	trace("playerreset");

	with (obj_player)
	{
		global.hp = 0;
		global.gerome = false;
		global.stylelock = false;
		ds_list_clear(global.baddietomb);
		global.ammorefill = 0;
		global.ammoalt = 1;
		obj_player.supercharge = 0;
		obj_player.supercharged = 0;
		global.mort = false;
		global.style = 0;
		global.spaceblockswitch = 1;
		global.stylethreshold = 0;
		global.baddiespeed = 1;

		with (obj_stylebar)
		{
			sprite = spr_mild;
		}

		global.bullet = 3;
		global.fuel = 3;
		global.golfhit = 0;
		global.railspeed = global.maxrailspeed;
		global.temperature = 0;

		if (room != freezer_1)
		{
			global.use_temperature = 0;
		}

		global.heatmeter_count = 0;
		global.monsterspeed = 0;

		with (obj_music)
		{
			arena = 0;
		}

		if (instance_exists(obj_endlevelfade))
		{
			instance_destroy(obj_endlevelfade);
		}

		if (instance_exists(obj_monstertrackingrooms))
		{
			instance_destroy(obj_monstertrackingrooms);
		}

		if (instance_exists(obj_gnome_checklist))
		{
			var destroy = 1;

			with (obj_player)
			{
				if (state == states.gameover || state == states.timesup)
				{
					destroy = 0;
				}
			}

			if (destroy)
			{
				instance_destroy(obj_gnome_checklist);
			}
		}

		global.timeractive = 0;
		global.wave = 0;
		global.maxwave = 0;
		global.secretfound = 0;
		global.hurtcounter = 0;
		global.snickchallenge = false;
		global.timeattack = false;
		global.giantkey = false;
		global.pizzadelivery = false;
		global.failcutscene = false;
		global.pizzasdelivered = 0;
		global.spaceblockswitch = 1;

		if (instance_exists(obj_snickexe))
		{
			instance_destroy(obj_snickexe);
		}

		obj_timeattack.stop = 0;

		if (instance_exists(obj_pizzaface))
		{
			instance_destroy(obj_pizzaface);
		}

		if (instance_exists(obj_pizzashield))
		{
			instance_destroy(obj_pizzashield);
		}

		instance_destroy(obj_pepanimatronicfollow);
		global.timedgate = false;
		global.timedgatetimer = 0;
		global.timedgatetime = 0;
		global.taseconds = 0;
		global.taminutes = 0;
		obj_player1.spotlight = true;
		obj_player2.x = -1000;
		obj_player2.y = 500;

		if (instance_exists(obj_coopflag))
		{
			instance_destroy(obj_coopflag);
		}

		if (instance_exists(obj_cooppointer))
		{
			instance_destroy(obj_cooppointer);
		}

		instance_destroy(obj_coopplayerfollow);

		with (obj_cutscene_handler)
		{
			instance_destroy();
		}

		if (instance_exists(obj_toppinwarrior))
		{
			instance_destroy(obj_toppinwarrior);
		}

        with (obj_tv)
        {
            shownranka = false
            shownrankb = false
            shownrankc = false
            ds_list_clear(tvprompts_list)
            prompt = ""
            bubblespr = -4
            promptx = promptxstart
            tv_bg_index = 0
            expressionsprite = -4
            if (!global.levelreset)
            {
                sprite_index = spr_tv_off
                tvsprite = spr_tv_idle
                state = states.normal
                tv_set_idle()
            }
        }

		global.SAGEshotgunsnicknumber = 0;
		obj_music.fadeoff = 0;
		audio_stop_all();

		if (instance_exists(obj_timesup))
		{
			instance_destroy(obj_timesup);
		}

		global.seconds = 59;
		global.minutes = 1;
		obj_player1.state = states.comingoutdoor;
		obj_player2.state = states.comingoutdoor;
		obj_player1.visible = true;
		obj_player2.visible = true;
		ds_list_clear(global.saveroom);
		ds_list_clear(global.baddieroom);

		with (obj_player)
		{
			image_blend = make_colour_hsv(0, 0, 255);
			supercharged = 0;
			pizzapepper = false;
			pizzashield = false;
			c = 0;
			heavy = false;
			image_index = 0;
			sprite_index = spr_walkfront;
			alarm[0] = -1;
			alarm[1] = -1;
			alarm[3] = -1;
			alarm[4] = -1;
			alarm[5] = -1;
			alarm[6] = -1;
			alarm[7] = -1;
			alarm[8] = -1;
			alarm[9] = -1;
			alarm[10] = -1;
			grav = 0.5;
			hsp = 0;
			vsp = 0;
			global.playerhealth = 100;
			xscale = 1;
			yscale = 1;
			parry = 0;
			parry_inst = noone;
			parry_count = 0;
			is_firing = false;
			pogospeed = 6;
			pogochargeactive = false;
			pogocharge = 100;
			x = backtohubstartx;
			y = backtohubstarty;
			backupweapon = 0;
			shotgunAnim = 0;
			box = false;
			steppy = false;
			movespeedmax = 5;
			jumpstop = false;
			start_running = 1;
			obj_camera.ded = 0;
			visible = true;
			global.panic = false;
			turn = 0;
			jumpAnim = true;
			dashAnim = 1;
			landAnim = false;
			machslideAnim = false;
			moveAnim = true;
			stopAnim = true;
			crouchslideAnim = 1;
			crouchAnim = 1;
			machhitAnim = 0;
			stompAnim = false;
			inv_frames = false;
			turning = false;
			hurtbounce = 0;
			hurted = false;
			autodash = false;
			mach2 = 0;
			input_buffer_jump = 8;
			input_buffer_secondjump = 8;
			input_buffer_highjump = 8;
			flash = false;
			global.key_inv = false;
			global.pepanimatronic = 0;
			global.shroomfollow = false;
			global.cheesefollow = false;
			global.tomatofollow = false;
			global.sausagefollow = false;
			global.pineapplefollow = false;
			global.keyget = false;
			global.collect = 0;
			global.collectN = 0;
			global.ammo = 0;
			global.treasure = 0;
			global.combo = 0;
			global.combotime = 0;
			global.heattime = 0;
			global.pizzacoin = 0;
			global.toppintotal = 1;
			global.hit = 0;
			ini_open(concat("saveData", global.currentsavefile, ".ini"));
			global.SAGEshotgunsnick = ini_read_string("SAGE2019", "shotgunsnick", 0);
			global.SAGEshotgunsnicknumber = 0;
			global.SAGEdungeonbackup = ini_read_string("SAGE2019", "dungeonbackup", 0);
			global.SAGEsrank = ini_read_string("SAGE2019", "srank", 0);
			global.SAGEsnicksrank = ini_read_string("SAGE2019", "snicksrank", 0);
			global.SAGEcombo10 = ini_read_string("SAGE2019", "combo10", 0);
			global.SAGEsecret = ini_read_string("SAGE2019", "secret", 0);
			global.SAGEknight = ini_read_string("SAGE2019", "knight", 0);
			global.SAGEknighttaken = false;
			global.SAGEtoppin = ini_read_string("SAGE2019", "toppin", 0);
			global.SAGEtreasure = ini_read_string("SAGE2019", "treasure", 0);
			ini_close();
			in_water = 0;
			key_particles = false;
			barrel = 0;
			bounce = 0;
			a = 0;
			idle = 0;
			attacking = false;
			slamming = false;
			superslam = 0;
			machpunchAnim = false;
			punch = false;
			machfreefall = 0;
			shoot = true;
			instakillmove = false;
			windingAnim = false;
			facestompAnim = false;
			ladderbuffer = 0;
			chainsaw = 50;
			toomuchalarm1 = 0;
			toomuchalarm2 = 0;
			dashdust = 0;
			throwforce = 0;
			hurtsound = 0;
			idleanim = 0;
			momemtum = 0;
			cutscene = false;
			grabbing = false;
			dir = xscale;
			goingdownslope = 0;
			goingupslope = 0;
			fallinganimation = 0;
			bombpeptimer = 100;
			slapbuffer = 0;
			slaphand = 1;
			suplexmove = false;
			suplexhavetomash = 0;
			timeuntilhpback = 300;
			anger = 0;
			angry = false;
			skateboarding = 0;
		}
	}

	with (obj_player2)
	{
		pizzashield = false;
		image_blend = make_colour_hsv(0, 0, 255);
		supercharged = 0;
		pizzapepper = false;
		c = 0;
		heavy = false;
		image_index = 0;
		sprite_index = spr_walkfront;
		alarm[0] = -1;
		alarm[1] = -1;
		alarm[3] = -1;
		alarm[4] = -1;
		alarm[5] = -1;
		alarm[6] = -1;
		alarm[7] = -1;
		alarm[8] = -1;
		alarm[9] = -1;
		alarm[10] = -1;
		grav = 0.5;
		hsp = 0;
		vsp = 0;
		global.playerhealth = 100;
		xscale = 1;
		yscale = 1;
		pogospeed = 6;
		pogochargeactive = false;
		pogocharge = 100;
		parry = 0;
		parry_inst = noone;
		parry_count = 0;
		is_firing = false;
		x = backtohubstartx;
		y = backtohubstarty;
		backupweapon = 0;
		shotgunAnim = 0;
		box = false;
		steppy = false;
		movespeedmax = 5;
		jumpstop = false;
		start_running = 1;
		obj_camera.ded = 0;
		visible = true;
		global.panic = false;
		turn = 0;
		jumpAnim = true;
		dashAnim = 1;
		landAnim = false;
		machslideAnim = false;
		moveAnim = true;
		stopAnim = true;
		crouchslideAnim = 1;
		crouchAnim = 1;
		machhitAnim = 0;
		stompAnim = false;
		inv_frames = false;
		turning = false;
		hurtbounce = 0;
		hurted = false;
		autodash = false;
		mach2 = 0;
		input_buffer_jump = 8;
		input_buffer_secondjump = 8;
		input_buffer_highjump = 8;
		flash = false;
		global.key_inv = false;
		global.shroomfollow = false;
		global.cheesefollow = false;
		global.tomatofollow = false;
		global.sausagefollow = false;
		global.pineapplefollow = false;
		global.keyget = false;
		global.collect = 0;
		global.collectN = 0;
		global.ammo = 0;
		global.treasure = 0;
		global.combo = 0;
		global.combotime = 0;
		global.heattime = 0;
		global.pizzacoin = 0;
		global.toppintotal = 1;
		global.hit = 0;
		ini_open("saveData.ini");
		global.SAGEshotgunsnick = ini_read_string("SAGE2019", "shotgunsnick", 0);
		global.SAGEshotgunsnicknumber = 0;
		global.SAGEdungeonbackup = ini_read_string("SAGE2019", "dungeonbackup", 0);
		global.SAGEsrank = ini_read_string("SAGE2019", "srank", 0);
		global.SAGEsnicksrank = ini_read_string("SAGE2019", "snicksrank", 0);
		global.SAGEcombo10 = ini_read_string("SAGE2019", "combo10", 0);
		global.SAGEsecret = ini_read_string("SAGE2019", "secret", 0);
		global.SAGEknight = ini_read_string("SAGE2019", "knight", 0);
		global.SAGEknighttaken = false;
		global.SAGEtoppin = ini_read_string("SAGE2019", "toppin", 0);
		global.SAGEtreasure = ini_read_string("SAGE2019", "treasure", 0);
		ini_close();
		in_water = 0;
		key_particles = false;
		barrel = 0;
		bounce = 0;
		a = 0;
		idle = 0;
		attacking = false;
		slamming = false;
		superslam = 0;
		machpunchAnim = false;
		punch = false;
		machfreefall = 0;
		shoot = true;
		instakillmove = false;
		windingAnim = false;
		facestompAnim = false;
		ladderbuffer = 0;
		chainsaw = 50;
		toomuchalarm1 = 0;
		toomuchalarm2 = 0;
		dashdust = 0;
		throwforce = 0;
		hurtsound = 0;
		idleanim = 0;
		momemtum = 0;
		cutscene = false;
		grabbing = false;
		dir = xscale;
		goingdownslope = 0;
		goingupslope = 0;
		fallinganimation = 0;
		bombpeptimer = 100;
		slapbuffer = 0;
		slaphand = 1;
		suplexmove = false;
		suplexhavetomash = 0;
		timeuntilhpback = 300;
		anger = 0;
		angry = false;
	}
}

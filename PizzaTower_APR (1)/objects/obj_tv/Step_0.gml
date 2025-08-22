if (room == Realtitlescreen || room == rank_room || room == rm_levelselect || room == timesuproom || room == boss_room1 || room == characterselect)
{
    visible = false
    sprite_index = spr_tv_off
}
else
    visible = true
if (instance_exists(obj_debugcontroller) && (!obj_debugcontroller.showhud))
    visible = false
image_speed = 0.35
if (targetgolf != noone && (!instance_exists(targetgolf)))
    targetgolf = -4
if (targetgolf != -4 && (!view_visible[1]))
{
    view_visible[1] = true
    view_enabled = true
}
if (bubblespr != -4 && bubblespr != spr_tv_bubbleclosed)
{
    if (prompt != -4)
        prompt_buffer = 2
    bubbleindex += image_speed
    if (floor(bubbleindex) == sprite_get_number(bubblespr))
    {
        bubbleindex = 0
        switch bubblespr
        {
            case spr_tv_bubbleopen:
                bubblespr = spr_tv_bubble
                break
            case spr_tv_bubbleclose:
                bubblespr = spr_tv_bubbleclosed
                if (prompt == -4 || prompt == "")
                    bubblespr = -4
                break
        }

    }
}
switch (state)
{
	case states.normal:
		idlespr = spr_tv_idle;
		if (!obj_player1.ispeppino)
			idlespr = spr_tv_idleN;
		if (global.panic)
			idlespr = spr_tv_exprpanic;
		else if (global.combo >= 3 && global.combo < 50)
			idlespr = spr_tv_exprcombo;
		else if (global.combo >= 50 || global.stylethreshold >= 3)
			idlespr = spr_tv_exprheat;
		if (!obj_player1.ispeppino && global.panic)
			idlespr = spr_tv_exprpanicN;
		var _state = obj_player1.state;
		if (_state == states.backbreaker || _state == states.chainsaw)
			_state = obj_player1.tauntstoredstate;
		var _transfo = true;
		var _transfospr = scr_tv_get_transfo_sprite();
		if (_transfospr == noone)
			_transfo = false;
		else
			idlespr = _transfospr;
		if (!obj_player1.ispeppino)
		{
			var spr = sprite_get_name(idlespr);
			spr = asset_get_index(concat(spr, "N"));
			if (spr > -1)
				idlespr = spr;
		}
		if (!_transfo)
		{
			//with (obj_player1)
			{
				//if (mach4mode == 1)
					//tv_do_expression(spr_tv_exprmach4);
				//else if (state == states.mach3 || sprite_index == spr_mach3boost)
					//tv_do_expression(spr_tv_exprmach3);
			}
		}
		switch (sprite_index)
		{
			case spr_tv_off:
				if (visible)
				{
					sprite_index = spr_tv_open;
					image_index = 0;
				}
				break;
			case spr_tv_open:
				if (floor(image_index) == (image_number - 1))
					sprite_index = idlespr;
				break;
			case spr_tv_idle:
			case spr_tv_idleN:
				if (idleanim > 0)
					idleanim--;
				if (sprite_index != idlespr)
					sprite_index = idlespr;
				if (idleanim <= 0 && floor(image_index) == (image_number - 1))
				{
					sprite_index = choose(spr_tv_idleanim1, spr_tv_idleanim2);
					if (!obj_player1.ispeppino)
					{
						if (sprite_index == spr_tv_idleanim1)
							sprite_index = spr_tv_idleanim1N;
						if (sprite_index == spr_tv_idleanim2)
							sprite_index = spr_tv_idleanim2N;
					}
					image_index = 0;
				}
				break;
			case spr_tv_idleanim1:
			case spr_tv_idleanim2:
			case spr_tv_idleanim1N:
			case spr_tv_idleanim2N:
				if (floor(image_index) == (image_number - 1))
				{
					sprite_index = idlespr;
					idleanim = 240 + (60 * irandom_range(-1, 2));
				}
				if (idlespr != spr_tv_idle && idlespr != spr_tv_idleN)
					sprite_index = idlespr;
				break;
			default:
				sprite_index = idlespr;
		}
		if (sprite_index != spr_tv_open)
		{
			if (!ds_list_empty(tvprompts_list))
			{
				var b = ds_list_find_value(tvprompts_list, 0);
				prompt_buffer = prompt_max;
				if (b[0] != "" && b[0] != -4)
				{
					bubblespr = spr_tv_bubbleopen;
					bubbleindex = 0;
					prompt = b[0];
					promptspd = b[3];
					promptx = promptxstart;
				}
				else
				{
					if (bubblespr != -4 && bubblespr != spr_tv_bubbleclosed)
						bubblespr = spr_tv_bubbleclose;
					if (bubblespr == spr_tv_bubbleclosed)
						bubblespr = -4;
					bubbleindex = 0;
					promptx = promptxstart;
					prompt = -4;
				}
				if (b[1] == tvprompt.normal)
				{
					sprite_index = spr_tv_open;
					image_index = 0;
					tvsprite = b[2];
					if (!obj_player1.ispeppino)
					{
						spr = sprite_get_name(tvsprite);
						spr = asset_get_index(concat(spr, "N"));
						if (spr > -1)
							tvsprite = spr;
					}
				}
				else
				{
					tvsprite = b[2];
					if (!obj_player1.ispeppino)
					{
						spr = sprite_get_name(tvsprite);
						spr = asset_get_index(concat(spr, "N"));
						if (spr > -1)
							tvsprite = spr;
					}
					sprite_index = tvsprite;
					image_index = 0;
				}
				state = states.transitioncutscene;
			}
			else
				bubblespr = -4;
		}
		break;
	
	case states.transitioncutscene:
		if (sprite_index == spr_tv_open && floor(image_index) == (image_number - 1))
			sprite_index = tvsprite;
		if (sprite_index == tvsprite)
		{
			if (prompt_buffer > 0)
				prompt_buffer--;
			else
			{
				promptx = promptxstart;
				ds_list_delete(tvprompts_list, 0);
				state = states.normal;
			}
		}
		break;
	
	case states.tv_whitenoise:
		if (tv_trans >= sprite_get_number(spr_tv_whitenoise))
		{
			if (expressionsprite != -4)
			{
				state = states.tv_expression;
				sprite_index = expressionsprite;
			}
			else
				state = states.normal;
			image_index = 0;
		}
		break;
	
	case states.tv_expression:
		var s = state;
		var es = expressionsprite;
		_transfospr = scr_tv_get_transfo_sprite();
		switch (expressionsprite)
		{
			case spr_tv_exprhurt:
            case spr_tv_exprhurtN:
           /* case spr_tv_exprhurt1:
            case spr_tv_exprhurt2:
            case spr_tv_exprhurt3:
            case spr_tv_exprhurt4:
            case spr_tv_exprhurt5:
            case spr_tv_exprhurt6:
            case spr_tv_exprhurt7:
            case spr_tv_exprhurt8:
            case spr_tv_exprhurt9:
            case spr_tv_exprhurt10:
            case spr_tv_exprhurtN1:
            case spr_tv_exprhurtN2:
            case spr_tv_exprhurtN3:
            case spr_tv_exprhurtN4:
            case spr_tv_exprhurtN5:
            case spr_tv_exprhurtN6:
            case spr_tv_exprhurtN7:
            case spr_tv_exprhurtN8:
            case spr_tv_exprhurtN9:
            case spr_tv_exprhurtN10:
			*/	if (obj_player1.state != states.hurt)
				{
					if (expressionbuffer > 0)
						expressionbuffer--;
					else
					{
						state = states.tv_whitenoise;
						expressionsprite = -4;
					}
				}
				break;
			
			case spr_tv_exprcombo:
			case spr_tv_exprcomboN:
				if (global.combo < 3 || _transfospr != -4 || obj_player1.mach4mode || obj_player1.state == states.hurt || obj_player1.state == states.mach3 || obj_player1.sprite_index == obj_player1.spr_mach3boost || global.stylethreshold >= 3)
				{
					state = states.tv_whitenoise;
					expressionsprite = -4;
					if (obj_player1.state == states.hurt)
						tv_do_expression(spr_tv_exprhurt);
				}
				break;
			
			case spr_tv_exprcollect:
			case spr_tv_exprcollectN:
				if (expressionbuffer > 0)
					expressionbuffer--;
				else
				{
					state = states.tv_whitenoise;
					expressionsprite = -4;
				}
				break;
			
			//case spr_tv_exprmach3:
			//case spr_tv_exprmach3N:
				//with (obj_player1)
				{
					//if (state != states.mach3 && state != states.climbwall && (state != states.chainsaw || (tauntstoredstate != states.mach3 && tauntstoredstate != states.climbwall)) && sprite_index != spr_mach3boost && mach4mode == 0)
					{
						//other.state = states.tv_whitenoise;
						//other.expressionsprite = -4;
					}
					//if (mach4mode)
						//tv_do_expression(spr_tv_exprmach4);
				}
				//break;
			
			//case spr_tv_exprmach4:
			//case spr_tv_exprmach4N:
				//with (obj_player1)
				{
					//if (mach4mode == 0 && (state != states.chainsaw || (tauntstoredstate != states.mach3 && tauntstoredstate != states.climbwall)))
					{
						//other.state = states.tv_whitenoise;
						//other.expressionsprite = -4;
					}
				}
				///break;
			
			case spr_tv_exprheat:
			case spr_tv_exprheatN:
				_transfo = false;
				with (obj_player1)
				{
					if (_transfospr != -4)
						_transfo = true;
				}
				if (global.stylethreshold < 3 || _transfo || obj_player1.mach4mode || obj_player1.state == states.hurt || obj_player1.state == states.mach3 || obj_player1.sprite_index == obj_player1.spr_mach3boost)
				{
						other.state = states.tv_whitenoise;
						other.expressionsprite = -4;
				}
				break;
			
			case spr_tv_exprpanic:
			case spr_tv_exprpanicN:
				_transfo = false;
				with (obj_player1)
				{
					if (_transfospr)
						_transfo = true;
				}
				if (!global.panic || _transfo || obj_player1.mach4mode || obj_player1.state == states.hurt || obj_player1.state == states.mach3 || obj_player1.sprite_index == obj_player1.spr_mach3boost)
				{
					state = states.tv_whitenoise;
					expressionsprite = noone;
				}
				break;
		}
		if (!ds_list_empty(tvprompts_list))
		{
			state = states.tv_whitenoise;
			tv_trans = 0;
			expressionsprite = -4;
		}
		break;
}
if (state != states.tv_whitenoise && state != states.tv_expression && instance_exists(obj_player1))
{
	spr_palette = obj_player1.spr_palette;
	paletteselect = obj_player1.paletteselect;
}
if (state != states.tv_whitenoise)
	tv_trans = 0;
else
	tv_trans += 0.35;
var change_pos = false;
if (obj_player.x > (room_width - 224) && obj_player.y < 187)
	change_pos = true;
if (bubblespr != -4 && obj_player.x > 316 && obj_player.y < 101)
	change_pos = true;
var spd = 15;
if change_pos
    hud_posY = Approach(hud_posY, -300, spd)
else
    hud_posY = Approach(hud_posY, 0, spd)
	
	if (showtext == 1)
{
    xi = 500 + (random_range(1, -1))
    if (yi > 500)
        yi -= 5
}
if (showtext == 0)
{
    xi = 500 + (random_range(1, -1))
    if (yi < 600)
        yi += 1
}
if (global.panic && global.fill > 0)
{
    showtime_buffer = 100

        timer_y = Approach(timer_y, (timer_ystart + 212), 4)
}
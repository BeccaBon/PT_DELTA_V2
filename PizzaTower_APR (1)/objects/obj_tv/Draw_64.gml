draw_set_font(global.bigfont);
draw_set_halign(fa_center);
draw_set_color(c_white);
shader_set(global.Pal_Shader);

if (global.use_temperature)
{
	var _width = sprite_get_width(spr_temperature_meterfill);
	var _height = sprite_get_height(spr_temperature_meterfill);
	global.temperature += global.temperature_spd;
	global.temperature = clamp(global.temperature, 0, global.temp_thresholdnumber * 100);
	var _tmp = global.temperature / (global.temp_thresholdnumber * 100);
	var _top = 0;
	var _height2 = _height * _tmp;
	draw_sprite_part_ext(spr_temperature_meterfill, 0, 0, _top, _width, _height2, 864, 192 + _height, 1, -1, c_white, 1);
	draw_sprite(spr_temperature_meter, 0, 864, 192);
}

if (obj_player1.state == states.trickjump && obj_player1.ramp)
{
	draw_text(
		obj_player1.x - camera_get_view_x(view_camera[0]),
		obj_player1.y - 100 - camera_get_view_y(view_camera[0]),
		concat("X", obj_player1.ramp_points, " TRICKS", "\nTAUNT")
	);
}

var collect_x = irandom_range(-collect_shake, collect_shake);
var collect_y = irandom_range(-collect_shake, collect_shake);

if (room != strongcold_endscreen)
{
	pal_swap_set(spr_palette, paletteselect, false);
	draw_sprite_ext(sprite_index, image_index, tv_x + collect_x, tv_y + collect_y + hud_posY, 1, 1, 0, c_white, alpha);
	
	var _red = obj_player1.pizzapepper && (obj_player1.ispeppino);
	
	if (!obj_player1.ispeppino)
	{
		pal_swap_set(spr_tv_palette, 1, false);
		var spr = spr_tv_empty;
		if (sprite_index == spr_tv_open)
			spr = sprite_index;
		draw_sprite_ext(spr_tv_bg, tv_bg_index, tv_x + collect_x, tv_y + collect_y + hud_posY, 1, 1, 0, c_white, alpha);
		draw_sprite_ext(sprite_index, image_index, tv_x + collect_x, tv_y + collect_y + hud_posY, 1, 1, 0, c_white, alpha);
	}
	
	if (state == states.tv_whitenoise)
	{
		if (!obj_player1.ispeppino)
			pal_swap_set(spr_tv_palette, 1, false);
		draw_sprite(spr_tv_whitenoise, tv_trans, tv_x + collect_x, tv_y + collect_y + hud_posY);
	}
	
	if (sprite_index == spr_tv_exprheatN)
	{
		pal_swap_set(spr_palette, paletteselect, false);
		draw_sprite_ext(sprite_index, image_index, tv_x + collect_x, tv_y + collect_y + hud_posY, 1, 1, 0, c_white, alpha);
		if (_red)
		{
			pal_swap_set(spr_palette, 2, false);
			draw_sprite_ext(sprite_index, image_index, tv_x + collect_x, tv_y + collect_y + hud_posY, 1, 1, 0, c_white, alpha);
		}
	}
	

}
shader_reset();

if (bubblespr != -4)
    draw_sprite_ext(bubblespr, bubbleindex, 512, 53, 1, 1, 1, c_white, alpha)
if (!surface_exists(promptsurface))
	promptsurface = surface_create(290, 102);
surface_set_target(promptsurface);
draw_clear_alpha(0, 0);
draw_set_font(font1);
draw_set_halign(fa_left);
draw_set_valign(fa_middle);
if (bubblespr == spr_tv_bubble)
{
	promptx -= promptspd;
	if (bubblespr != spr_tv_bubbleclose && promptx < (350 - string_width(prompt)))
	{
		bubblespr = spr_tv_bubbleclose;
		bubbleindex = 0;
	}
	draw_text_color(promptx - 350, 50, prompt, c_black, c_black, c_black, c_black, 1);
}
draw_set_halign(fa_left);
surface_reset_target();
if (global.combo != 0 && sprite_index != spr_tv_open && sprite_index != spr_tv_off)
{
			pal_swap_set(spr_tv_palette, 1, false);
			draw_sprite_ext(spr_tv_combo, image_index, tv_x + collect_x, tv_y + collect_y + hud_posY, 1, 1, 0, c_white, alpha);
	var str = string(global.combo);

	if (global.combo < 10)
	{
		str = concat("0", str);
	}

	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	draw_set_font(global.combofont);
	var num = string_length(str);
	var w = string_width(str) / num;
	var xx = 0;
	var yy = 0;

if (global.miniboss && sprite_index != spr_tv_open && sprite_index != spr_tv_off)
{
	draw_sprite_ext(spr_tv_combo, image_index, tv_x + collect_x, tv_y + collect_y + hud_posY, 1, 1, 1, c_white, alpha);
	var str = string(global.boxhp);

	if (global.boxhp < 10)
	{
		str = concat("0", str);
	}

	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	draw_set_font(global.combofont);
}
	for (var i = 0; i < num; i++)
	{
		var char = string_char_at(str, i + 1);
		xx = i * w;
		yy = i * 5;
		draw_text(789 + xx, (91 - yy) + hud_posY, char);
	}
}

if (bubblespr != noone)
{
	draw_sprite_ext(bubblespr, bubbleindex, 512, 53 + hud_posY, 1, 1, 1, c_white, alpha);
}

if (!surface_exists(promptsurface))
{
	promptsurface = surface_create(290, 102);
}

surface_set_target(promptsurface);
draw_clear_alpha(c_black, 0);
draw_set_font(font1);
draw_set_halign(fa_left);
draw_set_valign(fa_middle);

if (bubblespr == spr_tv_bubble)
{
	promptx -= promptspd;

	if (bubblespr != spr_tv_bubbleclose && promptx < (350 - string_width(prompt)))
	{
		bubblespr = spr_tv_bubbleclose;
		bubbleindex = 0;
	}

	draw_text_color(promptx - 350, 50, prompt, c_black, c_black, c_black, c_black, 1);
}

draw_set_halign(fa_left);
surface_reset_target();
draw_surface(promptsurface, 350, hud_posY);
draw_set_font(global.smallnumber_fnt);
draw_set_halign(fa_center);

if (instance_exists(obj_pizzaball))
{
	draw_text(832, 300, string(global.golfhit) + " " + "GOLF HIT");
}

var barxx = -26;
var baryy = 30;
draw_sprite(spr_barpop, 0, 832 + barxx, 200 + baryy);
var sw = sprite_get_width(spr_barpop);
var sh = sprite_get_height(spr_barpop);
var b = global.combotime / 55;
draw_sprite_part(spr_barpop, 1, 0, 0, sw * b, sh, 832 + barxx, 200 + baryy);

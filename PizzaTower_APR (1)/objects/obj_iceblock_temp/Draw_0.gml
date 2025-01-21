
var old_halign = draw_get_halign();
var old_valign = draw_get_valign();
var old_color = draw_get_color();
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_color(c_white);
draw_text(x + 16, y + 16, string(threshold));
draw_set_halign(old_halign);
draw_set_valign(old_valign);
draw_set_color(old_color);

for (var yy = 0; yy < abs(image_yscale); yy++)
{
    for (var xx = 0; xx < abs(image_xscale); xx++)
        draw_sprite_ext(sprite_index, image_index, (xstart + xx * 32), (ystart + yy * 32), 1, 1, 0, c_white, image_alpha)
}
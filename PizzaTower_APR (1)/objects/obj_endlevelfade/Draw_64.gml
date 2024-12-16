draw_set_alpha(fadealpha);
draw_set_color(c_white);
draw_rectangle(-8, -8, 8 + camera_get_view_width(view_camera[0]), 8 + camera_get_view_height(view_camera[0]), false);
draw_set_alpha(1);

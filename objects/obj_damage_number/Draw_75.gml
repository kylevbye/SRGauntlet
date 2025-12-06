var display_text = string(number);

draw_set_font(font);
draw_set_color(color);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_text_ext_transformed_colour(x, y, display_text, sep, width, scale, scale, angle, color, color, color, color, alpha);

/// Reset
draw_set_color(c_white);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
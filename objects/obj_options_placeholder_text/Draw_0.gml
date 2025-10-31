draw_set_font(fnt_mainmenu_title);
draw_set_color(c_white);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

draw_text(x, y, "Options");

// Resets attributes for other text objects.
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_color(c_white);
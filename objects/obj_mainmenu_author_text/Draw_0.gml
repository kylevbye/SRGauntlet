draw_set_font(fnt_mainmenu_footer);
draw_set_color(c_ltgray);
draw_set_halign(fa_right);
draw_set_valign(fa_bottom);

draw_text(x, y, "By Kyle Bye");

// Resets attributes for other text objects.
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_color(c_white);
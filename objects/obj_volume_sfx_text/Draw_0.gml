draw_set_font(fnt_mainmenu_option);
draw_set_halign(fa_center);
draw_set_valign(fa_top);

var color = c_white;
if (selected) color = c_yellow
draw_set_color(color);

var printstr = "Sound FX";
draw_text(x, y, printstr);

// Resets attributes for other text objects.
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_color(c_white);
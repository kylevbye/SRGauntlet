draw_set_font(fnt_mainmenu_option);
draw_set_halign(fa_left);
draw_set_valign(fa_top);

// Selected = yellow
var color = c_white;
if (selected) color = c_yellow;
draw_set_color(color);

draw_text(x, y, "Start");

// Resets attributes for other text objects.
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_color(c_white);
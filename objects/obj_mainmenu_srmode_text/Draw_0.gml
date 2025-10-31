draw_set_font(fnt_mainmenu_option);
draw_set_halign(fa_left);
draw_set_valign(fa_top);

// Selected = yellow
var color = c_white;
if (selected) {
    if (!global.sr_mode) color = c_yellow; 
    else color = c_lime;
}
else if (global.sr_mode) color = c_green;
draw_set_color(color);

draw_text(x, y, "SR Mode");

// Resets attributes for other text objects.
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_color(c_white);
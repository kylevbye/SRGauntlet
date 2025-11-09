/// global.interact
draw_set_font(fnt_debug);
draw_set_halign(fa_left);
draw_set_valign(fa_top);


draw_set_color(c_white);

var g_interact_str = "Global.interact = " + InteractValueToString(global.interact);
draw_text(0, 0, g_interact_str);

// Resets attributes for other text objects.
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_color(c_white);
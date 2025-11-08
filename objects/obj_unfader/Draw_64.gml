// Set
draw_set_color(c_black);
draw_set_halign(fa_right);
draw_set_valign(fa_bottom);


var alpha = 1-(count/duration);
show_debug_message(alpha)
draw_set_alpha(alpha*1.0);

var width = view_wport[0];
var height = view_hport[0];
draw_rectangle(0, 0, width, height, false);

// Reset
draw_set_alpha(1);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_color(c_white);
// Outer
var outer_color = border_color;
draw_roundrect_color_ext(x, y, x+button_length, y+button_height, rad_x, rad_y, border_color, border_color, outline_flag);
// INNER
draw_roundrect_color_ext(x+border_length, y+border_length, x+button_length-border_length, y+button_height-border_length, rad_x, rad_y, back_color, back_color, outline_flag);
var centered_offset_x = width/2.0;
draw_set_color(c_white);
draw_rectangle(x-centered_offset_x-border_length, y-border_length, x+width-centered_offset_x+border_length, y+height+border_length, true);
draw_healthbar(x-centered_offset_x, y, x+width-centered_offset_x, y+height, global.mus_volume*100, c_red, c_yellow, c_yellow, vol_direction, show_background, show_border);
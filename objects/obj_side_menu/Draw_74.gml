if (active) {
    draw_set_color(c_white);
    draw_set_halign(fa_left);
    draw_set_valign(fa_top);
    
    // Outer
    var outer_color = border_color;
    draw_roundrect_color_ext(x, y, x+width, y+height, rad_x, rad_y, border_color, border_color, outline_flag);
    // INNER
    draw_roundrect_color_ext(x+border_length, y+border_length, x+width-border_length, y+height-border_length, 
    rad_x, rad_y, back_color, back_color, outline_flag);
}

// Reset
draw_set_color(c_white);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
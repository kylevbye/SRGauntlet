draw_set_color(c_white);
if (using) {
    var center_x = CONFIG.V_WIDTH*0.5;
    var center_y = CONFIG.V_HEIGHT*0.5;
    draw_rectangle(center_x-(postcard_width*0.5), center_y-(postcard_height*0.5),
    center_x+(postcard_width*0.5), center_y+(postcard_height*0.5), false);
}

// Reset
draw_set_color(c_white);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
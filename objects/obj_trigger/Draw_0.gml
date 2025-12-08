draw_set_color(color);
draw_set_halign(fa_left);
draw_set_valign(fa_top);

if (global.debug) {
    draw_rectangle(x-(width*0.5), y-(height*0.5), x+(width*0.5), y+(height*0.5), true);
}

/// Reset
draw_set_color(c_white);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
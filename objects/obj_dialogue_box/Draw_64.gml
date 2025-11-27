var x1 = x;
var x2 = x+width;
var y1 = y;
var y2 = y+height;

if (standard_pos) {
    x1 = standard_x;
    x2 = standard_x+width;
    y1 = standard_y; 
    y2 = standard_y+height;
}

if (h_centered) {
    var offset_x = width*0.5;
    x1 -= offset_x;
    x2 -= offset_x;
}

if (v_centered) {
    var offset_y = height*0.5;
    y1 -= offset_y;
    y2 -= offset_y;
}

// Outer
draw_set_color(diag_border_color);
draw_roundrect_ext(x1, y1, x2, y2, x_rad, y_rad, false);

// Inner
draw_set_color(diag_back_color);
draw_roundrect_ext(x1+diag_border_length, y1+diag_border_length, x2-diag_border_length, 
y2-diag_border_length, x_rad, y_rad, false);

/// Reset
draw_set_color(c_white);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
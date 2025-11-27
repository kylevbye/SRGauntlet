var display_str = string_copy(script[line], 0, char_pos);

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

// Text
draw_set_font(font);
draw_set_color(c_white);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_text_ext(x1+(diag_border_length*2), y1+(diag_border_length*2), display_str, -1, width-(diag_border_length*2));

// Reset
draw_set_color(c_white);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
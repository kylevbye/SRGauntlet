if (active) {
    draw_set_halign(fa_left);
    draw_set_valign(fa_top);
    
    // Who?
    draw_set_font(instruct_font);
    draw_text_transformed(x+instruct_offset_x, y+instruct_offset_y, instruct_str, instruct_scale, instruct_scale, 0);
    
    // Enemy
    draw_set_font(enemy_font);
    draw_set_color(select_color);
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    draw_text_transformed(x+(width*0.5)+enemy_offset_x, y+enemy_offset_y, enemy_str, enemy_scale, enemy_scale, 0);
    
}

// Reset
draw_set_color(c_white);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
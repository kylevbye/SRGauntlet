if (active) {

    // MAGIC text
    draw_set_color(c_white);
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    draw_set_font(magic_font);
    draw_text_transformed(x+(width*0.5)+magic_offset_x, y+magic_offset_y, magic_str, magic_scale, magic_scale, angle);
    
    // Heal text
    draw_set_font(heal_font);
    if (selected == BATTLE_OPTIONS.HEAL) draw_set_color(heal_select_color);
    else draw_set_color(c_white);
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    draw_text_transformed(x+(width*0.5)+heal_offset_x, y+heal_offset_y, heal_str, heal_scale, heal_scale, angle);
    
    // Super text
    draw_set_font(super_font);
    if (selected == BATTLE_OPTIONS.SUPER) draw_set_color(super_select_color);
    else draw_set_color(c_white);
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    draw_text_transformed(x+(width*0.5)+super_offset_x, y+super_offset_y, super_str, super_scale, super_scale, angle);
    
}

// Reset
draw_set_color(c_white);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
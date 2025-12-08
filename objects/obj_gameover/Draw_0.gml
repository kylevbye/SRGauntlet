draw_sprite_ext(go_spr, -1, go_pos_x, go_pos_y, go_scale, go_scale, go_rot, go_color, go_alpha);

draw_set_halign(fa_middle);
draw_set_valign(fa_center);

draw_set_font(ins_font);

// go label
draw_text_ext_transformed(ins_pos_x, ins_pos_y, ins_text, l_sep, l_width, ins_scale, ins_scale, l_rot);

// ins label
draw_text_ext_transformed(gol_pos_x, gol_pos_y, gol_text, l_sep, l_width, gol_scale, gol_scale, l_rot);

/// Reset
draw_set_color(c_white);
draw_set_halign(fa_left);
draw_set_valign(fa_top);


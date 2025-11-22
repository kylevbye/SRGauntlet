draw_rectangle_color(CONFIG.V_WIDTH*0.5, 0, CONFIG.V_WIDTH*0.5, CONFIG.V_HEIGHT, c_white, c_white, c_white, c_white, false);

///
/// Rectangle 
/// 

// Outer
var outer_color = border_color;
draw_roundrect_color_ext(x, y, x+button_length, y+button_height, rad_x, rad_y, border_color, border_color, outline_flag);
// INNER
draw_roundrect_color_ext(x+border_length, y+border_length, x+button_length-border_length, y+button_height-border_length, rad_x, rad_y, back_color, back_color, outline_flag);

///
/// Health Points
/// 
draw_set_halign(fa_left);
draw_set_font(fnt_battle_label); 

// HP Label
draw_text(x+stat_label_offset_x-2, stat_label_y, "HP");
// Hp Amount
draw_set_halign(fa_center);
draw_set_font(fnt_battle_amount); 
draw_text(x+(button_length*0.25), stat_amt_label_y, string("{0}/{0}", global.current_hp, global.max_hp));
// Hp Bar
draw_healthbar(x+16-1, y+button_height-8, x+stat_bar_length-4, y+button_height-stat_bar_height-12, 100, c_red, c_red, c_green, 0, true, true);

///
/// Magic Points
/// 

draw_set_halign(fa_left);
draw_set_font(fnt_battle_label); 
// MP Label
draw_text((CONFIG.V_WIDTH*0.5)+stat_label_offset_x-4, stat_label_y, "MP");
// MP Amount
draw_set_halign(fa_center);
draw_set_font(fnt_battle_amount); 
draw_text(x+(button_length*0.75)+4, stat_amt_label_y, string("{0}/{0}", global.current_hp, global.max_hp));
// MP Bar
draw_healthbar(x+16-1+(button_length*0.5)+5, y+button_height-8, x+stat_bar_length-4+(button_length*0.5)+6, y+button_height-stat_bar_height-12, 100, c_red, c_red, c_green, 0, true, true);

/// Reset
draw_set_color(c_white);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
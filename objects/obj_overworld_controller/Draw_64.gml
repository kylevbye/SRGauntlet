draw_set_halign(fa_left);
draw_set_valign(fa_top);

// Game Menu
if (global.interact == INTERACT.GAME_MENU || global.interact == INTERACT.INVENTORY) {
    
    var center_menu_x = game_menu_x+(game_menu_width*0.5);
    
    // Inner
    draw_roundrect_color_ext(game_menu_x, game_menu_y, game_menu_x+game_menu_width, 
    game_menu_y+game_menu_height, game_menu_rad_x, game_menu_rad_y, game_menu_outline_color, 
    game_menu_outline_color, game_menu_outline_flag);
    
    // Outer
    draw_roundrect_color_ext(game_menu_x+game_menu_border_size, game_menu_y+game_menu_border_size, 
    game_menu_x+game_menu_width-game_menu_border_size, game_menu_y+game_menu_height-game_menu_border_size, 
    game_menu_rad_x, game_menu_rad_y, game_menu_back_color, game_menu_back_color, game_menu_outline_flag);
    
    // Player Icon
    draw_sprite_ext(game_menu_spr, game_menu_spr_index, center_menu_x, game_menu_y + game_menu_spr_offset, 
    game_menu_spr_scale_x, game_menu_spr_scale_y, game_menu_spr_rot, game_menu_spr_color, game_menu_spr_alpha);
    
    // Text Init
    draw_set_halign(fa_center);
    
    // HP Label
    draw_set_font(hp_label_font);
    var hp_string = string("HP: {0}/{1}", global.current_hp, global.max_hp);
    draw_text(center_menu_x, game_menu_y+hp_label_offset, hp_string);
    
    // Text Options
    draw_set_font(menu_text_font);
    
    if (global.menu_choicer == GAME_MENU.INVENTORY) { draw_set_color(menu_text_select_color); }
    else draw_set_color(c_white);
    draw_text(center_menu_x, game_menu_y+menu_text_first_offset, "INV");
    
    if (global.menu_choicer == GAME_MENU.STATISTICS) { draw_set_color(menu_text_select_color); }
    else draw_set_color(c_white);
    draw_text(center_menu_x, game_menu_y+menu_text_first_offset+menu_text_offset, "STATS");
}

// Reset
draw_set_color(c_white);
draw_set_halign(fa_left);
draw_set_valign(fa_top);

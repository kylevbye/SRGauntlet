draw_set_halign(fa_left);
draw_set_valign(fa_top);

// Game Menu
if (menu_open_flag()) {
    
    ///
    /// Game Menu
    /// 
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
    
    ///
    /// STATS
    /// 
    if (global.menu_sub_menu == GAME_SUB_MENU_TYPE.STATISTICS) {
        var center_stats_menu_x = game_stats_menu_x+(game_stats_menu_width*0.5);
        // Inner
        draw_roundrect_color_ext(game_stats_menu_x, game_stats_menu_y, game_stats_menu_x+game_stats_menu_width, 
        game_stats_menu_y+game_stats_menu_height, game_stats_menu_rad_x, game_stats_menu_rad_y, game_stats_menu_outline_color, 
        game_stats_menu_outline_color, game_stats_menu_outline_flag);
    
        // Outer
        draw_roundrect_color_ext(game_stats_menu_x+game_stats_menu_border_size, game_stats_menu_y+game_stats_menu_border_size, 
        game_stats_menu_x+game_stats_menu_width-game_stats_menu_border_size, game_stats_menu_y+game_stats_menu_height-game_stats_menu_border_size, 
        game_stats_menu_rad_x, game_stats_menu_rad_y, game_stats_menu_back_color, game_stats_menu_back_color, game_stats_menu_outline_flag);
        
        // Weapon Sprite
        var weapon_spr = get_current_weapon_sprite();
        draw_sprite_ext(weapon_spr, game_stats_menu_wpn_spr_index, center_stats_menu_x, game_stats_menu_wpn_spr_y, 
        game_stats_menu_wpn_spr_scale_x, game_stats_menu_wpn_spr_scale_y, game_stats_menu_wpn_spr_rot, game_stats_menu_wpn_spr_color, 
        game_stats_menu_wpn_spr_alpha);
        
        // Text Options
        draw_set_halign(fa_center);
        draw_set_font(menu_text_font);
        draw_set_color(c_white);
        var weapon_str = string("WPN: {0}", get_weapon());
        var attack_str = string("ATTACK: {0}", calc_attack());
        var defense_str = string("DEFENSE: {0}", calc_defense());
        var level_str = string("LEVEL: {0}/{1}", global.current_hp, global.max_hp);
        var exp_str = string("EXP: {0}/{1}", global.current_hp, global.max_hp);
        draw_text(center_stats_menu_x, game_stats_menu_y+menu_stats_text_first_offset, weapon_str);
        draw_text(center_stats_menu_x, game_stats_menu_y+menu_stats_text_first_offset+(menu_stats_text_offset*1), attack_str);
        draw_text(center_stats_menu_x, game_stats_menu_y+menu_stats_text_first_offset+(menu_stats_text_offset*2), defense_str);
        draw_text(center_stats_menu_x, game_stats_menu_y+menu_stats_text_first_offset+(menu_stats_text_offset*3), level_str);
        draw_text(center_stats_menu_x, game_stats_menu_y+menu_stats_text_first_offset+(menu_stats_text_offset*4), exp_str);
    }
    
    /// 
    /// INV
    /// 
    if (global.menu_sub_menu == GAME_SUB_MENU_TYPE.INVENTORY) {
        var center_inv_menu_x = game_inv_menu_x+(game_inv_menu_width*0.5);
        // Inner
        draw_roundrect_color_ext(game_inv_menu_x, game_inv_menu_y, game_inv_menu_x+game_inv_menu_width, 
        game_inv_menu_y+game_inv_menu_height, game_inv_menu_rad_x, game_inv_menu_rad_y, game_inv_menu_outline_color, 
        game_inv_menu_outline_color, game_inv_menu_outline_flag);
    
        // Outer
        draw_roundrect_color_ext(game_inv_menu_x+game_inv_menu_border_size, game_inv_menu_y+game_inv_menu_border_size, 
        game_inv_menu_x+game_inv_menu_width-game_inv_menu_border_size, game_inv_menu_y+game_inv_menu_height-game_inv_menu_border_size, 
        game_inv_menu_rad_x, game_inv_menu_rad_y, game_inv_menu_back_color, game_inv_menu_back_color, game_inv_menu_outline_flag);
        
        // Text Options
        draw_set_halign(fa_center);
        draw_set_font(menu_text_font);
        for (var i = 0; i<5; i += 1) {
            var inv_slots_str = string("Slot {0}", i);
            draw_set_color(c_white);
            if (i == global.menu_sub_choicer) draw_set_color(menu_text_select_color);
            draw_text(center_inv_menu_x, game_inv_menu_y+menu_inv_text_first_offset + (menu_inv_text_offset*i), inv_slots_str);
        }

    }
    
}

// Reset
draw_set_color(c_white);
draw_set_halign(fa_left);
draw_set_valign(fa_top);

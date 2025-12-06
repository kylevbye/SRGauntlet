/// global.interact
draw_set_font(fnt_debug);
draw_set_halign(fa_left);
draw_set_valign(fa_top);


draw_set_color(c_white);

if (room == room_battle) {
    var battle_turn_str = "Battle Turn: " + BattleToString(global.battle_state.turn);
    draw_text(pos_x, pos_y, battle_turn_str);
    
    var battle_state_str = battle_state_to_string();
    draw_text_ext_transformed(pos_x, pos_y+next_line_offset, 10, )
}
else {
    var g_interact_str = "Global.interact: " + InteractValueToString(global.interact);
    draw_text(pos_x, pos_y, g_interact_str);
}

// Resets attributes for other text objects.
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_color(c_white);
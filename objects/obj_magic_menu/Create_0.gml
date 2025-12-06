// obj_side_menu
event_inherited();

selected = BATTLE_OPTIONS.NONE;
valid_color = c_yellow;
invalid_color = c_red;

// Properties of "MAGIC" text
magic_font = fnt_battle_label;
magic_str = "MAGIC"
magic_scale = 0.8;
magic_offset_x = 2;
magic_offset_y = 20;

// Proprties of "Heal - XX" text
heal_font = fnt_dialogue;
heal_str = "Heal - " + string(BATTLE_VALUES.HEAL_COST);
heal_scale = 0.7;
heal_offset_x = 2;
heal_offset_y = 47;
heal_select_color = valid_color;

// Proprties of "Super - XX" text
super_font = fnt_dialogue;
super_str = "Super - " + string(BATTLE_VALUES.SUPER_COST);
super_scale = 0.7;
super_offset_x = 2;
super_offset_y = 72;
super_select_color = valid_color;
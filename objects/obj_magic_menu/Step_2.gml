heal_select_color = invalid_color;
super_select_color = invalid_color;

if (global.current_mp >= BATTLE_VALUES.HEAL_COST) {
    heal_select_color = valid_color;
}

if (global.current_mp >= BATTLE_VALUES.SUPER_COST) {
    super_select_color = valid_color;
}
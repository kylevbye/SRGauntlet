global.battle_state = new BattleControlState();
music = mus_battle;
if (global.enemy == obj_boss1 || global.enemy == obj_boss2) {
    music = mus_boss;
}
profile = obj_player_profile;
randomise();
enemy = instance_create_layer(CONFIG.V_WIDTH*0.5, CONFIG.V_HEIGHT*0.5-40, "Instances", global.battle_state.enemy);
enemy_hp_bar.current_value = global.battle_state.enemy.hp;
enemy_hp_bar.max_value = global.battle_state.enemy.hp;
update_hp_values();
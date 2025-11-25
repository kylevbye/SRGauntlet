global.battle_state = new BattleControlState();
music = mus_battle;
profile = obj_player_profile;
randomise();
var enem_ins = instance_create_layer(CONFIG.V_WIDTH*0.5, CONFIG.V_HEIGHT*0.5-40, "Instances", global.battle_state.enemy.obj);
enem_ins.image_xscale = 5;
enem_ins.image_yscale = 5;
obj_enemy_hp_bar.max_value = global.battle_state.enemy.hp;
update_hp_values();
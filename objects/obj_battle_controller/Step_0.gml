if (!audio_is_playing(mus_battle)) { 
    audio_play_sound(mus_battle, 30, true, global.mus_volume);
}

control_player_profile(profile);
reset_select_states();

switch (global.battle_state.turn) {
    case BATTLE.PLAYER:
        process_player_turn();
        break;
    case BATTLE.ENEMY:
        process_enemy_turn();
        break;
    case BATTLE.ENEMY_ATTACK:
        process_enemy_attack();
        break;
    case BATTLE.FIGHT:
        process_player_attack();
        break;
    case BATTLE.FIGHT_APPLY:
        process_player_attack_apply();
        break;
    case BATTLE.SUPER:
        process_player_super();
        break;
    case BATTLE.HEAL:
        process_player_heal();
        break;
    case BATTLE.LOSS:
        room_goto(room_intromenu);
        break;
    case BATTLE.VICTOR:
        //
        break;
}

update_hp_values();
check_wl_conditions();
if (!audio_is_playing(mus_battle)) { 
    audio_play_sound(mus_battle, 30, true, global.mus_volume);
}

control_player_profile(battle_state, profile);
reset_select_states();

switch (battle_state.turn) {
    case BATTLE.PLAYER:
        process_player_turn(battle_state);
        break;
    case BATTLE.ENEMY:
        process_enemy_turn(battle_state);
        break;
    case BATTLE.ENEMY_ATTACK:
        process_enemy_attack(battle_state);
        break;
    case BATTLE.FIGHT:
        process_player_attack(battle_state);
        break;
    case BATTLE.SUPER:
        process_player_super(battle_state);
        break;
    case BATTLE.HEAL:
        process_player_heal(battle_state);
        break;
}

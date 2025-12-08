control_player_profile(profile);
reset_select_states();

switch (global.battle_state.turn) {
    case BATTLE.INIT: 
        init_battle();
        break;
    case BATTLE.PLAYER:
        process_player_turn();
        break;
    case BATTLE.ENEMY:
        process_enemy_turn();
        break;
    case BATTLE.ENEMY_ATTACK_DIAG:
        inform_enemy_attack();
        break;
    case BATTLE.ENEMY_ATTACK_WAIT:
        // Do nothing until dialogue is done.
        break;
    case BATTLE.ENEMY_ATTACK:
        process_enemy_attack();
        break;
    case BATTLE.FIGHT_INIT:
        initiate_player_attack();
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
    case BATTLE.SUPER_WAIT:
        // Do nothing until dialogue is done.
        break;
    case BATTLE.SUPER_APPLY:
        process_player_super_apply();
        break;
    case BATTLE.HEAL:
        process_player_heal();
        break;
    case BATTLE.HEAL_WAIT:
        // Do nothing until dialogue is done.
        break;
    case BATTLE.HEAL_APPLY:
        process_player_heal_apply();
        break;
    case BATTLE.LOSS:
        room_goto(room_gameover);
        break;
    case BATTLE.VICTOR:
        initiate_win_sequence();
        break;
    case BATTLE.VICTOR_WAIT:
        wait_win();
        break;
    case BATTLE.VICTOR_SEQ:
        process_win();
        break;
    case BATTLE.VICTOR_DIALOGUE:
        break;
    
}

update_hp_values();
check_wl_conditions();
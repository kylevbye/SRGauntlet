function InteractValueToString(_interact_value) {
    return_str = "";
    
    switch (_interact_value) {
    	case INTERACT.NONE:
            return_str = "NONE";
            break;
        case INTERACT.INVENTORY:
            return_str = "INVENTORY";
            break;
        case INTERACT.STATISTICS:
            return_str = "STATISTICS";
            break;
        case INTERACT.GAME_MENU:
            return_str = "MENU"
            break;
        case INTERACT.TRAVEL:
            return_str = "TRAVEL";
            break;
        case INTERACT.DIALOGUE:
            return_str = "DIALOGUE";
            break;
        case INTERACT.POSTCARD:
            return_str = "POSTCARD";
            break;
        case INTERACT.BATTLE_INIT:
            return_str = "BATTLE_INIT";
            break;
        case INTERACT.BATTLE:
            return_str = "BATTLE";
            break;
        case INTERACT.CUTSCENE:
            return_str = "CUTSCENE";
            break;
        case INTERACT.CUTSCENE_TRIGGERED:
            return_str = "CUTSCENE_TRIGGERED";
            break;
        default:
            return_str = "ERROR";
            break;
    }
    
    return return_str;

}

function BattleToString(_battle_value) {
    
    return_str = "";

    switch (_battle_value) {
        case BATTLE.PLAYER:
            return_str = "PLAYER";
            break;
        case BATTLE.ENEMY:
            return_str = "ENEMY";
            break;
        case BATTLE.ENEMY_ATTACK_DIAG:
            return_str = "ENEMY_ATTACK_DIAG";
            break;
        case BATTLE.ENEMY_ATTACK_WAIT:
            return_str = "ENEMY_ATTACK_WAIT"
            break;
        case BATTLE.ENEMY_ATTACK:
            return_str = "ENEMY_ATTACK";
            break;
        case BATTLE.FIGHT_INIT:
            return_str = "FIGHT_INIT";
            break;
        case BATTLE.FIGHT:
            return_str = "FIGHT";
            break;
        case BATTLE.FIGHT_WAIT:
            return_str = "FIGHT_WAIT";
            break;
        case BATTLE.FIGHT_APPLY:
            return_str = "FIGHT_APPLY";
            break;
        case BATTLE.SUPER:
            return_str = "SUPER";
            break;
        case BATTLE.SUPER_WAIT:
            return_str = "SUPER_WAIT";
            break;
        case BATTLE.SUPER_APPLY:
            return_str = "SUPER_APPLY";
            break;
        case BATTLE.HEAL:
            return_str = "HEAL";
            break;
        case BATTLE.HEAL_WAIT:
            return_str = "HEAL_WAIT";
            break;
        case BATTLE.HEAL_APPLY:
            return_str = "HEAL_APPLY";
            break;
        case BATTLE.VICTOR:
            return_str = "VICTOR";
            break;
        case BATTLE.VICTOR_WAIT:
            return_str = "VICTOR_WAIT";
            break;
        case BATTLE.VICTOR_SEQ:
            return_str = "VICTOR_SEQ";
            break;
        case BATTLE.VICTOR_DIALOGUE:
            return_str = "VICTOR_DIALOGUE";
            break;
        case BATTLE.LOSS:
            return_str = "LOSS";
            break;
        default:
            return_str = "ERROR";
            break;
    }
    
    return return_str;
}
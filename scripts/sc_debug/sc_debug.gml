function InteractValueToString(_interact_value) {
    return_str = "";
    
    switch (_interact_value) {
    	case INTERACT.NONE:
            return_str = "NONE";
            break;
        case INTERACT.INVENTORY:
            return_str = "INVENTORY";
            break;
        case INTERACT.GAME_MENU:
            return_str = "MENU"
            break;
        case INTERACT.TRAVEL:
            return_str = "TRAVEL";
            break;
        default:
            return_str = "ERROR";
            break;
    }
    
    return return_str;

}
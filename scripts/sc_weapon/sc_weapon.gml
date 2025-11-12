function get_weapon_string(_weapon_value) {
    return_str = "";
    
    switch (_weapon_value) {
        case WEAPON.NONE:
            return_str = "NONE";
            break;
        case WEAPON.SWORD1:
            return_str = "B. Sword";
            break;
        case WEAPON.SWORD2:
            return_str = "ADV Sword";
            break;
        case WEAPON.SWORD3:
            return_str = "ULT Sword";
            break;
        default:
            return_str = "ERROR";
            break;
    }
    
    return return_str;
}

function get_weapon_sprite(_weapon_value) {
    return_spr = pointer_null;
    
    switch (_weapon_value) {
        case WEAPON.NONE:
            return_spr = pointer_null
            break;
        case WEAPON.SWORD1:
            return_spr = spr_sword1;
            break;
        case WEAPON.SWORD2:
            return_spr = spr_sword2;
            break;
        case WEAPON.SWORD3:
            return_spr = spr_sword3;
            break;
        default:
            return_spr = pointer_null;
            break;
    }
    
    return return_spr;
}

function get_current_weapon_string() {
    return get_weapon_string(global.weapon);
}

function get_current_weapon_sprite() {
    return get_weapon_sprite(global.weapon);
}
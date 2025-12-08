function get_weapon_to_obj(_weapon_value) {
    return_obj = pointer_null
    switch (_weapon_value) {
        case WEAPON.SWORD1:
            return_obj = obj_sword1;
            break;
        case WEAPON.SWORD2:
            return_obj = obj_sword2;
            break;
        case WEAPON.SWORD3:
            return_obj = obj_sword3;
            break;
        default:
            return_obj = obj_stick;
            break;
    }
    
    return return_obj;
}
function get_weapon_string(_weapon_value) {
    var wname = "";
    with (get_weapon_to_obj(_weapon_value)) { wname = name; }
    return wname;
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
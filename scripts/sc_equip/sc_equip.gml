function equip_weapon () {
    
    // Equip, then swap slots from inventory to equipped weapon.
    var old_weapon = global.weapon;
    global.weapon = weapon_code;
    global.inventory[global.menu_sub_choicer] = get_weapon_to_obj(old_weapon);
    
    
    // INFO
    var equip_str = string("You have equipped the {0}! {1}", name, unique_equip_str);
    var dialogue_instance = spawn_dialogue(equip_str);

    dialogue_instance.restore_interact_state = function () {
        global.interact = INTERACT.NONE;
        global.inv_state = INVENTORY_STATE.CLOSED;
        global.menu_sub_menu = GAME_SUB_MENU_TYPE.NONE;
    }
    
}
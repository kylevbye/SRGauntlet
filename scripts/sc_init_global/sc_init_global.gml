function init_global_values(){
    global.sr_mode = false;
    global.mus_volume = 0.5;
    global.snd_volume = 0.5;
    global.interact = INTERACT.NONE;
    global.debug = true;
    global.entrance = ENTRANCE.NONE;
    global.current_hp = 50;
    global.max_hp = 50;
    global.menu_choicer = GAME_MENU.INVENTORY;
    global.menu_sub_menu = GAME_SUB_MENU_TYPE.NONE;
    global.menu_sub_choicer = GAME_SUB_MENU_CHOICE.FIRST;
    global.inventory = pointer_null;
    global.inv_state = INVENTORY_STATE.CLOSED;
    global.item_choicer = ITEM_CHOICE.NONE;
    global.weapon = WEAPON.SWORD1;
    
    load_config();
}

function load_config() {
    // To-do load values from config/save file
}
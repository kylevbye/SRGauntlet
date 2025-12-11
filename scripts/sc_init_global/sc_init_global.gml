function init_global_values(){
    global.sr_mode = false;
    global.mus_volume = 0.5;
    global.snd_volume = 0.5;
    global.interact = INTERACT.NONE;
    global.debug = false;
    global.entrance = ENTRANCE.NONE;
    global.current_hp = 50;
    global.max_hp = 50;
    global.current_mp = 50;
    global.max_mp = 50;
    global.menu_choicer = GAME_MENU.INVENTORY;
    global.menu_sub_menu = GAME_SUB_MENU_TYPE.NONE;
    global.menu_sub_choicer = GAME_SUB_MENU_CHOICE.FIRST;
    global.inventory = pointer_null;
    global.inv_state = INVENTORY_STATE.CLOSED;
    global.item_choicer = ITEM_CHOICE.NONE;
    global.weapon = WEAPON.SWORD1;
    global.enemy = obj_enemy;
    global.battle_state = pointer_null;
    global.dialogue = "";
    global.diag_rad = 10;
    global.counter = 0;
    global.floor = 0;
    global.loaded_room = room_intromenu;
    global.plot = pointer_null;
    global.step = 0;
    
    load_config();
    instantiate_dialogue();
}

function load_config() {
    // To-do load values from config/save file
}
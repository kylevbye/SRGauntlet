function start_game(){
    initialize_inventory();
    load_game_values();
}

function load_game_values() {
    global.interact = INTERACT.NONE;
    global.entrance = ENTRANCE.NONE;
    global.current_hp = 50;
    global.max_hp = 50;
    global.current_mp = 50;
    global.max_mp = 50;
    global.menu_choicer = GAME_MENU.INVENTORY;
    global.menu_sub_menu = GAME_SUB_MENU_TYPE.NONE;
    global.menu_sub_choicer = GAME_SUB_MENU_CHOICE.FIRST;
    global.inv_state = INVENTORY_STATE.CLOSED;
    global.item_choicer = ITEM_CHOICE.NONE;
    global.weapon = WEAPON.SWORD1;
    global.enemy = obj_enemy;
    global.battle_state = pointer_null;
    global.diag_rad = 10;
    global.counter = 0;
    global.floor = 1;
    global.loaded_room = room_floor1_start;
    
    // plot
    if (global.plot != pointer_null) instance_destroy(obj_plot);
    global.plot = instance_create_depth(0, 0, 0, obj_plot);
    
    // Timer
    with (obj_speedrun) { event_user(0); }
}
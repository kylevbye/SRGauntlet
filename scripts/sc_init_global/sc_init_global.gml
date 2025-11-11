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
    
    load_config();
}

function load_config() {
    // To-do load values from config/save file
}
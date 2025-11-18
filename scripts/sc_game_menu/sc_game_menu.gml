function menu_open_flag() {
    return (global.interact == INTERACT.GAME_MENU) || 
    (global.interact == INTERACT.INVENTORY) || 
    (global.interact == INTERACT.STATISTICS);
}

///
/// Game Menu
/// 
function open_game_menu() {
    
    audio_play_sound(snd_menu, 10, false, global.snd_volume);
    global.interact = INTERACT.GAME_MENU;

}

function close_game_menu() {
    
    global.interact = INTERACT.NONE;
    
    // Reset sub menu choicers.
    // Game menu choicer must be preserved.
    global.menu_sub_choicer = GAME_SUB_MENU_CHOICE.FIRST;
    global.menu_sub_menu = GAME_SUB_MENU_TYPE.NONE;
    global.inv_state = INVENTORY_STATE.CLOSED;
    
}

///
/// Inventory Menu
/// 
function open_inv() {
    show_debug_message("open_inv()");
    audio_play_sound(snd_select, 10, false, global.snd_volume);
    
    clear_interact_input();
    
    // Set global values
    global.interact = INTERACT.INVENTORY;
    global.menu_sub_menu = GAME_SUB_MENU_TYPE.INVENTORY;
    global.menu_sub_choicer = GAME_SUB_MENU_CHOICE.FIRST;
    global.inv_state = INVENTORY_STATE.OPEN;
    
}

function close_inv() {
    show_debug_message("close_inv()");
    clear_cancel_input();
    clear_menu_input();
    
    // Return to Menu
    global.interact = INTERACT.GAME_MENU;
    global.menu_sub_menu = GAME_SUB_MENU_TYPE.NONE;
    global.menu_sub_choicer = GAME_SUB_MENU_CHOICE.FIRST;
    global.inv_state = INVENTORY_STATE.CLOSED;
    
}

function open_inv_item() {
    show_debug_message("open_inv_item()");
    global.inv_state = INVENTORY_STATE.ITEM;
    global.item_choicer = ITEM_CHOICE.USE;
}

function close_inv_item() {
    show_debug_message("close_inv_item()");
    clear_cancel_input();
    
    global.inv_state = INVENTORY_STATE.OPEN;
}

///
/// Stats Menu
/// 
function open_stats() {
    
    audio_play_sound(snd_select, 10, false, global.snd_volume);
    
    // Set global values
    global.interact = INTERACT.STATISTICS;
    global.menu_sub_menu = GAME_SUB_MENU_TYPE.STATISTICS
    global.menu_sub_choicer = GAME_SUB_MENU_CHOICE.FIRST;
    
}

function get_weapon() {
    return get_current_weapon_string();
}

function calc_attack() {
    return "10";
}

function calc_defense () {
    return "10";
}

function calc_level() {
    return "1"
}

function calc_exp() {
    return "0/20"
}

function close_stats() {
    
    // Set global values
    global.interact = INTERACT.GAME_MENU;
    global.menu_sub_menu = GAME_SUB_MENU_TYPE.NONE;
    global.menu_sub_choicer = GAME_SUB_MENU_CHOICE.FIRST;
    
}

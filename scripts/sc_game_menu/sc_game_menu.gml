function menu_open_flag() {
    return (global.interact == INTERACT.GAME_MENU) || 
    (global.interact == INTERACT.INVENTORY) || 
    (global.interact == INTERACT.STATISTICS);
}

///
/// Game Menu
/// 
function open_game_menu() {
    
    global.interact = INTERACT.GAME_MENU;

}

function close_game_menu() {
    
    global.interact = INTERACT.NONE;
    
    // Reset sub menu choicers.
    // Game menu choicer must be preserved.
    global.menu_sub_choicer = GAME_SUB_MENU_CHOICE.FIRST;
    global.menu_sub_menu = GAME_SUB_MENU_TYPE.NONE;
}

///
/// Inventory Menu
/// 
function open_inv() {
    
    // Set global values
    global.interact = INTERACT.INVENTORY;
    global.menu_sub_menu = GAME_SUB_MENU_TYPE.INVENTORY;
    global.menu_sub_choicer = GAME_SUB_MENU_CHOICE.FIRST;
}

function close_inv() {
    
    // Return to Menu
    global.interact = INTERACT.GAME_MENU;
    global.menu_sub_menu = GAME_SUB_MENU_TYPE.NONE;
    global.menu_sub_choicer = GAME_SUB_MENU_CHOICE.FIRST;
    
}

///
/// Stats Menu
/// 
function open_stats() {
    
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

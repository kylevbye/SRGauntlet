// Debug Features
if (global.debug) {
    if (keyboard_check_pressed(vk_space)) global.interact = INTERACT.NONE;
}


// Game
var _hor = keyboard_check(vk_right) - keyboard_check(vk_left);
var _ver = keyboard_check(vk_down) - keyboard_check(vk_up);

if (global.interact == INTERACT.NONE) {
    move_and_collide(_hor * move_speed, _ver* move_speed, tilemap_collide, undefined, undefined, undefined, move_speed, move_speed);
}

// In Game Menu
if (keyboard_check_pressed(ord("C")) || keyboard_check_pressed(vk_control)) {
    if (global.interact == INTERACT.NONE) {
        open_game_menu();
    }
    else if (global.interact == INTERACT.GAME_MENU) {
        close_game_menu();
    }
}
if (keyboard_check_pressed(ord("X")) || keyboard_check_pressed(vk_shift)) {
    switch (global.interact) {
    	case INTERACT.GAME_MENU:
            close_game_menu();
            break;
        case INTERACT.INVENTORY:
            close_inv();
            break;
        case INTERACT.STATISTICS:
            close_stats();
            break;
    }
}
if (global.interact == INTERACT.GAME_MENU) {
    if (keyboard_check_pressed(vk_down)) global.menu_choicer += 1;
    else if (keyboard_check_pressed(vk_up)) global.menu_choicer -= 1;
    // Range Check
    if (global.menu_choicer > GAME_MENU.STATISTICS) {
        global.menu_choicer = GAME_MENU.INVENTORY;
    }
    else if (global.menu_choicer < GAME_MENU.INVENTORY) {
        global.menu_choicer = GAME_MENU.STATISTICS;
    }
    // <Z/Enter>
    if (has_interacted()) {
        switch (global.menu_choicer) {
        	case GAME_MENU.INVENTORY:
                open_inv();
                break;
            case GAME_MENU.STATISTICS:
                open_stats();
                break;
        }
    }
        
}
if (global.interact == INTERACT.STATISTICS) {
    if (has_cancelled()) {
        close_stats();
    }
    if (has_menu_toggled()) {
        close_stats();
        close_game_menu();
    }
}
if (global.interact == INTERACT.INVENTORY) {
    if (has_pressed_down()) global.menu_sub_choicer += 1;
    if (has_pressed_up()) global.menu_sub_choicer -= 1;
    // Range Check
    if (global.menu_sub_choicer > INVENTORY.SLOT5) {
        global.menu_sub_choicer = INVENTORY.SLOT1;
    }
    else if (global.menu_sub_choicer < INVENTORY.SLOT1) {
        global.menu_sub_choicer = INVENTORY.SLOT5;
    }
    
    if (has_interacted()) {
        // WIP
    }
        
    if (has_cancelled()) {
        close_inv();
    }
        
    if (has_menu_toggled()) {
        close_inv();
        close_game_menu();
    }
}

// Sprite Update
if ((_hor != 0 || _ver !=0) && global.interact == INTERACT.NONE) {
    
    if (_hor > 0) sprite_index = spr_player_walk_right; 
    else if (_hor < 0) sprite_index =  spr_player_walk_left;
    else if (_ver > 0) sprite_index = spr_player_walk_down; 
    else if (_ver < 0) sprite_index = spr_player_walk_up;
}
else {
    
    switch (sprite_index) {
        case spr_player_walk_up:
            sprite_index = spr_player_idle_up;
            break;
        case spr_player_walk_right:
            sprite_index = spr_player_idle_right;
            break;
        case spr_player_walk_left:
            sprite_index = spr_player_idle_left;
            break;
        case spr_player_walk_down:
            sprite_index = spr_player_idle_down;
            break;
    }
    
}
// Debug Features
if (global.debug) {
    if (keyboard_check_pressed(vk_space)) global.interact = INTERACT.NONE;
        
    if (keyboard_check_pressed(ord("M"))) room_goto(room_battle);
}


// Game
var _hor = keyboard_check(vk_right) - keyboard_check(vk_left);
var _ver = keyboard_check(vk_down) - keyboard_check(vk_up);

// Movement
var _prev_x = x;
var _prev_y = y;
if (global.interact == INTERACT.NONE) { 
    move_and_collide(_hor * move_speed, _ver* move_speed, tilemap_collide, undefined, undefined, undefined, move_speed, move_speed);
}

// Face State
is_moving = true;
if (_prev_x > x) facing_direction = DIRECTION.LEFT;
else if (_prev_x < x) facing_direction = DIRECTION.RIGHT;
else if (_prev_y > y) facing_direction = DIRECTION.UP;
else if (_prev_y < y) facing_direction = DIRECTION.DOWN;
    
else is_moving = false;

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
    }
}
if (global.interact == INTERACT.GAME_MENU) {
    if (keyboard_check_pressed(vk_down)) global.menu_choicer += 1;
    else if (keyboard_check_pressed(vk_up)) global.menu_choicer -= 1;
    // Range Check
    global.menu_choicer = menu_range_check(global.menu_choicer, GAME_MENU.INVENTORY, GAME_MENU.STATISTICS, false);
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
    switch (global.inv_state) {
        case INVENTORY_STATE.OPEN:
            if (has_pressed_down()) global.menu_sub_choicer += 1;
            if (has_pressed_up()) global.menu_sub_choicer -= 1;
            global.menu_sub_choicer = menu_range_check(global.menu_sub_choicer, INVENTORY.SLOT1, INVENTORY.SLOT5, false);
            if (has_interacted()) open_inv_item();
            if (has_cancelled()) close_inv(); 
            break;
        case INVENTORY_STATE.ITEM:
            if (has_pressed_right()) global.item_choicer += 1;
            if (has_pressed_left()) global.item_choicer -= 1;
            global.item_choicer = menu_range_check(global.item_choicer, ITEM_CHOICE.USE, ITEM_CHOICE.DROP, false);    
            if (has_interacted()) process_item_choice();
            if (has_cancelled()) close_inv_item();
            break;
    	
    }

}
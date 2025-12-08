/**
 * Called on game start. Starts with empty inventory.
 * If debug mode is on, the inventory is prefilled with
 * items to be debugged.
 */
function initialize_inventory() {
    // 5-slot
    global.inventory = array_create(INVENTORY.LENGTH, ITEM.NONE);
    
    // If debug mode is active, the game will start with the following items:
    // 1.) PostCard
    // 2.) Heal 1
    // 3.) Speed?
    
    if (global.debug) {
        for (i = 0; i<3; ++i) {
            add_to_inventory(obj_postcard);
        }
    }
}

/**
 * Called when item option is selected by player.
 * Choices: [Use], [Info], [Drop].
 * Interact input is cleared.
 */
function process_item_choice(){
    
    if (global.inventory[global.menu_sub_choicer] == ITEM.NONE) {
        return;
    }
    
    switch (global.item_choicer) {
    	case ITEM_CHOICE.USE:
            use_item();
            break;
        case ITEM_CHOICE.INFO:
            info_item();
            break;
        case ITEM_CHOICE.DROP:
            drop_item();
            break;
    }
    
    clear_interact_input();
}

/**
 * Calls the use function of the item selected.
 */
function use_item() {
    var item = global.inventory[global.menu_sub_choicer];
    global.inv_state = INVENTORY_STATE.ITEM;
    
    if (item == ITEM.NONE) return;
    with (item) event_user(0);
}

/**
 * Spawns a dialogue box that displays the information of
 * the selected item.
 */
function info_item() {
    var item = global.inventory[global.menu_sub_choicer];
    
    if (item == ITEM.NONE) return;
    with (item) event_user(1);
}

/**
 * Drops selected item from inventory and shifts 
 * the inventory forward.
 */ 
function drop_item() {
    var item = global.inventory[global.menu_sub_choicer];
    
    if (item == ITEM.NONE) return;
    with (item) event_user(2); 
        
    global.inventory[global.menu_sub_choicer] = ITEM.NONE;
    shift_inventory();
}

/**
 * Adds an item to the first empty/null slot in the inventory.
 * @param {obdj_item} item Item to add
 */
function add_to_inventory(item) {
    
    var pos = 0;
    var max_inv_slots = array_length(global.inventory);
    
    while (pos < max_inv_slots) {
        if (global.inventory[pos] == ITEM.NONE) {
            break;
        }
        ++pos;
    }
    
    if (pos == max_inv_slots) {
        return false;
    }
    
    global.inventory[pos] = item;
}

/**
 * Removes empty gaps in the inventory by shifting
 * everything towards the top.
 */ 
function shift_inventory() {
    
    var pos = 0;
    
    while (pos < array_length(global.inventory)-1) {
        item = global.inventory[pos];
        if (item == ITEM.NONE) {
            item_next = global.inventory[pos+1];
            global.inventory[pos] = item_next;
            global.inventory[pos+1] = ITEM.NONE;
        }
        ++pos;
    }
    
}
function initialize_inventory() {
    // 5-slot
    global.inventory = array_create(INVENTORY.LENGTH, ITEM.NONE);
    
    if (global.debug) {
        for (i = 0; i<3; ++i) {
            add_to_inventory(obj_postcard);
        }
    }
}

function process_item_choice(){
    
    if (global.inventory[global.menu_sub_choicer] == ITEM.NONE) {
        return;
    }
    
    switch (global.item_choicer) {
    	case ITEM_CHOICE.USE:
            global.inv_state = INVENTORY_STATE.ITEM;
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

function use_item() {
    var item = global.inventory[global.menu_sub_choicer];
    
    if (item == ITEM.NONE) return;
    with (item) event_user(0);
}

function info_item() {
    var item = global.inventory[global.menu_sub_choicer];
    
    if (item == ITEM.NONE) return;
    with (item) event_user(1);
}

function drop_item() {
    var item = global.inventory[global.menu_sub_choicer];
    
    if (item == ITEM.NONE) return;
    with (item) event_user(2); 
        
    global.inventory[global.menu_sub_choicer] = ITEM.NONE;
    shift_inventory();
    //global.menu_sub_choicer -= 1;
    //global.menu_sub_choicer = menu_range_check(global.menu_sub_choicer, INVENTORY.SLOT1, INVENTORY.SLOT5, false);
}

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
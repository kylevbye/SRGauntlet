function initialize_inventory() {
    // 5-slot
    global.inventory = array_create(INVENTORY.LENGTH, ITEM.NONE);
    
    if (global.debug) global.inventory[0] = obj_postcard;
}

function process_item_choice(){
    
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
}

function use_item() {
    var item = global.inventory[global.menu_sub_choicer];
    
    if (item == ITEM.NONE) return;
    with (item) event_user(0);
}

function info_item() {
    
}

function drop_item() {
    
}
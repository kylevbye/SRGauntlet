// INFO
var dialogue_instance = spawn_dialogue([info]);
global.interact = INTERACT.INVENTORY;
global.inv_state = INVENTORY_STATE.INFO;
dialogue_instance.restore_interact_state = function () {
    global.interact = INTERACT.INVENTORY;
    global.inv_state = INVENTORY_STATE.ITEM;
}

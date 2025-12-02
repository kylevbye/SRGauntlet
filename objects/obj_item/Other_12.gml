// DROP
var drop_text = string("{0} was dropped", name);
var dialogue_instance = spawn_dialogue([drop_text]);
global.interact = INTERACT.INVENTORY;
global.inv_state = INVENTORY_STATE.DROP;
dialogue_instance.restore_interact_state = function () {
    global.interact = INTERACT.INVENTORY;
    global.inv_state = INVENTORY_STATE.OPEN;
}
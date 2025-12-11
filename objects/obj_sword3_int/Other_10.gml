// Inherit the parent event
event_inherited();

if (!interacted) {
    interacted = true;
    var dialogue = spawn_dialogue("You have picked up the Ultimate Sword!");
    dialogue.queued_event= function () {
        global.plot.boss1room.sword3_looted = true;
        add_to_inventory(obj_sword3);
        play_item_pickup_sound();
    }
    
}

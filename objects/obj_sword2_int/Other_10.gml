// Inherit the parent event
event_inherited();

if (!interacted) {
    interacted = true;
    var dialogue = spawn_dialogue("You have picked up the Advanced Sword!");
    dialogue.queued_event= function () {
        global.plot.sword2_u2r1.sword_looted = true;
        add_to_inventory(obj_sword2);
        play_item_pickup_sound();
    }
    
}

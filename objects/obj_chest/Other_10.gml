// Inherit the parent event
event_inherited();

if (!looted && !interacted) {
    interacted = true;
    var dialogue = spawn_dialogue(interact_dialogue);
    dialogue.queued_event= function () {
        interact_event();
        looted = true;
        play_item_pickup_sound();
    }
    
}



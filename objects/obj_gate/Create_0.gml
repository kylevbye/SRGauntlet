// Inherit the parent event
event_inherited();

// Unlock
unlock_condition = function() {}
unlock_event = function () {}

// Interactive
interactable = true;
array_push(obj_player.tilemap_collide, self);

dialogue_locked = "";
dialogue_unlock = [
    "You insert the key.", 
    "The gate has been opened!"
];

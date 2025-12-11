// Inherit the parent event
event_inherited();

// Interactive
interactable = true;
array_push(obj_player.tilemap_collide, self);

counter = 0;
show_condition = function() {
    return !global.plot.boss1room.boss_fought;
}
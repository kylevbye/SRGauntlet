// Inherit the parent event
event_inherited();

show_condition = function () { return !global.plot.boss1room.boss_fought; }
array_push(obj_player.tilemap_collide, self);
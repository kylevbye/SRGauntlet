if (room == room_battle) {
    if (counter == fade_out_duration ) {
        counter = 0;
        room_goto(global.loaded_room);
        room_set_persistent(global.loaded_room, false);
        room_persistent = false;
        global.loaded_room = pointer_null;
        global.interact = INTERACT.NONE;
        instance_create_layer(0, 0, "Instances", obj_music);
    }
}
else if (counter == fade_in_duration) {
    instance_create_layer(0, 0, "Instances", obj_music);
    instance_destroy();
}
++counter;
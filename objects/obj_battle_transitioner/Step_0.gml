if (room != room_battle) {
    if (counter == fade_in_duration + encounter_duration) {
        counter = 0;
        global.enemy = enemy;
        room_goto(room_battle);
        global.interact = INTERACT.BATTLE;
    }
}
else if (counter == fade_out_duration) {
    instance_destroy();
}
++counter;
// If the player walks into a door during this,
// we stop the encounter to prevent persistence
// problems.
if (instance_exists(obj_fader)) {
    instance_destroy();
    global.interact = INTERACT.NONE;
    audio_stop_sound(snd_encounter);
}

global.enemy = enemy;

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
if (switch1.switched && !switch2.switched && switch3.switched) {
    solved = true;
    global.plot.postcard_puz_d2.chest_door_unlocked = true;
    play_secret_sound();
    spawn_dialogue("You heard a path open!");
}

// Update states for plot
global.plot.postcard_puz_d2.switch1_state = switch1.switched;
global.plot.postcard_puz_d2.switch2_state = switch2.switched;
global.plot.postcard_puz_d2.switch3_state = switch3.switched;

if (solved) instance_destroy();
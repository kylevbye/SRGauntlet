
// Process <Up/Down> Input
if (keyboard_check_pressed(vk_up)) {
}

if (keyboard_check_pressed(vk_down)) {
    
}

    
// Update Choicer


// Process <Z/Enter> Input


// Process <X/Shift> Input
if (keyboard_check_pressed(ord("X")) || keyboard_check_pressed(vk_shift)) {
    audio_play_sound(snd_menu, 10, false, global.snd_volume);
    room_goto(room_options);
}

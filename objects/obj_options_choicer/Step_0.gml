
// Process <Up/Down> Input
if (keyboard_check_pressed(vk_up)) {
    audio_play_sound(snd_menu, 10, false, global.snd_volume);
    player_choice -= 1;
}

if (keyboard_check_pressed(vk_down)) {
    audio_play_sound(snd_menu, 10, false, global.snd_volume);
    player_choice += 1;
}

// Range check
if (player_choice > OPTIONS.EXIT) player_choice = OPTIONS.FULLSCREEN;
if (player_choice < OPTIONS.FULLSCREEN) player_choice = OPTIONS.EXIT;
    
// Update Choicer
obj_options_fullscreen_text.selected = false;
obj_options_volume_text.selected = false;
obj_options_exit_text.selected = false;

switch (player_choice) {
    case OPTIONS.FULLSCREEN:
        obj_options_fullscreen_text.selected = true;
        break;
    case OPTIONS.VOLUME:
        obj_options_volume_text.selected = true;
        break;
    case OPTIONS.EXIT:
        obj_options_exit_text.selected = true;
        break;
}

// Process <Z/Enter> Input
if (keyboard_check_pressed(ord("Z")) || keyboard_check_pressed(vk_enter)) {
    audio_play_sound(snd_select, 10, false, global.snd_volume);
    
    switch (player_choice) {
        case OPTIONS.FULLSCREEN: 
            window_set_fullscreen(!window_get_fullscreen());
            break;
        case OPTIONS.VOLUME:
            room_goto(room_options_volume);
            break;
        case OPTIONS.EXIT:
            room_goto(room_intromenu);
            break;
    }
}

// Process <X/Shift> Input
if (keyboard_check_pressed(ord("X")) || keyboard_check_pressed(vk_shift)) {
    audio_play_sound(snd_menu, 10, false, global.snd_volume);
    room_goto(room_intromenu);
}

if (!audio_is_playing(mus_mainmenu)) { 
    audio_play_sound(mus_mainmenu, 30, true, global.mus_volume);
}

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
if (player_choice > MAIN_MENU.SR_MODE) player_choice = MAIN_MENU.START;
if (player_choice < MAIN_MENU.START) player_choice = MAIN_MENU.SR_MODE;
    
// Update Choicer
obj_mainmenu_start_text.selected = false;
obj_mainmenu_options_text.selected = false;
obj_mainmenu_srmode_text.selected = false;

switch (player_choice) {
    case MAIN_MENU.START:
        obj_mainmenu_start_text.selected = true;
        break;
    case MAIN_MENU.OPTIONS:
        obj_mainmenu_options_text.selected = true;
        break;
    case MAIN_MENU.SR_MODE:
        obj_mainmenu_srmode_text.selected = true;
        break;
}

// Process <Z/Enter> Input
if (keyboard_check_pressed(ord("Z")) || keyboard_check_pressed(vk_enter)) {
    audio_play_sound(snd_select, 10, false, global.snd_volume);
    
    switch (player_choice) {
        case MAIN_MENU.START:
            room_goto(room_floor1_test1);
            break;
        case MAIN_MENU.OPTIONS:
            room_goto(room_options);
            break;
        case MAIN_MENU.SR_MODE:
            // Toggle
            global.sr_mode = !global.sr_mode;
            break;
}
}

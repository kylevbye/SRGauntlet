// When selecting SFX, MUSIC, or EXIT
if (selected_volume == VOLUME_CHOICES.NONE) {
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
    if (player_choice > VOLUME_CHOICES.EXIT) player_choice = VOLUME_CHOICES.SFX;
    if (player_choice < VOLUME_CHOICES.SFX) player_choice = VOLUME_CHOICES.EXIT;
        
    // Update Choicer
    obj_volume_sfx_text.selected = false;
    obj_volume_mus_text.selected = false;
    obj_volume_exit_text.selected = false;
    switch (player_choice) {
        case VOLUME_CHOICES.SFX:
            obj_volume_sfx_text.selected = true;
            break;
        case VOLUME_CHOICES.MUSIC:
            obj_volume_mus_text.selected = true;
            break;
        case VOLUME_CHOICES.EXIT:
            obj_volume_exit_text.selected = true;
            break;
    }

    // Process <Z/Enter> Input
    if (keyboard_check_pressed(ord("Z")) || keyboard_check_pressed(vk_enter)) {
        audio_play_sound(snd_select, 10, false, global.snd_volume);
        switch (player_choice) {
            case VOLUME_CHOICES.SFX:
                selected_volume = VOLUME_CHOICES.SFX;
                org_volume = global.snd_volume;
                break;
            case VOLUME_CHOICES.MUSIC:
                selected_volume = VOLUME_CHOICES.MUSIC;
                org_volume = global.mus_volume;
                break;
            case VOLUME_CHOICES.EXIT:
                room_goto(room_options);
                break;
        }
    }    
        
    // Process <X/Shift> Input
    if (keyboard_check_pressed(ord("X")) || keyboard_check_pressed(vk_shift)) {
        audio_play_sound(snd_menu, 10, false, global.snd_volume);
        room_goto(room_options);
    }
}
// Interacting w/ Volume Slider
else {
    var change_val = 0.0;
    if (keyboard_check_pressed(vk_left)) {
        audio_play_sound(snd_menu, 10, false, global.snd_volume);
        audio_sound_gain(mus_mainmenu, global.mus_volume, 0);
        change_val -=0.1;
    }
    if (keyboard_check_pressed(vk_right)) { 
        audio_play_sound(snd_menu, 10, false, global.snd_volume);
        audio_sound_gain(mus_mainmenu, global.mus_volume, 0);
        change_val +=0.1; 
    }
        
    ChangeVolume(change_val, selected_volume);
    
    if (keyboard_check_pressed(ord("Z")) || keyboard_check_pressed(vk_enter)) {
        audio_play_sound(snd_levelup, 10, false, global.snd_volume);
        selected_volume = VOLUME_CHOICES.NONE;
        org_volume = 0.0;
    }
    else if (keyboard_check_pressed(ord("X")) || keyboard_check_pressed(vk_shift)) {
        SetVolumeValue(org_volume,selected_volume);
        selected_volume = VOLUME_CHOICES.NONE;
        org_volume = 0.0;
        audio_sound_gain(mus_mainmenu, global.mus_volume, 0);
        audio_play_sound(snd_heavyswing, 10, false, global.snd_volume);
    }
    
}




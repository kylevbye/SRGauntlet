if (music != pointer_null) {
    if (!audio_is_playing(music)) {
        if (audio_is_playing(mus_mainmenu)) audio_stop_sound(mus_mainmenu);
        audio_play_sound(music, 30, true, global.mus_volume);
    }
}

instance_destroy();
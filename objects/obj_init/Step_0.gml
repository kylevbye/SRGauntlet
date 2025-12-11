if (audio_loaded || (audio_group_is_loaded(ag_sfx) && audio_group_is_loaded(ag_music))) {
    room_goto(room_intromenu);
}
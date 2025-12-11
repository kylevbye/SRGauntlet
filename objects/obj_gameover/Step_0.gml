
if (counter <= delay_amount) {
    ++counter;
}
else if (has_interacted()) {
    game_restart();
    audio_play_sound(snd_select, 10, false, global.snd_volume);
    audio_stop_all();
}

if (counter <= delay_amount) {
    ++counter;
}
else if (has_interacted()) {
    room_goto(room_intromenu);
    audio_play_sound(snd_select, 10, false, global.snd_volume);
    audio_stop_all();
}
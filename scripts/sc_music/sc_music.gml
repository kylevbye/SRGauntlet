function play_bat_victory_music() {
    audio_play_sound(mus_victory, 10, true, global.snd_volume);
}

function play_bat_music() {
    audio_play_sound(mus_battle, 30, true, global.mus_volume);
}

function play_boss_music() {
    audio_play_sound(mus_boss, 30, true, global.mus_volume);
}
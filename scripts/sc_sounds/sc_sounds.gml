function play_atk_bar_crit_sound(){
    audio_play_sound(snd_bar_crit, 10, false, global.snd_volume);
}

function play_atk_bar_land_sound(){
    audio_play_sound(snd_bar_hit, 10, false, global.snd_volume);
}

function play_atk_critical_sound() {
    audio_play_sound(snd_crit, 10, false, global.snd_volume);
}

function play_encounter_sound() {
    audio_play_sound(snd_encounter, 10, false, global.snd_volume);
} 

function play_enemy_defeat_sound() {
    audio_play_sound(snd_enemy_defeat, 10, false, global.snd_volume);
}
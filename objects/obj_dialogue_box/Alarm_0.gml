// Advance the character position of the dialogue line by 1 

if (char_pos < string_length(script[line])) {
    ++char_pos;
    alarm[0] = text_delay;
    
    if (string_char_at(script[line], char_pos) != " ") {
        audio_play_sound(text_sound, 30, false, global.snd_volume);
    }
}
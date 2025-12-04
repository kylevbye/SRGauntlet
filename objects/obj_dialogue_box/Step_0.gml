if (has_cancelled() && skippable) {
    char_pos = string_length(script[line]);
} 

if (has_interacted() && char_pos >= string_length(script[line])) {
    ++line;
    char_pos = 0;
    
    if (line >= array_length(script)) {
        instance_destroy();
        clear_interact_input();
    }
    alarm[0] = text_delay;
    
    clear_interact_input();
}


if (keyboard_check_pressed(vk_f4) || keyboard_check_pressed(vk_f11)) {
    window_set_fullscreen(!window_get_fullscreen());
}

if (keyboard_check(vk_escape)) {
    ++quit_counter;
}
else quit_counter = 0;
    
if (quit_counter >= 60) game_end(0);
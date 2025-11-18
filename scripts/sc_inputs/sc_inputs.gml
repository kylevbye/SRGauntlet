function has_interacted() {
    return keyboard_check_pressed(ord("Z")) || keyboard_check_pressed(vk_enter);
}

function has_cancelled() {
    return keyboard_check_pressed(ord("X")) || keyboard_check_pressed(vk_shift);
}

function has_skipped () { return has_cancelled(); }

function has_menu_toggled() {
    return keyboard_check_pressed(ord("C")) || keyboard_check_pressed(vk_control);
}

function has_pressed_up() {
    return keyboard_check_pressed(vk_up);
}

function has_pressed_left() {
    return keyboard_check_pressed(vk_left);
}

function has_pressed_right() {
    return keyboard_check_pressed(vk_right);
}

function has_pressed_down() {
    return keyboard_check_pressed(vk_down);
}

function clear_interact_input() {
    keyboard_clear(ord("Z"));
    keyboard_clear(vk_escape);
}

function clear_cancel_input() {
    keyboard_clear(ord("X"));
    keyboard_clear(vk_shift);
}

function clear_menu_input() {
    keyboard_clear(ord("C"));
    keyboard_clear(vk_control);
}
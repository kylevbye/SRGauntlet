if (active) {
    if (has_interacted()) {
        with (attack_bars[0]) { event_user(0); }
    }
    if (array_length(attack_bars) == 0) active = false;
}
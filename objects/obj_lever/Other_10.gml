// Inherit the parent event
event_inherited();

if (toggleable || !switched) {
    switched = !switched;
    switch_event();
}

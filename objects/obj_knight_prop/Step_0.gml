// Inherit the parent event
event_inherited();

if (triggered) {
    if (counter < move_duration) {
         y += y_speed;
        
    }
    else triggered = false;
    ++counter;
}

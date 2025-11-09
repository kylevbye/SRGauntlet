if (!touched) {
    global.interact = INTERACT.TRAVEL;
    global.entrance = entrance;
    instance_create_layer(0, 0, "Effects", obj_fader);
    alarm[2] = 8;
    touched = true;
}

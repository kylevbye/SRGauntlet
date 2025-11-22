//global.interact = INTERACT.TRAVEL;
if (!touched) {
    global.interact = INTERACT.TRAVEL;
    instance_create_layer(0, 0, "Effects", obj_fader);
    alarm[2] = 8;
    touched = true;
}

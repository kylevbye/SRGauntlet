switchroom_d1_switch.toggleable = false; 
switchroom_d1_switch.switched = global.plot.switchroom_d1.switch_state;
switchroom_d1_switch.switch_event = function () {
    spawn_dialogue("You heard a door open from far away!");
    global.plot.switchroom_d1.switch_state = true;
}

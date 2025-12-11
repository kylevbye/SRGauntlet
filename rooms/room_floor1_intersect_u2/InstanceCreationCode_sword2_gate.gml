sword2_gate.show_condition = function () { return !global.plot.switchroom_d1.switch_state; }
sword2_gate.unlock_condition = function() { return global.plot.switchroom_d1.switch_state; }
sword2_gate.dialogue_locked = [
    "Peeking through the gate, you see a new sword!",
    "There doesn't seem to be a keyhole on this gate."
]
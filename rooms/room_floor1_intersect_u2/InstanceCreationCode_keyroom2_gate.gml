keyroom2_gate.show_condition = function () { return !global.plot.intersect_u2.floor2_keyroom1_u3_unlocked; }
keyroom2_gate.unlock_condition = function() { return global.plot.keyroom1_u2l1.chest_looted; }
keyroom2_gate.unlock_event = function () {
    global.plot.intersect_u2.floor2_keyroom1_u3_unlocked = true;
}
keyroom2_gate.dialogue_locked = [
    "Peeking through the gate, you see a shiny chest!",
    "You look at the gate closely and see a keyhole.",
    "You probably need the north key to enter."
]
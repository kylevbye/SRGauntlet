start_gate.show_condition = function () { return !global.plot.start.floor2_entrance_room_unlocked; }
start_gate.unlock_condition = function() { return global.plot.keyroom2_u3.chest_looted; }
start_gate.unlock_event = function () {
    global.plot.start.floor2_entrance_room_unlocked = true;
}
start_gate.dialogue_locked = [
    "This is the gate to floor 2. It is locked!",
    "It requires the floor 2 key."
]

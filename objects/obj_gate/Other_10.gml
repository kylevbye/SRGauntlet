if (unlock_condition()) {
    var dia_ins = spawn_dialogue(dialogue_unlock);
    dia_ins.queued_event = function () {
        unlock_event();
    }
}
else {
    spawn_dialogue(dialogue_locked);
}
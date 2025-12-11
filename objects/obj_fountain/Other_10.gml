// Inherit the parent event
event_inherited();

interact_event();
var dialogue = spawn_dialogue(interact_dialogue);
dialogue.queued_event= function () {
    global.current_hp = global.max_hp;
    global.current_mp = global.max_mp;
    play_heal2_sound();
}



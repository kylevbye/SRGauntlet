// Inherit the parent event
event_inherited();

interact_dialogue = [
    "You drank from the fountain!",
    "HP and MP fully restored!"
];
interact_event = function () {
    play_heal1_sound();
}


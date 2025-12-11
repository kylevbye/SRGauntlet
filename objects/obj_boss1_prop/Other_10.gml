var dialogue = [
    "You have come a long way.",
    "That's too bad!",
    "You have come to die!"
]
var dia_ins = spawn_dialogue(dialogue);
dia_ins.queued_event = function () {
    var battletrans = instance_create_layer(0,0,"Instances", obj_battle_transitioner);
    battletrans.enemy = obj_boss2;
    battletrans.queued_event = function() { global.plot.boss1room.boss_fought = true; }
}

if (global.plot.keyroom1_u2l1.encounter3_fought) {
    instance_destroy(knight1_3);
    exit;
}

knight1_3.width = 60;
knight1_3.height = 140;


knight1_3.event = function() {
    var seq_ins = instance_create_layer(0,0,"Instances",obj_sequence);
    seq_ins.sequence = knight1_scripted_encounter;
    knight1_3_prop.triggered = true;
    play_spotted_sound();
    
    seq_ins.queued_event = function() {
        var battletrans = instance_create_layer(0,0,"Instances", obj_battle_transitioner);
        battletrans.enemy = obj_knight1;
        battletrans.queued_event = function() { global.plot.keyroom1_u2l1.encounter3_fought = true; }
    }
}
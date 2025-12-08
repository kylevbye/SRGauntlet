knight1_1.event = function() {
    var seq_ins = instance_create_layer(0,0,"Instances",obj_sequence);
    seq_ins.sequence = knight1_scripted_encounter;
    
    
    seq_ins.queued_event = function() {
        var battletrans = instance_create_layer(0,0,"Instances", obj_battle_transitioner);
        battletrans.enemy = obj_enemy;
    }
}
if (global.step >= step_trigger && !encountered && global.interact == INTERACT.NONE) {
    var battletrans = instance_create_layer(0,0,"Instances", obj_battle_transitioner);
    battletrans.enemy = get_room_rencounter();
    encountered = true;
}



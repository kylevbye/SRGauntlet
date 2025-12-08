function spawn_dialogue(dialogue_arr){
    global.interact = INTERACT.DIALOGUE;
    var instance = instance_create_layer(0, 0, "Instances", obj_dialogue_box);
    if (is_string(dialogue_arr)) instance.script = [dialogue_arr];
    else instance.script = dialogue_arr;
    return instance;
}

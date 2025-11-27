function spawn_dialogue(dialogue_arr){
    global.interact = INTERACT.DIALOGUE;
    instance_create_layer(0, 0, "Instances", obj_dialogue_box);
}

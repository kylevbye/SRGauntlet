function create_dialogue_from_gml(){
    var diag_struct = {
        general : pointer_null,
        battle : pointer_null
    }
    
    diag_struct.general = create_general_dialogue();
    diag_struct.battle = create_battle_dialogue();
    
    return diag_struct;
}

function create_general_dialogue() {
    var gen_diag_struct = {
        test : [
            "This is the first line of dialogue",
            "This is the second line.",
            "And finally, the third!"
        ]
        
    }
    
    return gen_diag_struct;
}

function create_battle_dialogue() {
    var bat_diag_struct = {
        enemy_attack_land : [
            "{0} has landed a blow and dealt {1} damage!",
            "{0} has dealt a significant blow of {1} damage!",
        ]
    }
    
    return bat_diag_struct;
}
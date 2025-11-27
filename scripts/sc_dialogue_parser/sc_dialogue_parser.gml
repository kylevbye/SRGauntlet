function instantiate_dialogue() {
    global.dialogue = create_dialogue_from_gml();
}

function parse_dialogue() {
    var dialogue_data = json_parse(read_dialogue_file());
    global.dialogue = dialogue_data;
}

function read_dialogue_file() {
    var return_str = "";
    var json_file = file_text_open_read("dialogue.json");
    
    
    
    file_text_close(json_file);
    return return_str;
}
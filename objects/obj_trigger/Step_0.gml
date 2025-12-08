if (!instance_exists(obj_player)) {
    return;
}

var left_x = obj_player.bbox_left;
var right_x = obj_player.bbox_right;
var up_y = obj_player.bbox_top;
var down_y = obj_player.bbox_bottom;

if ( right_x>=x-(width*0.5) && left_x<=x+(width*0.5) && up_y>=y-(height*0.5) && down_y<=y+(height*0.5)) {
    if (global.interact == INTERACT.NONE) {
        show_debug_message("TRIGGERED!");
        global.interact = INTERACT.CUTSCENE_TRIGGERED;
        event();
        instance_destroy();
    }
}
// Inherit the parent event
event_inherited();

// Interact 
if (has_interacted() && interactable && global.interact == INTERACT.NONE) {
    var interact_region = obj_player_interact.interact_region;
    
    show_debug_message("px:{0} py:{1} x1:{2} y1:{3} x2:{4} y2:{5}", x, y, 
    interact_region.x1, interact_region.y1, interact_region.x2, interact_region.y2);
    
    if ( x>=interact_region.x1 && x<=interact_region.x2 && y>=interact_region.y1 && y<=interact_region.y2) {
        show_debug_message("INTERACTION");
        event_user(0);
    }
}


function teleport_player_to_marker(){
    
    if (global.interact == INTERACT.TRAVEL) {
        global.interact = INTERACT.NONE;
        var new_x = 0;
        var new_y = 0;
        var teleported = false;
        
        switch (global.entrance) {
        	case ENTRANCE.LEFT:
                if (instance_exists(obj_marker_a)) {
                    new_x = obj_marker_a.x;
                    new_y = obj_marker_a.y;
                    teleported = true;
                }
                break;
            case ENTRANCE.UP:
                if (instance_exists(obj_marker_b)) {
                    new_x = obj_marker_b.x;
                    new_y = obj_marker_b.y;
                    teleported = true;
                }
                break;
            case ENTRANCE.RIGHT:
                if (instance_exists(obj_marker_c)) {
                    new_x = obj_marker_c.x;
                    new_y = obj_marker_c.y;
                    teleported = true;
                }
                break;
            case ENTRANCE.DOWN:
                if (instance_exists(obj_marker_d)) {
                    new_x = obj_marker_d.x;
                    new_y = obj_marker_d.y;
                    teleported = true;
                }
                break;
        }
        
        if (teleported) {
            obj_player.x = new_x;
            obj_player.y = new_y;
        }
        
    }

}
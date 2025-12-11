function get_room_step_counts(){
    
    var step_count = -1;
    
    // Floor 1
    switch (room) {
        case room_floor1_hallway_d1:
            step_count = -1;
            break;
        case room_floor1_hallway_u1:
            step_count = 70;
            break;
        case room_floor1_intersect_u2:
            step_count = 65;
            break;
        case room_floor1_keyroom1_u2l1:
            step_count = -1;
            break;
        case room_floor1_keyroom2_u3:
            step_count = -1;
            break;
        case room_floor1_postcard_puz_d2:
            step_count = 50;
            break;
        case room_floor1_start:
            step_count = -1;
            break;
        case room_floor1_switchroom_d1:
            step_count = -1;
            break;
        case room_floor1_sword2_u2r1:
            step_count = 45;
            break;
    }
    
    return step_count;
}

function get_room_rencounter() {
    var enemy = obj_knight0;
    
    if (room == room_floor1_intersect_u2 || room == room_floor1_hallway_u1
        || room == room_floor1_postcard_puz_d2) {
        enemy = obj_knight0;
    }
    
    if (room == room_floor1_sword2_u2r1) {
        enemy = obj_knight2;
    }
    
    return enemy;
}
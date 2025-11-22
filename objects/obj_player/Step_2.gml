// Sprite Update
if (is_moving) {
    
    switch (facing_direction) {
        case DIRECTION.RIGHT:
            sprite_index = spr_player_walk_right;
            break;
        case DIRECTION.LEFT:
            sprite_index = spr_player_walk_left;
            break;
        case DIRECTION.DOWN:
            sprite_index = spr_player_walk_down;
            break;
        case DIRECTION.UP:
            sprite_index = spr_player_walk_up;
            break;
    }
}
else {
    
    switch (sprite_index) {
        case spr_player_walk_right:
            sprite_index = spr_player_idle_right;
            break;
        case spr_player_walk_left:
            sprite_index = spr_player_idle_left;
            break;
        case spr_player_walk_down:
            sprite_index = spr_player_idle_down;
            break;
        case spr_player_walk_up:
            sprite_index = spr_player_idle_up;
            break;
    }
    
}

// Camera 
var h_view_width= camera_get_view_width(view_camera[0])/2;
var h_view_height= camera_get_view_width(view_camera[0])/2;
camera_set_view_pos(view_camera[0], x - h_view_width + sprite_width, y- h_view_height + sprite_height);
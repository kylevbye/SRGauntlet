var _hor = keyboard_check(vk_right) - keyboard_check(vk_left);
var _ver = keyboard_check(vk_down) - keyboard_check(vk_up);

if (global.interact == 0) move_and_collide(_hor * move_speed, _ver* move_speed, tilemap_collide, undefined, undefined, undefined, move_speed, move_speed);

if (_hor != 0 || _ver !=0) {
    
    if (_hor > 0) sprite_index = spr_player_walk_right; 
    else if (_hor < 0) sprite_index =  spr_player_walk_left;
    else if (_ver > 0) sprite_index = spr_player_walk_down; 
    else if (_ver < 0) sprite_index = spr_player_walk_up;
}
else {
    
    switch (sprite_index) {
        case spr_player_walk_up:
            sprite_index = spr_player_idle_up;
            break;
        case spr_player_walk_right:
            sprite_index = spr_player_idle_right;
            break;
        case spr_player_walk_left:
            sprite_index = spr_player_idle_left;
            break;
        case spr_player_walk_down:
            sprite_index = spr_player_idle_down;
            break;
    }
    
}
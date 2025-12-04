if (!instance_exists(obj_player)) return;

x = obj_player.x;
y = obj_player.y;
facing_direction = obj_player.facing_direction;

interact_region.x1 = 0; 
interact_region.x2 = 0;
interact_region.y1 = 0;
interact_region.y2 = 0;
var p_width = obj_player.sprite_width;
var p_height = obj_player.sprite_height;

switch (facing_direction) { 
    case DIRECTION.UP:
        interact_region.x1 = x-(interact_side*0.5)-1;
        interact_region.x2 = x+(interact_side*0.5);
        interact_region.y1 = y-interact_reach;
        interact_region.y2 = y;
        break;
    case DIRECTION.DOWN:
        interact_region.x1 = x-(interact_side*0.5)-1;
        interact_region.x2 = x+(interact_side*0.5);
        interact_region.y1 = y;
        interact_region.y2 = y+interact_reach;
        break;
    case DIRECTION.RIGHT:
        interact_region.x1 = x;
        interact_region.x2 = x+interact_reach+2;
        interact_region.y1 = y-(interact_side*0.5);
        interact_region.y2 = y+(interact_side*0.5)+1;
        break;
    case DIRECTION.LEFT:
        interact_region.x1 = x-(interact_reach+3);
        interact_region.x2 = x;
        interact_region.y1 = y-(interact_side*0.5)+1;
        interact_region.y2 = y+(interact_side*0.5);
        break;
}

if (has_interacted()) {
    duration_count = show_duration;
}
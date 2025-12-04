move_speed = 4;
is_moving = 0;
facing_direction = DIRECTION.UP;

tilemap_collide = layer_tilemap_get_id("Tile_Collision");

if (global.debug) instance_create_layer(0, 0, "Debug", obj_debug);
    
instance_create_layer(0, 0, "Instances", obj_player_interact);
    
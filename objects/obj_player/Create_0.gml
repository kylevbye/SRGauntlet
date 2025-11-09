move_speed = 4;

tilemap_collide = layer_tilemap_get_id("Tile_Collision");

if (global.debug) instance_create_layer(0, 0, "Debug", obj_debug);
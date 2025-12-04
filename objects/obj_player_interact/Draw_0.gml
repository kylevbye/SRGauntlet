if (!instance_exists(obj_player)) return;

draw_set_color(color);
draw_set_halign(fa_left);
draw_set_valign(fa_top);

if (global.interact == INTERACT.NONE && global.debug && duration_count > 0) {
    draw_rectangle(interact_region.x1, interact_region.y1, interact_region.x2, interact_region.y2, true);
    --duration_count;
}

/// Reset
draw_set_color(c_white);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
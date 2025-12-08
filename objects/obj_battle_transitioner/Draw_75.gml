draw_set_halign(fa_left);
draw_set_valign(fa_top);


if (room != room_battle) {
    // Encounter Circle
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    draw_set_color(encounter_color);
    draw_set_alpha(encounter_alpha);
    draw_circle(CONFIG.V_WIDTH*0.5, CONFIG.V_HEIGHT*0.5, counter*encounter_scalar, false);
    
    // Fader in
    if (counter >= encounter_duration) {
        draw_set_halign(fa_center);
        draw_set_valign(fa_middle);
        draw_set_color(fade_color);
        var f_alpha = (counter-encounter_duration)/fade_in_duration;
        draw_set_alpha(f_alpha);
        draw_rectangle(0, 0, CONFIG.V_WIDTH, CONFIG.V_HEIGHT, false);
    }
}
else {
    // Fader out
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    draw_set_color(fade_color);
    draw_set_alpha(1-(counter/fade_out_duration));
    draw_rectangle(0, 0, CONFIG.V_WIDTH, CONFIG.V_HEIGHT, false);
}

    
/// Reset
draw_set_alpha(1);
draw_set_color(c_white);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
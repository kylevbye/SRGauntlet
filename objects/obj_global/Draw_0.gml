if (quit_counter > 0) {
    draw_set_font(fnt_global);
    draw_set_halign(fa_left);
    draw_set_valign(fa_top); 
    var color = c_white; 
    draw_set_alpha((quit_counter/60.0)*0.5 + 0.5);
    draw_text(5, 0, "QUITING");

    // Resets attributes for other text objects.
    draw_set_halign(fa_left);
    draw_set_valign(fa_top);
    draw_set_color(c_white);
    draw_set_alpha(1.0);
}
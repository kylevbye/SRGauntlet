// Convert to timer format: 
// MM:SS:CS
var minutes = floor(global.time_elapsed/60);
var seconds = floor(global.time_elapsed - (60*minutes));
var centiseconds = floor((global.time_elapsed - floor(global.time_elapsed))*100);

var time_format = "{0}:{1}:{2}";

// minutes 
var minutes_str = string(minutes);
if (string_length(minutes_str) == 1) {
    minutes_str = "0" + minutes_str;
}

var seconds_str = string(seconds);
if (string_length(seconds_str) == 1) {
    seconds_str = "0" + seconds_str;
}

var centiseconds_str = string(centiseconds);
if (string_length(centiseconds_str) == 1) {
    centiseconds_str = "0" + centiseconds_str;
}

var time_str = string(time_format, minutes_str, seconds_str, centiseconds_str);

if (global.sr_mode) {
    draw_set_font(font);
    draw_set_halign(fa_right);
    draw_set_valign(fa_top);
    draw_text(CONFIG.V_WIDTH-pad_amount, 0-pad_amount, time_str);
    
}

/// Reset
draw_set_color(c_white);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
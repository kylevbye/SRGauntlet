/// @description Calculate score based on current x position's offset from target position. Removes from attack_controller.
decaying = true;

if (array_length(obj_attack_controller.attack_bars) > 0) {
    array_delete(obj_attack_controller.attack_bars, 0, 1);
}

var calc_score = 0;

var diff_center = abs(obj_target.x - x);

if (diff_center < 13) {
    calc_score = 100;
    play_atk_bar_crit_sound();
    color=c_yellow;
}
else {
    calc_score = round((1-(diff_center/220))*100);
    if (calc_score < 10) calc_score = 10;
    play_atk_bar_land_sound();
}


with (obj_attack_controller) { attack_score += calc_score; }
var score_str = string("Bar Score: {0}", calc_score);
show_debug_message(score_str);

selected = false;
select_color = c_yellow;
button_length = 243;
button_height = 100;
border_color = make_color_rgb(33, 209, 24);
border_length = 4;
rad_x = 10
rad_y = 10
back_color = c_black;
outline_flag= false;

stat_label_offset_x = button_length*0.2;
stat_label_offset_y = button_height*.5;
stat_label_y = 335;
stat_amt_label_y = 360;
stat_bar_length = 106;
stat_bar_height = 10;

// HP
hp_label_offset_x = button_length*0.25;

// MP
mp_label_offset_x = button_length*0.75;

// Dialogue Box
diag_x = CONFIG.V_WIDTH*0.5;
diag_y = CONFIG.V_HEIGHT*0.5;
diag_w = 400;
diag_h = 150;
diag_x1 = diag_x - (diag_w*0.5);
diag_x2 = diag_x + (diag_w*0.5);
diag_y1 = diag_y - (diag_h*0.5);
diag_y2 = diag_y + (diag_h*0.5);
diag_back_color = c_black;
diag_border_color = c_red;
diag_border_length = 3;
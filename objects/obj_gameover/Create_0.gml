ins_font = fnt_battle_label;
ins_text = "Press Enter to Continue.";
ins_pos_x = CONFIG.V_WIDTH*0.5;
ins_pos_y = CONFIG.V_HEIGHT*0.5+120;
ins_scale = 1;


gol_pos_x = CONFIG.V_WIDTH*0.5;
gol_pos_y = CONFIG.V_HEIGHT*0.5-180;
gol_text = "GAMEOVER";
gol_scale = 3;

// Both labels
l_sep = 10;
l_width = 500;
l_rot = 0;

// Flower
go_spr = spr_gameover_flower;
go_pos_x = CONFIG.V_WIDTH*0.5;
go_pos_y = CONFIG.V_HEIGHT*0.5
go_scale = 0.7;
go_rot = 0;
go_color = c_white;
go_alpha = 1;

mus = mus_mainmenu;
delay_amount = 30;
counter = 0;
audio_stop_all();
audio_play_sound(mus, 10, true, global.mus_volume);
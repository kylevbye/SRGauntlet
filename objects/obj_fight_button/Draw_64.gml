draw_set_font(fnt_battle_label);
draw_set_halign(fa_center);
var _color_use = c_white;
if (selected) _color_use = c_yellow;
draw_set_color(_color_use);
draw_text(x+2+(button_length*0.5)+1, y+(button_height*0.5)+1, "FIGHT");

// Icon
var ico_spr = spr_fight_icon;
var ico_subimg = -1; // Normal
var ico_offset_x = button_length*0.175;
var ico_offset_y = button_height*.1;
var ico_scale_x = 1.6;
var ico_scale_y = 1.6;
var ico_rot = 0;
var ico_color = c_white;
var ico_alpha = 1;
if (selected) ico_color = c_yellow;
draw_sprite_ext(ico_spr, ico_subimg, x+ico_offset_x, y+ico_offset_y, ico_scale_x, ico_scale_y, ico_rot, ico_color, ico_alpha);

// Reset
draw_set_color(c_white);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
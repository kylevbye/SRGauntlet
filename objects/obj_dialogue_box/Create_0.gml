// The Box
h_centered = true;
v_centered = false;
standard_pos = true;
standard_x = CONFIG.V_WIDTH*0.5;
standard_y = 20;
x_rad = DIALOGUE.RAD;
y_rad = DIALOGUE.RAD;
width = 400;
height = 100;
diag_back_color = c_black;
diag_border_color = make_color_rgb(DIALOGUE.BORDER_COLOR_R, DIALOGUE.BORDER_COLOR_G, DIALOGUE.BORDER_COLOR_B);
diag_border_length = DIALOGUE.BORDER;

// Writer
script = ["This is the default line", "This is the another one", "If you are seeing this, I forgot to change the script of this instance."];
char_pos = 0;
line = 0;
text_delay = 2;
skippable = true;
scrolled = false;
text_sound = snd_text_default;
font = fnt_dialogue;

alarm[0] = text_delay;

restore_interact_state = function() {
    global.interact = INTERACT.NONE;
};

queued_event = function() { }
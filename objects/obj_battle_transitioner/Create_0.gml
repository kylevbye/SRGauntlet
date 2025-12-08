counter = 0;
encounter_duration = 30;
encounter_color = c_blue;
encounter_scalar = 20;
encounter_alpha = 0.3;
fade_color = c_black;
fade_in_duration = 30;
fade_out_duration = 15;

enemy = obj_enemy;

global.interact = INTERACT.BATTLE_INIT;
global.loaded_room = room;
audio_stop_all();
play_encounter_sound();
room_set_persistent(room, true);
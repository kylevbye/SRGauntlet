function process_player_turn(battle_state){
    
    if (battle_state.player_select_main == BATTLE_OPTIONS.NONE) {
        // FIGHT OR MAGIC
        
        // Choice Menuing
        if (has_pressed_left()) {
            audio_play_sound(snd_menu, 10, false, global.snd_volume);
            with (obj_battle_controller) {--battle_state.choicer;}
        }
        if (has_pressed_right()) {
            audio_play_sound(snd_menu, 10, false, global.snd_volume);
            with (obj_battle_controller) {++battle_state.choicer;}
        }
        battle_state.choicer = menu_range_check(battle_state.choicer, BATTLE_OPTIONS.FIGHT, BATTLE_OPTIONS.MAGIC, true);
        
        // Update UI
        if (battle_state.choicer == BATTLE_OPTIONS.FIGHT) {
            with (obj_fight_button) { selected = true; }
        }
        else if (battle_state.choicer == BATTLE_OPTIONS.MAGIC) {
            with (obj_magic_button) { selected = true; }
        }
        
        // Select
        if (has_interacted()) {
            if (battle_state.choicer == BATTLE_OPTIONS.FIGHT) {
                audio_play_sound(snd_select, 10, false, global.snd_volume);
                battle_state.turn = BATTLE.FIGHT;
                battle_state.player_select_main = BATTLE_OPTIONS.FIGHT;
            }
            else if (battle_state.choicer == BATTLE_OPTIONS.MAGIC) {
                audio_play_sound(snd_select, 10, false, global.snd_volume);
                battle_state.player_select_main = BATTLE_OPTIONS.MAGIC;
            }
        }
    }
    else if (battle_state.player_select_sub != BATTLE_OPTIONS.NONE) {
        // MAGIC SUBs
    }
    else {
        // Target Selection
        
    } 
}

function process_enemy_turn(battle_state){
    initiate_enemy_attack(battle_state);
}

function process_enemy_attack(battle_state){
    
}

function process_player_attack(battle_state){
    var damage = random(5);
}

function process_player_super(battle_state) {
    
}

function process_player_heal(battle_state) {
    
}

function initiate_enemy_attack(battle_state) {
    var attack = battle_state.enemy.attack;
}

function control_player_profile(battle_statem, profile) {
    var active_val_y = 292;
    var inactive_val_y = 340;
    if (battle_state.turn == BATTLE.FIGHT || battle_state.turn == BATTLE.HEAL
        || battle_state.turn == BATTLE.SUPER || battle_state.turn == BATTLE.PLAYER) {
            if (profile.y > active_val_y) {
                profile.y -= 8;
            }
    } 
    else {
        if (profile.y < inactive_val_y) {
                profile.y += 8;
            }
    }
}

function reset_select_states() {
    with (obj_fight_button) selected = false; 
        
    with (obj_magic_button) selected = false;
}
function process_player_turn(){
    show_debug_message(battle_state_to_string());
    
    if (global.battle_state.player_select_main == BATTLE_OPTIONS.NONE) {
        // FIGHT OR MAGIC
        
        // Choice Menuing
        if (has_pressed_left()) {
            audio_play_sound(snd_menu, 10, false, global.snd_volume);
            with (obj_battle_controller) {--global.battle_state.choicer;}
        }
        if (has_pressed_right()) {
            audio_play_sound(snd_menu, 10, false, global.snd_volume);
            with (obj_battle_controller) {++global.battle_state.choicer;}
        }
        global.battle_state.choicer = menu_range_check(global.battle_state.choicer, BATTLE_OPTIONS.FIGHT, BATTLE_OPTIONS.MAGIC, true);
        
        // Update UI
        if (global.battle_state.choicer == BATTLE_OPTIONS.FIGHT) {
            with (obj_fight_button) { selected = true; }
        }
        else if (global.battle_state.choicer == BATTLE_OPTIONS.MAGIC) {
            with (obj_magic_button) { selected = true; }
        }
        
        // Select
        if (has_interacted()) {
            
            switch (global.battle_state.choicer) {
                case BATTLE_OPTIONS.FIGHT:
                    audio_play_sound(snd_select, 10, false, global.snd_volume);
                    global.battle_state.player_select_main = BATTLE_OPTIONS.FIGHT;
                    break;
                case BATTLE_OPTIONS.MAGIC:
                    audio_play_sound(snd_select, 10, false, global.snd_volume);
                    global.battle_state.player_select_main = BATTLE_OPTIONS.MAGIC;
                    global.battle_state.choicer = BATTLE_OPTIONS.HEAL;
                    break;
            }
            
        }
        
    }
    // MAGIC Choicers
    else if (global.battle_state.player_select_main == BATTLE_OPTIONS.MAGIC) {
        
        with (obj_magic_menu) { 
            active = true; 
            selected = global.battle_state.choicer;
        }
        
        
        // Choice Menuing
        if (has_pressed_up()) {
            audio_play_sound(snd_menu, 10, false, global.snd_volume);
            with (obj_battle_controller) {--global.battle_state.choicer;}
        }
        if (has_pressed_down()) {
            audio_play_sound(snd_menu, 10, false, global.snd_volume);
            with (obj_battle_controller) {++global.battle_state.choicer;}
        }
        global.battle_state.choicer = menu_range_check(global.battle_state.choicer, BATTLE_OPTIONS.HEAL, BATTLE_OPTIONS.SUPER, false);
        
        if (has_interacted()) {
            switch (global.battle_state.choicer) {
                case BATTLE_OPTIONS.HEAL:
                    if (global.current_mp >= BATTLE_VALUES.HEAL_COST) {
                        with (obj_magic_menu) { active = false; }
                        audio_play_sound(snd_select, 10, false, global.snd_volume);
                    }
                    else audio_play_sound(snd_incorrect, 10, false, global.snd_volume);
                    break;
                case BATTLE_OPTIONS.SUPER:
                    if (global.current_mp >= BATTLE_VALUES.SUPER_COST) {
                        with (obj_magic_menu) { active = false; }
                        audio_play_sound(snd_select, 10, false, global.snd_volume);
                    }
                    else audio_play_sound(snd_incorrect, 10, false, global.snd_volume);
                    break;
            }
        }
        // Go back to FIGHT/MAGIC selection
        else if (has_cancelled()) {
            with (obj_magic_menu) { active = false; }
            global.battle_state.player_select_main = BATTLE_OPTIONS.NONE;
            global.battle_state.choicer = BATTLE_OPTIONS.MAGIC;
            audio_play_sound(snd_select_reversed, 10, false, global.snd_volume);
        }
        
    }
    else if (global.battle_state.player_select_main == BATTLE_OPTIONS.FIGHT) {
        with (obj_target_menu) { active = true; }
        // Target Selection
        if (has_interacted()) {
            with (obj_target_menu) { active = false; }
            global.battle_state.turn = BATTLE.FIGHT;
        }
        else if (has_cancelled()) {
            with (obj_target_menu) { active = false; }
            global.battle_state.player_select_main = BATTLE_OPTIONS.NONE;
            global.battle_state.choicer = BATTLE_OPTIONS.FIGHT;
            audio_play_sound(snd_select_reversed, 10, false, global.snd_volume);
        }
        
    } 
}

function process_enemy_turn(){
    initiate_enemy_attack();
}

function initiate_enemy_attack() {
    //show_debug_message(battle_state_to_string());
    var multiplier = 1.5;
    var attack = (global.battle_state.enemy.attack)+(irandom(2)-1);
    attack *= multiplier;
    attack = round(attack);
    global.battle_state.attack_damage = attack;
    
    var enemy_name = global.battle_state.enemy.name;
    var diag_str = string("{0} is attacking!", enemy_name);
    diag_box = spawn_dialogue([diag_str]);
    diag_box.text_delay = 1;
    diag_box.skippable = false;
    diag_box.queued_event = function () {
        var attack = global.battle_state.attack_damage;
        change_turn(BATTLE.ENEMY_ATTACK);
        audio_play_sound(snd_damage_taken, 10, false, global.snd_volume);
            // Spawn Damage Number
        var damage_num = instance_create_depth(BATTLE_POSITIONS.ENEMY_DAMAGE_X, 
        BATTLE_POSITIONS.ENEMY_DAMAGE_Y, 1.0, obj_damage_number);
        damage_num.number = attack;
        damage_num.scale = BATTLE_POSITIONS.ENEMY_DAMAGE_SCALE;
    }
    global.counter = 
    change_turn(BATTLE.ENEMY_ATTACK_DIAG);
}

function inform_enemy_attack() {
    global.counter = BATTLE_VALUES.ENEMY_POST_ATTACK_TIME;
    change_turn(BATTLE.ENEMY_ATTACK_WAIT);
}

function process_enemy_attack(){
    show_debug_message(battle_state_to_string());
    var decay_rate = 1;
    
    if (global.battle_state.attack_damage > 0) {
        global.current_hp -= decay_rate;
        global.battle_state.attack_damage -= decay_rate;
    }
    else if (global.counter <= 0 ) {
        change_turn(BATTLE.PLAYER);
    }
    --global.counter;
}

function process_player_attack(){
    show_debug_message(battle_state_to_string());
    var multiplier = 1.5;
    var attack_value = (5)+(irandom(2)-1);
    attack_value *= multiplier;
    attack_value = round(attack_value);
    global.battle_state.attack_damage = attack_value;
    global.battle_state.turn = BATTLE.FIGHT_APPLY;
    
    // Spawn Damage Number
    var damage_num = instance_create_depth(BATTLE_POSITIONS.PLAYER_DAMAGE_X, 
    BATTLE_POSITIONS.PLAYER_DAMAGE_Y, 1.0, obj_damage_number);
    damage_num.number = attack_value;
    damage_num.scale = BATTLE_POSITIONS.PLAYER_DAMAGE_SCALE;
    
    audio_play_sound(snd_damage, 10, false, global.snd_volume);
}

function process_player_attack_apply() {
    //show_debug_message(battle_state_to_string());
    var decay_rate = -1;
    
    if (global.battle_state.attack_damage > 0) {
        global.battle_state.enemy.hp += decay_rate;
        global.battle_state.attack_damage += decay_rate;
    }
    else {
        change_turn(BATTLE.ENEMY);
    }
}

function process_player_super() {
    show_debug_message(battle_state_to_string());
}

function process_player_heal() {
    show_debug_message(battle_state_to_string());
}

/*
 * Check if the player had just won or lost the battle.
 * Updates turn to BATTLE.VICTOR or BATTLE.LOSS.
 */
function check_wl_conditions() {
    
    if (global.battle_state.enemy.hp <= 0) {
        global.battle_state.turn = BATTLE.VICTOR;
    }
    
    if (global.current_hp <= 0) {
        global.battle_state.turn = BATTLE.LOSS;
    }
    
}

function control_player_profile(profile) {
    var active_val_y = 292;
    var inactive_val_y = 340;
    if (is_profile_active()) {
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

function is_profile_active() {
    return global.battle_state.turn == BATTLE.FIGHT || global.battle_state.turn == BATTLE.HEAL
        || global.battle_state.turn == BATTLE.SUPER || global.battle_state.turn == BATTLE.PLAYER
}

function update_hp_values() {
    var battle_state = global.battle_state;
    obj_enemy_hp_bar.current_value = battle_state.enemy.hp;
}

function change_turn(turn) {
    switch (turn) {
        case BATTLE.PLAYER:
        global.battle_state.choicer = BATTLE_OPTIONS.FIGHT;
        global.battle_state.player_select_main = BATTLE_OPTIONS.NONE;
        global.battle_state.player_select_sub = BATTLE_OPTIONS.NONE;
        break;
    case BATTLE.ENEMY:
        global.battle_state.turn = BATTLE.ENEMY;
        break;
    case BATTLE.ENEMY_ATTACK_DIAG:
        global.battle_state.turn = BATTLE.ENEMY_ATTACK_DIAG;
        break;
    case BATTLE.ENEMY_ATTACK_WAIT:
        global.battle_state.turn = BATTLE.ENEMY_ATTACK_WAIT;
        break;
    case BATTLE.ENEMY_ATTACK:
        global.battle_state.turn = BATTLE.ENEMY_ATTACK;
        break;
    case BATTLE.FIGHT:
        global.battle_state.turn = BATTLE.FIGHT;
        break;
    case BATTLE.FIGHT_APPLY:
        global.battle_state.turn = BATTLE.FIGHT_APPLY;
        break;
    case BATTLE.SUPER:
        global.battle_state.turn = BATTLE.SUPER;
        break;
    case BATTLE.HEAL:
        global.battle_state.turn = BATTLE.HEAL;
        break;
    }
    
    global.battle_state.turn = turn;
}

function battle_state_to_string() {
    var format_str = "BattleState:[turn:{0}; choicer:{1};" +
    "player_select_main:{2}; player_select_sub:{3}; weapon:{4};" +
    "enemy:{5}; attack_started:{6}; attack_damage:{7};";
    return_str = string(format_str, global.battle_state.turn, 
    global.battle_state.choicer, global.battle_state.player_select_main, 
    global.battle_state.player_select_sub, global.battle_state.weapon, 
    global.battle_state.enemy, global.battle_state.attack_started, 
    global.battle_state.attack_damage);
    return return_str;
}
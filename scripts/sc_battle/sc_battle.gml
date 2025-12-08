function init_battle() {
    play_bat_music();
    change_turn(BATTLE.PLAYER);
}

function process_player_turn(){
    
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
                        change_turn(BATTLE.HEAL);
                    }
                    else audio_play_sound(snd_incorrect, 10, false, global.snd_volume);
                    break;
                case BATTLE_OPTIONS.SUPER:
                    if (global.current_mp >= BATTLE_VALUES.SUPER_COST) {
                        with (obj_magic_menu) { active = false; }
                        audio_play_sound(snd_select, 10, false, global.snd_volume);
                        change_turn(BATTLE.SUPER);
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
            global.battle_state.turn = BATTLE.FIGHT_INIT;
            clear_interact_input();
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
    global.counter = BATTLE_VALUES.ENEMY_POST_ATTACK_TIME;
    change_turn(BATTLE.ENEMY_ATTACK_DIAG);
}

function inform_enemy_attack() {
    global.counter = BATTLE_VALUES.ENEMY_POST_ATTACK_TIME;
    change_turn(BATTLE.ENEMY_ATTACK_WAIT);
}

function process_enemy_attack(){
    //show_debug_message(battle_state_to_string());
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

function initiate_player_attack() {
    instance_create_depth(BATTLE_POSITIONS.TARGET_X, BATTLE_POSITIONS.TARGET_Y, BATTLE_POSITIONS.TARGET_D, obj_target);
    with (obj_attack_controller) { event_user(0); }
    change_turn(BATTLE.FIGHT);
}

function process_player_attack( ){
    var atk_score_per = calc_attack_score_per(obj_attack_controller.attack_score);
    var attack_value = (find_attack_power()*atk_score_per)+(irandom(2)-1);
    if (atk_score_per == 1.0) {
        play_atk_critical_sound();
        attack_value *= find_attack_crit_mult();
    }
    attack_value = round(attack_value);
    
    global.battle_state.counter_2 = round(7*atk_score_per);
    if (global.battle_state.counter_2 < 0) global.battle_state.counter_2 = 0;
    
    if (!obj_attack_controller.active) {
        if (atk_score_per <= 0) attack_value = 0;
        global.battle_state.attack_damage = attack_value;
        global.battle_state.turn = BATTLE.FIGHT_APPLY;
        if (attack_value > 0) {
            audio_play_sound(snd_damage, 10, false, global.snd_volume);
        }
        instance_destroy(obj_target);
        
        // Spawn Damage Number
        var damage_num = instance_create_depth(BATTLE_POSITIONS.PLAYER_DAMAGE_X, 
        BATTLE_POSITIONS.PLAYER_DAMAGE_Y, 1.0, obj_damage_number);
        damage_num.number = global.battle_state.attack_damage;
        damage_num.scale = BATTLE_POSITIONS.PLAYER_DAMAGE_SCALE;
    }
    
}

function process_player_attack_apply() {
    var decay_rate = -1;
    
    if (global.battle_state.attack_damage > 0) {
        global.battle_state.enemy.hp += decay_rate;
        global.battle_state.attack_damage += decay_rate;
    }
    
    if (global.battle_state.counter_2 > 0) {
        if (global.current_mp == global.max_mp) {
            global.battle_state.counter_2 = 0;
        }
        else {
            global.current_mp += 1;
            global.battle_state.counter_2 -= 1;
        }
    }
    
    if (global.battle_state.attack_damage <= 0 && global.battle_state.counter_2 <= 0){
        change_turn(BATTLE.ENEMY);
    }
}

function process_player_super() {
    var atk_pow = find_attack_power();
    var attack_value = atk_pow*3.5 + irandom_range(1,3);
    attack_value = round(attack_value);
    global.battle_state.attack_damage = attack_value;
    global.battle_state.counter_2 = BATTLE_VALUES.SUPER_COST;
    
    // Spawn Dialogue that spawns damage numbers and continues the sequence
    var event = function() {
        // Spawn Damage Number (purple)
        var damage_num = instance_create_depth(BATTLE_POSITIONS.PLAYER_DAMAGE_X, 
        BATTLE_POSITIONS.PLAYER_DAMAGE_Y, 1.0, obj_damage_number);
        damage_num.number = global.battle_state.attack_damage;
        damage_num.scale = BATTLE_POSITIONS.PLAYER_DAMAGE_SCALE;
        damage_num.color = c_purple;
        audio_play_sound(snd_damage, 10, false, global.snd_volume);
        change_turn(BATTLE.SUPER_APPLY);
    }
    var dia_str = string("YOU SUPER ATTACKED for {0} DMG!", attack_value);
    var dialogue_ins = spawn_dialogue(dia_str);
    dialogue_ins.queued_event = event;
    
    change_turn(BATTLE.SUPER_WAIT);
} 

function process_player_super_apply() {
    
    // Enemy HP Drain
    if (global.battle_state.attack_damage > 0) {
        global.battle_state.enemy.hp -= 1;
        global.battle_state.attack_damage -= 1;
    }
    // MP Drain
    if (global.battle_state.counter_2 > 0) {
        global.current_mp -= 1;
        global.battle_state.counter_2 -= 1;
    }
    
    if (global.battle_state.attack_damage <= 0 && global.battle_state.counter_2 <= 0) {
        change_turn(BATTLE.ENEMY);
    }
    
}

function process_player_heal() {
    // Randomly heal in range 30-50
    var heal_amount = irandom_range(30, 50);
    randomise();
    global.battle_state.counter = heal_amount;
    global.battle_state.counter_2 = BATTLE_VALUES.HEAL_COST;
    
    // Spawn Dialogue that spawns damage numbers and continues the sequence
    var event = function() {
        // Spawn Damage Number (green)
        var damage_num = instance_create_depth(BATTLE_POSITIONS.ENEMY_DAMAGE_X, 
        BATTLE_POSITIONS.ENEMY_DAMAGE_Y, 1.0, obj_damage_number);
        damage_num.number = global.battle_state.counter;
        damage_num.scale = BATTLE_POSITIONS.ENEMY_DAMAGE_SCALE;
        damage_num.color = c_lime;
        audio_play_sound(snd_heal2, 10, false, global.snd_volume);
        change_turn(BATTLE.HEAL_APPLY);
    }
    var dia_str = string("YOU healed for {0} HP!", heal_amount);
    var dialogue_ins = spawn_dialogue(dia_str);
    dialogue_ins.queued_event = event;
    audio_play_sound(snd_heal1, 10, false, global.snd_volume);
    change_turn(BATTLE.HEAL_WAIT);
}

function process_player_heal_apply() {
    
    if (global.battle_state.counter > 0) {
        if (global.current_hp == global.max_hp) {
            global.battle_state.counter = 0;
        }
        else {
            global.current_hp += 1;
            global.battle_state.counter -= 1;
        }
    }
    
    if (global.battle_state.counter_2 > 0) {
        global.current_mp -= 1;
        global.battle_state.counter_2 -= 1;
    }
    
    if (global.battle_state.counter <= 0 && global.battle_state.counter_2 <= 0) {
        change_turn(BATTLE.ENEMY);
    }
    
}

function initiate_win_sequence() {
    global.counter = BATTLE_VALUES.ENEMY_DEFEAT_WAIT_TIME;
    global.enemy.alive = false;
    audio_stop_sound(mus_battle);
    play_enemy_defeat_sound();
    play_bat_victory_music();
    change_turn(BATTLE.VICTOR_WAIT);
}

function wait_win() {
    if (global.counter == 0) change_turn(BATTLE.VICTOR_SEQ);
    --global.counter;
}

function process_win() {
    var diag_ins = spawn_dialogue("You have won! Congrats!");
    diag_ins.skippable = false;
    diag_ins.queued_event = function() {
        instance_create_layer(0, 0, "Instances", obj_battle_out_transitioner);
        audio_stop_sound(mus_victory);
    }
    change_turn(BATTLE.VICTOR_DIALOGUE);
}

/*
 * Check if the player had just won or lost the battle.
 * Updates turn to BATTLE.VICTOR or BATTLE.LOSS.
 */
function check_wl_conditions() {
    
    if (global.battle_state.enemy.hp <= 0 && 
        global.battle_state.turn < BATTLE.VICTOR) {
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
    }
    
    global.battle_state.turn = turn;
}

function find_attack_power() {
    var value = 1;
    switch (global.weapon) {
    	case WEAPON.NONE:
            value = 3;
            break;
        case WEAPON.SWORD1:
            value = 5;
            break;
        case WEAPON.SWORD2:
            value = 10;
            break;
        case WEAPON.SWORD3:
            value = 15;
            break;
        
    }
    
    return value;
}

function  find_attack_crit_mult() {
    var mult = 1.0;
    
    switch (global.weapon) {
    	case WEAPON.NONE:
            mult = 1.5;
            break;
        case WEAPON.SWORD1:
            mult = 1.75;
            break;
        case WEAPON.SWORD2:
            mult = 2;
            break;
        case WEAPON.SWORD3:
            mult = 3;
            break;
        
    }
    
    return mult;
}

function calc_attack_score_per(attack_score) {
    var score_max = 100;
    
    switch (global.weapon) {
        case WEAPON.NONE:
            score_max = 100;
            break;
        case WEAPON.SWORD1:
            score_max = 100;
            break;
        case WEAPON.SWORD2:
            score_max = 300;
            break;
        case WEAPON.SWORD3:
            score_max = 400;
            break;
    }
    
    return attack_score/score_max;
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
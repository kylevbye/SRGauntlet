global.ATTACK_PATTERNS = {
    // ~ Stick
    NONE: [
        [0]
    ],
    // ~ Toy Knife
    SWORD1: [
        [0]
    ],
    // Ballet Shows
    SWORD2: [
        [0, 5, 13],
        [0, 5, 15],
        [0, 5, 10],
        [0, 8, 10],
        [0, 8, 12],
        [0, 8, 7],
        [0, 10, 8],
        [0, 10, 10],
        [0, 10, 5]
    ],
    // ~ Burnt Pan
    SWORD3: [
        [0, 5, 13, 7],
        [0, 5, 15, 5],
        [0, 5, 10, 10],
        [0, 8, 10, 7],
        [0, 8, 12, 5],
        [0, 8, 7, 10],
        [0, 10, 8, 7],
        [0, 10, 10, 5],
        [0, 10, 5, 10]
    ]
};

function generate_attack_bars() {
    
    var attack_bars = [];
    var org_side = BATTLE_VALUES.LEFT;
    
    var attack_patterns = [];
    switch (global.weapon) {
        case WEAPON.SWORD1:
            attack_patterns = global.ATTACK_PATTERNS.SWORD1;
            org_side = BATTLE_VALUES.LEFT;
            break;
        case WEAPON.SWORD2:
            attack_patterns = global.ATTACK_PATTERNS.SWORD2;
            org_side = BATTLE_VALUES.LEFT;
            break;
        case WEAPON.SWORD3:
            attack_patterns = global.ATTACK_PATTERNS.SWORD3;
            org_side = BATTLE_VALUES.RIGHT;
            break;
        default:
            // Assume NONE
            attack_patterns = global.ATTACK_PATTERNS.NONE;
            break;
    }
    
    var pattern_index = irandom_range(0, array_length(attack_patterns)-1);
    var attack_pattern = attack_patterns[pattern_index];
    var pos_x = BATTLE_POSITIONS.TARGET_X;
    var offset = BATTLE_POSITIONS.BAR_START_OFFSET;
    var sign_x = 1;
    if (org_side == BATTLE_VALUES.LEFT) sign_x = -1;
    pos_x += offset*sign_x;
    for (var i = 0; i<array_length(attack_pattern); ++i) {
        var pos_y = BATTLE_POSITIONS.TARGET_Y;
        
        var attack_bar = instance_create_depth(pos_x, pos_y, 0, obj_attack_bar);
        attack_bar.origin_side = org_side;
        attack_bar.x += attack_bar.x_speed*attack_pattern[i]*sign_x;
        pos_x = attack_bar.x;
        array_push(attack_bars, attack_bar);
    }
    
    show_debug_message(attack_bars);
    
    return attack_bars;
    
}

function check_missed_attack() {
    missed = false;
    
    if (origin_side == BATTLE_VALUES.RIGHT && x < BATTLE_POSITIONS.TARGET_MISS_ORG_RIGHT) {
        missed = true;
    }
    else if (origin_side == BATTLE_VALUES.LEFT && x > BATTLE_POSITIONS.TARGET_MISS_ORG_LEFT) {
        missed = true;
    }
    
    // Missed
    if (missed) {
        decaying = true;
        if (array_length(obj_attack_controller.attack_bars) > 0) {
            array_delete(obj_attack_controller.attack_bars, 0, 1);
        }
    }
}
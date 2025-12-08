enum BATTLE {
    INIT,
    PLAYER,
    ENEMY,
    ENEMY_ATTACK_DIAG,
    ENEMY_ATTACK_WAIT,
    ENEMY_ATTACK,
    FIGHT_INIT,
    FIGHT,
    FIGHT_WAIT,
    FIGHT_APPLY,
    SUPER,
    HEAL,
    VICTOR,
    VICTOR_WAIT,
    VICTOR_SEQ,
    VICTOR_DIALOGUE,
    LOSS
}

enum BATTLE_OPTIONS {
    NONE,
    FIGHT,
    MAGIC,
    HEAL,
    SUPER
}

enum BATTLE_VALUES {
    LEFT,
    RIGHT,
    HEAL_COST = 10,
    SUPER_COST = 25,
    PLAYER_POST_ATTACK_TIME = 15,
    ENEMY_POST_ATTACK_TIME = 15,
    ENEMY_DEFEAT_DECAY_RATE = 0.1, 
    ENEMY_DEFEAT_WAIT_TIME = 60,
}

enum BATTLE_POSITIONS {
    ENEMY_DAMAGE_X = 320, 
    ENEMY_DAMAGE_Y = 270,
    ENEMY_DAMAGE_SCALE = 1.8,
    PLAYER_DAMAGE_X = 324,
    PLAYER_DAMAGE_Y = 135,
    PLAYER_DAMAGE_SCALE = 2.0,
    TARGET_X = CONFIG.V_WIDTH*0.5,
    TARGET_Y = (CONFIG.V_HEIGHT*0.5)+103,
    TARGET_D = -100,
    TARGET_MISS_ORG_RIGHT = 100,
    TARGET_MISS_ORG_LEFT = 540,
    BAR_START_OFFSET = 185
}

function BattleControlState() constructor {
    turn = BATTLE.INIT;
    choicer = BATTLE_OPTIONS.FIGHT;
    player_select_main = BATTLE_OPTIONS.NONE;
    player_select_sub = BATTLE_OPTIONS.NONE;
    weapon = global.weapon;
    enemy = global.enemy;
    attack_started = false;
    attack_damage = 0;
}

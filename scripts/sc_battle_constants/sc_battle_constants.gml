enum BATTLE {
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
    HEAL_COST = 10,
    SUPER_COST = 25,
    PLAYER_POST_ATTACK_TIME = 15,
    ENEMY_POST_ATTACK_TIME = 15
}

enum BATTLE_POSITIONS {
    ENEMY_DAMAGE_X = 320, 
    ENEMY_DAMAGE_Y = 270,
    ENEMY_DAMAGE_SCALE = 1.8,
    PLAYER_DAMAGE_X = 324,
    PLAYER_DAMAGE_Y = 135,
    PLAYER_DAMAGE_SCALE = 2.0
}

function BattleControlState() constructor {
    turn = BATTLE.PLAYER;
    choicer = BATTLE_OPTIONS.FIGHT;
    player_select_main = BATTLE_OPTIONS.NONE;
    player_select_sub = BATTLE_OPTIONS.NONE;
    weapon = global.weapon;
    enemy = global.enemy;
    attack_started = false;
    attack_damage = 0;
}
function Test() constructor  {
    obj = obj_enemy;
    name = "Test";
    hp = 100;
    attack = 2;
    defense = 5;
}

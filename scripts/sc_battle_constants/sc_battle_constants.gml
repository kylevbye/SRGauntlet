enum BATTLE {
    PLAYER,
    ENEMY,
    ENEMY_ATTACK,
    FIGHT,
    SUPER,
    HEAL
}

enum BATTLE_OPTIONS {
    NONE,
    FIGHT,
    MAGIC,
    SUPER,
    HEAL
}

function BattleControlState() constructor {
    turn = BATTLE.PLAYER;
    choicer = BATTLE_OPTIONS.FIGHT;
    player_select_main = BATTLE_OPTIONS.NONE;
    player_select_sub = BATTLE_OPTIONS.NONE;
    weapon = global.weapon;
    enemy = global.enemy;
}
function Test() constructor  {
    obj = obj_enemy;
    name = "Test";
    hp = 100;
    attack = 5;
    defense = 5;
}

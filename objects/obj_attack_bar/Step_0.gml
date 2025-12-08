
if (decaying) {
    alpha -= a_decay_rate;
    if (!missed) y_scale += y_scale_grow_rate;
        
    else alpha -= a_decay_rate*1.4;
}

if (missed || !decaying) {
    var x_dir = 1;
    if (origin_side == BATTLE_VALUES.RIGHT) x_dir = -1;
    x += (x_speed*x_dir);
    script_execute(check_missed_attack);
} 
    

if (alpha <= 0) instance_destroy();
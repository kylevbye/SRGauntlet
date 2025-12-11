var x1 = x;
var y1 = y;
var x2 = x+width;
var y2 = y+height;

if (centered) {
    x1 = x-(width/2);
    x2 = x+(width/2);
    y1 = y-(height/2);
    y2 = y+(height/2);
}

max_value = global.enemy.max_hp;
draw_healthbar(x1, y1, x2, y2, round((current_value/max_value)*100), 
back_color, min_color, max_color, direction_val, show_back, show_border);
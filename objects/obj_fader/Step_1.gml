//alpha -= trans_speed;
//if (alpha < 0.02) instance_destroy();
if (!faded_out) {
    alpha += trans_speed_in;
    if (alpha >= 1.0) {
        alpha = 1.0;
        faded_out = true;
    }
}
else if (transitioned) {
    alpha -= trans_speed_out;
    if (alpha < 0.02) instance_destroy();
}
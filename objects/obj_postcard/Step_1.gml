if (using && (has_interacted() || has_cancelled())) {
    using = false;
    global.interact = INTERACT.NONE;
    clear_interact_input();
}
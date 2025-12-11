postcard_puz_d2_chest.looted = global.plot.postcard_puz_d2.chest_looted;
postcard_puz_d2_chest.interact_dialogue = "You have gotten the PostCard!";
postcard_puz_d2_chest.interact_event = function () {
    global.plot.postcard_puz_d2.chest_looted = true;
    add_to_inventory(obj_postcard);
}
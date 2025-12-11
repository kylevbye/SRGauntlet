keyroom1_u2l1_chest.looted = global.plot.keyroom1_u2l1.chest_looted;
keyroom1_u2l1_chest.interact_dialogue = "You have obtained the key to the north key room!";
keyroom1_u2l1_chest.interact_event = function () {
    global.plot.keyroom1_u2l1.chest_looted = true;
}
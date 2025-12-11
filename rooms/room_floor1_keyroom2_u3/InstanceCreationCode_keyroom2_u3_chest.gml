keyroom2_u3_chest.looted = global.plot.keyroom2_u3.chest_looted;
keyroom2_u3_chest.interact_dialogue = "You have obtained the key to floor 2!";
keyroom2_u3_chest.interact_event = function () {
    global.plot.keyroom2_u3.chest_looted = true;
}
// Position player
x = global.characterX * global.gridSize
y = global.characterY * global.gridSize
draw_self()

//destroy all crates
instance_destroy(objCrate)

// Display info text
window_set_caption("Stephen's Happy Fun Time Game Level: " + string(global.level))
draw_set_font(bebasNeue)
draw_set_halign(fa_center)
draw_set_colour(c_yellow)
draw_text(320, 600, "Stephen's Happy Fun Time Game Level: " + string(global.level))
draw_text(320, 620, "Steps: " + string(global.numberOfSteps))

//draw the crates
for (i = 0; i < 10; i++){
    for (j = 0; j < 10;  j++){
        if ((global.playgrid[i][j][global.numberOfSteps] == 2) || (global.playgrid[i][j][global.numberOfSteps] = 6)){
            instance_create_layer(32 + (i * 64), 32 + (j * 64), "Instances", objCrate)
        }
    }
}

//draw the playGrid array for debugging.  Comment or uncomment as required.
/*

for (i = 0; i < 10; i++){
    for (j = 0; j < 10;  j++){
        draw_text(32 + i * 32, 32 + j * 32, global.playgrid[i][j][global.numberOfSteps-1])
    }
}

*/
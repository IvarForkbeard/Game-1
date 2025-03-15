// Position player
x = global.playerX * global.gridSize
y = global.playerY * global.gridSize
draw_self()

//destroy all crates
instance_destroy(objCrate)

//instantiates the crates
for (i = 0; i < 10; i ++){
    for (j = 0; j < 10;  j ++){
        if global.playgrid[i][j][global.numberOfSteps] == entity.crate
        || global.playgrid[i][j][global.numberOfSteps] = entity.crate + entity.target{
            instance_create_layer(i * 64, j * 64, "Instances", objCrate)
        }
    }
}

// Display info text
window_set_caption("Stephen's Happy Fun Time Game Level: " + string(global.level))
draw_set_font(bebasNeue)
draw_set_halign(fa_center)
draw_set_colour(c_yellow)
draw_text(320, 580, "Stephen's Happy Fun Time Game Level: " + string(global.level))
draw_text(320, 610, "Steps: " + string(global.numberOfSteps - 999))

//draw the text of some variables
//draw_text(320, 32, "Here's X, Y, dX, dY :" + string (global.playerX) + ", " + string (global.playerY) + ", " + string (global.dx) + ", " + string (global.dy))

//draw the playGrid array for debugging.  Comment or uncomment as required.
/*

for (i = 0; i < 10; i++){
    for (j = 0; j < 10;  j++){
        draw_text(32 + i * 32, 32 + j * 32, global.playgrid[i][j][global.numberOfSteps-1])
    }
}

*/
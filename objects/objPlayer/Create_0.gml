//player pulls blocks around randomly to set up playable surface
global.numberOfSteps = 999
for (i = 0; i <= global.numberOfSteps; i ++){
    global.dx = 0
    global.dy = 0
    switch irandom(3){
        case 0:
            global.dy = -1
        break
        case 1:
            global.dx = +1
        break
        case 2:
            global.dy = +1
        break
        case 3:
            global.dx = -1
        break
    }
    destination = global.playgrid[global.playerX + global.dx][global.playerY + global.dy][i]
    if destination == entity.floor
    || destination == entity.target{
        global.playgrid[global.playerX][global.playerY][i] -= entity.player
        global.playerX += global.dx
        global.playerY += global.dy
        global.playgrid[global.playerX][global.playerY][i] += entity.player
        behind = global.playgrid[global.playerX - global.dx * 2][global.playerY - global.dy * 2][i]
        if behind == entity.crate
        || behind == entity.crate + entity.target{
          global.playgrid[global.playerX - global.dx * 2][global.playerY - global.dy * 2][i] -= entity.crate
          global.playgrid[global.playerX - global.dx][global.playerY - global.dy][i] += entity.crate
        }
    }
    for (j = 0; j < 10; j ++){
        for (k = 0; k < 10; k ++){
            global.playgrid[j][k][i + 1] = global.playgrid[j][k][i]
        }
    }
}
//check if the player is surrounded and if so, restart the room to ensure max scrambling.
isPlayable = false
if global.playgrid[global.playerX + 1][global.playerY][i] != entity.floor
&& global.playgrid[global.playerX - 1][global.playerY][i] != entity.floor
&& global.playgrid[global.playerX][global.playerY + 1][i] != entity.floor
&& global.playgrid[global.playerX][global.playerY - 1][i] != entity.floor{
    room_restart()
}
global.hasPlayerMoved = false
//player pulls blocks around randomly to set up playable surface
spacePause = 0
global.numberOfSteps = 999
for (i = 0; i <= global.numberOfSteps; i++){
    global.dx = 0
    global.dy = 0
    switch(irandom(3)){
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
    destination = global.playgrid[global.characterX + global.dx][global.characterY + global.dy][i]
    if ((destination == 0) or (destination == 4)){
        global.playgrid[global.characterX][global.characterY][i] -= 8
        global.characterX += global.dx
        global.characterY += global.dy
        global.playgrid[global.characterX][global.characterY][i] += 8
        if ((global.playgrid[global.characterX - (global.dx * 2)][global.characterY - (global.dy * 2)][i] == 2) || (global.playgrid[global.characterX - (global.dx * 2)][global.characterY - (global.dy * 2)][i] == 6)){
            global.playgrid[global.characterX - (global.dx * 2)][global.characterY - (global.dy * 2)][i] -= 2
            global.playgrid[global.characterX - global.dx][global.characterY - global.dy][i] += 2
        }
    }
    for (j = 0; j < 10; j++){
        for (k = 0; k < 10; k++){
            global.playgrid[j][k][i + 1] = global.playgrid[j][k][i]
        }
    }
}
//check if the player is surrounded and if so, restart the room to ensure max scrambling.
isPlayable = false
if (global.playgrid[global.characterX + 1][global.characterY][i] == 0){
    isPlayable = true
}
if (global.playgrid[global.characterX - 1][global.characterY][i] == 0){
    isPlayable = true
}
if (global.playgrid[global.characterX][global.characterY + 1][i] == 0){
    isPlayable = true
}
if (global.playgrid[global.characterX][global.characterY - 1][i] == 0){
    isPlayable = true
}
if (!isPlayable){
    room_restart()
}
global.hasMoved = false
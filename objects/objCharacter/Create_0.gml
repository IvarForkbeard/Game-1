//player pulls blocks around randomly to set up playable surface

numberOfSteps = 9999
for (i = 0; i < numberOfSteps; i++){
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
    destination = global.playgrid[global.characterX + global.dx, global.characterY + global.dy]
    if ((destination == 0) or (destination == 4)){
        global.playgrid[global.characterX, global.characterY] -= 8
        global.characterX += global.dx
        global.characterY += global.dy
        global.playgrid[global.characterX, global.characterY] += 8
        if ((global.playgrid[global.characterX - (global.dx * 2), global.characterY - (global.dy * 2)] == 2) || (global.playgrid[global.characterX - (global.dx * 2), global.characterY - (global.dy * 2)] == 6)){
            global.playgrid[global.characterX - (global.dx * 2), global.characterY - (global.dy * 2)] -= 2
            global.playgrid[global.characterX - global.dx, global.characterY - global.dy] += 2
        }
    }
}
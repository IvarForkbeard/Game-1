//on input, increment the number of steps and store the new grid at that position in the 3d array
for (j = 0; j < 10; j ++){
    for (k = 0; k < 10; k ++){
        global.playgrid[j][k][global.numberOfSteps + 1] = global.playgrid[j][k][global.numberOfSteps]
    }
}
global.dx = 0
global.dy = 0
switch(keyboard_key){
    case vk_left:
        global.dx = -1
        global.dy = 0
        global.numberOfSteps ++
        global.hasMoved = true
    break
    case vk_up:
        global.dx = 0
        global.dy = -1
        global.numberOfSteps ++
        global.hasMoved = true
    break
    case vk_right:
        global.dx = 1
        global.dy = 0
        global.numberOfSteps ++
        global.hasMoved = true
    break
    case vk_down:
        global.dx = 0
        global.dy = 1
        global.numberOfSteps ++
        global.hasMoved = true
    break
    case vk_space:
        if (global.numberOfSteps > 2){
            global.numberOfSteps --
        }
        for (i = 0; i < 10; i ++){
            for(j = 0; j < 10; j ++){
                if ((global.playgrid[i][j][global.numberOfSteps]) == entity.player || (global.playgrid[i][j][global.numberOfSteps] == (entity.player + entity.target))){
                    global.characterX = i
                    global.characterY = j
                }
            }
        }
    break
}

//move the character as long as it hasn't stepped onto the skirt
    global.playgrid[global.characterX][global.characterY][global.numberOfSteps] -= entity.player
    global.characterX += global.dx
    global.characterY += global.dy
    global.playgrid[global.characterX][global.characterY][global.numberOfSteps] += entity.player

    //if the character is on a crate, then push that crate ahead
    if ((global.playgrid[global.characterX][global.characterY][global.numberOfSteps] == (entity.player + entity.crate))
            || (global.playgrid[global.characterX][global.characterY][global.numberOfSteps] == (entity.player + entity.crate + entity.target))){
                global.playgrid[global.characterX][global.characterY][global.numberOfSteps] -= entity.crate
                global.playgrid[global.characterX + global.dx][global.characterY + global.dy][global.numberOfSteps] += entity.crate
    }

//check for illegal board situations
isPlayable = true
for (i = 0; i < 10; i ++){
    for(j = 0; j < 10; j ++){
        switch global.playgrid[i][j][global.numberOfSteps]{
            case 8: //player on wall
            case 16: //crate on wall
            case 30: //crate on crate
            case 33: //crate on crate on target
                isPlayable = false
            break
        } 
    }
}
if !(isPlayable) {
    global.numberOfSteps--
    for (i = 0; i < 10; i ++){
        for(j = 0; j < 10; j ++){
            if ((global.playgrid[i][j][global.numberOfSteps]) == entity.player || (global.playgrid[i][j][global.numberOfSteps] == (entity.player + entity.target))){
                global.characterX = i
                global.characterY = j
            }
        }
    }
}
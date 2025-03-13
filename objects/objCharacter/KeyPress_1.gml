//on input, increment the number of steps and store the new grid at that position in the 3d array
for (j = 0; j < 10; j++){
    for (k = 0; k < 10; k++){
        global.playgrid[j][k][global.numberOfSteps + 1] = global.playgrid[j][k][global.numberOfSteps]
    }
}
global.dx = 0
global.dy = 0
switch(keyboard_key){
    case vk_left:
        global.dx = -1
        global.dy = 0
        global.numberOfSteps++
        global.hasMoved = true
    break
    case vk_up:
        global.dx = 0
        global.dy = -1
        global.numberOfSteps++
        global.hasMoved = true
    break
    case vk_right:
        global.dx = 1
        global.dy = 0
        global.numberOfSteps++
        global.hasMoved = true
    break
    case vk_down:
        global.dx = 0
        global.dy = 1
        global.numberOfSteps++
        global.hasMoved = true
    break
    case vk_space:
        if (global.numberOfSteps > 2){
            global.numberOfSteps--
        }
        for (i = 0; i < 10; i++){
            for(j = 0; j < 10; j++){
                if ((global.playgrid[i][j][global.numberOfSteps]) == 7 || (global.playgrid[i][j][global.numberOfSteps] == 10)){
                    global.characterX = i
                    global.characterY = j
                }
            }
        }
    break
}

//move the character as long as it hasn't stepped onto the skirt
    global.playgrid[global.characterX][global.characterY][global.numberOfSteps] -= 7
    global.characterX += global.dx
    global.characterY += global.dy
    global.playgrid[global.characterX][global.characterY][global.numberOfSteps] += 7

    //if the character is on a crate, then push that crate ahead
    if ((global.playgrid[global.characterX][global.characterY][global.numberOfSteps] == 22) || (global.playgrid[global.characterX][global.characterY][global.numberOfSteps] == 25)){
        global.playgrid[global.characterX][global.characterY][global.numberOfSteps] -= 15
        global.playgrid[global.characterX + global.dx][global.characterY + global.dy][global.numberOfSteps] += 15
    }


//check for illegal board situations
isPlayable = true
for (i = 0; i < 10; i++){
    for(j = 0; j < 10; j++){
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
    for (i = 0; i < 10; i++){
        for(j = 0; j < 10; j++){
            if ((global.playgrid[i][j][global.numberOfSteps]) == 7 || (global.playgrid[i][j][global.numberOfSteps] == 10)){
                global.characterX = i
                global.characterY = j
            }
        }
    }
}

/*
//check if we're trying to step into a wall
if (global.playgrid[global.characterX + global.dx][global.characterY + global.dy][global.numberOfSteps] != 1) {
    
    //check if no crate in front
    if ((global.playgrid[global.characterX + global.dx][global.characterY + global.dy][global.numberOfSteps] != 15) && (global.playgrid[global.characterX + global.dx][global.characterY + global.dy][global.numberOfSteps] != 18)){
        global.playgrid[global.characterX][global.characterY][global.numberOfSteps] -= 7
        global.characterX += global.dx
        global.characterY += global.dy
        global.playgrid[global.characterX][global.characterY][global.numberOfSteps] += 7
    }
    
    //check if no crate or wall beyond the current crate
    else if ((global.playgrid[global.characterX + (global.dx * 2)][global.characterY + (global.dy * 2)][global.numberOfSteps] != 15)
        && (global.playgrid[global.characterX + (global.dx * 2)][global.characterY + (global.dy * 2)][global.numberOfSteps] != 1)
        && (global.playgrid[global.characterX + (global.dx * 2)][global.characterY + (global.dy * 2)][global.numberOfSteps] != 18)){
        
        //remove crate from one spot beyond current character spot, add crate two spots beyond the current character spot
        global.playgrid[global.characterX + global.dx][global.characterY + global.dy][global.numberOfSteps] -= 15
        global.playgrid[global.characterX + (global.dx * 2)][global.characterY + (global.dy *2)][global.numberOfSteps] += 15
        audio_play_sound(blockMove5, 2, false)
        
        //remove player from old spot, add player to new spot
        global.playgrid[global.characterX][global.characterY][global.numberOfSteps] -= 7
        global.characterX += global.dx
        global.characterY += global.dy
        global.playgrid[global.characterX][global.characterY][global.numberOfSteps] += 7
    }
}
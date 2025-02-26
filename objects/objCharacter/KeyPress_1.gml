// Get input
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
}

//check if we're trying to step into a wall
if (global.playgrid[global.characterX + global.dx][global.characterY + global.dy][global.numberOfSteps] != 1) {
    
    //check if no crate in front
    if ((global.playgrid[global.characterX + global.dx][global.characterY + global.dy][global.numberOfSteps] != 2) && (global.playgrid[global.characterX + global.dx][global.characterY + global.dy][global.numberOfSteps] != 6)){
        global.playgrid[global.characterX][global.characterY][global.numberOfSteps] -= 8
        global.characterX += global.dx
        global.characterY += global.dy
        global.playgrid[global.characterX][global.characterY][global.numberOfSteps] += 8
    }
    
    //check if no crate or wall beyond the current crate
    else if ((global.playgrid[global.characterX + (global.dx * 2)][global.characterY + (global.dy * 2)][global.numberOfSteps] != 2)
        && (global.playgrid[global.characterX + (global.dx * 2)][global.characterY + (global.dy * 2)][global.numberOfSteps] != 1)
        && (global.playgrid[global.characterX + (global.dx * 2)][global.characterY + (global.dy * 2)][global.numberOfSteps] != 6)){
        
        //remove crate from one spot beyond current character spot, add crate two spots beyond the current character spot
        global.playgrid[global.characterX + global.dx][global.characterY + global.dy][global.numberOfSteps] -= 2
        global.playgrid[global.characterX + (global.dx * 2)][global.characterY + (global.dy *2)][global.numberOfSteps] += 2
        audio_play_sound(blockMove5, 2, false)
        
        //remove player from old spot, add player to new spot
        global.playgrid[global.characterX][global.characterY][global.numberOfSteps] -= 8
        global.characterX += global.dx
        global.characterY += global.dy
        global.playgrid[global.characterX][global.characterY][global.numberOfSteps] += 8
    }
}
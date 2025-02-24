// Get input
global.dx = 0
global.dy = 0
switch(keyboard_key){
    case vk_left:
        global.dx = -1
        global.dy = 0
        //numberOfSteps++
    break
    case vk_up:
        global.dx = 0
        global.dy = -1
        //numberOfSteps++
    break
    case vk_right:
        global.dx = 1
        global.dy = 0
        //numberOfSteps++
    break
    case vk_down:
        global.dx = 0
        global.dy = 1
        //numberOfSteps++
    break
    case vk_space:
        audio_play_sound(sadTrombone8, 2, false)
        room_restart()
    break
}

//check if we're trying to step into a wall
if (global.playgrid[global.characterX + global.dx, global.characterY + global.dy] != 1) {
    
    //check if no crate in front
    if (global.playgrid[global.characterX + global.dx, global.characterY + global.dy] != 2) && (global.playgrid[global.characterX + global.dx, global.characterY + global.dy] != 6) {
        global.playgrid[global.characterX, global.characterY] -= 8
        global.characterX += global.dx
        global.characterY += global.dy
        global.playgrid[global.characterX, global.characterY] += 8
        numberOfSteps++
    }
    
    //check if no crate or wall beyond the current crate
    else if ((global.playgrid[global.characterX + (global.dx * 2), global.characterY + (global.dy * 2)] != 2)
        && (global.playgrid[global.characterX + (global.dx * 2), global.characterY + (global.dy * 2)] != 1)
        && (global.playgrid[global.characterX + (global.dx * 2), global.characterY + (global.dy * 2)] != 6)){
        
        //remove crate from one spot beyond current character spot, add crate two spots beyond the current character spot
        global.playgrid[global.characterX + global.dx, global.characterY + global.dy] -= 2
        global.playgrid[global.characterX + (global.dx * 2), global.characterY + (global.dy *2)] += 2
        audio_play_sound(blockMove5, 2, false)
        
        //remove player from old spot, add player to new spot
        global.playgrid[global.characterX, global.characterY] -= 8
        global.characterX += global.dx
        global.characterY += global.dy
        global.playgrid[global.characterX, global.characterY] += 8
    }
}
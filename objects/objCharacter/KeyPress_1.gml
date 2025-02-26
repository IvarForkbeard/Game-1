// Get input
global.dx = 0
global.dy = 0
global.history[global.numberOfSteps] = global.playgrid
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
    case vk_escape:
        global.numberOfSteps--
        global.playgrid = global.history[global.numberOfSteps]
        /*for (i = 0; i < 10; i++){
            for(j = 0; j < 10; j++){
                if ((global.playgrid[i, j] == 8) || (global.playgrid[i, j] == 12)){
                    global.characterX = i
                    global.characterY = j
                }
            }
        }*/
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
        global.history[global.numberOfSteps] = global.playgrid
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
        global.history[global.numberOfSteps] = global.playgrid
    }
}
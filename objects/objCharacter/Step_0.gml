// Calculate if the puzzle is complete
global.puzzleComplete = true
for (i = 0; i < 10; i++){
    for (j = 0; j < 10; j++){
        if (global.playgrid[i, j] == 4 || global.playgrid[i, j] == 12){
            global.puzzleComplete = false
        }
    }
}

// Increment level if the puzzle is complete
if (global.puzzleComplete) { 
    global.level++
    audio_play_sound(golfClap6, 4, false)
    room_restart()
}

// Restart level on space
if keyboard_check_pressed(vk_space){
    audio_play_sound(sadTrombone8, 3, false)
    room_restart()
}

// loop music
if !(audio_is_playing(music7)){
    audio_play_sound(music7, 5, true)
}
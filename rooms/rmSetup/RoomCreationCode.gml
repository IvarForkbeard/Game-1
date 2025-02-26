randomise()
global.gridSize = 64
global.level = 0
global.numberOfBoxes = 8
global.playgrid[0, 0] = 0
global.history[0] = global.playgrid
window_set_size(640, 640)
audio_play_sound(theme, 5, true)
room_goto_next()
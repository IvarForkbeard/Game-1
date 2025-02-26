/// @description

while (spacePause < 1000000){
    spacePause++
}
if (global.numberOfSteps > 2){
    global.numberOfSteps--
}
for (i = 0; i < 10; i++){
    for(j = 0; j < 10; j++){
        if ((global.playgrid[i][j][global.numberOfSteps]) == 8 || (global.playgrid[i][j][global.numberOfSteps] == 12)){
            global.characterX = i
            global.characterY = j
        }
    }
}
//fast unwind
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
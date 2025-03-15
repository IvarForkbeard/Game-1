global.numberOfBoxes = ceil(global.level / 3) + 1

// 1 = wall, 3 = target, 7 = player, 15 = crate
enum entity {
    floor = 0,
    wall = 1,
    target = 3,
    player = 7,
    crate = 15
}

// create global.playgrid
for (i = 0; i < 10; i ++){
    for (j = 0; j < 10; j ++){
        global.playgrid[i][j][0] = entity.wall
    }
}

// add generated path
i = 1
pathX = irandom(7) + 1
pathY = irandom(7) + 1
global.playgrid[pathX][pathY][0] = entity.floor
while i < global.level + 20
&& i < 64{
    switch irandom(3){
        case 0:
            if (pathY > 1){
                pathY --
            }
        break
        case 1:
            if (pathX > 1){
                pathX --
            }
        break
        case 2:
            if (pathY < 8){
                pathY ++
            }
        break
        case 3:
            if (pathX < 8){
                pathX ++
            }
        break
    }
    if (global.playgrid[pathX][pathY][0] == entity.wall){
        global.playgrid[pathX][pathY][0] = entity.floor
        i ++
    }
}

// add player to global.playgrid
playerHasBeenPlaced = false
while !playerHasBeenPlaced{
    global.playerX = irandom(7) + 1
    global.playerY = irandom(7) + 1
    if (global.playgrid[global.playerX][global.playerY][0] == entity.floor){
        global.playgrid[global.playerX][global.playerY][0] = entity.player
        playerHasBeenPlaced = true
    }
}

// add targets and crates to global.playgrid
i = 0
while i < global.numberOfBoxes{
    targetX = irandom(7) + 1
    targetY = irandom(7) + 1
    if (global.playgrid[targetX][targetY][0] == entity.floor){
        global.playgrid[targetX][targetY][0] += (entity.target + entity.crate)
        i ++
    }
}

//now put actual objects onto the play surface except crates, which are redrawn every clock cycle
for (i = 0; i < 10; i ++){
    for (j = 0; j < 10; j ++){
        switch global.playgrid[i][j][0]{
            case entity.wall:
                instance_create_layer(i * 64, j * 64, "Instances", objWall)
            break
            case entity.target + entity.crate:
                instance_create_layer(i * 64, j * 64, "Instances", objTarget)
            break
        }
    }
}

//instantiate player after the room has been built to prevent room scrambling prematurely
instance_create_layer(global.playerX, global.playerY, "Text", objPlayer)
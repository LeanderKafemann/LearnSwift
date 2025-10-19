func turnRight() {
    for i in 1 ... 3 {
        turnLeft()
    }
}


for i in 1 ... 8 {
    collectGem()
    if isBlocked {
        turnRight()
    }
    moveForward()
}

turnRight()
moveForward()
turnRight()
moveForward()
collectGem()
for i in 1 ... 4 {
    moveForward()
    if isOnGem {
        collectGem()
    }
}
turnLeft()
turnLeft()
for i in 1 ... 4 {
    turnRight()
    if !isBlocked {
        break
    } else {
        turnLeft()
        moveForward()
    }
}
moveForward()
moveForward()
collectGem()
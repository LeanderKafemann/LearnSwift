moveForward()
turnLeft()
while isOnGem {
    collectGem()
    if !isBlocked {
        moveForward()
    } else {
        turnLeft()
        moveForward()
        turnRight()
        moveForward()
        turnLeft()
    }
}
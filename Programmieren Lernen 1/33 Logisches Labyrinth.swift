for i in 1 ... 8 {
    moveForward()
    if isOnClosedSwitch {
        toggleSwitch()
        if isOnGem {
            turnRight()
            moveForward()
            moveForward()
            turnLeft()
            turnLeft()
            collectGem()
            moveForward()
            moveForward()
            turnRight()
        } else {
            turnLeft()
        }
    }
    if isOnGem {
        collectGem()
    }
}
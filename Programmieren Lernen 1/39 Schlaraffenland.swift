func collectAll() {
    while isOnClosedSwitch || isOnOpenSwitch || isOnGem {
        if isOnGem {
            collectGem()
        }
        if isOnClosedSwitch {
            toggleSwitch()
        }
        moveForward()
    }
}

moveForward()
collectAll()
turnRight()
moveForward()
turnRight()
moveForward()
collectAll()
turnLeft()
moveForward()
turnLeft()
moveForward()
collectAll()
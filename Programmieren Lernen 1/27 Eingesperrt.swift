func collectOrToggle() {
    if isOnGem {
        collectGem()
    } else if isOnClosedSwitch {
        toggleSwitch()
    }
}

for i in 1 ... 8 {
    if isBlocked {
        turnLeft()
    }
    moveForward()
    collectOrToggle()
}
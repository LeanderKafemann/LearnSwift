while !(isBlocked && isBlockedLeft && isBlockedRight) {
    while !isBlocked {
        moveForward()
        if isOnClosedSwitch {
            toggleSwitch()
        }
        if isOnGem {
            collectGem()
        }
    }
    if !isBlockedRight {
        turnRight()
    }
}
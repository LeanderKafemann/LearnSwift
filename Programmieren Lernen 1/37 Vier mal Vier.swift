while !(isBlockedRight && isBlockedLeft && isBlocked) {
    if isOnOpenSwitch {
        turnRight()
    }
    moveForward()
    if isOnClosedSwitch {
        toggleSwitch()
    }
}
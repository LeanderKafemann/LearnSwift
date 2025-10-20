var gemCounter = 0

while !(isBlockedLeft && isBlockedRight && isBlocked) {
    moveForward()
    if isOnGem {
        collectGem()
        gemCounter += 1
    }
    if isBlocked && !isBlockedRight {
        turnRight()
    }
}
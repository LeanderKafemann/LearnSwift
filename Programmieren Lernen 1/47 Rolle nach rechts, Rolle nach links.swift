func navigate() {
    if isBlocked {
        if isBlockedRight {
            turnLeft()
        } else {
            turnRight()
        }
    }  else {
        moveForward()
    }
}

var gemCount = 0
while !(gemCount == 8){
    if isOnClosedSwitch {
        toggleSwitch()
    }
    if isOnGem {
        collectGem()
        gemCount += 1
    }
    navigate()
}
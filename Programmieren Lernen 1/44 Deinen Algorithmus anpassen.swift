func navigateAroundWall() {
    if isBlockedRight {
        if isBlocked {
            turnLeft()
        } else {
            moveForward()
        }
    }  else {
        turnRight()
        moveForward()
    }
}
    
while !isOnClosedSwitch {
    navigateAroundWall()
    if isOnGem {
        collectGem()
        turnLeft()
        turnLeft()
    }
}
toggleSwitch()
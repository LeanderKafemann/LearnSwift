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
    
while !isOnGem {
    navigateAroundWall()
}
collectGem()
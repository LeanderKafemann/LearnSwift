func turnAround() {
    turnLeft()
    turnLeft()
}

func maxMove() {
    while !isBlocked {
        moveForward()
        if isOnGem {
            collectGem()
        }
    }
    turnAround()
}

moveForward()
pinkPortal.isActive = false
maxMove()
maxMove()
pinkPortal.isActive = true
moveForward()
moveForward()

pinkPortal.isActive = false
bluePortal.isActive = false
maxMove()
maxMove()

bluePortal.isActive = true
moveForward()
maxMove()
bluePortal.isActive = false
maxMove()
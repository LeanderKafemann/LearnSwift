func turnAround() {
    turnLeft()
    turnLeft()
}

func tripleForward() {
    for i in 1 ... 3 {
        moveForward()
    }
}

bluePortal.isActive = false
pinkPortal.isActive = false
tripleForward()
collectGem()
turnAround()

pinkPortal.isActive = true
moveForward()
turnAround()
moveForward()
collectGem()
turnAround()
moveForward()
pinkPortal.isActive = false

bluePortal.isActive = true
moveForward()
bluePortal.isActive = false
moveForward()
collectGem()
turnAround()
moveForward()
moveForward()
collectGem()
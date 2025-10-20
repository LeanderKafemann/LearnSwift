func turnAround() {
    turnLeft()
    turnLeft()
}

func tripleForward() {
    for i in 1 ... 3 {
        moveForward()
    }
}

func toggleOrCollect() {
    if isOnGem {
        collectGem()
    }
    if isOnClosedSwitch {
        toggleSwitch()
    }
}

func collectFour() {
    for i in 1 ... 4 {
        if !isBlocked {
            moveForward()
            toggleOrCollect()
            turnAround()
            moveForward()
            turnLeft()
        } else {
            turnRight()
        }
    }
}

greenPortal.isActive = false
orangePortal.isActive = false

turnRight()
moveForward()
moveForward()
collectFour()

orangePortal.isActive = true
moveForward()
turnAround()
moveForward()
orangePortal.isActive = false
collectFour()

turnLeft()
tripleForward()
collectFour()
moveForward()
turnAround()
greenPortal.isActive = true
moveForward()
greenPortal.isActive = false
collectFour()
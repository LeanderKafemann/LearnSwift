let greenPortal = Portal(color: #colorLiteral(red: 0.4028071761, green: 0.7315050364, blue: 0.2071235478, alpha: 1))

func turnAround() {
    turnLeft()
    turnLeft()
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

moveForward()
collectFour()

moveForward()
world.place(greenPortal, atStartColumn: 1, startRow: 5, atEndColumn: 5, endRow: 1)
turnAround()
moveForward()

greenPortal.isActive = false
collectFour()
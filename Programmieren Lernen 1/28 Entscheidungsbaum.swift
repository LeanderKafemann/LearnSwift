func move(n: Int) {
    for i in 1 ... n {
        moveForward()
    }
}

func turnAround() {
    turnLeft()
    turnLeft()
}

func solveRightSide() {
    turnRight()
    move(n: 3)
    turnLeft()
    moveForward()
    collectGem()
    turnAround()
    moveForward()
    turnRight()
    move(n: 3)
    turnRight()
}

func solveLeftSide() {
    turnLeft()
    moveForward()
    collectGem()
    turnAround()
    moveForward()
    turnLeft()
}

for i in 1 ... 5 {
    moveForward()
    if isOnGem {
        collectGem()
        solveRightSide()
    } else if isOnClosedSwitch {
        toggleSwitch()
        solveLeftSide()
    }
}
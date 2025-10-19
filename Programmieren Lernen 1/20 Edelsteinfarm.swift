func move(n: Int) {
    for i in 1 ... n {
        moveForward()
    }
}

func turnAround() {
    turnLeft()
    turnLeft()
}

func doubleToggle() {
    moveForward()
    toggleSwitch()
    moveForward()
    toggleSwitch()
    turnAround()
    move(n: 2)
}

func doubleCollect() {
    moveForward()
    collectGem()
    moveForward()
    collectGem()
    turnAround()
    move(n: 2)
}


for i in 1 ... 3 {
    turnLeft()
    doubleToggle()
    doubleCollect()
    turnRight()
    moveForward()
}
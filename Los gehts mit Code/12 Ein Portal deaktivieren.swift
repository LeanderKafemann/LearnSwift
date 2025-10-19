greenPortal.isActive = false

func tripleForward() {
    for i in 1 ... 3 {
        moveForward()
    }
}


tripleForward()
for i in 1 ... 3 {
    turnLeft()
    tripleForward()
    turnLeft()
    turnLeft()
    toggleSwitch()
    tripleForward()
}
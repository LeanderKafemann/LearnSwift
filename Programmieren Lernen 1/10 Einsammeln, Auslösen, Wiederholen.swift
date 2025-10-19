func move() {
	moveForward()
    collectGem()
    moveForward()
    toggleSwitch()
    moveForward()
    if isBlocked {
        turnLeft()
    } else {
        moveForward()
        turnLeft()
    }
}


for i in 1 ... 4 {
    move()
}
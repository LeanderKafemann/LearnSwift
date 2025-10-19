func move(n: Int) {
    for i in 1 ... n {
        moveForward()
    }
}

func turnAround() {
    turnLeft()
    turnLeft()
}

for i in 1 ... 3 {
    move(n: 2)
    turnRight()
    move(n: 7)
    turnAround()
    toggleSwitch()
    move(n: 7)
    turnRight()
}
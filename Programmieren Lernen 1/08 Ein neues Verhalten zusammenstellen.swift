func move(n: Int) {
    for i in 1 ... n {
        moveForward()
    }
}

func turnRight() {
    for i in 1 ... 3 {
        turnLeft()
    }
}

move(n: 3)
turnRight()
move(n: 3)
collectGem()
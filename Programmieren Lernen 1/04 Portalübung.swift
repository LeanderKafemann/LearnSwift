func move(n: Int) {
    for i in 1 ... n {
        moveForward()
    }
}

move(n: 3)
turnLeft()
move(n: 2)
toggleSwitch()
moveForward()
moveForward()
turnLeft()
move(n: 2)
collectGem()
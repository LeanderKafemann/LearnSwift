func move(distance: Int) {
    for i in 1 ... distance {
        moveForward()
    }
}

move(distance: 2)
turnLeft()
moveForward()
collectGem()
moveForward()
turnLeft()
move(distance: 2)
toggleSwitch()
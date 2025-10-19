func move(n: Int) {
    for i in 1 ... n {
        moveForward()
    }
}

move(n: 3)
collectGem()
move(n: 2)
move(n: 2)
toggleSwitch()
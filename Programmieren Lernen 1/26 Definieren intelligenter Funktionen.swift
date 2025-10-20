func collectOrToggle() {
	if isOnGem {
        collectGem()
    } else if isOnClosedSwitch {
        toggleSwitch()
    }
}

func move(n: Int) {
    for i in 1 ... n {
        moveForward()
        collectOrToggle()
    }
}

move(n: 4)
turnLeft()
move(n: 2)
turnLeft()
move(n: 4)
turnRight()
moveForward()
turnRight()
move(n: 4)
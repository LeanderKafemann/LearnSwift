func collectGemTurnAround() {
	moveForward()
    moveForward()
    collectGem()
    turnLeft()
    turnLeft()
    moveForward()
    moveForward()
}

func solveRow() {
	collectGemTurnAround()
    collectGemTurnAround()
    turnLeft()
    turnLeft()
    turnLeft()
    moveForward()
    turnLeft()
}

for i in 1 ... 3 {
    solveRow()
}
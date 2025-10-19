func turnAround() {
    turnLeft()
    turnLeft()
}

func singleCollect() {
    moveForward()
    collectGem()
    turnAround()
    moveForward()
}

func collect() {
    moveForward()
    collectGem()
    turnLeft()
    singleCollect()
    singleCollect()
    turnRight()
    singleCollect()
    turnLeft()
    moveForward()
    if !isBlocked {
        moveForward()
    }
}

for i in 1 ... 4 {
    collect()
}
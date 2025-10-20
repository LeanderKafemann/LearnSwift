let expert = Expert()

func turnAround() {
    expert.turnLeft()
    expert.turnLeft()
}

func move(distance: Int) {
    for i in 1 ... distance {
        expert.moveForward()
    }
}

func maxMove() {
    while !expert.isBlocked {
        expert.moveForward()
        if expert.isOnGem {
            expert.collectGem()
        }
    }
    turnAround()
}

maxMove()
maxMove()
move(distance: 2)
expert.turnLeft()
maxMove()
move(distance: 2)
expert.turnRight()
move(distance: 2)

expert.turnLockDown()
turnAround()
move(distance: 2)
expert.turnRight()
maxMove()
move(distance: 2)
expert.turnLeft()
maxMove()
maxMove()
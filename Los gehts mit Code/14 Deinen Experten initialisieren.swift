let expert = Expert()


func turnAround() {
    expert.turnLeft()
    expert.turnLeft()
}

func tripleForward() {
    for i in 1 ... 3 {
        expert.moveForward()
    }
}

tripleForward()
expert.turnLockUp()

turnAround()
tripleForward()
expert.turnRight()
tripleForward()
expert.collectGem()

turnAround()
tripleForward()
tripleForward()
expert.collectGem()

turnAround()
tripleForward()
expert.turnLeft()
tripleForward()
expert.collectGem()
let expert = Expert()
world.place(expert, atColumn: 2, row: 6)

func turnAround() {
    for i in 1 ... 2 {
        expert.turnLeft()
    }

}

expert.turnLeft()
expert.turnLockUp()

turnAround()
expert.move(distance: 2)
expert.collectGem()
turnAround()
expert.moveForward()

expert.turnRight()
expert.move(distance: 5)

expert.turnLeft()
expert.turnLockUp()
expert.turnRight()
expert.moveForward()

expert.move(distance: 5)
expert.collectGem()
turnAround()
expert.move(distance: 5)

expert.moveForward()
expert.turnLeft()
expert.moveForward()
expert.collectGem()

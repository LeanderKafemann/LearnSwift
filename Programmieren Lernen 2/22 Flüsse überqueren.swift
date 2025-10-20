let expert = Expert()
world.place(expert, facing: .south, atColumn: 1, row: 8)

func moveNCollect(steps: Int) {
    for i in 1 ... steps {
        if expert.isOnGem {
            expert.collectGem()
        }
        if !expert.isBlocked {
            expert.moveForward()
        }
    }
}

moveNCollect(steps: 4)

expert.turnLockDown()
expert.turnLeft()

moveNCollect(steps: 4)
expert.turnLockUp()
expert.turnRight()

moveNCollect(steps: 5)
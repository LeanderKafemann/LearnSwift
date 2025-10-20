let expert = Expert()
let character = Character()

func turnAround() {
    character.turnLeft()
    character.turnLeft()
}

func collectOne() {
    character.move(distance: 2)
    turnAround()
    character.collectGem()
}

character.move(distance: 2)
character.collectGem()
character.turnRight()

for i in 1 ... 4 {
    expert.turnRight()
    expert.turnLock(up: true, numberOfTimes: 4)
}

character.move(distance: 2)
character.collectGem()
character.turnRight()
character.move(distance: 4)
character.collectGem()
character.turnRight()
character.moveForward()

for i in 1 ... 4 {
    expert.turnRight()
    expert.turnLock(up: false, numberOfTimes: 3)
}

character.turnLeft()
character.moveForward()
character.collectGem()

turnAround()
character.move(distance: 2)
character.turnRight()
collectOne()

character.move(distance: 2)
character.turnRight()
character.move(distance: 2)
character.turnRight()
collectOne()

character.move(distance: 2)
character.turnRight()
character.move(distance: 2)
character.collectGem()
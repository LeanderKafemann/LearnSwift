let expert = Expert()
let character = Character()

func turnLock(up: Bool, numberOfTimes: Int) {
	for i in 1 ... numberOfTimes {
        if up {
            expert.turnLockUp()
        } else {
            expert.turnLockDown()
        }
    }
}

func turnAround(expert_: Bool) {
    for i in 1 ... 2 {
        if expert_ {
            expert.turnLeft()
        } else {
            character.turnLeft()
        }
    }
}

turnLock(up: true, numberOfTimes: 3)
turnAround(expert_: true)
turnLock(up: true, numberOfTimes: 3)

character.move(distance: 3)
character.collectGem()
turnAround(expert_: false)
character.moveForward()

turnLock(up: false, numberOfTimes: 3)
turnAround(expert_: true)
turnLock(up: false, numberOfTimes: 2)

character.turnLeft()
character.moveForward()
character.turnLeft()
character.moveForward()
character.collectGem()

turnAround(expert_: false)
character.moveForward()

turnLock(up: false, numberOfTimes: 1)

character.moveForward()
character.moveForward()
character.collectGem()
let totalGems = randomNumberOfGems

let expert = Expert()
world.place(expert, facing: .north, atColumn: 0, row: 4)

let character = Character()
world.place(character, facing: .south, atColumn: 2, row: 6)

func maxMove() {
    for i in 1 ... 6 {
        if character.isOnGem {
            character.collectGem()
        }
        character.jump()
    }
    if character.isOnGem {
        character.collectGem()
    }
}

maxMove()
character.turnLeft()

expert.turnLock(up: true, numberOfTimes: 3)

character.moveForward()
character.turnLeft()
maxMove()

character.turnRight()
character.moveForward()
character.turnRight()
maxMove()
let totalGems = randomNumberOfGems
var gemCounter = 0

greenPortal.isActive = false
yellowPortal.isActive = false
bluePortal.isActive = false

let character = Character()
world.place(character, facing: .east, atColumn: 0, row: 3)

world.place(Block(), atColumn: 1, row: 3)
world.place(Block(), atColumn: 3, row: 3)
world.place(Block(), atColumn: 6, row: 3)
world.place(Block(), atColumn: 6, row: 0)
world.place(Block(), atColumn: 1, row: 0)
world.place(Block(), atColumn: 0, row: 2)

while gemCounter < totalGems {
    if character.isOnGem {
        character.collectGem()
        gemCounter += 1
    }
    if character.isBlocked {
        character.turnRight()
    }
    character.moveForward()
}
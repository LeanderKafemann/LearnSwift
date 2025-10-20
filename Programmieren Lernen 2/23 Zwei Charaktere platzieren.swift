let expert = Expert()
let character = Character()

world.place(expert, facing: .north, atColumn: 3, row: 0)
world.place(character, facing: .north, atColumn: 0, row: 0)

expert.toggleSwitch()

func doubleJump() {
    character.jump()
    character.jump()
}

character.collectGem()
for i in 1 ... 2 {
    doubleJump()
    character.collectGem()
}
character.turnRight()
for i in 1 ... 2 {
    doubleJump()
    character.collectGem()
}

expert.turnLockUp()

character.turnLeft()
character.move(distance: 2)
character.collectGem()
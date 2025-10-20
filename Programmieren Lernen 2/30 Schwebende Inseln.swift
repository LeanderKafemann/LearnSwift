let character = Character()
world.place(character, facing: .north, atColumn: 2, row: 1)

func turnAround() {
    character.turnLeft()
    character.turnLeft()
}

func solve() {
    character.turnLeft()
    character.jump()
    character.toggleSwitch()
    turnAround()
    character.jump()
    character.collectGem()
    character.turnLeft()
    character.jump()
    character.toggleSwitch()
}

solve()
turnAround()

let greenPortal = Portal(color: #colorLiteral(red: 0.4028071761, green: 0.7315050364, blue: 0.2071235478, alpha: 1))
world.place(greenPortal, atStartColumn: 2, startRow: 1, atEndColumn: 6, endRow: 4)

character.jump()
greenPortal.isActive = false

let bluePortal = Portal(color: #colorLiteral(red: 0.0, green: 0.337249755859375, blue: 0.839202880859375, alpha: 1.0))
world.place(bluePortal, atStartColumn: 5, startRow: 4, atEndColumn: 1, endRow: 6)
bluePortal.isActive = false

character.turnRight()
solve()
turnAround()
character.jump()
turnAround()

bluePortal.isActive = true
character.jump()
bluePortal.isActive = false

turnAround()
solve()
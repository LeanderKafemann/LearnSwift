for i in 1 ... 7 {
    for j in 1 ... 3 {
        world.place(Block(), atColumn: i-1, row: 2)
    }
}

world.place(Switch(), atColumn: 4, row: 0)

let greenPortal = Portal(color: #colorLiteral(red: 0.4028071761, green: 0.7315050364, blue: 0.2071235478, alpha: 1))
world.place(greenPortal, atStartColumn: 1, startRow: 0, atEndColumn: 6, endRow: 3)

let character = Character()
world.place(character, facing: .east, atColumn: 0, row: 6)

for i in 1 ... 3 {
    world.place(Gem(), atColumn: 4, row: 0)
}

world.place(Block(), atColumn: 0, row: 1)

for i in 1 ... 3 {
    world.place(Block(), atColumn: 4+i, row: 6)
}
for i in 1 ... 2 {
    world.place(Block(), atColumn: 5+i, row: 5)
}
for i in 1 ... 2 {
    world.place(Block(), atColumn: 5+i, row: 6)
}
world.place(Block(), atColumn: 7, row: 5)
world.place(Block(), atColumn: 7, row: 6)

let bluePortal = Portal(color: #colorLiteral(red: 0.0, green: 0.258819580078125, blue: 0.6627349853515625, alpha: 1.0))
world.place(bluePortal, atStartColumn: 6, startRow: 2, atEndColumn: 7, endRow: 6)
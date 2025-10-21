characters = [
    Character(name: .blu),
    Portal(color: #colorLiteral(red: 0.933319091796875, green: 0.4431304931640625, blue: 0.619598388671875, alpha: 1.0)),
    Character(name: .hopper)
    Gem()
]

// Das Portal entfernen.
characters.remove(at: 1)

// Den Edelstein entfernen.
characters.remove(at: 2)

// Den Experten einsetzen.
characters.append(Expert())

var rowPlacement = 0
for character in characters {
    world.place(character, at: Coordinate(column: 1, row: rowPlacement))
    rowPlacement += 1
}
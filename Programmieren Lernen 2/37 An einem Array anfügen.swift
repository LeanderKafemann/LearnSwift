let allCoordinates = world.allPossibleCoordinates
var blockSet: [Coordinate] = []

for coordinate in allCoordinates {
    // Koordinaten suchen, deren Spalte > 5 ist ODER deren Zeile < 4.
    if coordinate.column > 5 || coordinate.row < 4 {
        blockSet.append(coordinate)
    }
}

// Für jedes Koordinatenpaar in blockSet sechs Blöcke platzieren.
for coordinate in blockSet {
    for i in 1 ... 6 {
        world.place(Block(), at: coordinate)
    }
}
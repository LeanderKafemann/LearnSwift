let allCoordinates = world.allPossibleCoordinates
// Zwei leere Arrays vom Typ [Coordinate] erstellen.
var islandCoords: [Coordinate] = []
var waterCoords: [Coordinate] = []

for coordinate in allCoordinates {
    if coordinate.column < 8 && coordinate.column > 3 && coordinate.row > 3 && coordinate.row < 8 {
        // An das Insel-Array anfügen.
        islandCoords.append(coordinate)
    } else {
        // An das Meeres-Array anfügen.
        waterCoords.append(coordinate)
    }
}
// Blöcke für das Insel-Array platzieren.
for coord in islandCoords {
    world.place(Block(), at: coord)
}

// Wasser für das Meer-Array platzieren.
for coord in waterCoords {
    world.removeAllBlocks(at: coord)
    world.place(Water(), at: coord)
}

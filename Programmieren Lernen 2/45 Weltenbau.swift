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

let colors: [Color] = [#colorLiteral(red: 0.4028071761, green: 0.7315050364, blue: 0.2071235478, alpha: 1), #colorLiteral(red: 1.0, green: 0.415679931640625, blue: 0.0, alpha: 1.0), #colorLiteral(red: 0.0, green: 0.337249755859375, blue: 0.839202880859375, alpha: 1.0), #colorLiteral(red: 0.886260986328125, green: 0.14117431640625, blue: 0.0, alpha: 1.0), #colorLiteral(red: 0.8274383544921875, green: 0.3411712646484375, blue: 0.996063232421875, alpha: 1.0), #colorLiteral(red: 0.917633056640625, green: 0.949005126953125, blue: 0.5607757568359375, alpha: 1.0), #colorLiteral(red: 0.0039215087890625, green: 0.7803802490234375, blue: 0.98822021484375, alpha: 1.0), #colorLiteral(red: 0.0, green: 0.0, blue: 0.0, alpha: 1.0)]
var characters: [Character] = []

// Blöcke für das Insel-Array platzieren.
for coord in islandCoords {
    world.place(Block(), at: coord)
    if coord.row == 7 {
        let newChar = Character(name: .blu)
        characters.append(newChar)
        world.place(newChar, at: coord)
    }
}

var index = 0
for coord in islandCoords {
    if index == 8 {
        index = -1
    }
    if index >= 0 {
        world.place(Portal(color: colors[index]), atStartColumn: coord.column, startRow: coord.row,
                    atEndColumn: 11 - coord.column, endRow: coord.row + 2)
        index += 1
    }
}

// Wasser für das Meer-Array platzieren.
for coord in waterCoords {
    world.removeAllBlocks(at: coord)
    world.place(Water(), at: coord)
}

for i in 1 ... 7 {
    for char in characters {
        if !char.isBlocked {
            char.moveForward()
        } else if !char.isBlockedRight {
            char.turnRight()
            char.moveForward()
        } else if !char.isBlockedLeft {
            char.turnLeft()
            char.moveForward()
        } else {
            char.turnLeft()
            char.turnLeft()
            char.argh()
        }
    }
}
// Ein Array mit allen Koordinaten aus Zeile 2 erstellen.
var row2 = world.row(2)

// Ein leeres Koordinaten-Array erstellen.
var newArray: [Coordinate] = []

for i in 1...12 {
    for coordinate in row2 {
        world.place(Block(), at: coordinate)
    }
    // Koordinaten entfernen und an das leere Array anfügen.
    newArray.append(row2.remove(at: 0))
}

// Für jedes zu dem leeren Array hinzugefügte Koordinatenpaar einen Charakter platzieren.
for coord in newArray {
    world.place(Character(), at: coord)
}

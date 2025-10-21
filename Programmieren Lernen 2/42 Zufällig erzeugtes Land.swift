let allCoordinates = world.allPossibleCoordinates
var heights: [Int] = []

// Zufällige Zahlen an die Höhen anfügen.
for i in 1 ... 10 {
    let localNumb = randomInt(from: 0, to: 12)
    heights.append(localNumb)
}

var index = 0
for coordinate in allCoordinates {
    if index == heights.count {
        index = 0
    }
    
    // currentHeight speichert die Höhe am aktuellen Index.
    var currentHeight = heights[index]

    if currentHeight == 0 {
        // Etwas Interessantes machen, wenn currentHeight = 0 ist.
        world.place(Gem(), at: coordinate)
    } else {
        for i in 1...currentHeight {
            world.place(Block(), at: coordinate)
        }
        if currentHeight > 10 {
            // Etwas ändern, z. B. einen Charakter platzieren.
            world.place(Expert(), at: coordinate)
        } else if coordinate.column >= 3 && coordinate.column < 6 {
            // Etwas ändern, z. B. Wasser platzieren.
            world.removeAllBlocks(at: coordinate)
            world.place(Water(), at: coordinate)
        }
    }
    index += 1   
}
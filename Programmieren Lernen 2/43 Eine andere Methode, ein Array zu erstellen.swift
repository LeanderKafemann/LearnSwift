let allCoordinates = world.allPossibleCoordinates

for coordinate in allCoordinates {
    // Die Höhe als die Summe der Spalte und der Zeile der jeweiligen Koordinaten festlegen.
    let height = coordinate.column + coordinate.row
    
    for i in 0...height {
        world.place(Block(), at: coordinate)
    }
    
    if height >= 8 && height < 10 {
        world.place(Character(name: .blu), at: coordinate)
    } else if height > 9 {
        world.place(Character(name: .hopper), at: coordinate)
    }
}

// Ein Array aus den bestehenden Charakteren der Rätselwelt initialisieren.
let characters = world.existingCharacters(at: allCoordinates)

// Für jeden Charakter bestimmte Aktionen ausführen.
for character in characters {
    character.danceLikeNoOneIsWatching()
    character.breakItDown()
}

characters[0].argh()

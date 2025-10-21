var teamBlu: [Character] = []

// Beachte die Anzahl der Instanzen von Blu im Array.
for i in 1...9 {
    teamBlu.append(Character(name: .blu))
}

// Blu in jeder Spalte in Zeile 4 platzieren.
var columnPlacement = 0
for blu in teamBlu {
    world.place(blu, at: Coordinate(column: columnPlacement, row: 4))
    columnPlacement += 1
}

// Finde den Indexbereichsfehler.
teamBlu[0].jump()
teamBlu[2].collectGem()
teamBlu[4].jump()
teamBlu[6].collectGem()
teamBlu[8].jump()
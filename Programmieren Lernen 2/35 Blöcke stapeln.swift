// Die beiden übrigen Eckkoordinaten hinzufügen.
var blockLocations = [
    Coordinate(column: 0, row: 0),
    Coordinate(column: 3, row: 3),
    Coordinate(column: 3, row: 0),
    Coordinate(column: 0, row: 3),
]
// Fünf Blöcke an jedem Koordinatenpaar platzieren.
for coordinate in blockLocations {
    for i in 1 ... 5 {
        world.place(Block(), at: coordinate)
    }
}
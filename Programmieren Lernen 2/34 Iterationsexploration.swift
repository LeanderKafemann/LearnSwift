let columns = [0, 1, 2, 3, 4]

// Der Schleifenvariablen einen Namen geben und dem Array übergeben.
for i in columns {
    // Einen Edelstein und einen Schalter für jede Spalte platzieren.
    world.place(Gem(), atColumn: i, row: 1)
    world.place(Switch(), atColumn: i, row: 1)
}
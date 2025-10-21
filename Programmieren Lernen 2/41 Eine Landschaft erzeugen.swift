var heights: [Int] = [1, 3, 4, 2, 6, 11, 3]
let allCoordinates = world.allPossibleCoordinates

var index = 0
for coordinate in allCoordinates {
    if index == heights.count {
        index = 0
    }
    for i in 0...heights[index] {
        // Einen Block platzieren.
        world.place(Block(), at: coordinate)
    }
    // Den Index erhöhen.
    index += 1
}

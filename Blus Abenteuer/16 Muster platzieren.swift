let animals = [#imageLiteral(resourceName: "horse@2x.png"), #imageLiteral(resourceName: "elephant@2x.png"), #imageLiteral(resourceName: "panda@2x.png"), #imageLiteral(resourceName: "pig@2x.png"), #imageLiteral(resourceName: "frog@2x.png"), #imageLiteral(resourceName: "snail@2x.png")]

// Ein Array von den Punkten eines Musters abrufen.
let points = scene.circlePoints(radius: 200, count: 100)
// Per Index zu Punkten.
var pointIndex = 0

func addImage(touch: Touch) {
    if touch.previousPlaceDistance < 80 { return }
        
    // Ein zufälliges Bild abrufen und platzieren.
    let index = randomInt(from: 0, to: animals.count - 1)
    var graphic = Graphic(image: animals[index])
    graphic.scale = 0.5
    scene.place(graphic, at: touch.position)
    // ✏️ Die Position von Punkten bei pointIndex abrufen.
    let position = points[pointIndex]
    // ✏️ pointIndex erhöhen.
    if pointIndex < points.count - 1 {
        pointIndex += 1
    } else {
        pointIndex = 0
    }
    // ✏️ Grafik an Position bewegen.
    graphic.move(to: position, duration: 1.0)
}
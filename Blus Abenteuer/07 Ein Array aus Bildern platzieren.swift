let blu = Graphic(image: #imageLiteral(resourceName: "Blu1@2x.png"))
let theOrigin = Point(x: 0, y: 0)
scene.place(blu, at: theOrigin)

var images = [#imageLiteral(resourceName: "soccerball@2x.png"), #imageLiteral(resourceName: "tennisball@2x.png"), #imageLiteral(resourceName: "baseball@2x.png"), #imageLiteral(resourceName: "billiardball@2x.png"), #imageLiteral(resourceName: "basketball@2x.png")]

var position = Point(x: 75, y: 75)

for image in images {
    // ✏️ Eine Grafik mit Bild erstellen.
    let graphic = Graphic(image: image)
    // ✏️ Grafik in der Szene platzieren.
    scene.place(graphic, at: position)
    // ✏️ Die Position für die nächste Grafik festlegen.
    position.x += 25
    position.y += 25
}
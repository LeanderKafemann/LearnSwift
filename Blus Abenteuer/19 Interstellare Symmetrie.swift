let animals = [#imageLiteral(resourceName: "horse@2x.png"), #imageLiteral(resourceName: "elephant@2x.png"), #imageLiteral(resourceName: "panda@2x.png"), #imageLiteral(resourceName: "pig@2x.png"), #imageLiteral(resourceName: "frog@2x.png"), #imageLiteral(resourceName: "snail@2x.png")]

var lastPlacePosition = Point(x: 0, y: 0)

func addImage(touch: Touch) {
    // Die Grafiken in der Szene verteilen.
    let placeDistance = touch.position.distance(from: lastPlacePosition)
    if placeDistance < 80 { return }
    lastPlacePosition = touch.position
    
    // Grafiken für jeden Quadranten.
    var graphics: [Graphic] = []
    // Ein zufälliges Bild auswählen.
    let chosenImage = animals.randomItem
    // Grafiken erstellen und zu Array hinzufügen.
    for i in 0 ..< 4 {
        let graphic = Graphic(image: chosenImage)
        graphics.append(graphic)
    }
    // Die absoluten x- und y-Werte abrufen.
    let x = abs(touch.position.x)
    let y = abs(touch.position.y)
    // Eine Grafik in jedem Quadranten positionieren.
    for i in 0 ... 3 {
        let graphic = graphics[i]
        var xp = x
        var yp = y
        if i < 2 {
            xp = -x
        }
        if i == 0 || i == 2 {
            yp = -y
        }
        scene.place(graphic, at: Point(x: xp, y: yp))
    }
}
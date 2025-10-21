let animals = [#imageLiteral(resourceName: "horse@2x.png"), #imageLiteral(resourceName: "elephant@2x.png"), #imageLiteral(resourceName: "panda@2x.png"), #imageLiteral(resourceName: "pig@2x.png"), #imageLiteral(resourceName: "frog@2x.png"), #imageLiteral(resourceName: "snail@2x.png")]

func addImage(touch: Touch) {
    if touch.previousPlaceDistance < 80 { return }
        
    // Ein zufälliges Bild abrufen und platzieren.
    let index = randomInt(from: 0, to: animals.count - 1)
    var graphic = Graphic(image: animals[index])
    scene.place(graphic, at: touch.position)
    
    let seconds = randomDouble(from: 1.0, to: 5.0)
    // ✏️ Mit verschiedenen Funktionen experimentieren.
    graphic.swirlAway(after: 5)
}
let animals = [#imageLiteral(resourceName: "horse@2x.png"), #imageLiteral(resourceName: "elephant@2x.png"), #imageLiteral(resourceName: "panda@2x.png"), #imageLiteral(resourceName: "pig@2x.png"), #imageLiteral(resourceName: "frog@2x.png"), #imageLiteral(resourceName: "snail@2x.png")]

func addImage(touch: Touch) {
    if touch.previousPlaceDistance < 80 { return }
        
    // ✏️ Index auf zufälligen Wert setzen.
    let index = randomInt(from: 0, to: animals.count - 1)
    var graphic = Graphic(image: animals[index])
    scene.place(graphic, at: touch.position)
    // ✏️ Grafik skalieren oder rotieren (oder beides).
    graphic.scale = randomDouble(from: 0.2, to: 2.0)
    graphic.rotation = randomInt(from: 0, to: 360)

}
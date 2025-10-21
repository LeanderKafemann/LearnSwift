let name = "Blue Moon"
let things = ["grüner Stern", "schwarzes Loch", "Roter Riese", "Weißer Zwerg"]
let colors = [#colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1), #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1), #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)]

func addText(touch: Touch) {
    if touch.previousPlaceDistance < 80 { return }
    // Den Index eines zufälligen Objekts in things abrufen.
    let index = randomInt(from: 0, to: things.count - 1)
    // ✏️ Eine Grafik mit einem String erstellen, der sich am Index im Array „things“ befindet.
    let graphic = Graphic(text: things[index])
    // ✏️ Schriftname und -größe ändern.
    graphic.fontName = .chalkduster
    graphic.fontSize = randomInt(from: 10, to: 100)
    // ✏️ Auf die Farbe setzen, die im Farben-Array bei Index steht.
    graphic.textColor = colors[index]
    scene.place(graphic, at: touch.position)
}
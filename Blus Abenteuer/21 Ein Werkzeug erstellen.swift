// Dies ist der Ereignishandler für „touch moved“-Ereignisse.
func addAlien(touch: Touch) {
    if touch.previousPlaceDistance < 60 { return }
    let graphic = Graphic(image: #imageLiteral(resourceName: "alien@2x.png"))
    scene.place(graphic, at: touch.position)
}

// ✏️ Ein Werkzeug erstellen.
let alienTool = Tool(name: "Alien", emojiIcon: "👽")
// ✏️ Ereignishandler mit dem Werkzeug verknüpfen.
alienTool.onTouchMoved = addAlien(touch:)
// ✏️ Werkzeug zu den Werkzeugen der Szene hinzufügen.
scene.tools.append(alienTool)
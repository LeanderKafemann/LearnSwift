// Ein „touch moved“-Ereignishandler.
func addAlien(touch: Touch) {
    if touch.previousPlaceDistance < 60 { return }
    let graphic = Graphic(image: #imageLiteral(resourceName: "alien@2x.png"))
    scene.place(graphic, at: touch.position)
}

// Ein „Graphic touched“-Ereignishandler.
func fattenAlien(graphic: Graphic) {
    graphic.scale *= 1.5
}

// Werkzeug 1 erstellen.
let tool1 = Tool(name: "Werkzeug 1", emojiIcon: "1️⃣")
// ✏️ Ereignishandler tauschen.
tool1.onTouchMoved = addAlien(touch:)
scene.tools.append(tool1)

// Werkzeug 2 erstellen.
let tool2 = Tool(name: "Werkzeug 2", emojiIcon: "2️⃣")
// ✏️ Ereignishandler tauschen.
tool2.onGraphicTouched = fattenAlien(graphic:)
scene.tools.append(tool2)
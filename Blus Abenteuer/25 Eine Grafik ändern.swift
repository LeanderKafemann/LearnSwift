// „Graphic touched“-Ereignishandler.
func modifyGraphic(graphic: Graphic) {
    // ✏️ Alpha modifizieren.
    if graphic.alpha == 0.1 {
        graphic.alpha = 1.0
    } else {
        graphic.alpha = 0.1
    }
    // Skalierung ändern.
    if graphic.scale < 2.0 {
        graphic.scale = 2.5
    } else {
        graphic.scale = 1.5
    }
}
// „touch moved“-Ereignishandler.
func addFruit(touch: Touch) {
    if touch.previousPlaceDistance < 60 { return }
    let fruit = "🍏🍐🍊🍋🍉🍒🍓🍌".componentsByCharacter()
    let graphic = Graphic(text: fruit.randomItem)
    scene.place(graphic, at: touch.position)
    graphic.scale = 2.5
}

// Werkzeug „Obst“ erstellen und hinzufügen.
let fruitTool = Tool(name: "Obst", emojiIcon: "🍒")
fruitTool.onTouchMoved = addFruit(touch:)
scene.tools.append(fruitTool)

// Werkzeug „Ändern“ erstellen und hinzufügen.
let modifyTool = Tool(name: "Ändern", emojiIcon: "⚒")
modifyTool.onGraphicTouched = modifyGraphic(graphic:)
scene.tools.append(modifyTool)
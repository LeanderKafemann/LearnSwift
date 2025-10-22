let blu = Graphic(image: #imageLiteral(resourceName: "Blu1@2x.png"))
let theOrigin = Point(x: 0, y: 0)
scene.place(blu, at: theOrigin)

// Ereignishandler für das Werkzeug „Ton“.
func soundGraphic(graphic: Graphic) {
    // Einen Ton für Blu abspielen.
    // ✏️ Für jede Art von Obst einen anderen Ton abspielen.
    if graphic == blu {
        playSound(.bluDance, volume: 75)
    } else if graphic.text == "🍐" {
        playSound(.owl)
    } else if graphic.text == "🍊" {
        playSound(.bark)
    } else {
        playSound(.horse)
    }
}

// Ereignishandler für das Werkzeug „Obst“.
func addFruit(touch: Touch) {
    if touch.previousPlaceDistance < 60 { return }
    let fruit = "🍐🍊🍋".componentsByCharacter()
    let graphic = Graphic(text: fruit.randomItem)
    scene.place(graphic, at: touch.position)
    graphic.scale = 2.0
}

// Werkzeug „Obst“ erstellen und hinzufügen.
let fruitTool = Tool(name: "Obst", emojiIcon: "🍊")
fruitTool.onTouchMoved = addFruit(touch:)
scene.tools.append(fruitTool)

// Werkzeug „Ton“ erstellen und hinzufügen.
let soundTool = Tool(name: "Ton", emojiIcon: "📣")
soundTool.onGraphicTouched = soundGraphic(graphic:)
scene.tools.append(soundTool)
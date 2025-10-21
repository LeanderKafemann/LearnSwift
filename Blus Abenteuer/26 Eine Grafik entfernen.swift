let blackHole = Graphic(image: #imageLiteral(resourceName: "BlackHole@2x.png"))
let x = randomDouble(from: -400, to: 400)
let y = randomDouble(from: -400, to: 400)
scene.place(blackHole, at: Point(x: x, y: y))

// Ereignishandler für das Werkzeug „Zerquetschen“.
func squishGraphic(graphic: Graphic) {
    // ✏️ Hier Code hinzufügen.
    if graphic.scale < 0.6 {
        graphic.moveAndZap(to: blackHole.position)
    } else {
        if graphic.text != "🍏" {
            graphic.scale -= 0.5
            graphic.alpha -= 0.25
        } else {
            graphic.alpha -= 0.1
            graphic.scale -= 0.2
        }
    }
}

// Ereignishandler für das Werkzeug „UFF“.
func addFructoid(touch: Touch) {
    if touch.previousPlaceDistance < 60 { return }
    let fruit = "🍏🍐🍊🍋🍉🍒🍓🍌".componentsByCharacter()
    let graphic = Graphic(text: fruit.randomItem)
    scene.place(graphic, at: touch.position)
    graphic.scale = 2.0
    
    let x = randomDouble(from: 50, to: 400)
    let y = randomDouble(from: 50, to: 400)
    let period = randomDouble(from: 8.0, to: 15.0)
    graphic.orbit(x: x, y: y, period: period)
}

// Werkzeug „UFF“ erstellen und hinzufügen.
let fructoidTool = Tool(name: "UFF", emojiIcon: "🍋")
fructoidTool.onTouchMoved = addFructoid(touch:)
scene.tools.append(fructoidTool)

// Werkzeug „Zerquetschen“ erstellen und hinzufügen.
let squishTool = Tool(name: "Zerquetschen", emojiIcon: "💥")
squishTool.onGraphicTouched = squishGraphic(graphic:)
scene.tools.append(squishTool)
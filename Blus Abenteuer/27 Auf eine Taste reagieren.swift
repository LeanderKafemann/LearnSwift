let blackHole = Graphic(image: #imageLiteral(resourceName: "BlackHole@2x.png"))
let x = randomDouble(from: -400, to: 400)
let y = randomDouble(from: -400, to: 400)
scene.place(blackHole, at: Point(x: x, y: y))

// Array der Grafiken in der Szene.
var graphics: [Graphic] = [Graphic]()
let maxGraphics = 200

// Grafik durch das schwarze Loch entfernen.
func squishGraphic(graphic: Graphic) {
    graphic.moveAndRemove(to: blackHole.position, duration: randomDouble(from: 0.25, to: 2))
}

// Alle Grafiken entfernen.
func squishEm() {
    // ✏️ Von Grafik zu Grafik wechseln und jede zerquetschen.
    for graphic in graphics {
        graphic.moveAndZap(to: blackHole.position)
    }
    // Einen Ton abspielen.
    playSound(.electricity)
    // Das Array mit den Grafiken leeren.
    graphics.removeAll()
}

// Ereignishandler für das Werkzeug „UFF“.
func addFructoid(touch: Touch) {
    if touch.previousPlaceDistance < 60 { return }
    if graphics.count >= maxGraphics { return }

    let fruit = "🍏🍐🍊🍋🍉🍒🍓🍌".componentsByCharacter()
    let graphic = Graphic(text: fruit.randomItem)
    scene.place(graphic, at: touch.position)
    graphics.append(graphic)
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

// Taste „Zerquetsch sie!“ erstellen und hinzufügen.
let squishButton = Button(name: "Zerquetsch sie!")
squishButton.onPress = squishEm
scene.button = squishButton
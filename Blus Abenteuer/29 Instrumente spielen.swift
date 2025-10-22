let blu = Graphic(image: #imageLiteral(resourceName: "Blu1@2x.png"))
let theOrigin = Point(x: 0, y: 0)
scene.place(blu, at: theOrigin)

// Ereignishandler für das Werkzeug „Musik“.
func musicalGraphic(graphic: Graphic) {
    
    // Eine Note für Blu spielen.
    if graphic == blu {
        playInstrument(.cosmicDrums, note: 12, volume: 50)
    }
    
    // ✏️ Für jede Art von Obst eine Note auf einem anderen Instrument abspielen.
    let note = randomInt(from: 0, to: 15)
    if graphic.text == "🍐" {
        playInstrument(.piano, note: note)
    } else if graphic.text == "🍊" {
        playInstrument(.electricGuitar, note: note)
    } else {
        playInstrument(.piano, note: note)
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

// Werkzeug „Musik“ erstellen und hinzufügen.
let musicTool = Tool(name: "Musik", emojiIcon: "🎼")
musicTool.onGraphicTouched = musicalGraphic(graphic:)
scene.tools.append(musicTool)
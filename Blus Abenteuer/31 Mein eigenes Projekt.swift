scene.clear()
// Verwende dein eigenes Hintergrundbild.
scene.backgroundImage = #imageLiteral(resourceName: "SpaceThePurpleFrontier@2x.png")
// Füge deinen eigenen Code zum Konfigurieren der Szene hinzu.
let blackHole = Graphic(image: #imageLiteral(resourceName: "BlackHole@2x.png"))
let x = randomDouble(from: -400, to: 400)
let y = randomDouble(from: -400, to: 400)
scene.place(blackHole, at: Point(x: x, y: y))

// Array der Grafiken in der Szene.
var graphics: [Graphic] = [Graphic]()
let maxGraphics = 200

// Wenn das Werkzeug „Luftballon“ ausgewählt ist, wird diese Funktion jedes Mal aufgerufen, wenn dein Berührungspunkt bewegt wird.
func addBalloon(touch: Touch) {
    if touch.previousPlaceDistance < 100 { return }
    
        // Durch eigenen Code ersetzen.
   
    let graphic = Graphic(text: "🎈")
    graphic.scale = randomDouble(from: 4, to: 8)
    scene.place(graphic, at: touch.position)
    graphics.append(graphic)
}

// Wenn das Werkzeug „Pop“ ausgewählt ist, wird diese Funktion jedes Mal aufgerufen, wenn du eine Grafik berührst.
func popBalloon(graphic: Graphic) {
        // Durch eigenen Code ersetzen.
   
    graphic.fadeOut(after: 1)
    playSound(.pop)
}

// Grafik durch das schwarze Loch entfernen.
func squishGraphic(graphic: Graphic) {
    graphic.moveAndRemove(to: blackHole.position, duration: randomDouble(from: 0.25, to: 2))
}

// Alle Grafiken entfernen.
func squishEm() {
    // ✏️ Von Grafik zu Grafik wechseln und jede zerquetschen.
    for graphic in graphics {
        squishGraphic(graphic: graphic)
    }
    // Einen Ton abspielen.
    playSound(.electricity)
    // Das Array mit den Grafiken leeren.
    graphics.removeAll()
}

// Die Werkzeuge ändern oder neue hinzufügen.
let balloonTool = Tool(name: "Luftballon", emojiIcon: "🎈")
balloonTool.onTouchMoved = addBalloon
scene.tools.append(balloonTool)

let popTool = Tool(name: "Pop", emojiIcon: "📌")
popTool.onGraphicTouched = popBalloon(graphic:)
scene.tools.append(popTool)

// Taste „Zerquetsch sie!“ erstellen und hinzufügen.
let squishButton = Button(name: "Zerquetsch sie!")
squishButton.onPress = squishEm
scene.button = squishButton
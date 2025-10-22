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

var gameOver = false

func doSomething(touch: Touch) {
    if !gameOver {
        for i in 1 ... randomInt(from: 1, to: 10) {
            let graphic = Graphic(text: "🎉")
            graphic.scale = randomDouble(from: 0.2, to: 8.0)
            graphic.alpha = randomDouble(from: 0.1, to: 1.0)
            graphic.rotation = randomDouble(from: 0, to: 180)
            scene.place(graphic, at: touch.position)
            graphics.append(graphic)
        }
    } else {
        if touch.previousPlaceDistance > 80 { 
            speak("Game Over!!")
        }
    }
}

func doSomethingTo(graphic: Graphic) {
    if !gameOver {
        squishGraphic(graphic: graphic)
        playSound(.pop)
    } else {
        speak("Game Over!!")
    }
}

// Grafik durch das schwarze Loch entfernen.
func squishGraphic(graphic: Graphic) {
    graphic.moveAndRemove(to: blackHole.position, duration: randomDouble(from: 0.25, to: 2))
    blackHole.scale *= 1.001
}

// Alle Grafiken entfernen.
func squishEm() {
    if !gameOver {
        // ✏️ Von Grafik zu Grafik wechseln und jede zerquetschen.
        for graphic in graphics {
            squishGraphic(graphic: graphic)
        }
        // Einen Ton abspielen.
        playSound(.electricity)
        // Das Array mit den Grafiken leeren.
        graphics.removeAll()
        if blackHole.scale > 15 {
            playSound(.warp)
            gameOver = true
            let graphic1 = Graphic(text: "Game Over")
            graphic1.fontName = .chalkduster
            graphic1.fontSize = 60
            graphic1.textColor = #colorLiteral(red: 0.5725490451, green: 0, blue: 0.2313725501, alpha: 1)
            graphic1.rotation = 10
            scene.place(graphic1, at: blackHole.position)
            speak("Game Over")
        }
    } else {
        speak("Game Over!!!")
    }
}

// Die Werkzeuge ändern oder neue hinzufügen.
let tool1 = Tool(name: "Überraschung", emojiIcon: "🎉")
tool1.onTouchMoved = doSomething(touch:)
scene.tools.append(tool1)

let tool2 = Tool(name: "Zerstören", emojiIcon: "💥")
tool2.onGraphicTouched = doSomethingTo(graphic:)
scene.tools.append(tool2)

// Namen der Taste ändern.
// Taste „Zerquetsch sie!“ erstellen und hinzufügen.
let squishButton = Button(name: "Zerstöre sie!")
squishButton.onPress = squishEm
scene.button = squishButton
scene.clear()
scene.backgroundImage = #imageLiteral(resourceName: "SpaceTheBlueFrontier@2x.png")
let emoji = "🎾🏐"
// Array der Grafiken in der Szene.
var graphics: [Graphic] = []
let center = Point(x: 0, y: 0)
var previousPosition = center

let numberOfGraphics = 500

// Hypotrochoidenparameter:
// Radius des äußeren Kreises.
var r1 = 100.0
// Geringster Wert für r1.
let r1Min = 200.0
// Höchster Wert für r1.
let r1Max = 400.0

// Radius des inneren Kreises.
var r2 = 100.0
// Geringster Wert für r2.
let r2Min = 50.0
// Höchster Wert für r2.
let r2Max = 100.0

// Die Entfernung des Punkts vom Mittelpunkt des inneren Kreises geteilt durch den Radius (r2) des inneren Kreises.
var d = 1.0
// Geringster Wert für d.
let dMin = 0.5
// Höchster Wert für d.
let dMax = 2.0

// Platziert eine neue Auswahl an Emoji-Grafiken in der Mitte der Szene.
func placeGraphics() {
    if scene.graphics.count != 0 { return }
    graphics = []
    var index = 0
    let emojiCharacters = emoji.componentsByCharacter()
    for i in 0..<numberOfGraphics {
        let graphic = Graphic(text: emojiCharacters[index])
        scene.place(graphic, at: center)
        graphics.append(graphic)
        index += 1
        if index == emojiCharacters.count {
            index = 0
        }
    }
}

// Bewegt die Grafiken in ein Hyptrochoidenmuster.
func randomPattern() {
    placeGraphics()
    // Zufällige Werte für die Hypotrochoidenparameter abrufen.
    r1 = randomDouble(from: r1Min, to: r1Max)
    r2 = randomDouble(from: r2Min, to: r2Max)
    d = randomDouble(from: dMin, to: dMax)
    // Ein Array aus Zählpunkten in einem Hypotrochoidenmuster abrufen.
    let points = scene.hypotrochoidPoints(r1: r1, r2: r2, d: d, count: graphics.count)
    // Eine zufällige Zeit abrufen, um die Grafiken an ihre neuen Positionen zu bewegen.
    let seconds = randomDouble(from: 0.25, to: 2.0)
    // Einen zufälligen Winkel abrufen, um den alle Grafiken gedreht werden.
    let rotation = randomDouble(from: -360, to: 360)
    // Die Grafiken an ihre neuen Positionen animieren.
    for i in 0..<graphics.count {
        graphics[i].move(to: points[i], duration: seconds)
        graphics[i].scale = 1.5
        graphics[i].rotation = rotation
    }
}

// Bewegt die Grafiken in ein Hyptrochoidenmuster, wobei die Grafiken skaliert werden.
func randomScaledPattern() {
    placeGraphics()
    // Zufällige Werte für die Hypotrochoidenparameter abrufen.
    r1 = randomDouble(from: r1Min, to: r1Max)
    r2 = randomDouble(from: r2Min, to: r2Max)
    d = randomDouble(from: dMin, to: dMax)
    // Ein Array aus Zählpunkten in einem Hypotrochoidenmuster abrufen.
    let points = scene.hypotrochoidPoints(r1: r1, r2: r2, d: d, count: graphics.count)
    // Eine zufällige Zeit abrufen, um die Grafiken an ihre neuen Positionen zu bewegen.
    let seconds = randomDouble(from: 0.25, to: 2.0)
    // Einen zufälligen Winkel abrufen, um den alle Grafiken gedreht werden.
    let rotation = randomDouble(from: -360, to: 360)
    // Die Grafiken an ihre neuen Positionen animieren.
    var scale = 0.5
    for i in 0..<graphics.count {
        let point = Point(x: points[i].x * scale, y: points[i].y * scale)
        graphics[i].move(to: point, duration: seconds)
        graphics[i].scale = 2.5
        graphics[i].rotation = rotation
        scale += 0.0005
    }
}

// Anfangs alle Grafiken in der Mitte platzieren.
placeGraphics()

// Taste „Zufall“ erstellen und hinzufügen.
let button = Button(name: "Zufall")
button.onPress = randomScaledPattern
scene.button = button
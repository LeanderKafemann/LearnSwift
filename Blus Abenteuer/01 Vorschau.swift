// Zeichnen: Wenn du das Werkzeug berührst und bewegst, wird diese Funktion bei jeder Bewegung des Berührungspunkts aufgerufen und ein Emoji zu deiner Szene hinzugefügt.
func addEmoji(touch: Touch) {
    if touch.previousPlaceDistance < 100 { return }
    let characters = emoji.componentsByCharacter()
    let graphic = Graphic(text: characters.randomItem)
    scene.place(graphic, at: touch.position)
}

// Kaleidoskop: Wenn du das Werkzeug berührst und bewegst, wird diese Funktion bei jeder Bewegung des Berührungspunkts aufgerufen und ein Emoji in symmetrischen Mustern zu deiner Szene hinzugefügt.
func addKaleidoImage(touch: Touch) {
    let characters = emoji.componentsByCharacter()
    // Grafiken in der Szene verteilen.
    let placeDistance = touch.position.distance(from: lastPlacePosition)
    if placeDistance < 80 { return }
    lastPlacePosition = touch.position
    // Grafiken für jeden Quadranten erstellen und zu einem Array hinzufügen.
    var graphics: [Graphic] = []
    for i in 0 ..< 4 {
        let graphic = Graphic(text: characters.randomItem)
        graphics.append(graphic)
    }
    // Die absoluten x- und y-Werte abrufen.
    let x = abs(touch.position.x)
    let y = abs(touch.position.y)
    // Eine Grafik in jedem Quadranten positionieren.
    let position1 = Point(x: x, y: y)
    scene.place(graphics[0], at: position1)
    let position2 = Point(x: x, y: -y)
    scene.place(graphics[1], at: position2)
    let position3 = Point(x: -x, y: -y)
    scene.place(graphics[2], at: position3)
    let position4 = Point(x: -x, y: y)
    scene.place(graphics[3], at: position4)
}

// Wiedergabe: Beim Berühren eines Emojis wird diese Funktion aufgerufen, um eine Note auf dem Kosmosschlagzeug wiederzugeben.
func playNote(graphic: Graphic) {
    // Anzahl der Noten.
    let noteSteps = 16
    // Entfernung von der Mitte 0,0 - 1,0.
    let center = Point(x: 0, y: 0)
    let distance = graphic.distance(from: center) / 707.0
    // Die Entfernung in den nächsten Noten-Int-Wert übersetzen.
    let note = (1.0 - distance) * noteSteps
    // Alpha in einen Lautstärkewert übersetzen.
    let volume = graphic.alpha * 100.0
    // Die Note spielen.
    playInstrument(.cosmicDrums, note: note, volume: volume)
}

// Hallo: Beim Berühren eines Emojis wird diese Funktion aufgerufen, um einen Ton oder eine Sprachausgabe zu erzeugen.
func sayHello(graphic: Graphic) {
    // Die Aktion anhand des Emojis entscheiden.
    switch graphic.text {
    case "🌕":
        speak("Planet „Stinkkäse“.")
    case "🎾":
        playSound(.tennis)
    case "⚾️":
        playSound(.wap)
    case "🌍":
        speak("Blauer Planet.")
    case "⚽️":
        speak("Planet „Fußball“.")
    default:
        speak(graphic.text)
    }
}

// Bis bald: Beim Berühren eines Emojis wird diese Funktion aufgerufen, um eine Grafik verschwinden zu lassen.
func fadeAway(graphic: Graphic) {
    playSound(.tumble)
    let sinkHole = Point(x: graphic.position.x, y: -800)
    graphic.moveAndRemove(to: sinkHole, duration: 2.5)
    graphic.fadeOut(after: 2.0)
}

// Astrodance: Wenn du auf diese Taste drückst, ordnet die Funktion die Emojis in hübschen Mustern an.
func dance() {
    // Die Anzahl der Tänzer begrenzen.
    let maximumNumberOfDancers = 500
    let actualNumberOfDancers = min(numberOfDancers, maximumNumberOfDancers)
    // Die Tänzer (falls erforderlich) in der Szene platzieren.
    if scene.graphics.count != actualNumberOfDancers {
        scene.clear()
        dancers = []
        var index = 0
        let emojiCharacters = emoji.componentsByCharacter()
        for i in 0..<actualNumberOfDancers {
            let dancer = Graphic(text: emojiCharacters[index])
            scene.place(dancer, at: center)
            dancers.append(dancer)
            index += 1
            if index == emojiCharacters.count {
                index = 0
            }
        }
    }
    // Ein neues Muster abrufen.
    let pattern = randomInt(from: 1, to: 3)
    // Die Tänzer neu anordnen.
    rearrange(dancers: dancers, pattern: pattern, instrument: .cosmicDrums)
}

// Die Tänzer begleitet von einem Instrument zu einem Muster umgruppieren.
func rearrange(dancers: [Graphic], pattern: Int, instrument: Instrument.Kind) {
    
    var points = [Point]()
    var note = 5
    
    // Mit allen Punkten in der Mitte beginnen.
    for i in 0..<dancers.count {
        points.append(center)
    }
    
    // In Abhängigkeit vom Muster einen neuen Satz Punkte abrufen:
    // Muster 0: Punkte in der Mitte.
    // Muster 1: Punkte in einem Kreis.
    if pattern == 1 {
        let radius = randomDouble(from: 100, to: 450)
        points = scene.circlePoints(radius: radius, count: dancers.count)
        note = 14
    }
    // Muster 3: Punkte in einer Spirale.
    if pattern == 2 {
        let spacing = randomDouble(from: 50, to: 200)
        points = scene.spiralPoints(spacing: spacing, count: dancers.count)
        note = 10
    }
    // Muster 4: Hypotrochoide.
    if pattern == 3 {
        let r1 = randomDouble(from: 200.0, to: 400.0)
        let r2 = randomDouble(from: 50.0, to: 100.0)
        let d = randomDouble(from: 0.5, to: 2.0)
        points = scene.hypotrochoidPoints(r1: r1, r2: r2, d: d, count: dancers.count)
        note = 12
    }

    // Alle Punkte um zufällige x- und y-Werte verschieben.
    let dx = randomDouble(from: -250, to: 250)
    let dy = randomDouble(from: -250, to: 250)
    
    for i in 0..<dancers.count {
        points[i].x += dx
        points[i].y += dy
    }

    // Zufällige Werte abrufen.
    let duration = randomDouble(from: 0.25, to: 2.0)
    let rotation = randomDouble(from: -360, to: 360)
    
    // Tänzer an ihre neuen Positionen animieren.
    for i in 0..<dancers.count {
        dancers[i].move(to: points[i], duration: duration)
        // Basierend auf dem Abstand zur Mitte skalieren.
        let distance = points[i].distance(from: center) / 707.0
        dancers[i].scale = 0.25 + (distance * 2.0)
        dancers[i].rotation = rotation
    }
    
    // Eine Note auf dem Instrument spielen.
    playInstrument(instrument, note: note, volume: 50)
}

// Taste „Zeichnen“ erstellen und hinzufügen.
let emojiTool = Tool(name: "Zeichnen", emojiIcon: "🖌")
emojiTool.onTouchMoved = addEmoji(touch:)
scene.tools.append(emojiTool)

// Taste „Kaleido“ erstellen und hinzufügen.
let kaleidoTool = Tool(name: "Kaleido", emojiIcon: "❄️")
kaleidoTool.onTouchMoved = addKaleidoImage(touch:)
scene.tools.append(kaleidoTool)

// Taste „Wiedergabe“ erstellen und hinzufügen.
let playTool = Tool(name: "Wiedergabe", emojiIcon: "🎶")
playTool.onGraphicTouched = playNote(graphic:)
scene.tools.append(playTool)

// Taste „Hallo“ erstellen und hinzufügen.
let helloTool = Tool(name: "Hallo", emojiIcon: "🗣")
helloTool.onGraphicTouched = sayHello(graphic:)
scene.tools.append(helloTool)

// Taste „Bis bald“ erstellen und hinzufügen.
let goodbyeTool = Tool(name: "Bis bald", emojiIcon: "⚡️")
goodbyeTool.onGraphicTouched = fadeAway(graphic:)
scene.tools.append(goodbyeTool)

// Die Taste „Tanzen“ erstellen und einbinden.
let danceButton = Button(name: "Astrodance")
danceButton.onPress = dance
scene.button = danceButton
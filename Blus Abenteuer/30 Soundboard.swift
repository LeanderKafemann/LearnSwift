let theOrigin = Point(x: 0, y: 0)

// Die Lautstärke einer Grafik von 0.0 (still) auf 1.0 (maximal) festlegen.
func setVolume(graphic: Graphic, volume: Number) {
    graphic.alpha = volume
    graphic.scale = volume * 3.0
}

// Instrumentengrafik zur Szene hinzufügen.
func addInstrument(emoji: String, touch: Touch) {
    if touch.previousPlaceDistance < 60 { return }
    let graphic = Graphic(text: emoji)
    scene.place(graphic, at: touch.position)
    // Lautstärke auf 80 % stellen
    setVolume(graphic: graphic, volume: 0.8)
}

// Ereignishandler für das Werkzeug „Klavier“.
func addPiano(touch: Touch) {
    addInstrument(emoji: "🎹", touch: touch)
}

// Ereignishandler für das Werkzeug „Gitarre“.
func addGuitar(touch: Touch) {
    addInstrument(emoji: "🎸", touch: touch)
}

// Ereignishandler für das Werkzeug „Kosmosschlagzeug“.
func addCosmicDrums(touch: Touch) {
    addInstrument(emoji: "🔮", touch: touch)
}

// Anzahl der Noten.
let noteSteps = 16

// Ereignishandler für das Werkzeug „Wiedergabe“.
func playInstrument(graphic: Graphic) {
    
    // Entfernung von der Mitte 0,0 - 1,0.
    let distance = graphic.distance(from: theOrigin) / 707.0
    
    // Die Entfernung in den nächsten Noten-Int-Wert übersetzen.
    let note = (1.0 - distance) * noteSteps
    
    // Alpha in einen Lautstärkewert übersetzen.
    let volume = graphic.alpha * 100.0
    
    // Note mit Instrument spielen.
    if graphic.text == "🎹" {
        playInstrument(.piano, note: note, volume: volume)
    }
    
    if graphic.text == "🎸" {
        playInstrument(.electricGuitar, note: note, volume: volume)
    }
    
    if graphic.text == "🔮" {
        playInstrument(.cosmicDrums, note: note, volume: volume)
    }
}

// Ereignishandler für höhere Lautstärke.
func volumeUp(graphic: Graphic) {
    var volume = graphic.alpha + 0.2
    if volume > 1.0 {
        volume = 1.0
    }
    setVolume(graphic: graphic, volume: volume)
}

// Ereignishandler für geringere Lautstärke.
func volumeDown(graphic: Graphic) {
    var volume = graphic.alpha - 0.2
    if volume < 0.4 {
        volume = 0.4
    }
    setVolume(graphic: graphic, volume: volume)
}

// Instrumentenwerkzeuge erstellen.
let pianoTool = Tool(name: "Klavier", emojiIcon: "🎹")
pianoTool.onTouchMoved = addPiano(touch:)
let guitarTool = Tool(name: "Gitarre", emojiIcon: "🎸")
guitarTool.onTouchMoved = addGuitar(touch:)
let cosmicDrumsTool = Tool(name: "Kosmisch", emojiIcon: "🔮")
cosmicDrumsTool.onTouchMoved = addCosmicDrums(touch:)

// Instrumentenwerkzeuge hinzufügen.
scene.tools.append(pianoTool)
scene.tools.append(guitarTool)
scene.tools.append(cosmicDrumsTool)

// Werkzeug „Wiedergabe“ erstellen und hinzufügen.
let playTool = Tool(name: "Wiedergabe", emojiIcon: "👇")
playTool.onGraphicTouched = playInstrument(graphic:)
scene.tools.append(playTool)

// Lautstärkewerkzeuge erstellen und hinzufügen.
let volumeUpTool = Tool(name: "➕", emojiIcon: "")
volumeUpTool.onGraphicTouched = volumeUp(graphic:)
scene.tools.append(volumeUpTool)
let volumeDownTool = Tool(name: "➖", emojiIcon: "")
volumeDownTool.onGraphicTouched = volumeDown(graphic:)
scene.tools.append(volumeDownTool)
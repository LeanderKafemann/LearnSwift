scene.clear()
scene.backgroundImage = #imageLiteral(resourceName: "SpaceThePurpleFrontier@2x.png")
let theOrigin = Point(x: 0, y: 0)

// Position der zuletzt gespielten Note.
var lastNotePosition = theOrigin
// Anzahl der verfügbaren Noten.
let numberOfNotes = 16
// Maximale Lautstärke.
let maxVolume = 100
// Minimaler Abstand zwischen Noten.
let minimumDistance = 100

// Ereignishandler für das Werkzeug „Klavier“.
func playInstrument(touch: Touch) {
    
    // Die Grafiken in der Szene verteilen.
    if touch.numberOfObjectsPlaced > 0 {
        let distanceFromLastNote = touch.position.distance(from: lastNotePosition)
        if distanceFromLastNote < minimumDistance { return }
    }
    // Die letzte Position sichern.
    lastNotePosition = touch.position
    
    // Rechnet die x- und y-Werte der Berührungskoordinaten auf das Intervall von 0 bis 1 um.
    let normalizedXPosition = (touch.position.x + 500) / 1000
    let normalizedYPosition = (touch.position.y + 500) / 1000
    
    // Die Note hängt von der x-Position ab.
    let note = normalizedXPosition * (numberOfNotes - 1)
    // Die Lautstärke hängt von der y-Position ab.
    let volume = normalizedYPosition * maxVolume
    
    // Die Note spielen.
    playInstrument(.piano, note: note, volume: volume)
    
    // Eine Grafik für die Note platzieren.
    let graphic = Graphic(text: "❄️")
    scene.place(graphic, at: touch.position)
    // Die Skalierung hängt von der Lautstärke ab.
    graphic.scale = volume / 10
    // Die Grafik nach einer kurzen Zeit ausblenden.
    graphic.fadeOut(after: 1.5)
}

// Werkzeug „Wiedergabe“ erstellen und hinzufügen.
let playTool = Tool(name: "Wiedergabe", emojiIcon: "🎹")
playTool.onTouchMoved = playInstrument(touch:)
scene.tools.append(playTool)

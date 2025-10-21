let emoji = "✨🌝🔦💫👀☄️🌎"
// ✏️ Emojis in ein Array aus Einzelzeichen-Strings aufspalten.
let emojis = emoji.componentsByCharacter()
// Per Index zum nächsten Objekt im Charakter-Array.
var index = 0

func addText(touch: Touch) {
    if touch.previousPlaceDistance < 80 { return }
    var chosenEmoji = emojis[index]
    // Eine Grafik aus dem ausgewählten Emoji erstellen.
    let graphic = Graphic(text: chosenEmoji)
    // ✏️ Index erhöhen, um auf nächstes Element zu verweisen.
    index += 1
    // ✏️ Den Index zurücksetzen, wenn er das Ende des Arrays erreicht.
    if index == emojis.count {
        index = 0
    }
    // `scale` und `rotation` festlegen.
    graphic.scale = 1.5
    graphic.rotation = randomDouble(from: 0.0, to: 180)
    scene.place(graphic, at: touch.position)
}
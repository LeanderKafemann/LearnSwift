// Die Szene leeren.
scene.clear()
// Verwende dein eigenes Hintergrundbild.
scene.backgroundImage = #imageLiteral(resourceName: "SpaceThePurpleFrontier@2x.png")
// Füge deinen eigenen Code zum Konfigurieren der Szene hinzu.
let animals = [#imageLiteral(resourceName: "horse@2x.png"), #imageLiteral(resourceName: "elephant@2x.png"), #imageLiteral(resourceName: "panda@2x.png"), #imageLiteral(resourceName: "pig@2x.png"), #imageLiteral(resourceName: "frog@2x.png"), #imageLiteral(resourceName: "snail@2x.png")]

// Wenn das Werkzeug „Bild“ ausgewählt ist, wird diese Funktion jedes Mal aufgerufen, wenn dein Berührungspunkt bewegt wird.
func addImage(touch: Touch) {
    if touch.previousPlaceDistance < 50 { return }
    
    // ✏️ Durch eigenen Code ersetzen.
    let im = animals.randomItem
    let scale = randomDouble(from: 0.2, to: 4.0)
    let rotation = randomDouble(from: 0, to: 180)
    
    let graphic = Graphic(image: im)
    graphic.scale = scale
    graphic.rotation = rotation
    scene.place(graphic, at: touch.position)
    
    let secondGraphic = Graphic(image: im)
    secondGraphic.scale = scale
    secondGraphic.rotation = -abs(rotation)
    scene.place(secondGraphic, at: Point(x: touch.position.x, y: -abs(touch.position.y)))
    
    graphic.move(to: Point(x: touch.position.x, y: 0), duration: 2.0)
    secondGraphic.move(to: Point(x: touch.position.x, y: 0), duration: 1.5)
    graphic.swirlAway(after: randomDouble(from: 4, to: 7))
    secondGraphic.swirlAway(after: randomDouble(from: 4, to: 7))
}

let emoji = "😺🚗🎃🚕🤢🚙"
// Emojis in ein Array aus Einzelzeichen-Strings aufspalten.
let characters = emoji.componentsByCharacter()
// Per Index zum nächsten Charakter.
var index = 0

// Wenn das Werkzeug „Text“ ausgewählt ist, wird diese Funktion jedes Mal aufgerufen, wenn dein Berührungspunkt bewegt wird.
func addText(touch: Touch) {
    if touch.previousPlaceDistance < 80 { return }
    
    // ✏️ Durch eigenen Code ersetzen.
    let graphic = Graphic(text: characters[index])
    graphic.scale = 2.5
    scene.place(graphic, at: touch.position)
    graphic.fadeOut(after: randomDouble(from: 1, to: 4))
    
    index += 1
    if index == characters.count {
        index = 0
    }
}
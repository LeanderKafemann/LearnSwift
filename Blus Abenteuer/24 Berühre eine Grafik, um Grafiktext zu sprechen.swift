// Den Text der Grafik sprechen.
func speakText(graphic: Graphic) {
    speak(graphic.text)
}

// Wenn das Werkzeug „Obst“ ausgewählt ist, wird diese Funktion jedes Mal aufgerufen, wenn dein Berührungspunkt bewegt wird.
func addFruit(touch: Touch) {
    if touch.previousPlaceDistance < 60 { return }
    let fruit = "🍏🍐🍊🍋🍉🍒🍓🍌".componentsByCharacter()
    let graphic = Graphic(text: fruit.randomItem)
    scene.place(graphic, at: touch.position)
    graphic.scale = 1.5
}

// Wenn das Werkzeug „Begrüßung“ ausgewählt ist, wird diese Funktion jedes Mal aufgerufen, wenn dein Berührungspunkt bewegt wird.
func addGreeting(touch: Touch) {
    if touch.previousPlaceDistance < 60 { return }
    let greetings = ["Hallo!", "Hallo", "hi", "Ciao", "Jo!", "Hey!", "Was gibt's?"]
    let greeting = greetings.randomItem
    let graphic = Graphic(text: greeting)
    graphic.textColor = #colorLiteral(red: 0.9686274529, green: 0.78039217, blue: 0.3450980484, alpha: 1)
    graphic.fontName = .chalkduster
    scene.place(graphic, at: touch.position)
    graphic.rotation = randomDouble(from: -30, to: 30)
}

// Werkzeug „Obst“ erstellen und hinzufügen.
let fruitTool = Tool(name: "Obst", emojiIcon: "🍒")
fruitTool.onTouchMoved = addFruit(touch:)
scene.tools.append(fruitTool)

// Werkzeug „Begrüßung“ erstellen und hinzufügen.
let greetingTool = Tool(name: "Begrüßung", emojiIcon: "🙏")
greetingTool.onTouchMoved = addGreeting(touch:)
scene.tools.append(greetingTool)

// ✏️ Werkzeug „Sprechen“ erstellen und hinzufügen.
let speakTool = Tool(name: "Sprechen", emojiIcon: "📢")
speakTool.onGraphicTouched = speakText(graphic:)
scene.tools.append(speakTool)

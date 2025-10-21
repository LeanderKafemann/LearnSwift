func addFruit(touch: Touch) {
    if touch.previousPlaceDistance < 60 { return }
    let fruit = "🍏🍐🍊🍋🍉🍒🍓🍌".componentsByCharacter()
    let graphic = Graphic(text: fruit.randomItem)
    scene.place(graphic, at: touch.position)
    graphic.scale = randomDouble(from: 0.5, to: 2.0)
}

func addSwirlingAlien(touch: Touch) {
    if touch.previousPlaceDistance < 60 { return }
    let graphic = Graphic(image: #imageLiteral(resourceName: "alien@2x.png"))
    scene.place(graphic, at: touch.position)
    graphic.swirlAway(after: 2.5)
}

func addGreeting(touch: Touch) {
    if touch.previousPlaceDistance < 60 { return }
    let greetings = ["Hallo", "Hallo", "hi", "Guten Tag"]
    let greeting = greetings.randomItem
    let graphic = Graphic(text: greeting)
    graphic.textColor = #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)
    graphic.fontName = .chalkduster
    scene.place(graphic, at: touch.position)
    graphic.rotation = randomDouble(from: -30.0, to: 30.0)
}

// ✏️ Werkzeug „Obst“ erstellen und hinzufügen.
let fruitTool = Tool(name: "Obst", emojiIcon: "🍉")
fruitTool.onTouchMoved = addFruit(touch:)
scene.tools.append(fruitTool)

// ✏️ Werkzeug „Alien“ erstellen und hinzufügen.
let alienTool = Tool(name: "Alien", emojiIcon: "👽")
alienTool.onTouchMoved = addSwirlingAlien(touch:)
scene.tools.append(alienTool)

// ✏️ Werkzeug „Begrüßung“ erstellen und hinzufügen.
let greetingTool = Tool(name: "Begrüßung", emojiIcon: "👋")
greetingTool.onTouchMoved = addGreeting(touch:)
scene.tools.append(greetingTool)
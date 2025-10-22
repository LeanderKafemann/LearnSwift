scene.clear()
scene.backgroundImage = #imageLiteral(resourceName: "SpaceTheBlueFrontier@2x.png")
// Dies ist die Position, die zuletzt berührt wurde.
var lastTouchPosition = Point(x: 0, y: 0)

// Beim Berühren und Bewegen werden Emojis gezeichnet.
var drawIndex = 0
func draw(touch: Touch) {
    // Emoji, mit dem gezeichnet wird.
    let emoji = "🌏🌕🎾"
    // Die Grafiken in der Szene verteilen.
    let distance = touch.position.distance(from: lastTouchPosition)
    if distance < 20 { return }
    lastTouchPosition = touch.position
    // Das nächste Emoji zum Platzieren einer Grafik an der Berührungsposition verwenden.
    let emojiCharacters = emoji.componentsByCharacter()
    let graphic = Graphic(text: emojiCharacters[drawIndex])
    scene.place(graphic, at: touch.position)
    // Die Grafik skalieren.
    graphic.scale = 1.5
    // drawIndex auf den nächsten Emoji-Charakter verweisen.
    drawIndex += 1
    // drawIndex zurücksetzen, wenn das Ende des Arrays erreicht wurde.
    if drawIndex >= emojiCharacters.count {
        drawIndex = 0
    }
}

// Beim Berühren und Bewegen werden verwehte Emojis gezeichnet.
var driftIndex = 0
var driftCount = 0
func driftDraw(touch: Touch) {
    // Emoji, mit dem gezeichnet wird.
    let emoji = "☣️㊙️"
    // Die Grafiken in der Szene verteilen.
    let distance = touch.position.distance(from: lastTouchPosition)
    if distance < 20 { return }
    lastTouchPosition = touch.position
    // Das nächste Emoji zum Platzieren einer Grafik an der Berührungsposition verwenden.
    let emojiCharacters = emoji.componentsByCharacter()
    let graphic = Graphic(text: emojiCharacters[driftIndex])
    scene.place(graphic, at: touch.position)
    // Kreise in Abhängigkeit von der Anzahl der platzierten Grafiken zwischen 0.0 und maxScale skalieren.
    let maxScale = 2.5
    graphic.scale = maxScale * cycleValue(n: driftCount)
    driftCount += 1
    // driftIndex auf den nächsten Emoji-Charakter verweisen.
    driftIndex += 1
    // driftIndex zurücksetzen, wenn das Ende des Arrays erreicht wurde.
    if driftIndex >= emojiCharacters.count {
        driftIndex = 0
    }
}

// Beim Berühren und Bewegen werden wirbelnde Emojis gezeichnet.
var swirlIndex = 0
var swirlCount = 0
func swirlDraw(touch: Touch) {
    // Emoji, mit dem gezeichnet wird.
    let emoji = "🌼🌸🌺"
    // Die Grafiken in der Szene verteilen.
    let distance = touch.position.distance(from: lastTouchPosition)
    if distance < 5 { return }
    lastTouchPosition = touch.position
    // Das nächste Emoji zum Platzieren einer Grafik verwenden.
    let emojiCharacters = emoji.componentsByCharacter()
    let graphic = Graphic(text: emojiCharacters[swirlIndex])
    // Kreise in Abhängigkeit von der Anzahl der platzierten Grafiken um die Berührungsposition positionieren.
    var position = touch.position
    let offset = cycleOffset(n: swirlCount)
    swirlCount += 1
    let radius = 60.0
    position.x += offset.x * radius
    position.y += offset.y * radius
    // Eine Grafik an der berechneten Position platzieren.
    scene.place(graphic, at: position)
    // Die Grafik skalieren.
    graphic.scale = 0.75
    // swirlIndex auf den nächsten Emoji-Charakter verweisen.
    swirlIndex += 1
    // swirlIndex zurücksetzen, wenn das Ende des Arrays erreicht wurde.
    if swirlIndex >= emojiCharacters.count {
        swirlIndex = 0
    }
}

// Beim Berühren und Bewegen werden Spiegeleier gezeichnet.
func friedEgg(touch: Touch) {
    // Die Eier in der Szene verteilen.
    let distance = touch.position.distance(from: lastTouchPosition)
    if distance < 40 { return }
    lastTouchPosition = touch.position
    // Das Eiweiß platzieren.
    let white = Graphic(text: "⚪️")
    scene.place(white, at: touch.position)
    // Das Eiweiß skalieren.
    white.scale = 2.0
    // Das Eiweiß ein wenig blasser machen.
    white.alpha = 0.8
    // Das Eigelb platzieren.
    let yolk = Graphic(text: "😶")
    scene.place(yolk, at: touch.position)
    // Das Eigelb um einen zufälligen Winkel drehen.
    yolk.rotation = randomDouble(from: -180.0, to: 180.0)
    // Das Eigelb skalieren.
    yolk.scale = 1.0
}

// Lässt eine Grafik verblassen, wenn du sie berührst.
func fade(graphic: Graphic) {
    graphic.alpha -= 0.1
}

// Rotiert eine Grafik, wenn du sie berührst.
func rotate(graphic: Graphic) {
    graphic.rotation += 45.0
}

// Vergrößert eine Grafik, wenn du sie berührst.
func scaleUp(graphic: Graphic) {
    graphic.scale *= 1.5
}

// Verkleinert eine Grafik, wenn du sie berührst.
func scaleDown(graphic: Graphic) {
    graphic.scale *= 1.0 / 1.5
}

// Füllt die ganze Szene mit einem Raster aus Emojis.
func fillScene(emoji: String, scale: Double) {
    let emojiCharacters = emoji.componentsByCharacter()
    var index = 0
    // Zählpunkte in einem Raster der Größe size * size abrufen.
    let points = scene.gridPoints(size: 925, count: 256)
    // Eine Grafik aus jedem Block erstellen und dann platzieren.
    for point in points {
        let graphic = Graphic(text: emojiCharacters[index])
        scene.place(graphic, at: point)
        // Die Grafik skalieren.
        graphic.scale = scale
        // Der Index verweist auf den nächsten Emoji-Charakter.
        index += 1
        // Den Index zurücksetzen, wenn er das Ende des Arrays erreicht.
        if index == emojiCharacters.count {
            index = 0
        }
    }
}

// Diese Funktion wird beim Drücken auf die Taste „Füllen“ aufgerufen.
func fill() {
    scene.clear()
    // Die Szene mit Emojis füllen.
    fillScene(emoji: "🌲🌳🌴", scale: 1.0)
    // Eine der Grafiken in ein anderes Emoji ändern.
    let n = randomInt(from: 0, to: scene.graphics.count - 1)
    scene.graphics[n].text = "🍏"
}

// Werkzeug „Zeichnen“ erstellen und hinzufügen.
let drawTool = Tool(name: "Zeichnen", emojiIcon: "🌍")
drawTool.onTouchMoved = draw(touch:)
scene.tools.append(drawTool)

// Werkzeug „Verwehen“ erstellen und hinzufügen.
let driftTool = Tool(name: "Verwehen", emojiIcon: "㊙️")
driftTool.onTouchMoved = driftDraw(touch:)
scene.tools.append(driftTool)

// Werkzeug „Wirbeln“ erstellen und hinzufügen.
let swirlTool = Tool(name: "Wirbeln", emojiIcon: "🌼")
swirlTool.onTouchMoved = swirlDraw(touch:)
scene.tools.append(swirlTool)

// Werkzeug „Spiegelei“ erstellen und hinzufügen.
let friedEggTool = Tool(name: "Spiegelei", emojiIcon: "🍳")
friedEggTool.onTouchMoved = friedEgg(touch:)
scene.tools.append(friedEggTool)

// Werkzeug „Verblassen“ erstellen und hinzufügen.
let fadeDownTool = Tool(name: "Verbl.", emojiIcon: "⛅️")
fadeDownTool.onGraphicTouched = fade(graphic:)
scene.tools.append(fadeDownTool)

// Werkzeug „Größer“ erstellen und hinzufügen.
let scaleUpTool = Tool(name: "Größer", emojiIcon: "➕")
scaleUpTool.onGraphicTouched = scaleUp(graphic:)
scene.tools.append(scaleUpTool)

// Werkzeug „Kleiner“ erstellen und hinzufügen.
let scaleDownTool = Tool(name: "Kleiner", emojiIcon: "➖")
scaleDownTool.onGraphicTouched = scaleDown(graphic:)
scene.tools.append(scaleDownTool)

// Taste „Füllen“ erstellen und hinzufügen.
let fillButton = Button(name: "Füllen")
fillButton.onPress = fill
scene.button = fillButton
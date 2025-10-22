scene.clear()
scene.backgroundImage = #imageLiteral(resourceName: "SpaceThePurpleFrontier@2x.png")
let center = Point(x: 0, y: 0)
// Emoji-Tänzer.
let emoji = "❤️💛💚💙💜"
// Array der Tänzer in der Szene.
var dancers: [Graphic] = []

// Die Tänzer erstellen.
func createDancers() {
    var index = 0
    dancers = []
    let emojiCharacters = emoji.componentsByCharacter()
    for i in 0..<100 {
        let dancer = Graphic(text: emojiCharacters[index])
        scene.place(dancer, at: center)
        dancers.append(dancer)
        index += 1
        if index == emojiCharacters.count {
            index = 0
        }
    }
}

// Folge von Tanzbewegungen.
let danceMoves = [
    DanceMove(pattern: 7, note: 10, x: 0, y: 0),
    DanceMove(pattern: 8, note: 9, x: 80, y: 80),
    DanceMove(pattern: 4, note: 5, x: -100, y: 100),
    DanceMove(pattern: 5, note: 6, x: -120, y: -120),
    DanceMove(pattern: 3, note: 1, x: 140, y: -140),
    DanceMove(pattern: 1, note: 12, x: 160, y: 160),
    DanceMove(pattern: 2, note: 7, x: -180, y: 180),
    DanceMove(pattern: 9, note: 8, x: 0, y: 0),
    DanceMove(pattern: 0, note: 4, x: 0, y: 0)
]

// Tänzer für eine Tanzbewegung umgruppieren.
func rearrange(graphics: [Graphic], index: Int) {
    if index >= danceMoves.count { return }
    
    // Nächste Bewegung abrufen.
    let danceMove = danceMoves[index]
    
    // Mit allen Punkten in der Mitte beginnen.
    var points = [Point]()
    for i in 0..<graphics.count {
        points.append(center)
    }
    
    // Standardwerte.
    var scale = 0.5
    var rotation = 0.0
    var twist = 0.0
    
    // Punkte aus einem Muster abrufen:
    
    // 0: Alle in der Mitte.
    if danceMove.pattern == 0 {
        // In der Mitte verschwinden.
    }
    // 1: Zufälliger Kreis.
    if danceMove.pattern == 1 {
        let radius = randomDouble(from: 100, to: 300)
        points = scene.circlePoints(radius: radius, count: graphics.count)
        twist = 2.0
    }
    // 2: Kleiner Kreis.
    if danceMove.pattern == 2 {
        points = scene.circlePoints(radius: 50, count: graphics.count)
        scale = 0.5
        twist = 4.0
    }
    // 3: Größerer Kreis.
    if danceMove.pattern == 3 {
        points = scene.circlePoints(radius: 200, count: graphics.count)
        scale = 3.0
        twist = -1.0
    }
    // 4: Zufälliges, gedrehtes Quadrat.
    if danceMove.pattern == 4 {
        let width = randomDouble(from: 400, to: 300)
        points = scene.squarePoints(width: width, count: graphics.count)
        scale = 1.0
        twist = randomDouble(from: -5.0, to: 5.0)
    }
    // 5: Zufällige Spirale.
    if danceMove.pattern == 5 {
        let spacing = randomDouble(from: 30, to: 100)
        points = scene.spiralPoints(spacing: spacing, count: graphics.count)
    }
    // 6: Gedrehte Spirale.
    if danceMove.pattern == 6 {
        points = scene.spiralPoints(spacing: 200, count: graphics.count)
        scale = 2.5
        twist = 2.5
    }
    // 7: Quadratraster.
    if danceMove.pattern == 7 {
        points = scene.gridPoints(size: 240, count: graphics.count)
        scale = 0.5
    }
    // 8: Rautenraster.
    if danceMove.pattern == 8 {
        points = scene.gridPoints(size: 300, count: graphics.count, angle: 45.0)
        scale = 0.5
    }
    // 9: Zufällige Positionen.
    if danceMove.pattern == 9 {
        for i in 0..<graphics.count {
            points[i].x = randomDouble(from: -500, to: 500)
            points[i].y = randomDouble(from: -500, to: 500)
        }
        scale = randomDouble(from: -0.25, to: 1.0)
        rotation = randomDouble(from: -360, to: 360)
        twist = 0.0
    }
    
    // An Position verschieben (außer zufällig).
    if danceMove.pattern != 9 {
        for i in 0..<graphics.count {
            points[i].x += danceMove.x
            points[i].y += danceMove.y
        }
    }
    
    // Eine zufällige Dauer für die Tanzbewegung abrufen.
    let duration = randomDouble(from: 0.25, to: 2.0)
    
    // Die Grafiken an ihre neuen Positionen animieren sowie skalieren und rotieren.
    for i in 0..<graphics.count {
        graphics[i].move(to: points[i], duration: duration)
        graphics[i].scale = scale
        graphics[i].rotation = rotation
        rotation += twist
    }
    
    // Eine Note auf dem Instrument spielen.
    playInstrument(.cosmicDrums, note: danceMove.note, volume: 50)
}

var danceIndex = 0
createDancers()

// Ereignishandler für die Taste „Tanzen“.
func dance() {
    // Die Tänzer erstellen, falls noch keine vorhanden sind.
    if scene.graphics.count == 0 {
        createDancers()
    }
    // Die Tanzbewegung ausführen.
    rearrange(graphics: dancers, index: danceIndex)
    // Bereitmachen für die nächste Tanzbewegung.
    danceIndex += 1
    if danceIndex >= danceMoves.count {
        danceIndex = 0
    }
}

// Die Taste „Tanzen“ erstellen und einbinden.
let danceButton = Button(name: "Tanzen")
danceButton.onPress = dance
scene.button = danceButton
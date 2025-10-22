scene.clear()
scene.backgroundImage = #imageLiteral(resourceName: "SpaceTheGreenFrontier@2x.png")
// Die Emojis müssen in der richtigen Reihenfolge berührt werden.
let emoji = "🥝🍭🍋🍔🍿"
// Das zu entsperrende Bild: Wähle ein eigenes.
let hiddenImage = #imageLiteral(resourceName: "Foto.png")

// Array der Zeichen des Emojis.
let keys = emoji.componentsByCharacter()
// Per Index zum nächsten richtigen Schlüssel.
var matchIndex = 0

// Endpositionen der Schlüssel konfigurieren.
var finalPositions: [Point] = []
var finalPosition = Point(x: -400, y: 400)
for key in keys {
    finalPosition.x += 125
    finalPositions.append(finalPosition)
}

// Aufforderung zum Starten.
let prompt = Graphic(text: "Zum Starten auf '🔒 Sperren‘ drücken.")
prompt.fontName = .avenirNext
prompt.fontSize = 50
prompt.textColor = #colorLiteral(red: 0.9686274529, green: 0.78039217, blue: 0.3450980484, alpha: 1)
scene.place(prompt, at: Point(x: 0, y: 0))

// Diese Funktion wird beim Drücken auf die Taste „Sperren“ aufgerufen.
func lock() {
    scene.clear()
    // Zurücksetzen, um auf den ersten Schlüssel zu verweisen.
    matchIndex = 0
    // Schlüssel an zufälligen Positionen hinzufügen.
    var position = Point(x: 999, y: 999)
    for key in keys {
        let graphic = Graphic(text: key)
        graphic.scale = 2.0
        graphic.rotation = randomDouble(from: -360, to: 360)
        // Eine neue zufällige Position in einiger Entfernung zu den anderen Schlüsseln erhalten.
        var distanceFromNearest = 0.0
        let minimumDistance = 150
        // Immer weiter neue Positionen abrufen, bis mindestens der Wert von minimumDistance einer anderen Grafik erreicht ist.
        while distanceFromNearest < minimumDistance {
            position.x = randomDouble(from: -450, to: 450)
            position.y = randomDouble(from: -450, to: 350)
            distanceFromNearest = 999
            // Die Entfernung zur nächsten Grafik abrufen.
            for graphic in scene.graphics {
                let distance = position.distance(from: graphic.position)
                if distance < distanceFromNearest {
                    distanceFromNearest = distance
                }
            }
        }
        // Den Schlüssel an der neuen, zufälligen Position platzieren.
        scene.place(graphic, at: position)
    }
}

// Diese Funktion wird jedes Mal aufgerufen, wenn ein Schlüssel berührt wird (Grafik).
func touchedKey(graphic: Graphic) {
    if graphic.text == keys[matchIndex] {
        // Passt: Den Schlüssel an seine endgültige Position bewegen.
        graphic.scale = 2.5
        graphic.rotation = 0
        graphic.move(to: finalPositions[matchIndex], duration: 0.25)
        playSound(.pop)
        // Ist dies die letzte Übereinstimmung?
        if keys[matchIndex] == keys.last {
            // Der Schlüssel hat gepasst, also das Geheimnis aufschließen.
            unlockSecret()
        } else {
            // Auf den nächsten Schlüssel verweisen.
            matchIndex += 1
        }
    } else {
        // Passt nicht: Alle Schlüssel verblassen.
        playSound(.wap)
        for graphic in scene.graphics {
            graphic.fadeOut(after: 0.25)
        }
        speak("Falsch!! Harharhar")
    }
}

// Diese Funktion wird aufgerufen, wenn alle Schlüssel in der richtigen Reihenfolge berührt wurden.
func unlockSecret() {
    // Die Schlüssel ausblenden.
    for graphic in scene.graphics {
        graphic.fadeOut(after: 0.25)
    }
    
    // Einen Toneffekt abspielen.
    playSound(.electricity)
    
    // Das ausgeblendete Bild anzeigen.
    let graphic = Graphic(image: hiddenImage)
    scene.place(graphic, at: Point(x: 0, y: 0))
    graphic.alpha = 0.0
    graphic.scale = 2.0
    graphic.fadeIn(after: 1.0)
    
    speak("Das ging aber schnell...")
}

// Werkzeug „Entsperren“ erstellen und hinzufügen.
let unlockTool = Tool(name: "Entsp.", emojiIcon: "🔑")
unlockTool.onGraphicTouched = touchedKey(graphic:)
scene.tools.append(unlockTool)

// Schloss erstellen und hinzufügen.
let shuffleButton = Button(name: "🔒 Sperren")
shuffleButton.onPress = lock
scene.button = shuffleButton
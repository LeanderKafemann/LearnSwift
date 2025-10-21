let blu = Graphic(image: #imageLiteral(resourceName: "Blu1@2x.png"))
let theOrigin = Point(x: 0, y: 0)
scene.place(blu, at: theOrigin)

var position = Point(x: 0, y: 200)

var images = [#imageLiteral(resourceName: "soccerball@2x.png"), #imageLiteral(resourceName: "rugbyball@2x.png"), #imageLiteral(resourceName: "tennisball@2x.png"), #imageLiteral(resourceName: "baseball@2x.png"), #imageLiteral(resourceName: "basketball@2x.png")]

for image in images {
    var graphic = Graphic(image: image)
    graphic.scale = randomDouble(from: 0.2, to: 2.0)
    
    scene.place(graphic, at: theOrigin)
    
    // Zufällige Werte für Orbitparameter abrufen.
    let x = randomDouble(from: 50, to: 400)
    let y = randomDouble(from: 50, to: 400)
    let period = randomDouble(from: 1.0, to: 10.0)
    
    // ✏️ Grafik in den Orbit schicken.
    graphic.orbit(x: x, y: y, period: period)
}
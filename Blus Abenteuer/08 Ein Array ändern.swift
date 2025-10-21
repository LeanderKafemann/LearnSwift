let blu = Graphic(image: #imageLiteral(resourceName: "Blu1@2x.png"))
let theOrigin = Point(x: 0, y: 0)
scene.place(blu, at: theOrigin)

var images = [#imageLiteral(resourceName: "soccerball@2x.png"), #imageLiteral(resourceName: "tennisball@2x.png"), #imageLiteral(resourceName: "baseball@2x.png"), #imageLiteral(resourceName: "billiardball@2x.png"), #imageLiteral(resourceName: "basketball@2x.png")]
//#-hidden-code
var correctArray = images
//#-end-hidden-code
let rugbyBall = #imageLiteral(resourceName: "rugbyball@2x.png")

var position = theOrigin

// ✏️ Objekte einfügen und entfernen.
images.remove(at: 3)
images.insert(#imageLiteral(resourceName: "rugbyball@2x.png"), at: 1)

// Bilder platzieren.
for image in images {
    var graphic = Graphic(image: image)
    position.x += 75
    position.y += 75
    scene.place(graphic, at: position)
}
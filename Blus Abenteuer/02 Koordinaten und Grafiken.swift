let blu = Graphic(image: #imageLiteral(resourceName: "Blu1@2x.png"))
let star = Graphic(image: #imageLiteral(resourceName: "Star@2x.png"))

let theOrigin = Point(x: 0, y: 0)
scene.place(blu, at: theOrigin)


// ✏️ Die Position des Sterns festlegen.
let position = Point(x: 150, y: 350)
scene.place(star, at: position)
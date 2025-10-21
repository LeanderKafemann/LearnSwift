scene.backgroundImage = #imageLiteral(resourceName: "SpaceTheBlueFrontier@2x.png")

let blu = Graphic(image: #imageLiteral(resourceName: "Blu1@2x.png"))
let star = Graphic(image: #imageLiteral(resourceName: "Star@2x.png"))

scene.place(blu, at: Point(x: -250, y: 250))

let position = Point(x: /*#-editable-code*/250/*#-end-editable-code*/, y: /*#-editable-code*/250/*#-end-editable-code*/)
scene.place(star, at: position)

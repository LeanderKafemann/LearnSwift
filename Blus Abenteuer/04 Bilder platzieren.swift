let blu = Graphic(image: #imageLiteral(resourceName: "Blu1@2x.png"))

let ghost = Graphic(image: #imageLiteral(resourceName: "ghost@2x.png"))
let alien = Graphic(image: #imageLiteral(resourceName: "alien@2x.png"))
let ogre = Graphic(image: #imageLiteral(resourceName: "ogre@2x.png"))
let monster = Graphic(image: #imageLiteral(resourceName: "monster@2x.png"))

let theOrigin = Point(x: 0, y: 0)
scene.place(blu, at: theOrigin)

// ✏️ Eine Grafik in jedem Quadranten platzieren.
scene.place(ghost, at: Point(x: 250, y: 250))
scene.place(alien, at: Point(x: 250, y: -250))
scene.place(ogre, at: Point(x: -250, y: 250))
scene.place(monster, at: Point(x: -250, y: -250))
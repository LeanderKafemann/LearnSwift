// ✏️ Bildunterschriften. Füge eigene hinzu!
let caption1 = "Buuuhuuuuu"
let caption2 = "Blörp! Gloink splok."
let caption3 = "Haariges Monster"
let caption4 = "Ich bin ganz lieb!"

// Bildunterschriften zur Szene hinzufügen.
let graphic1 = Graphic(text: caption1)
scene.place(graphic1, at: Point(x: -250, y: 310))
let graphic2 = Graphic(text: caption2)
scene.place(graphic2, at: Point(x: 200, y: 160))
// ✏️ Den Rest der Bildunterschriften hinzufügen.
let graphic3 = Graphic(text: caption3)
scene.place(graphic3, at: Point(x: 250, y: -270))
let graphic4 = Graphic(text: caption4)
scene.place(graphic4, at: Point(x: -310, y: -180))
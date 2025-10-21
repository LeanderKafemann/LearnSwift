let quote1 = "if coder { code() }"
let quote2 = "Relativity Rules"
let quote3 = "Me? Sarcastic? Never."
let quote4 = "/* No Comment */"
let quote5 = "✸ Quasars Quake ✸"
let quote6 = "Bits unite. Bytes rule!"
let quote7 = "Cosmic Bus: Light years ahead!"
let quote8 = "• Code = Poetry •"

let graphic1 = Graphic(text: quote2)
graphic1.fontName = .chalkduster
graphic1.fontSize = 60
graphic1.textColor = #colorLiteral(red: 0.5725490451, green: 0, blue: 0.2313725501, alpha: 1)
graphic1.rotation = 10
scene.place(graphic1, at: Point(x: -150, y: 50))

// ✏️ Mehr Zitate auf den Bus schreiben.
let graphic2 = Graphic(text: quote5)
graphic2.fontName = .georgia
graphic2.fontSize = 12
graphic2.textColor = .black
graphic2.rotation = 30
scene.place(graphic2, at: Point(x: 120, y: 190))

let graphic3 = Graphic(text: quote7)
graphic3.fontName = .markerfelt
graphic3.fontSize = 32
graphic3.textColor = .blue
graphic3.rotation = 120
scene.place(graphic3, at: Point(x: 220, y: -120))

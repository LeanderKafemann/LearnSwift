let animals = [#imageLiteral(resourceName: "horse@2x.png"), #imageLiteral(resourceName: "elephant@2x.png"), #imageLiteral(resourceName: "panda@2x.png"), #imageLiteral(resourceName: "pig@2x.png"), #imageLiteral(resourceName: "frog@2x.png"), #imageLiteral(resourceName: "snail@2x.png")]
var index = 0

func addImage(touch: Touch) {
    if touch.previousPlaceDistance < 80 { return }
    
    let chosenImage = animals[index]
    index += 1
    // ✏️ Den Index zurücksetzen, wenn er das Ende des Arrays erreicht.
    
    if index == animals.count {
        index = 0
    }

    let graphic = Graphic(image: chosenImage)
    scene.place(graphic, at: touch.position)
}
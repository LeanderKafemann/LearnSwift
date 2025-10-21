func addImage(touch: Touch) {
    if touch.previousPlaceDistance < 50 {
        return
    }
    
    let graphic = Graphic(image: #imageLiteral(resourceName: "alien@2x.png"))
    scene.place(graphic, at: touch.position)
}
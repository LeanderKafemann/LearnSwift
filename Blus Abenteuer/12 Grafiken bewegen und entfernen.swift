func addImage(touch: Touch) {
    if touch.previousPlaceDistance < 80 {
        return
    }
    
    let graphic = Graphic(image: #imageLiteral(resourceName: "Star@2x.png"))
    scene.place(graphic, at: touch.position)
}
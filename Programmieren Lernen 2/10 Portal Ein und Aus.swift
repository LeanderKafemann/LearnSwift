purplePortal.isActive = false

func move(n: Int) {
    for i in 1 ... n {
        moveForward()
    }
}

move(n: 2)
for i in 1 ... 4 {
    moveForward()
    collectGem()
}
turnLeft()
turnLeft()
purplePortal.isActive = true
move(n: 4)
move(n: 2)
toggleSwitch()
purplePortal.isActive = false
turnLeft()
turnLeft()
move(n: 2)
for i in 1 ... 3 {
    moveForward()
    collectGem()
}
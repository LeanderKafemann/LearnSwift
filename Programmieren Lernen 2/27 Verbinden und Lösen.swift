var block = Block()
for i in 1 ... 3 {
    block = Block()
    world.place(block, atColumn: 2*i, row: 2)
}
block = Block()
world.place(block, atColumn: 2, row: 2)
block = Block()
world.place(block, atColumn: 6, row: 2)

var gemCounter = 0

func navigateAroundWall() {
    if isBlockedRight {
        if isBlocked {
            turnLeft()
        } else {
            moveForward()
        }
    }  else {
        turnRight()
        moveForward()
    }
}
    
while gemCounter < 3 {
    navigateAroundWall()
    if isOnClosedSwitch {
        toggleSwitch()
    }
    if isOnGem {
        collectGem()
        gemCounter += 1
    }
}
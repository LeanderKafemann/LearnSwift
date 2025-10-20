world.place(Stair(), facing: .south, atColumn: 3, row: 1)
world.place(Stair(), facing: .south, atColumn: 3, row: 3)
world.place(Stair(), facing: .north, atColumn: 3, row: 7)
for i in 1 ... 3 {
    world.place(Stair(), facing: .west, atColumn: 1, row: 3+i)
}
for i in 1 ... 3 {
    world.place(Stair(), facing: .east, atColumn: 5, row: 3+i)

}

func maxMove() {
    while !isBlocked {
        moveForward()
        if isOnClosedSwitch {
            toggleSwitch()
        }
    }
    turnLeft()
    turnLeft()
}

move(distance: 4)

for i in 1 ... 3 {
    turnLeft()
    maxMove()
    maxMove()
    turnRight()
    if !isBlocked {
        moveForward()
    }
}
turnLeft()
move(distance: 3)
turnRight()
move(distance: 2)
turnLeft()
maxMove()
maxMove()
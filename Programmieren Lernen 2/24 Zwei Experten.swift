let e1 = Expert()
world.place(e1, facing: .east, atColumn: 0, row: 4)

let e2 = Expert()
world.place(e2, facing: .west, atColumn: 3, row: 0)

let e3 = Expert()
world.place(e3, facing: .east, atColumn: 6, row: 0)

e2.move(distance: 3)
e2.turnLeft()
e2.turnLeft()
e2.collectGem()
e2.move(distance: 3)
e2.turnLeft()

e2.turnLock(up: true, numberOfTimes: 2)
e3.turnLock(up: false, numberOfTimes: 2)

for i in 1 ... 7 {
    if e1.isOnGem {
        e1.collectGem()
    }
    e1.moveForward()
}
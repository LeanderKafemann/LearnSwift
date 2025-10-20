var switchCounter = 0
var gemCounter = 0

while switchCounter != gemCounter || gemCounter == 0 {
    if isOnGem {
        collectGem()
        gemCounter += 1
    }
    if isOnClosedSwitch {
        toggleSwitch()
        switchCounter += 1
    }
    moveForward()
    if isBlocked {
        turnRight()
    }
}
let totalGems = randomNumberOfGems

var gemCounter = 0

while gemCounter < totalGems {
    if isOnGem {
        collectGem()
        gemCounter += 1
    }
    moveForward()
    if isBlocked {
        if isBlockedLeft && !isBlockedRight{
            turnRight()
        } else if isBlockedRight && !isBlockedLeft {
            turnLeft()
        } else {
            turnLeft()
            turnLeft()
        }
    }
}
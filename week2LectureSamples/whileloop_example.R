## Basic while loop syntax
x <- 0
while (x < 10) {
    print(x)
    x <- x + 1
}


## Compound conditions
# Play a coin flip game. Walk away if I lose too much or wine too much to risk.
# I start with 5 bucks, and will walk if I lose more than half or win more than
# double. I win for every "heads" (coin=1) resulting from a flip.

# New command - cat() which outputs multiple objects as a single character
# vector.

# Gimme five bucks and reset the flip counter
dollars <- 5
flip <- 0

while(dollars > 2 && dollars <= 10) {
    flip <- flip + 1
    cat(c("Cash = $",dollars),sep="",fill=TRUE)
    coin <- rbinom(1,1,0.5)
    if (coin == 1) {
        dollars <- dollars + 1
        cat(c("Flip",flip,"is heads. I win!\n"))
    } else {
        dollars <- dollars - 1
        cat(c("Flip",flip,"is tails. I lose.\n"))
    }
}
cat(c("I quit with",dollars,"dollars.\n"))

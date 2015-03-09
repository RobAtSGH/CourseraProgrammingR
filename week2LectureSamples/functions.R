## Week 2 Functions Examples
# Basic function syntax. x and y are the formal arguments, declared in the
# function definition. Functions can be called with the arguments named, so they
# can be declared in arbitrary order. For example, the following can be called
# add2(1,2) so x=1 and y=2. Likewise, add2(y=2,x=1) produces the same result.
# This is useful when a function takes multiple arguments, some of which are
# optional, and you don't want to have to pass blank dummy values to keep the
# right order.

# example: somefunction(value, flag1=TRUE, flag2=FALSE) is declared. If you want
# the defaults, you can just specify somefunction(value). If you want to change
# the value of flag2 and take the default for flag1, you can specify
# somefunction(value,flag2=TRUE) instead of having to say
# somefunction(value,TRUE,TRUE)

add2 <- function (x,y) {
    x + y
}

# Pass an integer vector and return the subset containing members greater than
# 10. The hard way, via concatenation to a new vector.
above10 <- function(x) {
    sset <- vector(mode="integer",length=0)
    for (number in x){
        if (number > 10) {
            sset <- c(sset,number)
        }
    }
    sset
}

# The easy way, using a logical vector. When in doubt, always make a logical
# vector and index against the original dataset to filter/subset.
abovex <- function(x){
    sset <- x > 10
    x[sset]
}

# Return a subset of an integer vector containing members greater than
# user-specified value. Value is 0 by default if none specified.

# usage above(integer_vector,integer)
above <- function(intset,value = 0){
    sset <- intset > value
    intset[sset]
}

# Calculate the mean of all columns of a dataframe, with NA removal, the hard
# way. Create logical vector for each column pass to subset out NA values.
col_mean <- function (grid,removeNA=TRUE){
    numcol <- ncol(grid)
    means <- numeric(numcol)
    for (col in 1:numcol) {
        good <- !logical(numcol)
        if (removeNA) {
            good <- !is.na(grid[,col])
        }
        means[col] <- mean(grid[good,col])
    }
    means
}

# The easy way, using the na.rm flag on the mean() function call.
col_mean2 <- function (grid,removeNA=TRUE){
    numcol <- ncol(grid)
    means <- numeric(numcol)
    for (col in 1:numcol) {
        means[col] <- mean(grid[,col],na.rm=removeNA)
    }
    means
}

f <- function(a,b){
    print(a)
    print(b)
    # if only one value is specified, a will print before an error is thrown for
    # b undeclared this is because argument evaluation is "lazy" and occurs only
    # as each argument is needed.
}

# The ... operator signifies an arbitrary number of named or unnamed arguments,
# that can then be passed to another function en bloc. Example: concatenating an
# abitrary number of strings with a user definable separator. This is a dummy
# funct. that just recreates the C() operation
concat <- function(...,sep=" ") {
    unpack <- list(...)
    list <- vector(mode="character", length=0)
    for (word in unpack) {
        print(word)
        list <- c(list,word,sep)
    }
    list
}

# Scoping example
g <- function(x,y){
    x^2 + y / z
    # z is defined in the parent environment (from where function is defined)
}

# Scoping example 2: defining a function inside a function.
make.power <- function(x){
    power <- function(y){
        y^x
    }
    power
}
# Now, because of scoping, you can construct functions by defining new
# references.
# NOTE: good practice is to name constructor functions as make.*
cube <- make.power(3)
square <- make.power(2)
# cube and square are now of type function, ie cube: function(y)

# Lexical scoping means when y is used in fun1, it's the value 2 as declared
# inside the function. When referenced in fun2, it's 10 as that is the value
# assigned in fun2's parent environment.
y <- 10
fun1 <- function (x) {
    y <- 2
    y^2 + fun2(x)
}
fun2 <- function(x) {
    x * y
}

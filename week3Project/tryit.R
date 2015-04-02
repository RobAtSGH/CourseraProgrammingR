stuff <- function (x=vector()) {
    set <- function(y) x <<- y
    get <- function() x
    list(set=set,get=get)
}

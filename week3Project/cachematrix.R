# makeCacheMatrix constructs a list of functions for a matrix that allows the
# caching of its inverse.
# Usage:
# create the data vector
#   data <- makeCacheMatrix()
# set the value of the source matrix
#   data$set(matrix)
# get the value of the source matrix
#   data$get()
# set the inverse matrix in the cache
#   data$setinverse(matrix)
# get the inverse matrix from the cache
#   data$getinverse()
#
# cacheSolve calculates the inverse of a supplied matrix if the result is not
# already in the cache, or reads the cached result if present.
#

# Construct a list of functions: set the original matrix, get the original
# matrix, set the value of the inverse of a matrix, get the value of the
# inverse. Returns a function list.
makeCacheMatrix <- function(x = matrix()) {
    inverse <- NULL
    set <- function(m) {
        x <<- m
        inverse <<- NULL
    }
    get <- function() x
    setinverse <- function (i = matrix()) inverse <<- i
    getinverse <- function() inverse
    list(set=set,get=get,
         setinverse=setinverse,
         getinverse=getinverse)
}


# take a value of type makeCacheMatrix(). If its inverse has been previously
# calculated and cached, return the cached value. If not, calculate the
# inverse and cache it. Returns a matrix.

cacheSolve <- function(x, ...) {
    inv <- x$getinverse()
    if(!is.null(inv)) {
        message("Using cached result.")
        return(inv)
    }
    data <- x$get()
    inv <- solve(data, ...)
    x$setinverse(inv)
    inv
}

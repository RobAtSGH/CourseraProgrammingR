x <- list(a=1:5,b=rnorm(10)) # create two lists
y <- lapply(x,mean) # predefined function
z <- lapply(x,function(l) l[1]) # anonymous function - return first element
print(x)
print(y)
print(z)
# simplify the results - return a vector if all results are of the same type
y <- sapply(x,mean) # predefined function
z <- sapply(x,function(l) l[1]) # anonymous function - return first element
print(y)
print(z)
m1 <- matrix(1:10,5,2)
a2 <- array(1:27,dim=c(3,3,3))
x <- apply(m1,1,sum)   # calculate the sum of the rows of a matrix.
y <- apply(m1,2,sum)   # calculate the sum of the columns of a matrix.
z <- apply(a2,c(1,2,3),as.character)    # coerce a numeric 3d array to char,
                                        # preserving its existing structure.
print(x)
print(y)
print(z)
m2 <- matrix(rnorm(200),20,10)
z <- apply(m2,2,quantile,probs=c(0.10,0.50,0.90,0.95))  # Supply extra params to
                                                        # the quantile func.
                                                        # through the "..."
                                                        # operator.
print(z)
print(a2)
z1 <- apply(a2,c(1,2),sum) # Collapsing a 3d array to sum across the z axis
print(z1)
z2 <- apply(a2,c(1,3),sum) # Rotate the array 90-deg left, collapse and sum
print(z2)
z3 <- apply(a2,c(2,3),sum) # Rotate the array 90-deg up, collapse and sum
print(z3)

# mapply = used to pass multiple lists to a function that will take them.
a1 <- matrix(rnorm(100),10,10)
a2 <- matrix(1:100,10,10)
z4 <- mapply(sum,a1[1,],a2[1,]) # Sum across a single col of two matrices.
print(z4)
# mapply can also vectorize functions
noise <- function(num,mean,sd){
    rnorm(num,mean,sd)
}
print(noise(5,5,2)) # will return a 5-member vector
print(noise(5,1:5,2))   # still returns a 5-member vector,with one value for
                        # each mean when we want a list of vectors each with
                        # five members using each mean value in the range.
print(mapply(noise,5,1:5,2)) # this gets us what we want.

# tapply gets us functions over a subset of a vector. Uses a factor of equal
# length to subset.
x <- 1:100
f <- gl(2,50,labels=c("FirstHalf","SecondHalf"))
print(x)
print(f)
print(tapply(x,f,sum))

# split functions like the first half of tapply. Subsets vector by factor of
# equal length, but does not apply a function. Returns a list of vectors.
print(split(x,f))

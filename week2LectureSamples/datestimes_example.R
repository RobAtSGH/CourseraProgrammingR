# Dates and Times examples

# Dates are stored as number of days since the UNIX epoch

x <- "1970-01-01"
y <- as.Date(x)
print(x)
print(y)
print(unclass(y))

# x and y will print similarly by default, but dereferencing a date vector
# using unclass will return the epoch offset. In this case, 0.

# Change the value of x to something more in the future, and you will see a much
# wider offset from the epoch when that vector value is unclassed.

x <- "2015-03-09"
y <- as.Date(x)
print(x)
print(y)
print(unclass(y))

# Date math:
x <- as.Date("2015-03-09")
y <- as.Date("2014-03-09")
print(x-y)
print(unclass(x)-unclass(y))
print(unclass(x-y))

x <- Sys.time()
print(x)
t <- as.POSIXlt(x)
print(names(unclass(t)))
print(t$sec)
t <- as.POSIXct(x)
print(unclass(t))

# NOTE: date math must be between like object types. Convert dates and times to
# a common type (using as.POSIXlt(), for example) before doing any calculation.

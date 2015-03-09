x <- 20
y <- 30
z <- if (x > y){
  x
} else if (x == y) {
  z <- "X and Y are equal."
} else {
  y
}
z

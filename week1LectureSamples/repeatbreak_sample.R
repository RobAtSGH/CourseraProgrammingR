## Repeat...break loop basic syntax
x <- 0
repeat {
  print(x)
  if (x > 10){
    print("Done.")
    break
  } else {
    x <- x + 1
  }
}

## Repeat is an infinite loop with no conditions. The break statement must be used to end it explicitly
## Occassionally used when one wishes to iterate over a converging function and then stop only when
## convergence is achieved.

## DANGER: will loop forever if function does not converge. Better to set fixed number of iterations
## using for() and report whether or not convergence was achieved.

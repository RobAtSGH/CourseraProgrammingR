## basic loop syntax
for (x in 1:10) {
    print(x)
}

# "next" is a null function that lives within a condition and forces next
# iteration of loop. The following will only print the numbers greater than 5 in
# a 10-step loop.

for (count in 1:10) {
    if (count < 5){
        next
    }
    print(count)
}

string <- c("a","b","c","d")

## loop by vector index
for (x in 1:4) {
    print(string[x])
}

## loop by vector sequence length calculated by seq_along()
for (x in seq_along(string)) {
    print(string[x])
}

## loop by vector members
for (x in string) {
    print(x)
}

## Inner and outer loops (nesting)
grid <- matrix(1:12,3,4)
for (row in seq_len(nrow(grid))) {
    for (col in seq_len(ncol(grid))){
        print(grid[row,col])
    }
}

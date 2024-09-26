input <- c(267, 134, 66, 266332) 
ans <- c()

for (i in input) {
  steps <- 0
  while (i != 1) {
    if (i %% 2 == 0) {
      i <- i / 2
    } else {
      i <- 3 * i + 1
    }
    steps <- steps + 1
  }
  ans <- append(ans, steps)
}

print(ans)

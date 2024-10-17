#Question_2
fibonacci <- function(a) {
  if (a <= 2) {
    return(1)
  } else {
    return(fibonacci(a - 1) + fibonacci(a - 2))  # Recursive case
  }
}

fibonacci_22 <- fibonacci(22)
print(fibonacci_22)

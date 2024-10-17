#Question_1
multiply <- function(vector) {
  result <- 1
  for (num in vector) {
    result <- (result * num) %% 65537
  }
  return(result)
}

vector1 <- c(20, 22, 10, 13)
vector2 <- c(2022, 1013)
vector3 <- 1:30

result1 <- multiply(vector1)
result2 <- multiply(vector2)
result3 <- multiply(vector3)

print(result1)
print(result2)
print(result3)
M <- c(2, 3, 4, 5, 6, 7, 8, 9, 10, 11)
I <- c(-4728, 1946, -4738, 953, 3982, -4397, 1356, 6100, -9336, 6394)
O <- c(-6249, -953, -2658, 107, 3666, -3023, 420, 9030, -12001, 4591)

df <- data.frame(
  Month = as.character(M),
  Incoming_changes = I,
  Outcoming_changes = O
)

print(df)



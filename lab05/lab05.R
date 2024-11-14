#Lab05_Q1
data(iris)
# Create the dataset
df_train <- rbind(iris[1:40, ], iris[51:90, ], iris[101:140, ])
df_test <- rbind(iris[41:50, ], iris[91:100, ], iris[141:150, ])

#Lab05_Q2
lm_model <- lm(Sepal.Length ~ Sepal.Width + Petal.Length + Petal.Width, data = df_train)
summary(lm_model)

#Lab05_Q3
prediction <- predict(lm_model, df_test)
actual <- df_test$Sepal.Length
deviations <- prediction - actual
rms <- sqrt(mean(deviations^2))
print(rms)

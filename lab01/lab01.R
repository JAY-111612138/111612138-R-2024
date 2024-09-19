install.packages("titanic")
library(titanic)
library(dplyr)
library(ggplot2)
data(package = "titanic")
data("titanic_train")

ggplot(data=titanic_train, aes(x=Age)) +
  geom_bar() +
  labs(title="Passenger Distribution by Age",
       x="Age",
       y="Number of Passengers") +
  theme()

content <- c("了解所有『年齡』分佈情形以及各年齡層的乘客數量")
writeLines(content, "reason.txt")
getwd()  
readLines("titanic_analysis.txt")


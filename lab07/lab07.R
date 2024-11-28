install.packages("httr")
install.packages("XML")
library(httr)
library(XML)

html <- htmlParse(GET("https://disp.cc/m/"))

ht_title <- xpathSApply(html, "//div[@class='ht_title']", xmlValue) 
ht_desc <- xpathSApply(html, "//div[@class='ht_desc']", xmlValue)

data <- cbind(ht_title, ht_desc)

file.path <- "111612138.txt"

write.table(
  data, 
  file = file.path,
  append = TRUE,
  quote = FALSE,
  sep = "\n", 
  row.names = FALSE, 
  col.names = FALSE 
)



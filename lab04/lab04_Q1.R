install.packages("jsonlite")
install.packages("tidyverse")

library(jsonlite)
library(tidyverse)

data.file <- "data.jason"
data.url <- "https://ods.railway.gov.tw/tra-ods-web/ods/download/dataResource/8ae4cabf6973990e0169947ed32454b9"
download.file(url = data.url, destfile = data.file)
data <- fromJSON(data.file)

filtered_data <- data %>%
  filter(trnOpDate %in% c(20240101, 20240201, 20240301, 20240401, 20240501, 
                          20240601, 20240701, 20240801, 20240901, 20241001, 20241101), staCode == "1210")

filtered_data <- filtered_data %>%
  mutate(trnOpDate = as.Date(as.character(trnOpDate), format = "%Y%m%d"),
         gateInComingCnt = as.numeric(gateInComingCnt))
print(filtered_data)

ggplot(filtered_data, aes(x = trnOpDate, y = gateInComingCnt, group = 1)) +
  geom_line() +  
  geom_point() +
  labs(title = "Hsin Chu Station", x = "Date", y = "Gate In Coming Count") +
  theme_minimal()








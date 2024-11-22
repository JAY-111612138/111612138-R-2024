library(jsonlite)
library(ggplot2)
library(lubridate)

# Define URL and download the data
data.url <- "https://opendata.cwa.gov.tw/fileapi/v1/opendataapi/F-D0047-055?Authorization=CWA-DE234867-89DF-4DE3-AEAA-4BF58AEF1CB0&format=JSON"
data.file <- "Hsinchu_Weather_Forecast.json"
download.file(url = data.url, destfile = data.file)

# Read the JSON data
data <- fromJSON(data.file)

my.location <- data$cwaopendata$dataset$locations$location
my.weatherElement <- my.location[[which(my.location$locationName == "東區"), "weatherElement"]]

my.T <- my.weatherElement[[which(my.weatherElement$elementName == "T"), "time"]]
my.maxT <- my.weatherElement[[which(my.weatherElement$elementName == "MaxT"), "time"]]
my.minT <- my.weatherElement[[which(my.weatherElement$elementName == "MinT"), "time"]]

my.df <- data.frame(time = ymd_hms(my.T$startTime, tz = "Asia/Taipei"),
                    T_value = my.T$elementValue$value,
                    max_T_value = my.maxT$elementValue$value,
                    min_T_value = my.minT$elementValue$value)

str(my.df)
str(my.weatherElement)
str(my.location)

ggplot(my.df, aes(x = time)) +
  geom_line(aes(y = max_T_value, group = 1)) +
  geom_line(aes(y = min_T_value, group = 1)) +
  labs(x = "Time", y = "T_Value") +
  theme()

library(lubridate)
library(dplyr)



data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

#the data has been loaded into a data variable

rows <- nrow(data)
columns <- ncol(data)

print(rows) + print(2075259)
print(columns) + print(9)

#The above is just to check rows and columns are sufficient, please ignore it

data$Date <- dmy(data$Date)
#Using the lubridate package to get the dates convert appropriately

data2 <- filter(data, Date == "2007-02-01" | Date == "2007-02-02")
#Using the dplyr package to subset the date to 2007-02-01 and 2007-02-02


#Plots histgram with color red, titles and y label as specified and then margins, and create file


png(file = "plot1.png", width = 480, height = 480)
par(mar=c(6,4,4,2)) 
plot(hist(data2$Global_active_power), col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off() 

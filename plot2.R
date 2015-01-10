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
#Using the lubridate package to get the dates classed appropriately

data2 <- filter(data, Date == "2007-02-01" | Date == "2007-02-02")
#Using the dplyr package to subset the dates to 2007-02-01 and 2007-02-02

a <- ymd(data2$Date)
#gets the year, month and day from the Date columns
b <- hms(data2$Time)
#gets the hour, month and second from the Time columns

x <- a + b
#combines the year, month and day with the hour, month and second.

y <- data2$Global_active_power

#creates a plot with the specified metrics into a plot2.png

png(file = "plot2.png", width = 480, height = 480)
par(mar=c(6,4,4,2)) 
plot(x,y, ylab = "Global Active Power (kilowatts)", xlab = "", type ="l")
dev.off()

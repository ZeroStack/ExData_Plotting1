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
#Using the lubridate package to get the dates classed as dates

data2 <- filter(data, Date == "2007-02-01" | Date == "2007-02-02")
#Using the dplyr package to subset the data

a <- ymd(data2$Date)
#gets year, month and date
b <- hms(data2$Time)
#gets the hour, minute and second
x <- a + b
#combines the date and time

sub_1 <- data2$Sub_metering_1
sub_2 <- data2$Sub_metering_2
sub_3 <- data2$Sub_metering_3
#above assigns the data appropriately

data2 <- mutate(data2, DateTime = x)
#adds a column to data2 with the datetime

#creates the file plot3.

png(file = "plot3.png", width = 480, height = 480)

par(mar=c(6,4,4,2))
plot(x, sub_1, ylab = "Energy sub metering", xlab = "", type ="l", col = "black")
points(x, sub_2, type ="l", col = "red")
points(x, sub_3, type ="l", col = "blue")
legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.off()

library(lubridate)
library(dplyr)



data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
#the data has been loaded into a data variable

rows <- nrow(data)
columns <- ncol(data)
print(rows) + print(2075259)
print(columns) + print(9)
#The above is just to check rows and columns are sufficient

data$Date <- dmy(data$Date)
#Using the lubridate package to get the dates classed as dates

data2 <- filter(data, Date == "2007-02-01" | Date == "2007-02-02")
#Using the dplyr package to subset the data

a <- ymd(data2$Date)
#gets year, month and day

b <- hms(data2$Time)
#gets the hour, minute and second

x <- a + b
#adds date and time

sub_1 <- data2$Sub_metering_1
sub_2 <- data2$Sub_metering_2
sub_3 <- data2$Sub_metering_3
#assigns data appropriately

data2 <- mutate(data2, datetime = x)
#adds datetime column to data2


#creates the 4 graphs for plot4.
png(file = "plot4.png", width = 480, height = 480)



par(mfrow = c(2, 2), mar = c(4, 4, 2, 1), oma = c(0, 0, 2, 0))
with(data2, {
        plot(datetime, Global_active_power, type = "l", xlab = "", ylab = "Global Active Power")
        
        plot(datetime, Voltage, ylab = "Voltage", xlab = "datetime", type = "l")
        plot(x, sub_1, ylab = "Energy sub metering", xlab = "", type ="l", col = "black")
        points(x, sub_2, type ="l", col = "red")
        points(x, sub_3, type ="l", col = "blue")
        legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty = "n")
        plot(datetime, Global_reactive_power, type = "l")
})

dev.off()
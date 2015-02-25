
require(sqldf)
require(lubridate)
## The file exists in current directory
file <- c("household_power_consumption.txt")
## Read data from the dates 2007-02-01 and 2007-02-02
data_subset <- read.csv.sql(file, header = T, sep=";", sql = "select * from file where (Date == '1/2/2007' OR Date == '2/2/2007')" )
## Add new column concat Date and Time
data_subset$DateAndTime <- paste(data_subset$Date, data_subset$Time)
## Convert to Date type
data_subset$DateAndTime <- dmy_hms(data_subset$DateAndTime)
## Set up png
png(file = "./plot3.png", width = 480, height = 480, units = "px")
## Plot
plot(data_subset$DateAndTime, data_subset$Sub_metering_1,type = "l", xlab = "", ylab ="Energy sub metering")

lines(data_subset$DateAndTime, data_subset$Sub_metering_2, col = "red")

lines(data_subset$DateAndTime, data_subset$Sub_metering_3, col = "blue")

legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lwd = .75, cex = .75)

dev.off()
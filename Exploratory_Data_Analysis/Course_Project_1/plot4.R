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
png(file = "./plot4.png", width = 480, height = 480, units = "px")
## Set up view 2 plots per row, 2 plots per col
par(mfrow = c(2,2))
with (data_subset, {
  plot(DateAndTime, Global_active_power, xlab = "datetime", type = "l",ylab="Global Active Power (kilowatts)")
  plot(DateAndTime, Voltage, xlab = "datetime", type = "l",ylab="Voltage")
  plot(DateAndTime, Sub_metering_1,type = "l", xlab = "datetime", ylab ="Energy sub metering")
  
  lines(DateAndTime, Sub_metering_2, col = "red")
  
  lines(DateAndTime, Sub_metering_3, col = "blue")
  
  legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lwd = .75, cex = .75)
  
  plot(DateAndTime, Global_reactive_power,type = "l", xlab = "datetime", ylab ="Global_reactive_power")
})

dev.off()
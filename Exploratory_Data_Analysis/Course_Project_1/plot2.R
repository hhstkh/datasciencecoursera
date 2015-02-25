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
png(file = "./plot2.png", width = 480, height = 480, units = "px")

plot(data_subset$DateAndTime, data_subset$Global_active_power, type = "l", xlab = "", ylab="Global Active Power (kilowatts)")

dev.off()
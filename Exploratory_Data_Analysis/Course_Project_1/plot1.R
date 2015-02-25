## Plot hist plot by Global_active_power
require(sqldf)
## The file exists in current directory
file <- c("household_power_consumption.txt")
## Read data from the dates 2007-02-01 and 2007-02-02
data_subset <- read.csv.sql(file, header = T, sep=";", sql = "select * from file where (Date == '1/2/2007' OR Date == '2/2/2007')" )
## Set up png
png(file = "./plot1.png", width = 480, height = 480, units = "px")
## Plotting Global_active_power data
hist(data_subset$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", col = "red")
## Close device
dev.off()
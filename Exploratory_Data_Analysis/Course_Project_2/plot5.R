# This is the script for plotting emissions from motor vehicle sources 
# changed from 1999–2008 in Baltimore City
library(dplyr)
NEI <- readRDS("summarySCC_PM25.rds")
nei_df <- tbl_df(NEI)
# motor vehicle's type is ON-ROAD 
vehicalBal <- nei_df %>% filter(type == "ON-ROAD" & fips == "24510") %>% group_by(year) %>% summarise(Emissions = sum(Emissions))
## Set up png
png(file = "./plot5.png", width = 480, height = 480, units = "px")
plot(vehicalBal, type = "l", ylab = "", xaxt = "n", lwd = 2)
title(main = "Motor vehicle in Baltimore City", ylab = "Emissions (ton)")
axis(1, at = seq(1999, 2008, by = 3))
## Close device
dev.off()
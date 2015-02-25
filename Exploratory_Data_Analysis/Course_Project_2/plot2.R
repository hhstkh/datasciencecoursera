# This is script for plotting total emissions in the Baltimore City, Maryland
library(dplyr)
NEI <- readRDS("summarySCC_PM25.rds")
nei_df <- tbl_df(NEI)
nei_sum_bal <- nei_df %>% filter(fips == "24510") %>% group_by(year) %>% summarise(Emissions = sum(Emissions))
## Set up png
png(file = "./plot2.png", width = 480, height = 480, units = "px")
with(nei_sum_bal, plot(year, Emissions, ylab = "", type = "l", lwd = 2, xaxt = "n"))
title(main = "Baltimore City, Maryland", ylab = "Emission (ton)")
axis(1, at = seq(1999, 2008, by = 3))
## Close device
dev.off()
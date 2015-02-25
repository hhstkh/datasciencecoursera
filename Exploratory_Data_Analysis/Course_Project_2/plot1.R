# This is script for plotting the total PM2.5 emission from all sources 
# for each of the years 1999, 2002, 2005, and 2008
library(dplyr)
NEI <- readRDS("summarySCC_PM25.rds")
nei_df <- tbl_df(NEI)
nei_year <- group_by(nei_df, year)
nei_sum <- nei_year %>% summarise(Emissions = sum(Emissions)) %>% mutate(EmissionsKb = round(Emissions / 10000))
## Set up png
png(file = "./plot1.png", width = 480, height = 480, units = "px")
with(nei_sum, plot(year, EmissionsKb, ylab = "", type = "l", lwd = 2, xaxt = "n"))
title(main = "The total PM2.5 emission from all sources", ylab = "Emission (kton)")
axis(1, at = seq(1999, 2008, by = 3))
## Close device
dev.off()
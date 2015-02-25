# This is script for plotting emissions from 1999–2008 for Baltimore City with types
# point, nonpoint, onroad, nonroad
library(dplyr)
library(ggplot2)
NEI <- readRDS("summarySCC_PM25.rds")
nei_df <- tbl_df(NEI)

nei_bal_src <- nei_df %>% filter(fips == "24510") %>% group_by(type, year) %>% summarise(Emissions = sum(Emissions))
## Set up png
png(file = "./plot3.png", width = 800, height = 480, units = "px")
g <- ggplot(nei_bal_src, aes(year, Emissions))
g + geom_line() + facet_grid(~ type) + labs(title = "Baltimore City, Maryland")
## Close device
dev.off()
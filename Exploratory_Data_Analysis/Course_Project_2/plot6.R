# This is script for plotting to compare motor vehicle sources in Baltimore City 
# with emissions from motor vehicle sources in Los Angeles County, California
library(dplyr)
library(ggplot2)
NEI <- readRDS("summarySCC_PM25.rds")
nei_df <- tbl_df(NEI)
neiBalLos <- nei_df %>% filter(type == "ON-ROAD" & fips %in% c("24510", "06037")) %>% mutate(City = ifelse(fips == "24510", "Baltimore", "Los Angeles")) %>% group_by(City, year) %>% summarise(Emissions = sum(Emissions))
## Set up png
png(file = "./plot6.png", width = 800, height = 480, units = "px")
g <- ggplot(neiBalLos, aes(year, Emissions))
g + geom_line() + facet_grid(. ~ City) + labs(title = "Motor vehicle emission") + ylab("Emissions - ton")
## Close device
dev.off()
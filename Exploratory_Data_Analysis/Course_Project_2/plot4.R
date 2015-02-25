# This is script for plotting emissions from coal combustion-related sources
library(dplyr)
NEI <- readRDS("summarySCC_PM25.rds")
nei_df <- tbl_df(NEI)
SCC <- readRDS("Source_Classification_Code.rds")
scc_df <- tbl_df(SCC)
coal <- grepl("Coal", scc_df$EI.Sector)
scc_coal <- scc_df[coal,]
nei_coal <- filter(nei_df, SCC %in% scc_coal$SCC)
nei_coal_sum <- nei_coal %>% group_by(year) %>% summarise(Emissions = sum(Emissions))
## Set up png
png(file = "./plot4.png", width = 480, height = 480, units = "px")
plot(nei_coal_sum, type = "l", ylab = "", xaxt = "n", lwd = 2)
title(main = "Emissions from coal combustion-related", ylab = "Emissions (ton)")
axis(1, at = seq(1999, 2008, by = 3))
## Close device
dev.off()
#Across the United States, how have emissions from coal combustion-related sources changed from 1999–2008?

#Load the data for the code (assumes data and test code are in the same directory)
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#Search the category for from the SCC and grab all SCC IDs from those categories
coal <- SCC[grep("Coal",SCC$EI.Sector, ignore.case=TRUE),]
coal_ids <- coal[,1]
coal_emissions <- NEI[NEI$SCC %in% coal_ids,]

#It turns out these are the same groups categories
coal_combustion_ids <- coal[grep("comb",coal$EI.Sector, ignore.case=TRUE),1]
coal_combustion_emissions <- NEI[NEI$SCC %in% coal_combustion_ids,]

#Load ggplot2
library("ggplot2")

#Create several plots for each category of Emission
png("plot4.png")
qplot(year,Emissions,data=coal_emissions) + geom_smooth(method=lm, color="red") + ylim(0,10000) + stat_summary(fun.y="mean", geom="bar", fill="blue") + ggtitle("Coal emissions (with means and linear regression)")
dev.off()
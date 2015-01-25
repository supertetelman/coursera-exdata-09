#Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) variable, which of these four sources have seen decreases in emissions from 1999–2008 for Baltimore City? 
#Which have seen increases in emissions from 1999–2008? 
#Use the ggplot2 plotting system to make a plot answer this question.

#Load the data for the code (assumes data and test code are in the same directory)
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

NEI <- NEI[NEI$fips == c("24510"),]

#Subset the data a bit for exploration
EMM_1999 <- as.numeric(NEI[NEI$year == c("1999"),]$Emissions)
EMM_2002 <- as.numeric(NEI[NEI$year == c("1999"),]$Emissions)
EMM_2005 <- as.numeric(NEI[NEI$year == c("1999"),]$Emissions)
EMM_2008 <- as.numeric(NEI[NEI$year == c("1999"),]$Emissions)

#Load ggplot2
library("ggplot2")

#Create several plots for each category of Emission
png("plot3.png")
qplot(year,Emissions,data=NEI, facets=~type) + geom_smooth(method=lm, color="red") + ylim(0,500) + stat_summary(fun.y="mean", geom="bar", fill="blue") + ggtitle("Emissions by category (with means)")
dev.off()

png("plot3.1.png")
qplot(year,Emissions,data=NEI, facets=.~type) + geom_smooth(method=lm, color="red") + ylim(0,500) + stat_summary(fun.y="mean", geom="bar", fill="blue") + ggtitle("Emissions by category (with means)")
dev.off()
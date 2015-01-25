#Compare emissions from motor vehicle sources in Baltimore City with emissions from motor vehicle sources in Los Angeles County, California (fips == "06037"). Which city has seen greater changes over time in motor vehicle emissions?
#Load the data for the code (assumes data and test code are in the same directory)
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#Yay Baltimore
NEI <- NEI[NEI$fips == c("24510"),]

#Search the category for from the SCC and grab all SCC IDs from those categories
motor <- SCC[grep("mobile",SCC$EI.Sector, ignore.case=TRUE),]
motor_ids <- motor[,1]
motor_emissions <- NEI[NEI$SCC %in% motor_ids,]
motor_emissions <- merge(motor,NEI, by.x = "SCC", by.y, "SCC")


#Load ggplot2 and gridExtra
#install.packages("gridExtra" )
library("ggplot2")
require("gridExtra")

png("plot6.png")
p1 <-qplot(year,Emissions,data=motor_emissions, facets=~EI.Sector)  + geom_smooth(method=lm, color="red") + stat_summary(fun.y="mean", geom="bar", fill="blue") + ggtitle("Vehicle emissions in Baltimore by Sector (with means and linear regression)")
p2 <- qplot(year,Emissions,data=motor_emissions) + geom_smooth(method=lm, color="red") + stat_summary(fun.y="mean", geom="bar", fill="blue") + ylim(0,150) + ggtitle("Vehicle emissions in Baltimore without outliers(with means and linear regression)")
grid.arrange(p1,p2)


#Load the data for the code (assumes data and test code are in the same directory)
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#Yay Baltimore
NEI <- NEI[NEI$fips == c("06037"),]

#Search the category for from the SCC and grab all SCC IDs from those categories
motor <- SCC[grep("mobile",SCC$EI.Sector, ignore.case=TRUE),]
motor_ids <- motor[,1]
motor_emissions <- NEI[NEI$SCC %in% motor_ids,]
motor_emissions <- merge(motor,NEI, by.x = "SCC", by.y, "SCC")

p3 <-qplot(year,Emissions,data=motor_emissions, facets=~EI.Sector)  + geom_smooth(method=lm, color="red") + stat_summary(fun.y="mean", geom="bar", fill="blue") + ggtitle("Vehicle emissions in Baltimore by Sector (with means and linear regression)")
p4 <- qplot(year,Emissions,data=motor_emissions) + geom_smooth(method=lm, color="red") + stat_summary(fun.y="mean", geom="bar", fill="blue") + ylim(0,150) + ggtitle("Vehicle emissions in Baltimore without outliers(with means and linear regression)")
grid.arrange(p1,p2,p3,p4)

#Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? 
#Using the base plotting system, make a plot showing the total PM2.5 emission from all sources for each of the years 1999, 2002, 2005, and 2008.

#Load the data for the code (assumes data and test code are in the same directory)
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#Subset the data a bit for exploration
EMM_1999 <- as.numeric(NEI[NEI$year == c("1999"),]$Emissions)
EMM_2002 <- as.numeric(NEI[NEI$year == c("1999"),]$Emissions)
EMM_2005 <- as.numeric(NEI[NEI$year == c("1999"),]$Emissions)
EMM_2008 <- as.numeric(NEI[NEI$year == c("1999"),]$Emissions)

#Plot a filtered boxplot
png("plot1.png")
boxplot(Emissions~year, data=NEI, main="Emissions by year (without outliers)", xlab="Year", ylab="PM2.5 emitted, in tons", outline=FALSE, range=1)
dev.off()

png("plot1.1.png")
boxplot(Emissions~year, data=NEI, main="Emissions by year (with outliers)", xlab="Year", ylab="PM2.5 emitted, in tons", outline=FALSE, range=3)
dev.off()

png("plot1.2.png")
plot(NEI$Emissions, NEI$year, ylab="Year", xlab="PM2.5 emitted, in tons", main="Emissions by year") 
dev.off()

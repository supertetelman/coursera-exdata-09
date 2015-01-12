power_consumption_data <- read.csv("household_power_consumption.txt", header=TRUE, sep=";",  colClasses=c("character", "character", rep("numeric",7)),na="?")
consumption_subset <- power_consumption_data[power_consumption_data$Date %in% c("1/2/2007", "/2/2/2007") ]
png("plot1.png", width=480, height=480)
hist(consumption_subset$Global_active_power, col="red", xlab="Global Active Power (kilowatts)", ylab="Frequency", main="Global Active Power") 
dev.off()
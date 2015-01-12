power_consumption_data <- read.csv("household_power_consumption.txt", header=TRUE, sep=";",  colClasses=c("character", "character", rep("numeric",7)),na="?")
consumption_subset <- power_consumption_data[power_consumption_data$Date %in% c("1/2/2007", "2/2/2007"), ]
parsed_dates <- strptime(paste(consumption_subset$Date, consumption_subset$Time),"%d/%m/%Y %H:%M:%S")
parsed_power <- as.numeric(consumption_subset$Global_active_power)
png("plot2.png", width=480, height=480)
plot(parsed_dates,parsed_power, type="l", col="black", ylab="Global Active Power (kilowatts)") 
dev.off()
data <- read.csv("household_power_consumption.txt", sep=";", 
                 na.strings = c("?"), 
                 colClasses = c("character", "character", "numeric", "numeric",
                                "numeric", "numeric", "numeric", "numeric", "numeric"))

data$Date <- as.Date(data$Date, "%d/%m/%Y")

#Set up subset
date1 <- as.Date("2007-02-01")
data2 <- as.Date("2007-02-02")
sub_data <- data[data$Date >= date1 & data$Date <= date2,]

sub_data$timestamp <- strptime(paste(sub_data$Date, sub_data$Time), "%Y-%m-%d %H:%M:%S")

png(filename = "plot2.png", width = 480, height = 480)

plot(sub_data$timestamp, sub_data$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
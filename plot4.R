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

png(filename = "plot4.png", width = 480, height = 480)

with(sub_data, { 
  plot(sub_data$timestamp, sub_data$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
  plot(sub_data$timestamp, sub_data$Voltage, type="l", xlab="datetime", ylab="Voltage")
  with(sub_data, plot(timestamp, Sub_metering_1, type="l", xlab = "", ylab = "Energy sub metering"))
  with(sub_data, lines(timestamp, Sub_metering_2, col="red"))
  with(sub_data, lines(timestamp, Sub_metering_3, col="blue"))
  legend("topright", lty=1, col=c("black", "red", "blue"), bty="n", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  plot(sub_data$timestamp, sub_data$Global_reactive_power,xlab="datetime", ylab="Global_reactive_power", type="l")
})
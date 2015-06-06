data <- read.csv("household_power_consumption.txt", sep=";", 
                 na.strings = c("?"), 
                 colClasses = c("character", "character", "numeric", "numeric",
                 "numeric", "numeric", "numeric", "numeric", "numeric"))

data$Date <- as.Date(data$Date, "%d/%m/%Y")

#Set up subset
date1 <- as.Date("2007-02-01")
data2 <- as.Date("2007-02-02")
sub_data <- data[data$Date >= date1 & data$Date <= date2,]

#Png
png(filename = "plot1.png", width = 480, height = 480)

#Histogram
hist(sub_data$Global_active_power, col="red", xlab = "Global active power (kilowatts)", main="Global Active Power")
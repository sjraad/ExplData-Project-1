# read file
data <- read.table("./Exploratory Data Analysis/Project 1/household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE, dec = ".")
selectedData <- subset(data,data$Date=="1/2/2007" | data$Date =="2/2/2007")

# Convert date/time to classes
DateTime <- strptime(paste(selectedData$Date, selectedData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

# Select Data
ActivePower <- as.numeric(selectedData$Global_active_power)
subMetering1 <- as.numeric(selectedData$Sub_metering_1)
subMetering2 <- as.numeric(selectedData$Sub_metering_2)
subMetering3 <- as.numeric(selectedData$Sub_metering_3)

# Plot graph
plot(DateTime, subMetering1, type = "l", xlab = "", ylab = "Energy Sub metering")
lines(DateTime, subMetering2, type = "l", col = "red")
lines(DateTime, subMetering3, type = "l", col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty= 1, col = c("Black", "red", "blue"))

# Write to PNG file
dev.copy(png, file = "./Exploratory Data Analysis/Project 1/plot3.png", width = 480, height = 480)
dev.off()
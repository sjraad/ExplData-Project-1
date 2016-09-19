# read file
data <- read.table("./Exploratory Data Analysis/Project 1/household_power_consumption.txt", sep = ";", na.strings = "?", stringsAsFactors = FALSE)
names(data) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
selectedData <- subset(data,data$Date=="1/2/2007" | data$Date =="2/2/2007")

# Convert date/time to classes
DateTime <- strptime(paste(selectedData$Date, selectedData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

# Select Data
ActivePower <- as.numeric(selectedData$Global_active_power)
ReactivePower <- as.numeric(selectedData$Global_reactive_power)
Voltage <- as.numeric(selectedData$Voltage)
subMetering1 <- as.numeric(selectedData$Sub_metering_1)
subMetering2 <- as.numeric(selectedData$Sub_metering_2)
subMetering3 <- as.numeric(selectedData$Sub_metering_3)

# Plot graph
par(mfrow = c(2,2))
plot(DateTime, ActivePower, type = "l", xlab = "", ylab = "Global Active Power")
plot(DateTime, Voltage, type = "l", xlab = "", ylab = "Voltage")
plot(DateTime, subMetering1, type = "l", xlab = "", ylab = "Energy Sub metering")
lines(DateTime, subMetering2, type = "l", col = "red")
lines(DateTime, subMetering3, type = "l", col = "blue")
legend("topright", c( "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("Black", "red", "blue"), lty= 1, cex = 0.4)
plot(DateTime, ReactivePower, type = "l", xlab = "", ylab = "Global_reactive_power")

# Write to PNG file
dev.copy(png, file = "./Exploratory Data Analysis/Project 1/plot4.png", width = 480, height = 480)
dev.off()

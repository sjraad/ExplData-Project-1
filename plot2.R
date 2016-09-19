# read file
data <- read.table("./Exploratory Data Analysis/Project 1/household_power_consumption.txt", sep = ";", na.strings = "?")
names(data) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
selectedData <- subset(data,data$Date=="1/2/2007" | data$Date =="2/2/2007")

# Convert date/time to classes
DateTime <- strptime(paste(selectedData$Date, selectedData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

# Select Data
ActivePower <- as.numeric(selectedData$Global_active_power)

# Plot graph
plot(DateTime, ActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")

# Write to PNG file
dev.copy(png, file = "./Exploratory Data Analysis/Project 1/plot2.png", width = 480, height = 480)
dev.off()
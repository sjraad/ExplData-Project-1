# read file
data <- read.table("./Exploratory Data Analysis/Project 1/household_power_consumption.txt", sep = ";", na.strings = "?")
names(data) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
selectedData <- subset(data,data$Date=="1/2/2007" | data$Date =="2/2/2007")

# Plot Histogram
hist(as.numeric(as.character(selectedData$Global_active_power)),col="red",main="Global Active Power",xlab="Global Active Power(kilowatts)")

# Write to PNG file
dev.copy(png, file = "./Exploratory Data Analysis/Project 1/plot1.png", width = 480, height = 480)
dev.off()
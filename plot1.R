# read file
data <- read.table("./Exploratory Data Analysis/Project 1/household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE, dec = ".")
selectedData <- subset(data,data$Date=="1/2/2007" | data$Date =="2/2/2007")

# Plot Histogram
hist(as.numeric(as.character(selectedData$Global_active_power)),col="red",main="Global Active Power",xlab="Global Active Power(kilowatts)")

# Write to PNG file
dev.copy(png, file = "./Exploratory Data Analysis/Project 1/plot1.png", width = 480, height = 480)
dev.off()
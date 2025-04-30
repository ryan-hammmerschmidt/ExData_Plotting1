# Load required data
filename <- "household_power_consumption.txt"
data <- read.table(filename, header=TRUE, sep=";", na.strings="?", stringsAsFactors=FALSE, dec=".")

# Convert Date to correct format
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
subset_data <- subset(data, Date == "2007-02-01" | Date == "2007-02-02")

# Combine Date and Time
datetime <- strptime(paste(subset_data$Date, subset_data$Time), "%Y-%m-%d %H:%M:%S")

# Plot to PNG
png("plot3.png", width=480, height=480)
plot(datetime, subset_data$Sub_metering_1, type="n", xlab="", xaxt="n", col="black", ylab="Energy sub metering")
lines(datetime, subset_data$Sub_metering_1, col="black")
lines(datetime, subset_data$Sub_metering_2, col="red")
lines(datetime, subset_data$Sub_metering_3, col="blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"), lty=1)
dev.off()
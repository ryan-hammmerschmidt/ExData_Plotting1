# Load required data
filename <- "household_power_consumption.txt"
data <- read.table(filename, header=TRUE, sep=";", na.strings="?", stringsAsFactors=FALSE, dec=".")

# Convert Date to correct format
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
subset_data <- subset(data, Date == "2007-02-01" | Date == "2007-02-02")

# Combine Date and Time
datetime <- strptime(paste(subset_data$Date, subset_data$Time), "%Y-%m-%d %H:%M:%S")

# Plot to PNG
png("plot4.png", width=480, height=480)
par(mfrow=c(2, 2))

# Plot 1
plot(datetime, subset_data$Global_active_power, type="l", xlab="", xaxt="n", col="black", ylab="Global Active Power")
axis(1, at=as.POSIXct(c("2007-02-01", "2007-02-02", "2007-02-03")), labels=c("Thu", "Fri", "Sat"))

# Plot 2
plot(datetime, subset_data$Voltage, typ="l", xlab="datetime", xaxt="n", ylab="Voltage")
axis(1, at=as.POSIXct(c("2007-02-01", "2007-02-02", "2007-02-03")), labels=c("Thu", "Fri", "Sat"))

# Plot 3
plot(datetime, subset_data$Sub_metering_1, type="n", xlab="", xaxt="n", col="black", ylab="Energy sub metering")
lines(datetime, subset_data$Sub_metering_1, col="black")
lines(datetime, subset_data$Sub_metering_2, col="red")
lines(datetime, subset_data$Sub_metering_3, col="blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"), lty=1)
axis(1, at=as.POSIXct(c("2007-02-01", "2007-02-02", "2007-02-03")), labels=c("Thu", "Fri", "Sat"))

# Plot 4
plot(datetime, subset_data$Global_reactive_power, type="l", xlab="datetime", xaxt="n", ylab="Global_reactive_power")
axis(1, at=as.POSIXct(c("2007-02-01", "2007-02-02", "2007-02-03")), labels=c("Thu", "Fri", "Sat"))

dev.off()
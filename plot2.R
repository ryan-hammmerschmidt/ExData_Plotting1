# Load required data
filename <- "household_power_consumption.txt"
data <- read.table(filename, header=TRUE, sep=";", na.strings="?", stringsAsFactors=FALSE, dec=".")

# Convert Date to correct format
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
subset_data <- subset(data, Date == "2007-02-01" | Date == "2007-02-02")

# Combine Date and Time
datetime <- strptime(paste(subset_data$Date, subset_data$Time), "%Y-%m-%d %H:%M:%S")

# Plot to PNG
png("plot2.png", width=480, height=480)
plot(datetime, subset_data$Global_active_power, type="l", xlab="", xaxt="n", col="black", ylab="Global Active Power (kilowatts)")
axis(1, at=as.POSIXct(c("2007-02-01", "2007-02-02", "2007-02-03")), labels=c("Thu", "Fri", "Sat"))
dev.off()
# Load csv into memory
epcdata <- read.table("./data/household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

# Convert date column into proper date format
epcdata$Date <- as.Date(strptime(epcdata$Date, format = "%d/%m/%Y"))

# Subset the data for the desired date range
subset_epcdata <- epcdata[(epcdata$Date >= "2007-02-01" & epcdata$Date <= "2007-02-02"),]

# Remove the original large dataset
rm(epcdata)

# Build vector of date and times
dates <- strptime(paste(subset_epcdata$Date, subset_epcdata$Time, sep = " "), format = "%Y-%m-%d %H:%M:%S")

# File plot will be written too
png(file = "plot3.png")

# Create 3 plots for sub_meteinrg_[1-3] in one plot
plot(dates, subset_epcdata$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(dates, subset_epcdata$Sub_metering_2, type = "l", col = "red")
lines(dates, subset_epcdata$Sub_metering_3, type = "l", col = "blue")

# Create legend
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = c(1,1,1), col = c("black", "red", "blue"))

dev.off()
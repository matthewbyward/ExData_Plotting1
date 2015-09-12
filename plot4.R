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
png(file = "plot4.png")

# Set 2x2 set of plots with room for all axes
par(mfrow = c(2,2), mar = c(5,4,2,2))

# Upper left plot
plot(dates, subset_epcdata$Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")

# Upper right plot
plot(dates, subset_epcdata$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")

# Lower left plot
plot(dates, subset_epcdata$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(dates, subset_epcdata$Sub_metering_2, type = "l", col = "red")
lines(dates, subset_epcdata$Sub_metering_3, type = "l", col = "blue")

# Lower right plot
plot(dates, subset_epcdata$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")

dev.off()
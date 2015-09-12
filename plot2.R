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
png(file = "plot2.png")

# Create histogram of Date x Global Active Power
plot(dates, subset_epcdata$Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")

dev.off()
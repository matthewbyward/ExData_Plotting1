# Load csv into memory
epcdata <- read.table("./data/household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
        
# Convert date column into proper date format
epcdata$Date <- as.Date(strptime(epcdata$Date, format = "%d/%m/%Y"))
        
# Subset the data for the desired date range
subset_epcdata <- epcdata[(epcdata$Date >= "2007-02-01" & epcdata$Date <= "2007-02-02"),]
        
# Remove the original large dataset
rm(epcdata)
        
# File plot will be written too
png(file = "plot1.png")

# Create histogram of Global Active Power
hist(subset_epcdata$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts", main = "Global Active Power")

dev.off()
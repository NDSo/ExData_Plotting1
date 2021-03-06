
# Download and unzip data
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", "data.zip")
unzip("data.zip")

# Load in data
hpc <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", stringsAsFactors = FALSE)

# subset data
hpc <- hpc[ hpc$Date == '1/2/2007' | hpc$Date == '2/2/2007' , ]
hpc$DateTime <- strptime( paste( hpc$Date, hpc$Time, sep = ' ') , "%d/%m/%Y %H:%M:%S")

## make plot
png(file = "plot1.png", width = 480, height = 480, units = "px")
hist( hpc$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", ylab = "Frequency", main = "Global Active Power")
dev.off()

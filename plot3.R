
# Download and unzip data
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", "data.zip")
unzip("data.zip")

# Load in data
hpc <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", stringsAsFactors = FALSE)

# subset data
hpc <- hpc[ hpc$Date == '1/2/2007' | hpc$Date == '2/2/2007' , ]
hpc$DateTime <- strptime( paste( hpc$Date, hpc$Time, sep = ' ') , "%d/%m/%Y %H:%M:%S")

## make plot
png(file = "plot3.png", width = 480, height = 480, units = "px")
plot( hpc$DateTime, hpc$Sub_metering_1 , type = "n", xlab = "", ylab = "Energy sub metering" )
lines( hpc$DateTime, hpc$Sub_metering_1 , type = "l", col = "black" )
lines( hpc$DateTime, hpc$Sub_metering_2 , type = "l", col = "red" )
lines( hpc$DateTime, hpc$Sub_metering_3 , type = "l", col = "blue" )
legend( "topright" , legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3") , col = c("black", "red", "blue"), lty = 1)
dev.off()

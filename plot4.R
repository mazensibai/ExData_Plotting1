
file <- file.path("household_power_consumption.txt")
my.data <- read.table("household_power_consumption.txt",header = T,sep = ";",na.strings = "?")
my.data$Datetime <- strptime(paste(my.data$Date, my.data$Time), "%d/%m/%Y %H:%M:%S")

my.data$Date <- as.Date(my.data$Date, format ="%d/%m/%Y")
my.data$Time <-  strftime(strptime(my.data$Time, format="%H:%M:%S"),"%H:%M:%S")
datasubset <- subset(my.data, Date=="2007/02/01" | Date=="2007/02/02")

## forth plot
png(filename="plot4.png")
par(mfrow = c(2, 2))

# first sub plot
plot(datasubset$Datetime, datasubset$Global_active_power, type = "l", ylab = "Global Active Power", 
     xlab = "")

# second sub plot 
plot(datasubset$Datetime, datasubset$Voltage, type = "l", ylab = "Voltage", xlab = "datetime")

# third sub plot 
plot(datasubset$Datetime, datasubset$Sub_metering_1, type = "l", ylab = "Energy sub metering", 
     xlab = "", col = "black")
points(datasubset$Datetime, datasubset$Sub_metering_2, type = "l", xlab = "", ylab = "Sub_metering_2", 
       col = "red")
points(datasubset$Datetime, datasubset$Sub_metering_3, type = "l", xlab = "", ylab = "Sub_metering_3", 
       col = "blue")
legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", 
                                                                        "Sub_metering_2", "Sub_metering_3"), bty = "n" )

# forth sub plot 
plot(datasubset$Datetime, datasubset$Global_reactive_power, type = "l", xlab = "datetime", 
     ylab = "Global_reactive_power", ylim = c(0, 0.5))

dev.off()
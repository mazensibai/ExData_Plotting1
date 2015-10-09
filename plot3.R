
file <- file.path("household_power_consumption.txt")
my.data <- read.table("household_power_consumption.txt",header = T,sep = ";",na.strings = "?")
my.data$Datetime <- strptime(paste(my.data$Date, my.data$Time), "%d/%m/%Y %H:%M:%S")

my.data$Date <- as.Date(my.data$Date, format ="%d/%m/%Y")
my.data$Time <-  strftime(strptime(my.data$Time, format="%H:%M:%S"),"%H:%M:%S")
datasubset <- subset(my.data, Date=="2007/02/01" | Date=="2007/02/02")

## third plot
png(filename="plot3.png")
plot(datasubset$Datetime, datasubset$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
points(datasubset$Datetime, datasubset$Sub_metering_2, type = "l", xlab = "", ylab = "Energy sub metering", 
       col = "red")
points(datasubset$Datetime, datasubset$Sub_metering_3, type = "l", xlab = "", ylab = "Energy sub metering", 
       col = "blue")
legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", 
                                                                        "Sub_metering_2", "Sub_metering_3"))
dev.off()
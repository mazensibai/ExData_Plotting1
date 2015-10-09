
file <- file.path("household_power_consumption.txt")
my.data <- read.table("household_power_consumption.txt",header = T,sep = ";",na.strings = "?")
my.data$Datetime <- strptime(paste(my.data$Date, my.data$Time), "%d/%m/%Y %H:%M:%S")

my.data$Date <- as.Date(my.data$Date, format ="%d/%m/%Y")
my.data$Time <-  strftime(strptime(my.data$Time, format="%H:%M:%S"),"%H:%M:%S")
datasubset <- subset(my.data, Date=="2007/02/01" | Date=="2007/02/02")

## frist plot
png(filename="plot1.png")
hist(as.numeric(as.character(datasubset$Global_active_power)),xlab = "Global Active Power (kilowatts)",col="red",main = "Global Active Power")
dev.off()
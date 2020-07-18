#Reading, naming and subsetting data

allpower <- read.table("household_power_consumption.txt",skip=1,sep=";")
names(allpower) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
names(allpower)

power <- subset(allpower,allpower$Date=="1/2/2007" | allpower$Date =="2/2/2007")


#str(power)
datetime <- strptime(paste(power$Date, power$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
subMetering1 <- as.numeric(power$Sub_metering_1)
subMetering2 <- as.numeric(power$Sub_metering_2)
subMetering3 <- as.numeric(power$Sub_metering_3)

#Opening PNG

png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 

#graph1
plot(datetime, as.numeric(power$Global_reactive_power), type="l", xlab="", ylab="Global Active Power")

#Graph2
plot(datetime, as.numeric(power$Voltage), type="l", xlab="datetime", ylab="Voltage")

#Graph3
plot(datetime, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, subMetering2, type="l", col="red")
lines(datetime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, col=c("black", "red", "blue"), bty="o")

#Graph4
plot(datetime, as.numeric(power$Global_reactive_power), type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()
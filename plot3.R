#Reading, naming and subsetting data

allpower <- read.table("household_power_consumption.txt",skip=1,sep=";")
names(allpower) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
names(allpower)

power <- subset(allpower,allpower$Date=="1/2/2007" | allpower$Date =="2/2/2007")


#creating variables for Graph
datetime <- strptime(paste(power$Date, power$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(power$Global_active_power)
subMetering1 <- as.numeric(power$Sub_metering_1)
subMetering2 <- as.numeric(power$Sub_metering_2)
subMetering3 <- as.numeric(power$Sub_metering_3)

#opening PNG

png("plot3.png", width=480, height=480)

plot(datetime, subMetering1,type="l", ylab="Energy Submetering", xlab="")
lines(datetime, subMetering2,type="l", col="red")
lines(datetime, subMetering3,type="l", col="blue")

legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),lty=1, col=c("black", "red", "blue"))

# annotating graph
title(main="Energy sub-metering")


#Closing devices

dev.off()

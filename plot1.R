#Reading, naming and subsetting data

allpower <- read.table("household_power_consumption.txt",skip=1,sep=";")
names(allpower) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
names(allpower)

power <- subset(allpower,allpower$Date=="1/2/2007" | allpower$Date =="2/2/2007")

#opening PNG

png("plot1.png", width=480, height=480)

#Plot histogram
hist(as.numeric(power$Global_active_power),col="red",main="Global Active Power",xlab="Global Active Power(kilowatts)")

dev.off()
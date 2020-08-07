#Read text file into a data table and subset by date 1/2/2017 - 2/2/2017
Data <- read.table("/Users/juliehsu/Documents/p/datasciencecoursera/household_power_consumption.txt", header = TRUE, sep = ";")
SubSetData <- Data[Data$Date %in% c("1/2/2007","2/2/2007") ,]

#Plot the graphs and save as png file
datetime <- strptime(paste(SubSetData$Date, SubSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
GlobalActivePower <- as.numeric(SubSetData$Global_active_power)
GlobalReactivePower <- as.numeric(SubSetData$Global_reactive_power)
Voltage <- as.numeric(SubSetData$Voltage)
SubMetering1 <- as.numeric(SubSetData$Sub_metering_1)
SubMetering2 <- as.numeric(SubSetData$Sub_metering_2)
SubMetering3 <- as.numeric(SubSetData$Sub_metering_3)

png("plot4.png", width=480, height=480)
par(mfrow = c(2,2))

#plot1
plot(datetime, GlobalActivePower, type = "l", xlab = "", ylab = "Global Active Power")

#plot2
plot(datetime, Voltage, type = "l", xlab = "datetime", ylab = "Voltage")

#plot3
plot(datetime, SubMetering1, type="l", xlab = "", ylab = "Energy sub metering")
lines(datetime, SubMetering2, type="l", col = "red")
lines(datetime, SubMetering3, type="l", col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, lwd = 1, col = c("black", "red", "blue"))

#plot4
plot(datetime, GlobalReactivePower, type="l", xlab = "datetime", ylab = "Global_reactive_power")

dev.off()
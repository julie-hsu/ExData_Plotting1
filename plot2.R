#Read text file into a data table and subset by date 1/2/2017 - 2/2/2017
Data <- read.table("/Users/juliehsu/Documents/p/datasciencecoursera/household_power_consumption.txt", header = TRUE, sep = ";")
SubSetData <- Data[Data$Date %in% c("1/2/2007","2/2/2007") ,]

#Plot the graph and save as png file
datetime <- strptime(paste(SubSetData$Date, SubSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
GlobalActivePower <- as.numeric(SubSetData$Global_active_power)
plot(datetime, GlobalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.copy(png, width=480, height=480, file = "plot2.png")
dev.off()
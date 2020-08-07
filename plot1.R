#Read text file into a data table and subset by date 1/2/2017 - 2/2/2017
Data <- read.table("/Users/juliehsu/Documents/p/datasciencecoursera/household_power_consumption.txt", header = TRUE, sep = ";")
SubSetData <- Data[Data$Date %in% c("1/2/2007","2/2/2007") ,]

#Plot the histogram and save as png file
GlobalActivePower <- as.numeric(SubSetData$Global_active_power)
hist(GlobalActivePower, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)", ylab = "Frequency")
dev.copy(png, width=480, height=480, file = "plot1.png")
dev.off()

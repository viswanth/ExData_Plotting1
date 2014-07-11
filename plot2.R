##This script assumes that the household_power_consumption.txt file is present in the working directory.
##Also assumptions are made that the system has enough memory to handle this large data set

fileName <- "household_power_consumption.txt"
pwrData <- read.table(fileName,header=TRUE, sep=";",na.strings="?")
reqData <- subset(pwrData,pwrData$Date == "1/2/2007" | pwrData$Date=="2/2/2007")
dateTime <- strptime( paste(reqData$Date,reqData$Time), format="%d/%m/%Y %H:%M:%S")
png(file="plot2.png")
with(reqData,plot(dateTime,Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)"))
dev.off()

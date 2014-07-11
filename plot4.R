##This script assumes that the household_power_consumption.txt file is present in the working directory.
##Also assumptions are made that the system has enough memory to handle this large data set

fileName <- "household_power_consumption.txt"
pwrData <- read.table(fileName,header=TRUE, sep=";",na.strings="?")
reqData <- subset(pwrData,pwrData$Date == "1/2/2007" | pwrData$Date=="2/2/2007")
dateTime <- strptime( paste(reqData$Date,reqData$Time), format="%d/%m/%Y %H:%M:%S")
png(file="plot4.png")
par(mfrow=c(2,2))
with(reqData,plot(dateTime,Global_active_power,type="l",xlab="",ylab="Global Active Power"))
with(reqData,plot(dateTime,Voltage,type="l",ylab="Voltage",xlab="datetime"))
plot(dateTime,reqData$Sub_metering_1,xlab="",ylab="Energy sub metering",type="l")
lines(dateTime,reqData$Sub_metering_2,col="red")
lines(dateTime,reqData$Sub_metering_3,col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lty="solid",bty="n")
with(reqData,plot(dateTime,Global_reactive_power,xlab="datetime",type="l"))
dev.off()
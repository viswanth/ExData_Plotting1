##This script assumes that the household_power_consumption.txt file is present in the working directory.
##Also assumptions are made that the system has enough memory to handle this large data set

fileName <- "household_power_consumption.txt"
pwrData <- read.table(fileName,header=TRUE, sep=";",na.strings="?")
reqData <- subset(pwrData,pwrData$Date == "1/2/2007" | pwrData$Date=="2/2/2007")
png(file="plot1.png")
hist(reqData$Global_active_power, col="red", xlab="Global Active Power (kilowatts)", , main = "Global Active Power")
dev.off()
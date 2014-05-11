d = read.table("datasets/household_power_consumption.txt", sep = ";")

names(d) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")

feb1 <- d[d$Data == "1/2/2007",]

feb2 <- d[d$Date == "2/2/2007",]

feb <- rbind(feb1,feb2)

png(file = "plot1.png")

hist(as.numeric(as.character(feb$Global_active_power)), xlab="Global Active Power(kilowatts)", main = "Global Active Power",col="red")

dev.off()
dt <- read.table("./data/household_power_consumption.txt", header=TRUE, sep=";", 
                 stringsAsFactors=FALSE, dec=".")
subsetdt <- dt[dt$Date %in% c("1/2/2007","2/2/2007") ,]

dttime <- strptime(paste(subsetdt$Date, subsetdt$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(subsetdt$Global_active_power)
globalReactivePower <- as.numeric(subsetdt$Global_reactive_power)
voltage <- as.numeric(subsetdt$Voltage)
subMetering1 <- as.numeric(subsetdt$Sub_metering_1)
subMetering2 <- as.numeric(subsetdt$Sub_metering_2)
subMetering3 <- as.numeric(subsetdt$Sub_metering_3)

png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 

plot(dttime, globalActivePower, type="l", xlab="", ylab="Global Active Power", cex=0.2)

plot(dttime, voltage, type="l", xlab="datetime", ylab="Voltage")

plot(dttime, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(dttime, subMetering2, type="l", col="red")
lines(dttime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, 
       col=c("black", "red", "blue"), bty="o")

plot(dttime, globalReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()

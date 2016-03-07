dt <- read.table("./data/household_power_consumption.txt", header=TRUE, sep=";", 
                 stringsAsFactors=FALSE, dec=".")
subsetdt <- dt[dt$Date %in% c("1/2/2007","2/2/2007") ,]

dttime <- strptime(paste(subsetdt$Date, subsetdt$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(subsetdt$Global_active_power)
subMetering1 <- as.numeric(subsetdt$Sub_metering_1)
subMetering2 <- as.numeric(subsetdt$Sub_metering_2)
subMetering3 <- as.numeric(subsetdt$Sub_metering_3)

png("plot3.png", width=480, height=480)
plot(dttime, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(dttime, subMetering2, type="l", col="red")
lines(dttime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()

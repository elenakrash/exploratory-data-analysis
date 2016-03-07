dt <- read.table("./data/household_power_consumption.txt", header=TRUE, 
                 sep=";", stringsAsFactors=FALSE, dec=".")
subsetdt <- dt[dt$Date %in% c("1/2/2007","2/2/2007") ,]

dttime <- strptime(paste(subsetdt$Date, subsetdt$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(subsetdt$Global_active_power)
png("plot2.png", width=480, height=480)
plot(dttime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()

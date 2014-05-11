# Daten einlesen
#
setwd("d:/git-repos/ExData_Plotting1")
dm <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?", dec=".", strip.white=TRUE)
#
dm$Time <- strptime(paste(dm$Date, dm$Time), format = "%d/%m/%Y %H:%M:%S")
dm$Date <- as.Date(dm$Date, format = "%d/%m/%Y")
#
# subsetting the data frame
fd <- subset(dm, (Date >= "2007-02-01") & (Date <= "2007-02-02"))
#
# setting PNG as the graphic device
png(filename = "plot4.png", width = 480, height = 480, units = "px")
#
# set up the 2x2-panel
par(mfrow = c(2, 2))
#
# upper left (plot2, but without measurement units)
plot(fd$Time, fd$Global_active_power, type="l", ylab="Global Active Power", xlab="")
#
# upper right
plot(fd$Time, fd$Voltage, type="l", ylab="Voltage", xlab="datetime")
#
# lower left (plot3, but without legend boundary)
plot(fd$Time, fd$Sub_metering_1, type="l", col="black", ylab="Energy sub metering", xlab="")
lines(fd$Time, fd$Sub_metering_2, col="red")
lines(fd$Time, fd$Sub_metering_3, col="blue")
legend("topright", lwd=1, legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"), bty = "n")
#
# lower right
plot(fd$Time, fd$Global_reactive_power, type="l", ylab="Global_reactive_power", xlab="datetime")
#
# resetting panel out graphic device
par(mfrow = c(1, 1))
dev.off()

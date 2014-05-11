# Daten einlesen
#
setwd("d:/git-repos/ExData_Plotting1")
dm <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?", dec=".", strip.white=TRUE)
#dm <- read.table("daten.txt", header=TRUE, sep=";", na.strings="?", dec=".", strip.white=TRUE)
#
dm$Time <- strptime(paste(dm$Date, dm$Time), format = "%d/%m/%Y %H:%M:%S")
dm$Date <- as.Date(dm$Date, format = "%d/%m/%Y")
#
# subsetting the data frame
fd <- subset(dm, (Date >= "2007-02-01") & (Date <= "2007-02-02"))
#
# setting PNG as the graphic device
png(filename = "plot2.png", width = 480, height = 480, units = "px")
#
# drawing the line plot
plot(fd$Time, fd$Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab="")
dev.off()

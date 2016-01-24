# read data
temp <- read.csv('household_power_consumption.txt', stringsAsFactors=FALSE, 
                 sep = ';', na.strings = '?')

temp$Date <- as.Date(temp$Date, format = '%d/%m/%Y')

# Plot4 appears to plot the first few data observed
# on Feb 01 and 02  (Thursday, Friday)
dat <- subset(temp, temp$Date >= '2007-02-01' &
                  temp$Date < '2007-02-03')

 

png(filename = "plot4.png", width = 480, height = 480, units = "px")

par(mfrow = c(2,2), mar = c(4, 4, 2, 2))
plot(dat$Global_active_power, type = 'l', xaxt = "n", xlab = "" , 
     ylab = "Global Active Power")
axis(1, at=c(1, 1440, 2880), labels= c("Thursday", "Friday", "Saturday"))

plot(dat$Voltage, type = 'l', xaxt = "n", xlab = "datetime" , 
     ylab = "Voltage")
axis(1, at=c(1, 1440, 2880), labels= c("Thursday", "Friday", "Saturday"))

plot(dat$Sub_metering_1, type = 'l', xaxt = "n", xlab = "" , 
     ylab = "energy sub metering")
axis(1, at=c(1, 1440, 2880), labels= c("Thursday", "Friday", "Saturday"))
lines(dat$Sub_metering_2, col = "red")
lines(dat$Sub_metering_3, col = "blue")
legend("topright", legend = c("Sub_metering_1","Sub_metering_2",
                              "Sub_metering_3"), col = c("black", "red", "blue"), 
       lty = c(1, 1, 1))

plot(dat$Global_reactive_power, type = 'l', xaxt = "n", xlab = "datetime" , 
     ylab = "Global Reactive Power")
axis(1, at=c(1, 1440, 2880), labels= c("Thursday", "Friday", "Saturday"))
dev.off()
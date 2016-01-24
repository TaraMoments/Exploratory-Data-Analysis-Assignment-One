# read data
temp <- read.csv('household_power_consumption.txt', stringsAsFactors=FALSE, 
                 sep = ';', na.strings = '?')

# Convert data
temp$Date <- as.Date(temp$Date, format = '%d/%m/%Y')

# Plot3 appears to plot energy sub-metering for the first few observations 
# observed on Feb 01 and 02  (Thursday, Friday)
dat <- subset(temp, temp$Date >= '2007-02-01' &
                  temp$Date < '2007-02-03')

png(filename = "plot3.png", width = 480, height = 480, units = "px")
plot(dat$Sub_metering_1, type = 'l', xaxt = "n", xlab = "" , 
     ylab = "energy sub metering")
axis(1, at=c(1, 1440, 2880), labels= c("Thursday", "Friday", "Saturday"))
lines(dat$Sub_metering_2, col = "red")
lines(dat$Sub_metering_3, col = "blue")
legend("topright", legend = c("Sub_metering_1","Sub_metering_2",
                              "Sub_metering_3"), col = c("black", "red", "blue"), 
       lty = c(1, 1, 1))
dev.off()


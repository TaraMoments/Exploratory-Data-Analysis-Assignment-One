# read data
temp <- read.csv('household_power_consumption.txt', stringsAsFactors=FALSE, 
                 sep = ';', na.strings = '?')

# Convert to date 
temp$Date <- as.Date(temp$Date, format = '%d/%m/%Y')

# Plot2 appears to plot global active power for the first few observations 
# observed on Feb 01 and 02  (Thursday, Friday)
dat <- subset(temp, temp$Date >= '2007-02-01' &
                   temp$Date < '2007-02-03')

# globacl active power is numeric. 
dat$Global_active_power <- as.numeric(dat$Global_active_power)

png(filename = "plot2.png", width = 480, height = 480, units = "px")
plot(dat$Global_active_power, type = 'l', xaxt = "n", xlab = "" , 
     ylab = "Global Active Power")
axis(1, at=c(1, 1440, 2880), labels= c("Thursday", "Friday", "Saturday"))
dev.off()
 
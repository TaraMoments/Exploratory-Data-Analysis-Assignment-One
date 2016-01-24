# read data
temp <- read.csv('household_power_consumption.txt', stringsAsFactors=FALSE, 
                 sep = ';', na.strings = '?')

# Combine date and time as one timestamp 
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


# dayofweek
dat$dayofweek <- weekdays(dat$Date)

library(plyr)
df1 <- ddply(dat, .(dayofweek, Time), summarise, newvar = mean(Global_active_power,
                                                         na.rm = TRUE))
# only take Thursday and Friday
df2 <- subset(df1, dayofweek == 'Thursday' | dayofweek == 'Friday')


plot(dat$timestamp, dat$Global_active_power, type = 'l', 
     ylab = 'Globacl Active Power (kilowatts)') 


 

dat$Global_active_power <- as.numeric(dat$Global_active_power)
# create a new variable day of week.
dat$dayofweek <- weekdays(dat$Date)

test <- aggregate(dat$Global_active_power, by = list(dat$dayofweek, dat$Time),
                  FUN = mean, na.rm = TRUE)

tfs_dat <- subset(dat, dayofweek == 'Thursday' | dayofweek == 'Friday' | dayofweek == 'Saturday')

 


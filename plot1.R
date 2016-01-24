# read data
temp <- read.csv('household_power_consumption.txt', stringsAsFactors=FALSE, sep = ';')
temp$Date <- as.Date(temp$Date, format = '%d/%m/%Y')

# only take dates in Feb, 2007.
dat <- subset(temp, temp$Date >= '2007-02-01' & temp$Date < '2007-03-01')

# Histogram
dat$Global_active_power <- as.numeric(dat$Global_active_power)
png(filename = "plot1.png", width = 480, height = 480, units = "px")
with(dat, hist(Global_active_power, col = "red", 
               xlab = "Global Active Power (kilowatts)", 
               main = "Global Active Power"))
dev.off()


 

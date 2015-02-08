# read csv file
electData <- read.csv('household_power_consumption.txt', sep=';', 
                      nrows=100000, na.strings='?',
                      colClasses=c(rep('character', 2), rep('numeric',7)))
electData$Date <- as.Date(electData$Date, '%d/%m/%Y')

# keep only 02/01/2007 and 02/02/2007 data
electData <- subset(electData, electData$Date %in% as.Date(c('2007-02-01','2007-02-02')) )

# plot histogram
par(mfrow=c(2,2))
with(electData, hist(Global_active_power, col='orange', main='Global Active Power',
     xlab='Global Active Power (kilowatts)', ylab='Frequency'))

# save to png file
dev.copy(png, 'plot1.png')
dev.off()
# read csv file
electData <- read.csv('household_power_consumption.txt', sep=';', 
                      nrows=100000, na.strings='?',
                      colClasses=c(rep('character', 2), rep('numeric',7)))
electData$Date <- as.Date(electData$Date, '%d/%m/%Y')

# keep only 02/01/2007 and 02/02/2007 data
electData <- subset(electData, electData$Date %in% as.Date(c('2007-02-01','2007-02-02')) )

# plot histogram
with(electData, plot(Global_active_power, type='n', xaxt='n', ann=F))
title(ylab='Global Active Power (kilowattts)')
with(electData, lines(Global_active_power, ))
axis(1, at=c(0, 1440, 2880), labels=c('Thu','Fri','Sat'))


# save to png file
dev.copy(png, 'plot2.png')
dev.off()
# read csv file
electData <- read.csv('household_power_consumption.txt', sep=';', 
                      nrows=100000, na.strings='?',
                      colClasses=c(rep('character', 2), rep('numeric',7)))
electData$Date <- as.Date(electData$Date, '%d/%m/%Y')

# keep only 02/01/2007 and 02/02/2007 data
electData <- subset(electData, electData$Date %in% as.Date(c('2007-02-01','2007-02-02')) )

# plot data
par(mfrow=c(1,1))
with(electData, plot(Sub_metering_1, type='n', xaxt='n', ann=F))
title(ylab='Energy sub metering')
with(electData, {
        lines(Sub_metering_1, col='black')
        lines(Sub_metering_2, col='red')
        lines(Sub_metering_3, col='blue')
}
)
axis(1, at=c(0, 1440, 2880), labels=c('Thu','Fri','Sat'))
legend('topright', col=c('black','red','blue'), cex=0.75, y.intersp=0.5,
       legend=c('Sub_metering_1','Sub_metering_2','Sub_metering_3'),lty=1)

# save to png file
dev.copy(png, 'plot3.png')
dev.off()